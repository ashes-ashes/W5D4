require_relative '../questionsdatabase.rb'
require_relative 'user.rb'
require_relative 'reply.rb'

class Question
  attr_accessor :id, :title, :body, :author_id

  def self.find_by_id(id)
    quest = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        questions
      WHERE
        id = ?
    SQL
    Question.new(quest.first)
  end

  def self.find_by_author_id(author_id)
    quest = QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        questions
      WHERE
        author_id = ?
    SQL
    Question.new(quest.first)
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @author_id = options['author_id']
  end
end