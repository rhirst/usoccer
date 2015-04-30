require 'RestClient'

class Candidates 
  candidata = RestClient.get('http://www.politifact.com/api/statements/truth-o-meter/people/#{Candidate_name}/json/')
  statements = JSON.parse(response)

  for i in 0..number_of_statements
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