
local task = libs.task;
local keyboard = libs.keyboard;

--@help Focus Boxee application
actions.switch = function()
	local hwnd = task.window("BOXEE.exe");
	if (hwnd == 0) then
		actions.launch();
	end
	task.switchtowait(hwnd);
end

--@help Launch Boxee application
actions.launch = function()
	task.start("%programfiles(x86)%/Boxee/BOXEE.exe");
end

--@help Lower volume
actions.volume_down = function()
	actions.switch();
	keyboard.stroke("volume_down");
end

--@help Mute volume
actions.volume_mute = function()
	actions.switch();
	keyboard.stroke("volume_mute");
end

--@help Raise volume
actions.volume_up = function()
	actions.switch();
	keyboard.stroke("volume_up");
end

--@help Rewind
actions.rewind = function()
	actions.switch();
	keyboard.stroke("down");
	keyboard.stroke("left");
end

--@help Fast forward
actions.forward = function()
	actions.switch();
	keyboard.stroke("down");
	keyboard.stroke("right");
end

--@help Stop playback
actions.stop = function()
	actions.switch();
	keyboard.stroke("lmenu","x");
end

--@help Toggle playback state
actions.play_pause = function()
	actions.switch();
	keyboard.stroke("lmenu","space");
end

--@help Navigate up
actions.up = function()
	actions.switch();
	keyboard.stroke("up");
end

--@help Navigate down
actions.down = function()
	actions.switch();
	keyboard.stroke("down");
end

--@help Navigate left
actions.left = function()
	actions.switch();
	keyboard.stroke("left");
end

--@help Navigate back
actions.back = function()
	actions.switch();
	keyboard.stroke("escape");
end

--@help Navigate right
actions.right = function()
	actions.switch();
	keyboard.stroke("right");
end

--@help Toggle fullscreen
actions.fullscreen = function()
	actions.switch();
	keyboard.stroke("lmenu", "return");
end

--@help Navigate home
actions.home = function()
	actions.switch();
	keyboard.stroke("lmenu","h");
end

--@help Select current item
actions.select = function()
	actions.switch();
	keyboard.stroke("return");
end

