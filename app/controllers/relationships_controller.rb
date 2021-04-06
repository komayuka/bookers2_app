class RelationshipsController < ApplicationController

def create
    current_user.follow(params[:user_id])
    redirect_to request.referer
end

def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
end

def follow
    current_user.follow(params[:user_id])
    redirect_to root_path
end

def unfollow
    curretn_user.unfollow(params[:user_id])
    redirect_to root_path
end

end
