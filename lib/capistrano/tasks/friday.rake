require 'colorize'

namespace :friday do
  motds = {
    :base_jumper => %{
┓┏┓┏┓┃
┛┗┛┗┛┃⟍ ○⟋
┓┏┓┏┓┃  ∕       Friday
┛┗┛┗┛┃ノ)
┓┏┓┏┓┃          deploy,
┛┗┛┗┛┃
┓┏┓┏┓┃          good
┛┗┛┗┛┃
┓┏┓┏┓┃          luck!
┃┃┃┃┃┃
┻┻┻┻┻┻
}.strip!,
    :flipping_table => %{
(╯°□°）╯︵ ┻━┻    FRIDAY DEPLOY!
}.strip!
  }

  task :check do
    ignored_stages = Array(fetch :friday_ignored_stages)
    unless ignored_stages.include?(fetch(:stage))
      invoke 'friday:good_luck' if Time.now.friday?
      # invoke 'friday:happy_birthday' if Time.now.strftime("%m-%d") == VladimirKochnev.created_at.strftime("%m-%d")
    end
  end

  task :good_luck do
    motd = fetch :friday_motd
    unless motds.key? motd
      fail "MOTD #{motd.inspect} not found!"
    end
    warn motds[motd].yellow
    if fetch :friday_disable_deploy
      fail "Friday deploy disabled!"
    end
  end
end

task :happy_birthday do
  # ∩______∩ five
  # |(• ◡•)|/  \(❍ᴥ❍ʋ)
end

namespace :load do
  task :defaults do
    set :friday_motd, :base_jumper
    set :friday_disable_deploy, false
    set :friday_ignored_stages, :staging
  end
end
