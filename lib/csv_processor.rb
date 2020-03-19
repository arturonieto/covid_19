require 'open-uri'
require 'csv'

module CsvProcessor
  
  def read_covid_19(url)

    @final_cases = {}
    @cases_per_country = {}

    CSV.new(open(url), :headers => :first_row).each do |province, country, last_update, confirmed, deaths, recovered, latitude, longitud|

      #if specific_country && specific_country != '' && specific_country != 'no'
      #  next unless country[1] =~ /#{specific_country.capitalize}/
      #end
      last_update[1] = DateTime.parse last_update[1]
      last_update[1] = last_update[1].strftime '%m-%d-%Y %H:%M.%S'
      
      if province[1]
        
        if @cases_per_country[country[1]]
          
          @cases_per_country[ country[1] ][ province[1] ] = {
                                                              last_update: last_update[1],
                                                              country:     country[1],
                                                              confirmed:   confirmed[1],
                                                              deaths:      deaths[1],
                                                              recovered:   recovered[1],
                                                              latitude:    latitude[1],
                                                              longitud:    longitud[1]
                                                            }
        else
          
          @cases_per_country[country[1]] = {
                                            has_many: 1,
                                            province[1] => {
                                                            last_update: last_update[1],
                                                            country: country[1],
                                                            confirmed: confirmed[1],
                                                            deaths: deaths[1],
                                                            recovered: recovered[1],
                                                            latitude: latitude[1],
                                                            longitud: longitud[1]
                                                          }
                                           }
        end
      end
      

      @cases_per_country[country[1]] = { 
                                          last_update: last_update[1],
                                          country: country[1],
                                          confirmed: confirmed[1],
                                          deaths: deaths[1],
                                          recovered: recovered[1]
                                          } if !province[1]

      if !@final_cases[confirmed[0]]
        @final_cases[confirmed[0]] = confirmed[1].to_i
        @final_cases[recovered[0]] = recovered[1].to_i
        @final_cases[deaths[0]]    = deaths[1].to_i
      else
        @final_cases[confirmed[0]] += confirmed[1].to_i
        @final_cases[recovered[0]] += recovered[1].to_i
        @final_cases[deaths[0]]    += deaths[1].to_i
      end

    end

    {
      cases_per_country: @cases_per_country,
      final_cases: @final_cases
    }

  end

end
