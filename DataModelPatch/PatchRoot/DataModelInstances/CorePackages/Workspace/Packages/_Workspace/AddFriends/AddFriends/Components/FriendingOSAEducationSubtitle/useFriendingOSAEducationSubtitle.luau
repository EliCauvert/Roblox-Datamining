local AddFriends = script:FindFirstAncestor("AddFriends")
local Parent = AddFriends.Parent
local ReactModule = require(Parent.React)
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local EventNamesModule = require(AddFriends.Analytics.EventNames)
local UseFireAnalyticsEventModule = require(AddFriends.Analytics.useFireAnalyticsEvent)
local FriendingOSAEducationImpressionCacheModule = require(script.Parent.FriendingOSAEducationImpressionCache)
local FFlagConnectionsToFriendsRenameP1V1 = require(Parent.SharedFlags).FFlagConnectionsToFriendsRenameP1_v1

local function isHiddenOnInit(): boolean
	-- upvalues: FriendingOSAEducationImpressionCacheModule (copy)
	return FriendingOSAEducationImpressionCacheModule.getValue() ~= 0
end

return function()
	-- upvalues: ReactModule (copy), isHiddenOnInit (copy), UseFireAnalyticsEventModule (copy), UseAppPolicyFunction (copy), UseLocalizationFunction (copy), FFlagConnectionsToFriendsRenameP1V1 (copy), EventNamesModule (copy), FriendingOSAEducationImpressionCacheModule (copy)
	local UseStateResult = ReactModule.useState(isHiddenOnInit)
	local UseFireAnalyticsEventModuleResult = UseFireAnalyticsEventModule()
	local UseAppPolicyResult = UseAppPolicyFunction(function(p1)
		return p1.getRequiresOSAFriendingEducation()
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
	
	return if NoUseStateResult then UseLocalizationResult.educationText else nil
end