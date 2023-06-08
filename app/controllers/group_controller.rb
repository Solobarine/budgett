class GroupController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @groups = current_user.groups
  end
  
  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.new(group_params)
    
    if @group.save
      redirect_to group_index_path, notice: 'Category created Successfully'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @group = current_user.groups.find(params[:id])
    @deals = @group.deals
  end

  private

  def group_params
    params.require(:group).permit(:user_id, :name, :icon)
  end
end
