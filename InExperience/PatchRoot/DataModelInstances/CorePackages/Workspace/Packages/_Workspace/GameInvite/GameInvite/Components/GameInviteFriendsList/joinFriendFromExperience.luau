local Parent = script:FindFirstAncestor("GameInvite").Parent
local ExperienceServiceModule = require(Parent.ExperienceService)
local IsSubjectToDesktopPoliciesFunction = require(Parent.SharedFlags).isSubjectToDesktopPolicies
local ExperienceService = ExperienceServiceModule.ExperienceService
local GameParams = ExperienceServiceModule.GameParams

return function(p1)
	-- upvalues: GameParams (copy), IsSubjectToDesktopPoliciesFunction (copy), ExperienceService (copy)
	local RootPlaceId = if p1.placeId == "" then p1.rootPlaceId else p1.placeId
	local FromParamsResult = GameParams.fromParams({
		referralPage = "GameInviteFriendsList",
		userId = p1.userId,
		placeId = if RootPlaceId == "" then nil else tonumber(RootPlaceId)
	})
	
	if not IsSubjectToDesktopPoliciesFunction() then
		game:Shutdown()
	end
	ExperienceService:LaunchExperience(FromParamsResult, "GameInviteFriendsListFromInExp", nil)
end