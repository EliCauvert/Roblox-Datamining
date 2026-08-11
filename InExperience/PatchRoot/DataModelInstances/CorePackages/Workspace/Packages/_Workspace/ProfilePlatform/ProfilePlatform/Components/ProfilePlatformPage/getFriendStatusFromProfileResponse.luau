local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local getDeepValueModule = require(profilePlatform.Utils.getDeepValue)
local enumsModule = require(profilePlatform.Common.Enums)
local fFlagProfilePlatformUseViewerRelationshipForSocialStateModule = require(profilePlatform.Flags.FFlagProfilePlatformUseViewerRelationshipForSocialState)
local friendStatusModule = require(profilePlatform.Analytics.FriendStatus)
local viewerRelationshipUtilsModule = require(script.Parent.viewerRelationshipUtils)
local profilePlatformFixSelfAnalytics = game:DefineFastFlag("ProfilePlatformFixSelfAnalytics", false)

return function(p0) --[[ line: 13 | named "getFriendStatusFromProfileResponse" ]]
	-- upvalues: fFlagProfilePlatformUseViewerRelationshipForSocialStateModule (ref), viewerRelationshipUtilsModule (ref), getDeepValueModule (ref), enumsModule (ref), friendStatusModule (ref), profilePlatformFixSelfAnalytics (ref)
	if fFlagProfilePlatformUseViewerRelationshipForSocialStateModule then
		return viewerRelationshipUtilsModule.mapViewerRelationshipAndContextToAnalyticsFriendStatus(viewerRelationshipUtilsModule.getViewerRelationshipFromProfileResponse(p0), viewerRelationshipUtilsModule.getContextualInformationFromProfileResponse(p0))
	end
	local var7 = getDeepValueModule(p0, `responseBody.components.{enumsModule.Components.Actions}.buttons`)
	local var8 = if var7 and var7[1] then var7[1].type else nil
	
	return if var8 then if var8 == enumsModule.ProfileActions.PendingFriendRequest then friendStatusModule.RequestSent elseif var8 == enumsModule.ProfileActions.AcceptFriendRequest then friendStatusModule.RequestReceived elseif var8 == enumsModule.ProfileActions.Chat or var8 == enumsModule.ProfileActions.JoinExperience or var8 == enumsModule.ProfileActions.EditAlias then friendStatusModule.Friends elseif var8 == enumsModule.ProfileActions.EditProfile or profilePlatformFixSelfAnalytics and var8 == enumsModule.ProfileActions.EditAvatar or profilePlatformFixSelfAnalytics and var8 == enumsModule.ProfileActions.EditAppearance then friendStatusModule.Self elseif var8 == enumsModule.ProfileActions.Unfriend then friendStatusModule.Ineligible else friendStatusModule.NotFriends else friendStatusModule.Unknown
end