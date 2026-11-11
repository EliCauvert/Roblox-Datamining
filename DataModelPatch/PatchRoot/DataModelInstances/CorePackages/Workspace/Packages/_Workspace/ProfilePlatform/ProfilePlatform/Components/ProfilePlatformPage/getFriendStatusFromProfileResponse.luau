local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local GetDeepValueModule = require(ProfilePlatform.Utils.getDeepValue)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local FFlagProfilePlatformUseViewerRelationshipForSocialStateModule = require(ProfilePlatform.Flags.FFlagProfilePlatformUseViewerRelationshipForSocialState)
local FriendStatusModule = require(ProfilePlatform.Analytics.FriendStatus)
local ViewerRelationshipUtilsModule = require(script.Parent.viewerRelationshipUtils)
local ProfilePlatformFixSelfAnalytics = game:DefineFastFlag("ProfilePlatformFixSelfAnalytics", false)

return function(p1)
	-- upvalues: FFlagProfilePlatformUseViewerRelationshipForSocialStateModule (copy), ViewerRelationshipUtilsModule (copy), GetDeepValueModule (copy), EnumsModule (copy), FriendStatusModule (copy), ProfilePlatformFixSelfAnalytics (copy)
	if FFlagProfilePlatformUseViewerRelationshipForSocialStateModule then
		return ViewerRelationshipUtilsModule.mapViewerRelationshipAndContextToAnalyticsFriendStatus(ViewerRelationshipUtilsModule.getViewerRelationshipFromProfileResponse(p1), (ViewerRelationshipUtilsModule.getContextualInformationFromProfileResponse(p1)))
	end
	local DeepValueModule = GetDeepValueModule(p1, `responseBody.components.{EnumsModule.Components.Actions}.buttons`)
	local Type = if DeepValueModule and DeepValueModule[1] then DeepValueModule[1].type else nil
	
	if not Type then
		return FriendStatusModule.Unknown
	elseif Type == EnumsModule.ProfileActions.PendingFriendRequest then
		return FriendStatusModule.RequestSent
	elseif Type == EnumsModule.ProfileActions.AcceptFriendRequest then
		return FriendStatusModule.RequestReceived
	elseif Type == EnumsModule.ProfileActions.Chat or Type == EnumsModule.ProfileActions.JoinExperience or Type == EnumsModule.ProfileActions.EditAlias then
		return FriendStatusModule.Friends
	elseif Type == EnumsModule.ProfileActions.EditProfile or ProfilePlatformFixSelfAnalytics and Type == EnumsModule.ProfileActions.EditAvatar or ProfilePlatformFixSelfAnalytics and Type == EnumsModule.ProfileActions.EditAppearance then
		return FriendStatusModule.Self
	else
		return if Type == EnumsModule.ProfileActions.Unfriend then FriendStatusModule.Ineligible else FriendStatusModule.NotFriends
	end
end