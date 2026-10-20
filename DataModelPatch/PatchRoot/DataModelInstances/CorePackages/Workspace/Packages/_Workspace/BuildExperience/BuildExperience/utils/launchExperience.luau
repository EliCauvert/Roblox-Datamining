local Parent = script:FindFirstAncestor("BuildExperience").Parent
local ExperienceServiceModule = require(Parent.ExperienceService)
local ExperienceService = ExperienceServiceModule.ExperienceService
local GameParams = ExperienceServiceModule.GameParams
local BuildModeLaunchModule = require(script.Parent.BuildModeLaunch)
local Debug = require(Parent.DataHydration.CreatorAgentChat).debug

return function(p1, Source, p2)
	-- upvalues: BuildModeLaunchModule (copy), GameParams (copy), Debug (copy), ExperienceService (copy)
	BuildModeLaunchModule:set()
	local FromPlaceIdResult = GameParams.fromPlaceId(p1, p2)
	Debug.log("info", "LaunchExperience gameParams", { gameParams = FromPlaceIdResult, source = Source })
	ExperienceService:LaunchExperience(FromPlaceIdResult, Source)
end