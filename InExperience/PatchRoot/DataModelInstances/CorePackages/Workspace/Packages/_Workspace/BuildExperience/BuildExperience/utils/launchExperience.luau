local parent = script:FindFirstAncestor("BuildExperience").Parent
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local experienceServiceModule = require(parent.ExperienceService)
local experienceService = experienceServiceModule.ExperienceService
local gameParams = experienceServiceModule.GameParams
local buildModeLaunchModule = require(script.Parent.BuildModeLaunch)
local debug = creatorAgentChatModule.debug

return function(p0, p1, p2)
	-- upvalues: buildModeLaunchModule (ref), gameParams (ref), debug (ref), experienceService (ref)
	buildModeLaunchModule:set()
	local var3 = gameParams.fromPlaceId(p0, p2)
	debug.log("info", "LaunchExperience gameParams", { gameParams = var3, source = p1 })
	experienceService:LaunchExperience(var3, p1)
end