local foundation = script:FindFirstAncestor("Foundation")
local wrappersModule = require(foundation.Utility.Wrappers)
local coreGui = wrappersModule.Services.CoreGui
local runService = wrappersModule.Services.RunService
local players = wrappersModule.Services.Players
local isPluginSecurityModule = require(foundation.Utility.isPluginSecurity)
local var1 = nil

local function _()
	-- upvalues: runService (ref), players (ref)
	return if runService:IsClient() and players.LocalPlayer and runService:IsRunning() then players.LocalPlayer:WaitForChild("PlayerGui", 3) else nil
end

return function()
	-- upvalues: isPluginSecurityModule (ref), coreGui (ref), var1 (write), runService (ref), players (ref)
	if isPluginSecurityModule() then
		return coreGui
	elseif var1 == nil then
		var1 = if runService:IsClient() and players.LocalPlayer and runService:IsRunning() then players.LocalPlayer:WaitForChild("PlayerGui", 3) else nil
	end
	return var1
end