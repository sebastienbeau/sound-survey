class AnswersController < ApplicationController

  def index
    @sound = sound
    @sounds = sounds
    if @sounds.size == 0
      redirect_to :controller => 'site', :action => 'finish'
    end

  end

  def new
    Answer.create(
      user: user_id,
      group: group,
      item: new_params[:sound],
      aversif: new_params[:aversif],
      valence: new_params[:valence],
      arousal: new_params[:arousal],
      douleur: new_params[:douleur],
    )
    sounds.delete(new_params[:sound])
    redirect_to :controller => 'answers', :action => 'index'
  end

  private

  def new_params
    @new_params ||= params.permit(:aversif, :valence, :arousal, :douleur, :sound)
  end

end
