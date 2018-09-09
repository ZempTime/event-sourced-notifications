module ContextScoped
  extend ActiveSupport::Concern

  included do
    before_action :set_context
  end

  private
    def set_context
      @context = Context.all.sample
    end
end