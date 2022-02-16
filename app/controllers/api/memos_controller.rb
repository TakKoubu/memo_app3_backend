module Api
  class MemosController < ApplicationController
    def index
      render json: Memo.all
    end

    def create
      memo = current_user.memos.build(memo_params)
      if memo.save
        render json: memo
      else
        render json: memo.errors, status: 422
      end
    end

    private 
      def memo_params
        params.require(:memo).permit(:content)
      end
  end
end
