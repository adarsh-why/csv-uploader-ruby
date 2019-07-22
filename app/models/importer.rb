class Importer < ActiveRecord::Base
    paginates_per 5

    def self.async_store_csv(csv_items)
        pages = 5
        chunk = csv_items.length/pages
        # Splitting and sending csv arrays to async workers
        csv_items.each_slice(chunk).to_a.each do |list|
            CsvWorker.perform_async(list)
        end
    end
end
