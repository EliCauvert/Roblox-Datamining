local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local Parent = script:FindFirstAncestor("AvatarExperienceAnalytics").Parent
local Default = require(Parent.LoggingProtocol).default
local DashModule = require(Parent.Dash)
local IsSpatialFunction = require(Parent.AppCommonLib).isSpatial

local function getAXCounterV2Metadata(p1)
	-- upvalues: UserInputService (copy), IsSpatialFunction (copy), RunService (copy), HttpService (copy), DashModule (copy)
	local AssignResult = {
		AppVersion = RunService:GetRobloxVersion(),
		UserAgent = HttpService:GetUserAgent(),
		CoreScriptVersion = RunService:GetCoreScriptVersion(),
		Platform = if IsSpatialFunction() then "VR" else UserInputService:GetPlatform()
	}
	
	if p1 and next(p1) ~= nil then
		AssignResult = DashModule.assign({}, AssignResult, p1)
	end
	return AssignResult
end

return function(Text, p1)
	-- upvalues: Default (copy), getAXCounterV2Metadata (copy)
	Default:logRobloxTelemetryCounter({
		description = "Counter to track various Avatar Experience events.",
		links = "",
		eventName = "AvatarExperience_" .. Text,
		backends = { Default.TelemetryBackends.Counter },
		lastUpdated = { 2025, 10, 30 }
	}, 1, (getAXCounterV2Metadata(p1)))
end