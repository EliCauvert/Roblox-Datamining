local AddFriends = script:FindFirstAncestor("AddFriends")
local Parent = AddFriends.Parent
local ReactModule = require(Parent.React)
local Text = require(Parent.Foundation).Text
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local EventNamesModule = require(AddFriends.Analytics.EventNames)
local UseFireAnalyticsEventModule = require(AddFriends.Analytics.useFireAnalyticsEvent)
local FriendingOSAEducationImpressionCacheModule = require(script.Parent.FriendingOSAEducationImpressionCache)
local UseFriendingOSAEducationSubtitleModule = require(script.Parent.useFriendingOSAEducationSubtitle)
local FFlagConnectionsToFriendsRenameP1V1 = require(Parent.SharedFlags).FFlagConnectionsToFriendsRenameP1_v1
local FriendingOSAUseHook = game:DefineFastFlag("FriendingOSAUseHook", false)

local function isHiddenOnInit(): boolean
	-- upvalues: FriendingOSAEducationImpressionCacheModule (copy)
	return FriendingOSAEducationImpressionCacheModule.getValue() ~= 0
end

return function(p1)
	-- upvalues: FriendingOSAUseHook (copy), UseFriendingOSAEducationSubtitleModule (copy), ReactModule (copy), Text (copy), isHiddenOnInit (copy), UseFireAnalyticsEventModule (copy), UseAppPolicyFunction (copy), UseLocalizationFunction (copy), FFlagConnectionsToFriendsRenameP1V1 (copy), EventNamesModule (copy), FriendingOSAEducationImpressionCacheModule (copy)
	local LayoutOrder = p1.layoutOrder
	
	if FriendingOSAUseHook then
		local UseFriendingOSAEducationSubtitleModuleResult = UseFriendingOSAEducationSubtitleModule()
		
		return if UseFriendingOSAEducationSubtitleModuleResult then ReactModule.createElement(Text, {
			tag = "auto-y grow size-full-0 text-align-x-left text-wrap",
			Text = UseFriendingOSAEducationSubtitleModuleResult,
			LayoutOrder = LayoutOrder
		}) else nil
	else
		local UseStateResult = ReactModule.useState(isHiddenOnInit)
		local UseFireAnalyticsEventModuleResult = UseFireAnalyticsEventModule()
		local UseAppPolicyResult = UseAppPolicyFunction(function(p2)
			return p2.getRequiresOSAFriendingEducation()
		end)
		local UseLocalizationResult = UseLocalizationFunction({
			educationText = if FFlagConnectionsToFriendsRenameP1V1 then "Feature.Friends.Subtitle.FriendsEducation" else "Feature.Friends.Subtitle.ConnectionsEducation"
		})
		local NoUseStateResult: boolean = UseAppPolicyResult and not UseStateResult
		local UseResult = ReactModule.useCallback(function()
			-- upvalues: UseFireAnalyticsEventModuleResult (copy), EventNamesModule (upval), FriendingOSAEducationImpressionCacheModule (upval)
			UseFireAnalyticsEventModuleResult(EventNamesModule.FriendingOSAEducationSubtitleImpression)
			FriendingOSAEducationImpressionCacheModule.incrementValue()
		end, { UseFireAnalyticsEventModuleResult })
		ReactModule.useEffect(function()
			-- upvalues: NoUseStateResult (copy), UseResult (copy)
			if NoUseStateResult then
				UseResult()
			end
		end, { NoUseStateResult })
		
		return if NoUseStateResult then ReactModule.createElement(Text, {
			tag = "auto-y grow size-full-0 text-align-x-left text-wrap",
			Text = UseLocalizationResult.educationText,
			LayoutOrder = LayoutOrder
		}) else nil
	end
end