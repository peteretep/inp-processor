require 'spec_helper'
require 'rails_helper'
require 'inpImporter/inpImporter'

describe 'inpImporter' do
  it 'is needs a file' do
    expect { InpImporter.new }.to raise_error(ArgumentError)
    model_file = file_fixture("model.inp")
    expect(InpImporter.new(model_file)).to_not be_nil
  end

  it 'parse returns a hash' do
    importer = InpImporter.new(file_fixture("model.inp"))
    expect(importer.parse).to  be_a(Hash)
  end

  it 'parses rec_ve_31' do
    importer = InpImporter.new(file_fixture("model.inp"))
    expect(importer.parse[:rec_ve_31]).to  eq "REC-USER"
  end
end
