local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local navigationModule = require(parent.Navigation)
local momentsCarouselModule = require(script.Parent.MomentsCarousel)
local useUserMomentsModule = require(profilePlatform.Hooks.useUserMoments)
local useProfileWrapperContextModule = require(profilePlatform.Contexts.useProfileWrapperContext)
local useProfileAnalyticsContextModule = require(profilePlatform.Contexts.useProfileAnalyticsContext)
local eventNamesModule = require(profilePlatform.Analytics.EventNames)
local enumsModule = require(profilePlatform.Common.Enums)
local useNavigation = navigationModule.useNavigation

return function(p0) --[[ line: 20 | named "MomentsCarouselContainer" ]]
	-- upvalues: useProfileWrapperContextModule (ref), useProfileAnalyticsContextModule (ref), useNavigation (ref), useUserMomentsModule (ref), reactModule (ref), eventNamesModule (ref), enumsModule (ref), momentsCarouselModule (ref)
	local var9 = useProfileWrapperContextModule()
	local var10 = useProfileAnalyticsContextModule()
	local var11 = useNavigation()
	local profileId = var9.profileId
	local moments = useUserMomentsModule(profileId).moments
	
	return if #moments == 0 then reactModule.None else reactModule.createElement(momentsCarouselModule, {
		layoutOrder = p0.layoutOrder,
		moments = moments,
		onActivateHeader = reactModule.useCallback(function() --[[ line: 28 ]]
			-- upvalues: var10 (ref), eventNamesModule (copy), var11 (ref), enumsModule (copy), profileId (ref)
			var10.fireAnalyticsEvent(eventNamesModule.MomentsSeeAll)
			var11.navigate(enumsModule.Screens.MomentsAll, { extraProps = { profileId = profileId } })
		end, { var10, var11, profileId }),
		onSelectMoment = reactModule.useCallback(function(p1) --[[ line: 37 ]]
			-- upvalues: var10 (ref), eventNamesModule (copy), var11 (ref), enumsModule (copy), profileId (ref)
			var10.fireAnalyticsEvent(eventNamesModule.MomentOpened)
			var11.navigate(enumsModule.Screens.MomentsFeed, {
				extraProps = {
					targetUserId = tonumber(profileId) or 0,
					initialIndex = p1
				}
			})
		end, { var10, var11, profileId })
	})
end