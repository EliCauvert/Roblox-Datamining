local PlatformModule = require(script.Parent.Platform)
local GetInputPlatformModule = require(script.Parent.getInputPlatform)
local PlatformIconMapModule = require(script.Parent.PlatformIconMap)
local UserInputService = require(script.Parent.Parent.Services).UserInputService
local GuiService = require(script.Parent.Parent.Services).GuiService
local config = {
	[PlatformModule.PS4] = Enum.Platform.PS4,
	[PlatformModule.PS5] = Enum.Platform.PS5,
	[PlatformModule.Xbox] = Enum.Platform.XBoxOne
}

local function _()
	-- upvalues: UserInputService (copy), GuiService (copy), GetInputPlatformModule (copy), config (copy)
	local Success, Result = pcall(UserInputService.GetPlatform, UserInputService)
	
	if Success then
		return Result
	else
		local IsTenFootInterface = GuiService:IsTenFootInterface()
		local InputPlatformModule = GetInputPlatformModule()
		
		return if IsTenFootInterface then config[InputPlatformModule] else nil
	end
end

return function()
	-- upvalues: UserInputService (copy), GuiService (copy), GetInputPlatformModule (copy), config (copy), PlatformIconMapModule (copy)
	local Success, Result = pcall(UserInputService.GetPlatform, UserInputService)
	local Result1 = nil
	
	if Success then
		Result1 = Result
	else
		local IsTenFootInterface = GuiService:IsTenFootInterface()
		local InputPlatformModule = GetInputPlatformModule()
		Result1 = if IsTenFootInterface then config[InputPlatformModule] else nil
	end
	return PlatformIconMapModule[Result1]
end