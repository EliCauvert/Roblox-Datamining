-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:52:18 2026 Pacific Standard Time.

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

local function _() --[[ line: 13 | named "getPlatform" ]]
	-- upvalues: userInputService (ref), guiService (ref), getInputPlatformModule (ref), t (ref)
	local ok, status = pcall(userInputService.GetPlatform, userInputService)
	
	return if ok then status elseif guiService:IsTenFootInterface() then t[getInputPlatformModule()] else nil
end

return function() --[[ line: 27 | named "getBuilderIconForCurrentPlatform" ]]
	-- upvalues: userInputService (ref), guiService (ref), getInputPlatformModule (ref), t (ref), platformIconMapModule (ref)
	local ok, status = pcall(userInputService.GetPlatform, userInputService)
	
	return platformIconMapModule[if ok then status elseif guiService:IsTenFootInterface() then t[getInputPlatformModule()] else nil]
end