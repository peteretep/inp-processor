# Inp file format handler
class InpImporter
  def initialize(file_path)
    @file_path = file_path
  end

  # Parses the file
  # @return [Hash] the ini file parsed into a hash using downcase underscore symbols as keys
  def parse
    parsedata = {}
    File.foreach(@file_path) do |line|
      k, v = line.split('=',2)
      next unless k.present? && v.present?

      key = k.strip.delete_prefix('"').delete_suffix('"')
      value = v.strip.delete_prefix('"').delete_suffix('"')
      parsedata.store(key.underscore.to_sym, value)
    end
    parsedata
  end
end
