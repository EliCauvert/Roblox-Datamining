local Foundation = script:FindFirstAncestor("Foundation")
local WrappersModule = require(Foundation.Utility.Wrappers)
local CoreGui = WrappersModule.Services.CoreGui
local RunService = WrappersModule.Services.RunService
local Players = WrappersModule.Services.Players
local IsPluginSecurityModule = require(Foundation.Utility.isPluginSecurity)
local PlayerGui = nil

local function _()
	-- upvalues: RunService (copy), Players (copy)
	return if RunService:IsClient() and Players.LocalPlayer and RunService:IsRunning() then Players.LocalPlayer:WaitForChild("PlayerGui", 3) else nil
end

return function()
	-- upvalues: IsPluginSecurityModule (copy), CoreGui (copy), PlayerGui (ref), RunService (copy), Players (copy)
	if IsPluginSecurityModule() then
		return CoreGui
	end
	if PlayerGui == nil then
		PlayerGui = if RunService:IsClient() and Players.LocalPlayer and RunService:IsRunning() then Players.LocalPlayer:WaitForChild("PlayerGui", 3) else nil
	end
	return PlayerGui
end