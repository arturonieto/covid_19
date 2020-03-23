require 'open-uri'
require 'csv'

module CsvProcessor
  
  def read_from_url(url)

    @totals = {}
    @data = {}

    CSV.new(open(url), :headers => :first_row).each do |province, country, last_update, confirmed, deaths, recovered, latitude, longitud|

      #if specific_country && specific_country != '' && specific_country != 'no'
      #  next unless country[1] =~ /#{specific_country.capitalize}/
      #end
      last_update[1] = DateTime.parse last_update[1]
      last_update[1] = last_update[1].strftime '%m-%d-%Y %H:%M.%S'
      
      if province[1]
        
        if @data[country[1]]
          
          @data[ country[1] ][ province[1] ] = {
                                                              last_update: last_update[1],
                                                              country:     country[1],
                                                              confirmed:   confirmed[1],
                                                              deaths:      deaths[1],
                                                              recovered:   recovered[1],
                                                              latitude:    latitude[1],
                                                              longitud:    longitud[1]
                                                            }
        else
          
          @data[country[1]] = {
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
      

      @data[country[1]] = { 
                                          last_update: last_update[1],
                                          country: country[1],
                                          confirmed: confirmed[1],
                                          deaths: deaths[1],
                                          recovered: recovered[1]
                                          } if !province[1]

      if !@totals[confirmed[0]]
        @totals[confirmed[0]] = confirmed[1].to_i
        @totals[recovered[0]] = recovered[1].to_i
        @totals[deaths[0]]    = deaths[1].to_i
      else
        @totals[confirmed[0]] += confirmed[1].to_i
        @totals[recovered[0]] += recovered[1].to_i
        @totals[deaths[0]]    += deaths[1].to_i
      end

    end

    {
      data:   @data,
      totals: @total
    }

  end

end
