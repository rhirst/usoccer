require 'rest-client'

class Candidate
  def initialize(first_name, last_name, number_of_statements)
    @first_name = first_name.titleize
    @last_name = last_name
    @number_of_statements = number_of_statements
  end

  attr_reader :first_name, :last_name, :number_of_statements
  
  def full_name
    @first_name +' ' + @last_name
  end
  
  def image_url
    "/assets/#{name_slug}.jpg"
  end

  def statements
    @statements ||= JSON.parse(RestClient.get("http://www.politifact.com/api/statements/truth-o-meter/people/#{name_slug}/json/?n=#{@number_of_statements}"))
  end

  def credability
    @credability = 0
    for i in 0..(number_of_statements-1)
      ruling = statements[i]["ruling"]["ruling-slug"]
      case ruling
      when "true"
        credibility +=4
      when "mostly-true"
        credibility +=3
      when "half-true"
        credibility +=2
      when "mostly-false"
        credibility +=1
      when "false"
        credibility +=0
      end
    end
    credibility = (credibility/number_of_statements)
  end

  private
  def name_slug
    "#{@first_name.downcase}-#{@last_name.downcase}"
  end

end
