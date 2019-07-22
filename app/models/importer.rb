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
        total_count = csv_items.length - 1
        page = total_count/pages.ceil
        from_count = 0
        to_count = page
        flag = true

        while flag do
            CsvWorker.perform_async(csv_items[from_count..to_count])
            flag = false if to_count >= total_count
            from_count = to_count
            to_count = to_count > total_count ? total_count : from_count + page
        end
    end
end
