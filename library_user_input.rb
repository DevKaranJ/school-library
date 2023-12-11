# library_user_input.rb
require 'date'
class LibraryUserInput
  def self.get_integer(prompt)
    print "#{prompt}: "
    gets.chomp.to_i
  end

  def self.choice
    print 'Enter your choice: '
    gets.chomp.to_i
  end

  def self.get_string(prompt)
    print "#{prompt}: "
    gets.chomp
  end

  def self.get_boolean(prompt)
    print "#{prompt} (true/false): "
    gets.chomp.downcase == 'true'
  end

  def self.get_date(prompt)
    print "#{prompt} (YYYY-MM-DD): "
    Date.parse(gets.chomp)
  end
end
