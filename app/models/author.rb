class Author < ApplicationRecord


  def name
    first_name + " " + last_name
  end

end

print(Author.new(first_name: "hans", last_name: "franz", homepage: "hh").name)
