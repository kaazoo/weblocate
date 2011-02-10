class SearchController < ApplicationController

	def index
	
	end


	def ajax_search
		if params['search'] && params['search'].length > 4

			query =  ActionController::Base.helpers.sanitize(params['search'])
			query.gsub!(' ', '_')
			query = Escape.shell_command(query)

			cmd = "locate -l 30 " + query
			puts cmd

			out = IO.popen(cmd)
			@results = out.readlines
		
			render :layout => false
		else
			render :text => "Query must be longer than 4 characters."
		end
	end



end
