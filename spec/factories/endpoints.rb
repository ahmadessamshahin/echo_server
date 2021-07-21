FactoryBot.define do
  factory :endpoint do
  infoType {"endpoints"}
  path {"/foo/bar/baz"}
  code {200}
  body {"\"{ \"message\": \"test, world\" }\""}
  verb {"get"}
  headers {{ "Content-Type": "application/json" }}
  end
end
