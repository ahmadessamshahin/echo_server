require 'rails_helper'

RSpec.describe Endpoint, type: :model do
  context 'validation tests' do
    it 'ensures verb presence' do
      endpoint = FactoryBot.build(:endpoint, verb: nil)
      endpoint.validate
      expect(endpoint.errors[:verb]).to include("can't be blank")      
    end
    
    it 'ensures path presence' do
      endpoint = FactoryBot.build(:endpoint, path: nil)
      endpoint.validate
      expect(endpoint.errors[:path]).to include("can't be blank")
    end

    it 'ensures code presence' do
      endpoint = FactoryBot.build(:endpoint, code: nil)
      endpoint.validate
      expect(endpoint.errors[:code]).to include("can't be blank")
    end

    it 'ensures body presence' do
      endpoint = FactoryBot.build(:endpoint, body: nil)
      endpoint.validate
      expect(endpoint.errors[:body]).to include("can't be blank")
    end

    it 'ensures type presence' do
      endpoint = FactoryBot.build(:endpoint, infoType: nil)
      endpoint.validate
      expect(endpoint.errors[:infoType]).to include("can't be blank")
    end

    it 'ensures headers isOptional' do
      endpoint = FactoryBot.build(:endpoint, headers: nil)
      endpoint.validate
      expect(endpoint.errors[:headers]).not_to include("can't be blank")
    end

    it 'ensures verb is one of the enum types' do
      endpoint = FactoryBot.build(:endpoint, verb: nil)
      endpoint.validate
      expect(endpoint.errors[:verb]).to include("is not included in the list")
    end

    it 'ensures type is one of the enum types' do
      endpoint = FactoryBot.build(:endpoint, infoType: nil)
      endpoint.validate
      expect(endpoint.errors[:infoType]).to include("is not included in the list")
    end

    it 'should save successfully' do
      endpoint = FactoryBot.create(:endpoint)
      expect(Endpoint.where({path: endpoint.path, verb: endpoint.verb }).count).to eq(1)
    end
  end

  context 'scope tests' do 
    # validate that the endpoint is exists
    it "should found endpoint"do
      endpoint = FactoryBot.create(:endpoint)
      expect(Endpoint.where({path: endpoint.path, verb: endpoint.verb }).count).to eq(1)
    end
    it "shouldnot found endpoint"do
      expect(Endpoint.where({path: '/randomEndpointThatNotExist', verb: "get" }).count).to eq(0)
    end
  end

end