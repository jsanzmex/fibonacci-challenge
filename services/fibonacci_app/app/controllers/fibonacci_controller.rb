class FibonacciController < ApplicationController

	def index
		render json: {"message":"please provide a positive number after fibonacci/ to get that position in the series."}
	end

	def show
		render json: {"value": ::Fibonacci[params[:position].to_i]}
	end

end
