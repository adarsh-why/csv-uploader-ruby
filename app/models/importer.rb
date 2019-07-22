require "csv"

class Importer < ActiveRecord::Base
    def self.import(file)
        CSV.foreach(file.path, { col_sep: ';', headers: true }) do |row|
            Importer.create! row.to_hash
        end
    end
end
