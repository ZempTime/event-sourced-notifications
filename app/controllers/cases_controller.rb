class CasesController < ApplicationController
  include ContextScoped, SetRecordable

  def index
    @cases = Case.all
  end

  def edit
    @case = Case.find(params[:id])
  end

  def update
    set_user
    @case = @context.record updated_case, creator: @user

    respond_to do |format|
      format.any(:html, :js) { redirect_to edit_case_url(@case.id) }
    end
  end

  private

    def case_params
      params.require(:case).permit(:user_id, :name, :status, :content)
    end

    def set_user
      @user = User.find(case_params[:user_id])
    end

    def updated_case
      @recordable.attributes = case_params
      @recordable
    end
end