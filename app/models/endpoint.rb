class Endpoint < ApplicationRecord
VERB_OPTIONS = %w(get post put patch delete)
TYPE_OPTIONS= %w(endpoints)

validates :verb, :inclusion => {:in => VERB_OPTIONS}, :presence => true
validates_presence_of :path, :code
validates :verb, uniqueness: { scope: :path }

validates :infoType, :inclusion => {:in => TYPE_OPTIONS}, :presence => true

end
