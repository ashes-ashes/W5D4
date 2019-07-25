require_relative '../questionsdatabase.rb'

class QuestionFollow
  attr_accessor :users_id, :questions_id

  def self.find_by_id(id)
    follow = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_follows
      WHERE
        id = ?
    SQL
    QuestionFollow.new(follow.first)
  end

  def initialize(options)
    @users_id = options['users_id']
    @questions_id = options['questions_id']
  end
end