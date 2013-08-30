$KCODE = 'u'

require 'rubygems'
Gem.use_paths(File.join(Ti.App.getHome, 'Resources/ruby/gems/ruby/1.8'))

require 'mechanize'


def load_account
  begin
    f = open(File.join(Ti.App.getHome, 'config'))
    id = f.gets.chomp!
    pw = f.gets.chomp!
  rescue
    Ti.App.stderr("config read error: please write your account to config file")
    exit 1
  else
    f.close
  end
 
  return { :id => id, :pw => pw }
end


def fetch_game_uri()
  url = 'http://www.dmm.com/netgame/social/application/-/detail/=/app_id=854854/'
  act_to_login = '/netgame/social/application/-/detail/=/app_id=854854/act=install/'
  act_to_auth  = 'https://www.dmm.com/my/-/login/auth/'

  agent = Mechanize.new
  agent.follow_meta_refresh = true

  agent.get(url)
  agent.page.form(:action => act_to_login).submit

  acc = load_account
  agent.page.form(:action => act_to_auth) do |f| 
    f.login_id = acc[:id]
    f.password = acc[:pw]
    f.submit
  end

  game_uri = agent.page.iframe_with(:name => 'game_frame').uri.to_s
  
  Ti.App.stderr('game uri is ' + game_uri)

  return game_uri
end
