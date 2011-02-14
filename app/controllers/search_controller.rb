class SearchController < ApplicationController

	def index
	
	end


	def ajax_search
		if params['search'] && params['search'].length > QUERY_MIN_LENGTH

			@query =  ActionController::Base.helpers.sanitize(params['search'])
			@query.gsub!(' ', '_')
			@query = Escape.shell_command(@query)

      if USE_SUDO
        locate_cmd = "sudo locate"
      else
        locate_cmd = "locate"
      end

			cmd = locate_cmd + " " + LOCATE_ARGS.to_s + " -l "+ RESULT_LIMIT.to_s + " " + @query
			puts cmd

			out = IO.popen(cmd)
			@results = out.readlines
			@results_num = @results.length
		
			render :layout => false
		else
			render :text => "Query must be longer than " + QUERY_MIN_LENGTH.to_s + " characters."
		end
	end



end
