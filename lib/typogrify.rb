require 'typogruby'

module Typogrify
  def typogrify(content)
    Typogruby.improve(content)
  end
end