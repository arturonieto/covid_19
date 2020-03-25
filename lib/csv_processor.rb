require 'open-uri'
require 'csv'

module CsvProcessor
  
  def read_from_url(url)

    @data = []

    CSV.new(open(url), headers: true, write_headers: true).each do |row|

      @data.push row

    end
    
    @data

  end

end
