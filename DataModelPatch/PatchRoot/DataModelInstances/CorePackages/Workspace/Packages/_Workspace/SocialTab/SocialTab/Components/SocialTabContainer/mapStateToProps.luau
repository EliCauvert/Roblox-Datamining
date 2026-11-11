local SocialTab = script:FindFirstAncestor("SocialTab")
local DependenciesModule = require(SocialTab.dependencies)
local UserModule = require(SocialTab.User)
local Llama = DependenciesModule.llama
local GetDeepValueFunction = DependenciesModule.SocialLibraries.Dictionary.getDeepValue
local GetFFlagFixUserInfoWidgetPlusBadgeFunction = require(SocialTab.Parent.SharedFlags).GetFFlagFixUserInfoWidgetPlusBadge

return function(p1, p2)
	-- upvalues: GetDeepValueFunction (copy), UserModule (copy), GetFFlagFixUserInfoWidgetPlusBadgeFunction (copy), Llama (copy)
	local SocialTabShowContactImporterParams = GetDeepValueFunction(p1, "SocialTab.ShowContactImporterParams") or {}
	local JoinResult = UserModule.mapToUsers(p1, p2)(p1.LocalUserId)
	
	if GetFFlagFixUserInfoWidgetPlusBadgeFunction() then
		local User = if p1.Users then p1.Users[p1.LocalUserId] else nil
		
		if JoinResult and User then
			JoinResult = Llama.Dictionary.join(JoinResult, { isRobloxSubscriber = User.hasRobloxSubscription == true })
		end
	end
	return {
		unreadConversationCount = p1.SocialTab.UnreadConversationCount or 0,
		numberOfNotifications = p1.NotificationBadgeCounts.TopBarNotificationIcon,
		localUser = JoinResult,
		localUserId = p1.LocalUserId or nil,
		isPhoneVerified = SocialTabShowContactImporterParams.isPhoneVerified,
		isDiscoverabilityUnset = SocialTabShowContactImporterParams.isDiscoverabilityUnset
	}
end