-- metadata
meta.id = "Unified.Spotify"
meta.name = "Spotify"
meta.author = "Unified Intents"
meta.description = "Spotify basic media remote control."
meta.platform = "osx"

local task = libs.task;
local keyboard = libs.keyboard;
local timer = libs.timer;
local server = libs.server;

local tid = -1;
local playing = false;
local title = "";
local volume = 0;

events.focus = function ()
	tid = timer.interval(actions.update, 500);
end

events.blur = function ()
	timer.cancel(tid);
end

--@help Update status information
actions.update = function ()
	local state = os.script("tell application \"Spotify\" to set out to player state");
	local _title = "[Not Playing]";
	local _playing = false;
	
	if (state == "playing") then
		local name = os.script("tell application \"Spotify\" to set out to name of current track");
		local artist = os.script("tell application \"Spotify\" to set out to artist of current track");
		_title = artist .. " - " .. name;
		_playing = true;
	end
	
	if (_title ~= title) then
		title = _title;
		server.update({ id = "info", text = title });
	end
	
	if (_playing ~= playing) then
		playing = _playing;
		if (playing) then
			server.update({ id = "p", icon = "pause" });
		else
			server.update({ id = "p", icon = "play" });
		end
	end
end

--@help Launch Spotify application
actions.launch = function()
	task.start("spotify");
end

--@help Start playback
actions.play = function()
	os.script("tell application \"Spotify\" to play");
end

--@help Pause playback
actions.pause = function()
	os.script("tell application \"Spotify\" to pause");
end

--@help Toggle playback state
actions.play_pause = function()
	os.script("tell application \"Spotify\" to playpause");
end

--@help Lower volume
actions.volume_down = function()
	os.script("tell application \"Spotify\" to set sound volume to (sound volume - 10)");
end

--@help Raise volume
actions.volume_up = function()
	local curr = os.script("tell application \"Spotify\" to set out to sound volume");
	curr = curr + 10;
	os.script("tell application \"Spotify\" to set sound volume to (sound volume - 10)");
end

--@help Mute volume
actions.volume_mute = function()
	local curr = os.script("tell application \"Spotify\" to set out to sound volume");
	if (curr == 0) then
		os.script("tell application \"Spotify\" to set sound volume to " .. volume);
	else
		volume = curr;
	end
end

--@help Next track
actions.next = function()
	os.script("tell application \"Spotify\" to next track");
end

--@help Previous track
actions.previous = function()
	os.script("tell application \"Spotify\" to previous track");
end

--@help Stop playback
actions.stop = function()
	os.script("tell application \"Spotify\" to pause");
end

