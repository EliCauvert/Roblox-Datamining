local foundation = script:FindFirstAncestor("Foundation")
local wrappersModule = require(foundation.Utility.Wrappers)
local coreGui = wrappersModule.Services.CoreGui
local runService = wrappersModule.Services.RunService
local players = wrappersModule.Services.Players
local flagsModule = require(foundation.Utility.Flags)
local isPluginSecurityModule = require(foundation.Utility.isPluginSecurity)
local var1 = false
local var2 = nil

local function _()
	-- upvalues: runService (ref), players (ref)
	return if runService:IsClient() and players.LocalPlayer and runService:IsRunning() then players.LocalPlayer:WaitForChild("PlayerGui", 3) else nil
end

return function()
	-- upvalues: isPluginSecurityModule (ref), coreGui (ref), flagsModule (ref), var2 (write), runService (ref), players (ref), var1 (write)
	if isPluginSecurityModule() then
		return coreGui
	elseif flagsModule.FoundationOverlayResilientMainGui then
		if var2 == nil then
			var2 = if runService:IsClient() and players.LocalPlayer and runService:IsRunning() then players.LocalPlayer:WaitForChild("PlayerGui", 3) else nil
		end
		return var2
	elseif not var1 then
		var2 = if runService:IsClient() and players.LocalPlayer and runService:IsRunning() then players.LocalPlayer:WaitForChild("PlayerGui", 3) else nil
		var1 = true
	end
	if var2 then
		return var2
	end
	error("PlayerGui not found")
end