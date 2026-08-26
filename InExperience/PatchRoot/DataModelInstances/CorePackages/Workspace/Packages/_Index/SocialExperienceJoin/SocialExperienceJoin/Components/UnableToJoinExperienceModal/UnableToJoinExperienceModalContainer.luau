local socialExperienceJoin = script:FindFirstAncestor("SocialExperienceJoin")
local parent = socialExperienceJoin.Parent
local reactModule = require(parent.React)
local navigationModule = require(parent.Navigation)
local robloxAppHooksModule = require(parent.RobloxAppHooks)
local userProfilesModule = require(parent.UserProfiles)
local robloxAppNavigationModule = require(parent.RobloxAppNavigation)
local initializeSocialExperienceJoinAnalyticsModule = require(socialExperienceJoin.Analytics.initializeSocialExperienceJoinAnalytics)
local eventNamesModule = require(socialExperienceJoin.Analytics.EventNames)
local useNavigation = navigationModule.useNavigation
local useNavigationProps = robloxAppNavigationModule.useNavigationProps
local useScreenSize = robloxAppHooksModule.useScreenSize
local unableToJoinExperienceModalModule = require(script.Parent.UnableToJoinExperienceModal)

return function(p1)
	-- upvalues: useNavigation (ref), useNavigationProps (ref), reactModule (ref), initializeSocialExperienceJoinAnalyticsModule (ref), useScreenSize (ref), userProfilesModule (ref), eventNamesModule (ref), unableToJoinExperienceModalModule (ref)
	local var1 = useNavigation()
	local var2 = useNavigationProps(function(p2, p3)
		return {
			universeId = p2,
			userId = p3.userId,
			openGameDetailsPeekViewClosed = p3.openGameDetailsPeekViewClosed,
			analyticProps = p3.analyticProps
		}
	end)
	local var3 = reactModule.useMemo(function()
		-- upvalues: initializeSocialExperienceJoinAnalyticsModule (copy), var2 (ref)
		return initializeSocialExperienceJoinAnalyticsModule(var2.analyticProps)
	end, { var2.analyticProps })
	local var4 = useScreenSize()
	local var5 = userProfilesModule.Hooks.useUserProfilesFetch({
		userIds = { var2.userId },
		query = userProfilesModule.Queries.userProfilesCombinedNameByUserIds
	})
	local var6 = reactModule.useCallback(function()
		-- upvalues: var1 (ref)
		var1.pop()
	end, { var1 })
	
	return reactModule.createElement(unableToJoinExperienceModalModule, {
		cancel = reactModule.useCallback(function()
			-- upvalues: var3 (ref), eventNamesModule (copy), var2 (ref), var6 (ref)
			var3.fireAnalyticsEvent(eventNamesModule.UnableToJoinCancel, {
				universeId = var2.universeId,
				profileUserId = var2.userId
			})
			var6()
		end, { var6 }),
		openGameDetailsPeekView = reactModule.useCallback(function()
			-- upvalues: var3 (ref), eventNamesModule (copy), var2 (ref), var6 (ref), p1 (ref)
			var3.fireAnalyticsEvent(eventNamesModule.UnableToJoinViewDetails, {
				universeId = var2.universeId,
				profileUserId = var2.userId
			})
			var6()
			p1.openGameDetailsPeekView(var2.universeId, {
				mountAsFullView = true,
				showBackButton = true,
				onPeekViewClosed = var2.openGameDetailsPeekViewClosed
			})
		end, {
			var1, var2.universeId, var2.userId, var2.openGameDetailsPeekViewClosed,
			p1.openGameDetailsPeekView, var6
		}),
		screenSize = var4,
		userPrimaryName = if var5.data then userProfilesModule.Selectors.getCombinedNameFromId(var5.data, var2.userId) else ""
	})
end