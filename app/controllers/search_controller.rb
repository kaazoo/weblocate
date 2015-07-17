class SearchController < ApplicationController

  def index
    @frequency = FORM_FREQ.to_i
  end

  def ajax_search
    if params['search'] && params['search'].length >= QUERY_MIN_LENGTH
      @query = URI.unescape(params['search'])
      @query = ActionController::Base.helpers.sanitize(@query)
      @query_not_escaped = @query
      @query = Escape.shell_command(@query)

      if USE_SUDO
        locate_cmd = "sudo locate"
      else
        locate_cmd = "locate"
      end

	  cmd = locate_cmd + " " + LOCATE_ARGS.to_s + " -l "+ RESULT_LIMIT.to_s + " " + @query
	  Rails.logger.debug(cmd)

      out = IO.popen(cmd)
	  all_results = out.readlines
      @results = []

      Rails.logger.debug("All results: " + all_results.length.to_s)
      all_results.each do |line|
        if line.match(ALLOWED_PREFIXES)
          @results << line
        end
      end
      Rails.logger.debug("Allowed results: " + @results.length.to_s)

      @results.each do |line|
        Rails.logger.debug(line)
      end

	  @results_num = @results.length

	  render :layout => false
	else
	  render :text => "Query must be longer than " + QUERY_MIN_LENGTH.to_s + " characters."
	end
  end

end
