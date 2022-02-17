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
    end
  end
end
