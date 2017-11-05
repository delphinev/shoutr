class HashtagsController < ApplicationController
  def show
    @hashtag = params[:id]
    # @results = ShoutSearchQuery.new(term: "%#{@hashtag}%").to_relation
    @search = Search.new(term: hashtag)
  end

  private

  def hashtag
    "##{params[:id]}"
  end
end
