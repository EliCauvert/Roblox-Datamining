local Parent = script.Parent.Parent.Parent
local DependenciesModule = require(Parent.dependencies)
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local ImpressionsTagUtility = require(Parent1.Impressions).ImpressionsTagUtility
local RoduxFriends = DependenciesModule.RoduxFriends
local UseSelectorFunction = DependenciesModule.Hooks.useSelector
local GetDeepValueFunction = DependenciesModule.SocialLibraries.Dictionary.getDeepValue
local UsePrimaryCtaModule = require(Parent.Components.PYMKUser.usePrimaryCta)
local UseContextualInfoModule = require(Parent.Components.PYMKUser.useContextualInfo)
local UseUserPresenceModule = require(Parent.Components.PYMKUser.useUserPresence)
local UseOnActivatedTileModule = require(Parent.Components.PYMKUser.useOnActivatedTile)
local FFlagPymkCarouselPresenceStoreMigrationModule = require(Parent.Flags.FFlagPymkCarouselPresenceStoreMigration)
local _ = require(Parent1.UserList)

return function(p1)
	-- upvalues: ReactModule (copy), ImpressionsTagUtility (copy), UseSelectorFunction (copy), GetDeepValueFunction (copy), RoduxFriends (copy), UsePrimaryCtaModule (copy), UseContextualInfoModule (copy), UseUserPresenceModule (copy), FFlagPymkCarouselPresenceStoreMigrationModule (copy), UseOnActivatedTileModule (copy)
	local Text = tostring(p1.entity.id)
	local UseRefResult = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: ImpressionsTagUtility (upval), UseRefResult (copy), p1 (copy)
		ImpressionsTagUtility.AddTag(UseRefResult, p1.impressionsTag, p1.absolutePosition)
		
		return function()
			-- upvalues: ImpressionsTagUtility (upval), UseRefResult (upval), p1 (upval)
			ImpressionsTagUtility.RemoveTag(UseRefResult, p1.impressionsTag, p1.absolutePosition)
		end
	end, { p1.impressionsTag, p1.absolutePosition })
	local UseSelectorResult = UseSelectorFunction(function(p2): string
		return (tostring(p2.LocalUserId))
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p2)
		-- upvalues: GetDeepValueFunction (upval), Text (copy)
		return GetDeepValueFunction(p2, string.format("PYMKCarousel.Friends.recommendations.hasIncomingFriendRequest.%s", Text))
	end)
	local UseSelectorResult2 = UseSelectorFunction(function(p2)
		-- upvalues: RoduxFriends (upval), UseSelectorResult (copy), Text (copy)
		return RoduxFriends.Selectors.selectRecommendationsForUserId(p2)(UseSelectorResult)[Text] or {}
	end)
	local UseSelectorResult3 = UseSelectorFunction(function(p2)
		-- upvalues: RoduxFriends (upval), Text (copy)
		return RoduxFriends.Selectors.selectFriendshipStatusesByUserIds(p2)({ userId = Text })[Text] or nil
	end)
	local UsePrimaryCtaModuleResult = UsePrimaryCtaModule({
		entityId = Text,
		showToast = p1.showToast,
		fireAnalyticsEvent = p1.fireAnalyticsEvent,
		absolutePosition = p1.absolutePosition,
		entityType = p1.entity.type
	})
	local UseContextualInfoModuleResult = UseContextualInfoModule({
		recommendation = UseSelectorResult2,
		hasIncomingFriendRequest = UseSelectorResult1
	})
	local LoadingState = {
		subtitle = false,
		contextualInfo = UseSelectorResult2.contextType == nil
	}
	local UseUserPresenceModuleResult = UseUserPresenceModule({
		userId = Text,
		entityType = if FFlagPymkCarouselPresenceStoreMigrationModule then p1.entity.type else nil,
		forceFetchUserPresence = if FFlagPymkCarouselPresenceStoreMigrationModule then p1.forceFetchUserPresence else nil
	})
	local Row = p1.createRow({
		secondaryCta = nil,
		trailingContent = nil,
		primaryCta = UsePrimaryCtaModuleResult,
		contextualInfo = UseContextualInfoModuleResult,
		loadingState = LoadingState,
		presence = UseUserPresenceModuleResult,
		onRowActivated = UseOnActivatedTileModule({
			userId = Text,
			openProfilePeekView = p1.openProfilePeekView,
			absolutePosition = p1.absolutePosition,
			recommendation = UseSelectorResult2,
			recommendationSessionId = p1.recommendationSessionId,
			fireAnalyticsEvent = p1.fireAnalyticsEvent,
			friendshipStatus = UseSelectorResult3,
			userPresenceType = UseUserPresenceModuleResult
		})
	})
	
	return if Row then ReactModule.cloneElement(Row, { ref = UseRefResult }) else nil
end