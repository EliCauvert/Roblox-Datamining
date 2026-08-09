local foundation = script:FindFirstAncestor("Foundation")
local wrappersModule = require(foundation.Utility.Wrappers)
local coreGui = wrappersModule.Services.CoreGui
local runService = wrappersModule.Services.RunService
local players = wrappersModule.Services.Players
local flagsModule = require(foundation.Utility.Flags)
local isPluginSecurityModule = require(foundation.Utility.isPluginSecurity)
local var4 = false
local var5 = nil

local function _() --[[ line: 14 | named "getPlayerGui" ]]
	-- upvalues: runService (ref), players (ref)
	return if runService:IsClient() and players.LocalPlayer and runService:IsRunning() then players.LocalPlayer:WaitForChild("PlayerGui", 3) else nil
end

return function() --[[ line: 22 | named "getMainGui" ]]
	-- upvalues: flagsModule (ref), isPluginSecurityModule (ref), coreGui (ref), var4 (write), var5 (write), runService (ref), players (ref)
	if not flagsModule.FoundationUseMainGuiUtility then
		error("FoundationUseMainGuiUtility is not enabled")
	end
	if isPluginSecurityModule() then
		return coreGui
	elseif not var4 then
		var5 = if runService:IsClient() and players.LocalPlayer and runService:IsRunning() then players.LocalPlayer:WaitForChild("PlayerGui", 3) else nil
		var4 = true
	end
	if var5 then
		return var5
	end
	error("PlayerGui not found")
end