require_relative '../questionsdatabase.rb'
require_relative 'question.rb'
require_relative 'user.rb'

class QuestionFollow
  attr_accessor :id, :users_id, :questions_id

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

  def self.followers_for_question_id(question_id)
    follow = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        users.id, users.fname, users.lname
      FROM
        users
      JOIN 
        question_follows ON question_follows.users_id = users.id
      WHERE
        question_follows.questions_id = ?
    SQL
    follow.map { |ele| User.new(ele) }
  end

  def self.followed_questions_for_user_id(user_id)
    follow = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        questions.id, questions.title, questions.body, questions.author_id
      FROM
        questions
      JOIN 
        question_follows ON question_follows.questions_id = questions.id
      WHERE
        user_id = ?
    SQL
    follow.map { |ele| Questions.new(ele) }
  end


  def initialize(options)
    @id = options['id']
    @users_id = options['users_id']
    @questions_id = options['questions_id']
  end
end