local Parent = script.Parent
local ExperienceServiceModule = require(Parent:FindFirstAncestor("SocialCards").Parent.ExperienceService)
local _ = require(Parent.InviteTypes)
local LeaveCurrentExperienceModule = require(Parent.leaveCurrentExperience)
local ExperienceService = ExperienceServiceModule.ExperienceService
local GameParams = ExperienceServiceModule.GameParams

return function(p1)
	-- upvalues: GameParams (copy), LeaveCurrentExperienceModule (copy), ExperienceService (copy)
	local FromParamsResult = GameParams.fromParams({
		referralPage = "ChatInviteCard",
		placeId = tonumber(p1.placeId),
		gameInstanceId = p1.gameInstanceId,
		launchData = p1.launchData
	})
	LeaveCurrentExperienceModule()
	ExperienceService:LaunchExperience(FromParamsResult, "ChatInviteCard", nil)
end