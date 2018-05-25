json.questions @questions do |question|
  json.question question.question
  json.language question.language
  json.arguments question.arguments do |argument|
    json.title argument.title
    json.argument argument.clean_argument
    json.author argument.author
    json.url argument.url
    json.language argument.language
    json.link argument.hyperlink
  end
end
