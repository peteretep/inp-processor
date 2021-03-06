# frozen_string_literal: true

require 'spec_helper'
require 'rails_helper'
require 'inpImporter/inpImporter'

describe 'inpImporter' do
  let(:filepath) { file_fixture('model.inp') }

  it 'is needs a file' do
    expect { InpImporter.new }.to raise_error(ArgumentError)
    expect(InpImporter.new(filepath)).to_not be_nil
  end

  it 'parse returns a hash' do
    importer = InpImporter.new(filepath)
    expect(importer.parse).to be_a(Hash)
  end

  context 'parse' do
    let(:importer) { InpImporter.new(filepath) }
    it 'general returns a hash sized' do
      expect(importer.general).to be_a(Hash)
      byebug
      expect(importer.general.size).to be 2
    end
  end

  context 'when using the model.inp file' do
    let(:filepath) { file_fixture('model.inp') }
    let(:importer) { InpImporter.new(filepath) }

    it 'expects p_name to be BL-EPC-2599' do
      importer = InpImporter.new(filepath)
      expect(importer.parse[:p_name]).to eq 'BL-EPC-2599'
    end
    it 'general returns a hash sized' do
      expect(importer.general).to be_a(Hash)
      byebug
      expect(importer.general.size).to be 2
    end
  end
  context 'when using the model-1.inp file' do
    let(:filepath) { file_fixture('model-1.inp') }
    let(:importer) { InpImporter.new(filepath) }

    it 'expects p_name to be Kelting House, 3 & 4th Floor, Basildon, Essex, SS14 1EL' do
      importer = InpImporter.new(filepath)
      expect(importer.parse[:p_name]).to eq 'Kelting House, 3 & 4th Floor, Basildon, Essex, SS14 1EL'
    end
    it 'general returns a hash sized' do
      expect(importer.general).to be_a(Hash)
      byebug
      expect(importer.general.size).to be 2
    end
  end

  context 'when using the model-2.inp file' do
    let(:filepath) { file_fixture('model-2.inp') }
    let(:importer) { InpImporter.new(filepath) }

    it 'general returns a hash sized' do
      expect(importer.general).to be_a(Hash)
      byebug
      expect(importer.general.size).to be 2
    end

    it 'expects p_name to be Unit 11A, Eastgate Shopping Centre, Basildon, SS14 1EB' do
      importer = InpImporter.new(filepath)
      expect(importer.parse[:p_name]).to eq 'Unit 11A, Eastgate Shopping Centre, Basildon, SS14 1EB'
    end
  end
end
