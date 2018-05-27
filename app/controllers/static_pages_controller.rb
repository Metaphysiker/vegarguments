class StaticPagesController < ApplicationController
  def welcome

  end

  def overview
    @questions_with_few_arguments = Question.published.fewer_arguments_than(2)
  end

  def visits

  end

  def contact

  end

  def contribute

  end

  def use

  end

end
