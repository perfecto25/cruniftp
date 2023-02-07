require "ssh2"

SSH2::Session.open("qbtm-us2") do |session|
  session.login("mreider", "password")
  session.open_session do |channel|
    channel.command("uptime")
    IO.copy(channel, STDOUT)
  end
end
