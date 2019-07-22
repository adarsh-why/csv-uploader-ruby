class CsvWorker
    include Sidekiq::Worker
    sidekiq_options retry: false

    def perform(items)
        # Using Activerecord-import to bulk import to importers in single query
        Importer.import(items)
    end
end