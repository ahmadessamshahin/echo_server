class Endpoint < ApplicationRecord
VERB_OPTIONS = %w(get post put patch delete)
TYPE_OPTIONS= %w(endpoints)

validates :verb, uniqueness: { case_sensitive: false }, :inclusion => {:in => VERB_OPTIONS}, :presence => true
validates_presence_of :path, :code, :body

validates :infoType, :inclusion => {:in => TYPE_OPTIONS}, :presence => true

end
