require_relative '../questionsdatabase.rb'

class QuestionLike
  attr_accessor :id, :question, :liker

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
    @id = options['id']
    @question = options['question']
    @liker = options['liker']
  end

end