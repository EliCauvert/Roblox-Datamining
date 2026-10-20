local Foundation = script:FindFirstAncestor("Foundation")
local WrappersModule = require(Foundation.Utility.Wrappers)
local CoreGui = WrappersModule.Services.CoreGui
local RunService = WrappersModule.Services.RunService
local Players = WrappersModule.Services.Players
local FlagsModule = require(Foundation.Utility.Flags)
local IsPluginSecurityModule = require(Foundation.Utility.isPluginSecurity)
local Flag = false
local PlayerGui = nil

local function _()
	-- upvalues: RunService (copy), Players (copy)
	return if RunService:IsClient() and Players.LocalPlayer and RunService:IsRunning() then Players.LocalPlayer:WaitForChild("PlayerGui", 3) else nil
end

return function()
	-- upvalues: FlagsModule (copy), IsPluginSecurityModule (copy), CoreGui (copy), Flag (ref), PlayerGui (ref), RunService (copy), Players (copy)
	if not FlagsModule.FoundationUseMainGuiUtility then
		error("FoundationUseMainGuiUtility is not enabled")
	end
	if IsPluginSecurityModule() then
		return CoreGui
	end
	if not Flag then
		PlayerGui = if RunService:IsClient() and Players.LocalPlayer and RunService:IsRunning() then Players.LocalPlayer:WaitForChild("PlayerGui", 3) else nil
		Flag = true
	end
	if PlayerGui then
		return PlayerGui
	else
		error("PlayerGui not found")
	end
end