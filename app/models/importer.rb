require "csv"

class Importer < ActiveRecord::Base
    paginates_per 5

    def self.import_csv(file)
        Importer.delete_all
        csv_items = get_csv_items(file)
        async_store_csv(csv_items)
    end

    def self.get_csv_items(file)
        items = []
        CSV.foreach(file.path, { col_sep: ';', headers: true }) do |row|
            items << row.to_hash
        end
        return items
    end

    def self.async_store_csv(csv_items)
        pages = 5
        chunk = csv_items.length/pages
        csv_items.each_slice(chunk).to_a.each do |list|
            CsvWorker.perform_async(list)
        end
    end
end
