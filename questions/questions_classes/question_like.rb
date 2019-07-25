require_relative '../questionsdatabase.rb'

class QuestionLike
  attr_accessor :question, :liker

  def self.find_by_id(id)
    like = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_likes
      WHERE
        id = ?
    SQL
    QuestionLike.new(like.first)
  end

  def initialize(options)
    @question = options['question']
    @liker = options['liker']
  end

end