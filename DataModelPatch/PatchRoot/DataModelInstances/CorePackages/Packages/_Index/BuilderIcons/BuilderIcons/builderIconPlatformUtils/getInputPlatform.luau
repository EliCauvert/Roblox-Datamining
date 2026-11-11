local UserInputService = require(script.Parent.Parent.Services).UserInputService
local PlatformModule = require(script.Parent.Platform)
local config = {
	ps4 = PlatformModule.PS4,
	ps5 = PlatformModule.PS5,
	xbox = PlatformModule.Xbox
}

return function()
	-- upvalues: UserInputService (copy), config (copy), PlatformModule (copy)
	local ImageForKeyCode: string = UserInputService:GetImageForKeyCode(Enum.KeyCode.ButtonStart)
	
	for i, value in config do
		if ImageForKeyCode:find(i) then
			return value
		end
	end
	return if UserInputService:GetStringForKeyCode(Enum.KeyCode.ButtonA) == "ButtonCross" then PlatformModule.PS5 else PlatformModule.Xbox
end