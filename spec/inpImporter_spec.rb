require 'spec_helper'
require 'rails_helper'
require 'inpImporter/inpImporter'

describe 'inpImporter' do

  it 'is needs a file' do
    expect { InpImporter.new }.to raise_error(ArgumentError)
    model_file = file_fixture("model.inp")
    expect(InpImporter.new(model_file)).to_not be_nil
  end

  context 'when using the model.inp file' do
    let(:filepath) { file_fixture('model.inp') }

    it 'parse returns a hash' do
      importer = InpImporter.new(filepath)
      expect(importer.parse).to be_a(Hash)
    end

    it 'expects p_name to be BL-EPC-2599' do
      importer = InpImporter.new(filepath)
      expect(importer.parse[:p_name]).to  eq "BL-EPC-2599"
    end
  end
  context 'when using the model-1.inp file' do
    let(:filepath) { file_fixture('model-1.inp') }
     it 'parse returns a hash' do
      importer = InpImporter.new(filepath)
      expect(importer.parse).to be_a(Hash)
    end

    it 'expects p_name to be Kelting House, 3 & 4th Floor, Basildon, Essex, SS14 1EL' do
      importer = InpImporter.new(filepath)
      expect(importer.parse[:p_name]).to  eq "Kelting House, 3 & 4th Floor, Basildon, Essex, SS14 1EL"
    end
  end

  context 'when using the model-2.inp file' do
    let(:filepath) { file_fixture('model-2.inp') }
     it 'parse returns a hash' do
      importer = InpImporter.new(filepath)
      expect(importer.parse).to be_a(Hash)
    end

    it 'expects p_name to be Unit 11A, Eastgate Shopping Centre, Basildon, SS14 1EB' do
      importer = InpImporter.new(filepath)
      expect(importer.parse[:p_name]).to  eq "Unit 11A, Eastgate Shopping Centre, Basildon, SS14 1EB"
    end
  end

end
