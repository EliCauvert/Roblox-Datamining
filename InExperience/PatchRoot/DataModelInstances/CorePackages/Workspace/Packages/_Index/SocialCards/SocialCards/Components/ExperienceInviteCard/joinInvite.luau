local Parent = script.Parent
local ExperienceServiceModule = require(Parent:FindFirstAncestor("SocialCards").Parent.ExperienceService)
local LeaveCurrentExperienceModule = require(Parent.leaveCurrentExperience)
local ExperienceService = ExperienceServiceModule.ExperienceService
local GameParams = ExperienceServiceModule.GameParams

return function(p1, p2)
	-- upvalues: GameParams (copy), LeaveCurrentExperienceModule (copy), ExperienceService (copy)
	local FromParamsResult = GameParams.fromParams({
		referralPage = "ChatInviteCard",
		userId = if p2 then tonumber(p2) else nil,
		placeId = tonumber(p1)
	})
	LeaveCurrentExperienceModule()
	ExperienceService:LaunchExperience(FromParamsResult, "ChatInviteCard", nil)
end