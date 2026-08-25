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

return function(p0)
	-- upvalues: useNavigation (ref), useNavigationProps (ref), reactModule (ref), initializeSocialExperienceJoinAnalyticsModule (ref), useScreenSize (ref), userProfilesModule (ref), eventNamesModule (ref), unableToJoinExperienceModalModule (ref)
	local var9 = useNavigation()
	local var10 = useNavigationProps(function(p1, p2)
		return {
			universeId = p1,
			userId = p2.userId,
			openGameDetailsPeekViewClosed = p2.openGameDetailsPeekViewClosed,
			analyticProps = p2.analyticProps
		}
	end)
	local var11 = reactModule.useMemo(function()
		-- upvalues: initializeSocialExperienceJoinAnalyticsModule (copy), var10 (ref)
		return initializeSocialExperienceJoinAnalyticsModule(var10.analyticProps)
	end, { var10.analyticProps })
	local var12 = useScreenSize()
	local var13 = userProfilesModule.Hooks.useUserProfilesFetch({
		userIds = { var10.userId },
		query = userProfilesModule.Queries.userProfilesCombinedNameByUserIds
	})
	local var14 = reactModule.useCallback(function()
		-- upvalues: var9 (ref)
		var9.pop()
	end, { var9 })
	
	return reactModule.createElement(unableToJoinExperienceModalModule, {
		cancel = reactModule.useCallback(function()
			-- upvalues: var11 (ref), eventNamesModule (copy), var10 (ref), var14 (ref)
			var11.fireAnalyticsEvent(eventNamesModule.UnableToJoinCancel, {
				universeId = var10.universeId,
				profileUserId = var10.userId
			})
			var14()
		end, { var14 }),
		openGameDetailsPeekView = reactModule.useCallback(function()
			-- upvalues: var11 (ref), eventNamesModule (copy), var10 (ref), var14 (ref), p0 (ref)
			var11.fireAnalyticsEvent(eventNamesModule.UnableToJoinViewDetails, {
				universeId = var10.universeId,
				profileUserId = var10.userId
			})
			var14()
			p0.openGameDetailsPeekView(var10.universeId, {
				mountAsFullView = true,
				showBackButton = true,
				onPeekViewClosed = var10.openGameDetailsPeekViewClosed
			})
		end, {
			var9, var10.universeId, var10.userId, var10.openGameDetailsPeekViewClosed,
			p0.openGameDetailsPeekView, var14
		}),
		screenSize = var12,
		userPrimaryName = if var13.data then userProfilesModule.Selectors.getCombinedNameFromId(var13.data, var10.userId) else ""
	})
end