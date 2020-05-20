class IndexController < ApplicationController

  include CsvProcessor
  
  def index
=begin 
    @time      = Date.today.strftime '%m-%d-%Y'
    @remote_ip = request.remote_ip
    @ndx_hash  = {}
    
    # we need to check if today info is available, if not we will use yesterday
    today       = Date.today.strftime '%m-%d-%Y'
    yesterday   = Date.today.prev_day.strftime '%m-%d-%Y'
    parsed_url  = URI.parse("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/#{today}.csv")
    req         = Net::HTTP.new(parsed_url.host, parsed_url.port)
    req.use_ssl = true
    res         = req.request_head(parsed_url.path)
    
    res.code == "200" ? ( @covid_19_cases = read_from_url parsed_url.to_s ) : ( @covid_19_cases = read_from_url parsed_url.to_s.gsub!(/[0-2][0-9]-[0-3][0-9]-[12]\d{3}/, yesterday) )
 
    @covid_19_cases.each do |cases|
      
      if !@ndx_hash[cases[3]]
        @ndx_hash[cases[3]] = {}
        
        if cases[2] && cases[1]
          @ndx_hash[cases[3]][cases[2]]           = {}
          @ndx_hash[cases[3]][cases[2]][cases[1]] = cases.to_h
        elsif cases[2]
          @ndx_hash[cases[3]][cases[2]] = cases.to_h
        else
          @ndx_hash[cases[3]] = cases.to_h
        end
        
      elsif !@ndx_hash[cases[3]][cases[2]]
        
        if cases[1]
          @ndx_hash[cases[3]][cases[2]]           = {}
          @ndx_hash[cases[3]][cases[2]][cases[1]] = cases.to_h
        else
          @ndx_hash[cases[3]][cases[2]] = cases.to_h
        end
        
      else
        @ndx_hash[cases[3]][cases[2]][cases[1]] = cases.to_h
        
      end
      
      if !@ndx_hash[cases[3]][:country_total]
        @ndx_hash[cases[3]][:country_total_confirmed] = cases[7]
      else
        @ndx_hash[cases[3]][:country_total_confirmed] += cases[7]
      end
      
    end
=end
  end
  
end
