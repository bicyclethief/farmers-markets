require_relative '../market_importer'

importer = MarketImporter.new("https://data.cityofnewyork.us/resource/b7kx-qikm.json")
importer.import