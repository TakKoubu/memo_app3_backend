module Api
  class FavoritesController < ApplicationController
    def create
      # いいねするmemo_idの特定
      memo = Memo.find(params[:memo_id])
      # current_userがそのメモをfavoriteする
      if current_user.favorite(memo)
        # jsonでmemoのfavorite_countを返す
        render json: { favorite_count: memo.favorites.count}
      else
        render json: favorite.errors, status: 422
      end
    end

    def destroy
      # いいね解除するmemo_idの特定
      # 別の書き方
      # memo = Memo.find_by(memo_id: params[:memo_id], user_id: current_user.id)
      memo = current_user.favorite_memos.find(params[:memo_id])
      # current_userがそのメモのfavoriteを解除する
      if current_user.unfavorite(memo)
        render json: { favorite_count: memo.favorites.count}
      else
        render json: favorite.errors, status: 422 
      end
    end
  end
end
