-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:52:18 2026 Pacific Standard Time.

local userInputService = require(script.Parent.Parent.Services).UserInputService
local platformModule = require(script.Parent.Platform)
local t = {
	ps4 = platformModule.PS4,
	ps5 = platformModule.PS5,
	xbox = platformModule.Xbox
}

return function() --[[ line: 10 | named "getInputPlatform" ]]
	-- upvalues: userInputService (ref), t (ref), platformModule (ref)
	local buttonStartImageForKeyCode = userInputService:GetImageForKeyCode(Enum.KeyCode.ButtonStart)
	
	for i, v in t do
		if buttonStartImageForKeyCode:find(i) then
			return v
		end
	end
	return if userInputService:GetStringForKeyCode(Enum.KeyCode.ButtonA) == "ButtonCross" then platformModule.PS5 else platformModule.Xbox
end