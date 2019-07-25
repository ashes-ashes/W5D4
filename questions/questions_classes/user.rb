require_relative '../questionsdatabase.rb'


class User
  attr_accessor :fname, :lname

  def self.find_by_id(id)
    person = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        users
      WHERE
        id = ?
    SQL
    User.new(person.first)
  end

  def self.find_by_name(fname, lname)
    person = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM
        users
      WHERE
        fname = ? AND lname = ?
    SQL
    User.new(person.first)
  end

  def initialize(options)
    @fname = options['fname']
    @lname = options['lname']
  end
end