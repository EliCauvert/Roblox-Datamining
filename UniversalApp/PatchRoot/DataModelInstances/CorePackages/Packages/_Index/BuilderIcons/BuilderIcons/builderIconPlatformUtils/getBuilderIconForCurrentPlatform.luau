local platformModule = require(script.Parent.Platform)
local getInputPlatformModule = require(script.Parent.getInputPlatform)
local platformIconMapModule = require(script.Parent.PlatformIconMap)
local userInputService = require(script.Parent.Parent.Services).UserInputService
local guiService = require(script.Parent.Parent.Services).GuiService
local t = {
	[platformModule.PS4] = Enum.Platform.PS4,
	[platformModule.PS5] = Enum.Platform.PS5,
	[platformModule.Xbox] = Enum.Platform.XBoxOne
}

local function _()
	-- upvalues: userInputService (ref), guiService (ref), getInputPlatformModule (ref), t (ref)
	local ok, status = pcall(userInputService.GetPlatform, userInputService)
	
	return if ok then status elseif guiService:IsTenFootInterface() then t[getInputPlatformModule()] else nil
end

return function()
	-- upvalues: userInputService (ref), guiService (ref), getInputPlatformModule (ref), t (ref), platformIconMapModule (ref)
	local ok, status = pcall(userInputService.GetPlatform, userInputService)
	
	return platformIconMapModule[if ok then status elseif guiService:IsTenFootInterface() then t[getInputPlatformModule()] else nil]
end