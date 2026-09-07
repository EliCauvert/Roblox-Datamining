local parent = script:FindFirstAncestor("BuildExperience").Parent
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local experienceServiceModule = require(parent.ExperienceService)
local experienceService = experienceServiceModule.ExperienceService
local gameParams = experienceServiceModule.GameParams
local buildModeLaunchModule = require(script.Parent.BuildModeLaunch)
local debug = creatorAgentChatModule.debug

return function(p1, p2, p3)
	-- upvalues: buildModeLaunchModule (ref), gameParams (ref), debug (ref), experienceService (ref)
	buildModeLaunchModule:set()
	local var1 = gameParams.fromPlaceId(p1, p3)
	debug.log("info", "LaunchExperience gameParams", { gameParams = var1, source = p2 })
	experienceService:LaunchExperience(var1, p2)
end