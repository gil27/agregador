class Idea < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  def self.search(query)
    __elasticsearch__.search(
      {
        query: {
          multi_match: {
            query: query,
            fields: ['title^10']
          }
        }
      }
    )
  end

  settings index: { number_of_shards: 1 } do
    mappings dynamic: 'false' do
      indexes :title, analyzer: 'english'
    end
  end
end


# Delete the previous articles index in Elasticsearch
Idea.__elasticsearch__.client.indices.delete index: Idea.index_name rescue nil
 
# Create the new index with the new mapping
Idea.__elasticsearch__.client.indices.create \
  index: Idea.index_name
 
# Index all article records from the DB to Elasticsearch
Idea.import
