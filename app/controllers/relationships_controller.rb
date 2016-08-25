class RelationshipsController < ApplicationController

  def create
    @relationship = current_user.relationships.build(friend_id: params[:friend_id])

    respond_to do |format|
      if @relationship.save
        format.html {redirect_to profile_path(current_user.id), notice: 'User Followed Successfully'}
      else
        format.html { redirect_to root, notice: 'User Not Followed'}
    end
  end
end

def destroy
  @relationship = current_user.relationships.find(params[:id])
  @relationship.destroy

  respond_to do |format|
    format.html {redirect_to profile_path(current_user.id), notice: 'Succesfully unfollowed user'}
  end
end
  private

  def relationship_params
    params.require(:relationship).permit(:user_id, :friend_id)
  end
end
