module StringHelper
  def filter_and_group(strings, i)
    response = Hash.new
    strings.each do |string|
      next if string.length >= i
      if response.key?(string.length)
        response[string.length] += 1
      else
        response[string.length] = 1
      end
    end
    return response.to_json
  end
end