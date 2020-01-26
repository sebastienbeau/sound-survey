class ApplicationController < ActionController::Base

  before_action :set_variables

  SOUND_PER_GROUP = {}

  Dir.foreach("public/sound") do | group |
    next if [".", ".."].include?(group)
    SOUND_PER_GROUP[group] = []
    Dir.foreach("public/sound/#{group}") do | file |
      next if ['.', '..'].include?(file)
      SOUND_PER_GROUP[group].append("/sound/#{group}/#{file}")
    end
  end

  def set_variables
    total = SOUND_PER_GROUP[group].size
    @progress = (total - sounds.size) * 100 / total
    puts total, sounds.size, @progress
  end

  private

  def user_id
    unless session[:user_id]
      session[:user_id] = User.create(group: group).id
    end
    session[:user_id]
  end

  def sounds
    session[:sounds] ||= SOUND_PER_GROUP[group].clone
  end

  def sound
    sounds.sample
  end

  def group
    session[:group] ||= SOUND_PER_GROUP.keys.sample
  end

end
