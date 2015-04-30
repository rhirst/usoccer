class CandidatesController < ApplicationController
  def index
    @candidates = [
      Candidate.new('Hillary', 'Clinton',5),
      Candidate.new('Ted', 'Cruz',5)]
  end

  def show
    @Candidate = Person.new(params[:first_name], params[:last_name])
  end
end
