module SetRecordable
  extend ActiveSupport::Concern

  included do
    before_action :set_recordable
  end

  private
    def set_recordable
      #TODO(zemptime): infer recordable class from controller, or ask the controller and have it tell what this should be later
      @recordable = Case.find(params[:id])
    end
end
