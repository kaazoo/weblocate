class SearchController < ApplicationController


	def index
	
	end


	def ajax_search
		if params['search'] && params['search'].length > 4
			
			cmd = "locate -l 30 " + params['search']
			
			out = IO.popen(cmd)
			@results = out.readlines
		
			render :layout => false
		else
			render :text => "Query must be longer than 4 characters."
		end
	end



end
