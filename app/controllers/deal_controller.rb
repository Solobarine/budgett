class DealController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @group = current_user.groups
    @deal = Deal.new
  end

  def create
    @group = Group.find(params[:group_id])
    @deal = current_user.deals.new(
      name: params[:deal][:name],
      group_id: @group.id,
      amount: params[:deal][:amount],
      user_id: current_user.id
    )

    if @deal.save
      redirect_to group_path(@group), notice: 'Transaction created Successfully'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def deal_params
    params.require(:deal).permit(:user_id, :group_id, :name, :amount)
  end
end
