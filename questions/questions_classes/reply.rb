require_relative '../questionsdatabase.rb'
require_relative 'user.rb'
require_relative 'question.rb'

class Reply
  attr_accessor :id, :body, :question, :author, :parent_reply

  def self.find_by_id(id)
    repl = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        id = ?
    SQL
    Reply.new(repl.first)
  end

  def self.find_by_user_id(user_id)
    repl = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        replies
      WHERE
        user_id = ?
    SQL
    Reply.new(repl.first)
  end

  def self.find_by_question_id(question_id)
    repl = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        replies
      WHERE
        question_id = ?
    SQL
    Reply.new(repl.first)
  end

  def initialize(options)
    @id = options['id']
    @body = options['body']
    @question = options['question']
    @author = options['author']
    @parent_reply = options['parent_reply']
  end

end