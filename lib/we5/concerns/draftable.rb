module We5
  module Concerns
    # Draftable module relies on the plugin acts_as_state_machine (AASM)
    #
    # The draftable model needs a column called state:
    # => add_column :model, :state, :string, :default => "drafted"
    #
    # To change the state:
    # => model.publish!
    # => model.draft!
    #
    # To query the state:
    # => model.published?
    # => model.drafted? (or model.draft?)
    #
    # There are hooks which will be invoked on such transitions.
    # Override one of the following methods to do something if the state changes:
    # => def on_draft; puts "yes, i am a draft now"; end
    # => def on_publish; puts "omg, you really published me!"; end
    module Draftable
      def self.included(base)
        base.class_eval do
          aasm_column :state
          aasm_initial_state :drafted

          aasm_state :drafted,   :enter => :on_draft
          aasm_state :published, :enter => :on_publish

          aasm_event :publish do
            transitions :to => :published, :from => :drafted
          end

          aasm_event :draft do
            transitions :to => :drafted, :from => :published
          end

          named_scope :drafts,    :conditions => { :state => "drafted" }
          named_scope :published, :conditions => { :state => "published" }

          def on_draft; end
          def on_publish
            self.published_at = Time.now if self.respond_to?(:published_at=)
            @published = true
          end

          def published_at
            self[:published_at] || self.created_at || Time.now
          end

          def recently_published?
            @published
          end
        end
      end
    end
  end
end