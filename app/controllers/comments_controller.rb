class CommentsController < ApplicationController
	http_basic_authenticate_with name: "gabi", password: "gabi", only: :destroy

	def create
		if (params[:article_id] != nil)
			@article = Article.find(params[:article_id])
			@comment = @article.comments.create(comment_params)
			redirect_to article_path(@article)
		else
			@recipe = Recipe.find(params[:recipe_id])
			@comment = @recipe.comments.create(comment_params)
			redirect_to recipe_path(@recipe)
		end
	end

	def destroy
		if (params[:article_id] != nil)
			@article = Article.find(params[:article_id])
			@comment = @article.comments.find(params[:id])
			@comment.destroy
			redirect_to article_path(@article)
		else
			@recipe = Recipe.find(params[:recipe_id])
			@comment = @recipe.comments.find(params[:id])
			@comment.destroy
			redirect_to recipe_path(@recipe)
		end
	end

	private
		def comment_params
		  params.require(:comment).permit(:commenter, :body)
		end
end
