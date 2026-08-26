local runService = game:GetService("RunService")
local httpService = game:GetService("HttpService")
local userInputService = game:GetService("UserInputService")
local parent = script:FindFirstAncestor("AvatarExperienceAnalytics").Parent
local default = require(parent.LoggingProtocol).default
local dashModule = require(parent.Dash)
local isSpatial = require(parent.AppCommonLib).isSpatial

local function getAXCounterV2Metadata(p1)
	-- upvalues: userInputService (ref), isSpatial (ref), runService (ref), httpService (ref), dashModule (ref)
	local t = {
		AppVersion = runService:GetRobloxVersion(),
		UserAgent = httpService:GetUserAgent(),
		CoreScriptVersion = runService:GetCoreScriptVersion(),
		Platform = if isSpatial() then "VR" else userInputService:GetPlatform()
	}
	
	if p1 and next(p1) ~= nil then
		t = dashModule.assign({}, t, p1)
	end
	return t
end

return function(p1, p2)
	-- upvalues: default (ref), getAXCounterV2Metadata (ref)
	default:logRobloxTelemetryCounter({
		description = "Counter to track various Avatar Experience events.",
		links = "",
		eventName = "AvatarExperience_" .. p1,
		backends = { default.TelemetryBackends.Counter },
		lastUpdated = { 2025, 10, 30 }
	}, 1, getAXCounterV2Metadata(p2))
end