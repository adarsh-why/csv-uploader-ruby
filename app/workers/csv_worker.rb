class CsvWorker
    include Sidekiq::Worker
    sidekiq_options retry: false

    def perform(items)
        Importer.import(items)
    end
end