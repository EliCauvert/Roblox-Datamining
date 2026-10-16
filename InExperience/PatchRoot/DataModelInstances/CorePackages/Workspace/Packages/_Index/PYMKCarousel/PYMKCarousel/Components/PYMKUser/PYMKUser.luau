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
local _ = require(Parent.Common.DirectRecommendationTypes)
local FFlagPymkCarouselPresenceStoreMigrationModule = require(Parent.Flags.FFlagPymkCarouselPresenceStoreMigration)
local FFlagLuaAppEnableSduiHomePage = require(Parent1.SharedFlags).FFlagLuaAppEnableSduiHomePage
local _ = require(Parent1.UserList)

return function(p1) --[[ Line: 43 ]]
	-- upvalues: ReactModule (copy), ImpressionsTagUtility (copy), FFlagLuaAppEnableSduiHomePage (copy), UseSelectorFunction (copy), GetDeepValueFunction (copy), RoduxFriends (copy), UsePrimaryCtaModule (copy), UseContextualInfoModule (copy), UseUserPresenceModule (copy), FFlagPymkCarouselPresenceStoreMigrationModule (copy), UseOnActivatedTileModule (copy)
	local Text = tostring(p1.entity.id)
	local UseRefResult = ReactModule.useRef(nil)
	ReactModule.useEffect(function() --[[ Line: 47 ]]
		-- upvalues: ImpressionsTagUtility (upval), UseRefResult (copy), p1 (copy)
		ImpressionsTagUtility.AddTag(UseRefResult, p1.impressionsTag, p1.absolutePosition)
		
		return function() --[[ Line: 49 ]]
			-- upvalues: ImpressionsTagUtility (upval), UseRefResult (upval), p1 (upval)
			ImpressionsTagUtility.RemoveTag(UseRefResult, p1.impressionsTag, p1.absolutePosition)
		end
	end, { p1.impressionsTag, p1.absolutePosition })
	local UseSelectorResult = if not FFlagLuaAppEnableSduiHomePage then UseSelectorFunction(function(p2): string --[[ Line: 56 ]]
		return (tostring(p2.LocalUserId))
	end) else nil
	local HasIncomingFriendRequest = nil
	local Recommendation = nil
	
	if FFlagLuaAppEnableSduiHomePage then
		HasIncomingFriendRequest = if p1.recommendation then p1.recommendation.hasIncomingFriendRequest else nil
		Recommendation = p1.recommendation or {}
	else
		HasIncomingFriendRequest = UseSelectorFunction(function(p2) --[[ Line: 68 ]]
			-- upvalues: GetDeepValueFunction (upval), Text (copy)
			return GetDeepValueFunction(p2, string.format("PYMKCarousel.Friends.recommendations.hasIncomingFriendRequest.%s", Text))
		end)
		Recommendation = UseSelectorFunction(function(p2) --[[ Line: 74 ]]
			-- upvalues: RoduxFriends (upval), UseSelectorResult (ref), Text (copy)
			return RoduxFriends.Selectors.selectRecommendationsForUserId(p2)(UseSelectorResult)[Text] or {}
		end)
	end
	local UseSelectorResult1 = UseSelectorFunction(function(p2) --[[ Line: 79 ]]
		-- upvalues: RoduxFriends (upval), Text (copy)
		return RoduxFriends.Selectors.selectFriendshipStatusesByUserIds(p2)({ userId = Text })[Text] or nil
	end)
	local UsePrimaryCtaModuleResult = UsePrimaryCtaModule({
		entityId = Text,
		showToast = p1.showToast,
		fireAnalyticsEvent = p1.fireAnalyticsEvent,
		absolutePosition = p1.absolutePosition,
		entityType = p1.entity.type,
		recommendation = if FFlagLuaAppEnableSduiHomePage then p1.recommendation else nil
	})
	local UseContextualInfoModuleResult = UseContextualInfoModule({
		recommendation = Recommendation,
		hasIncomingFriendRequest = HasIncomingFriendRequest
	})
	local LoadingState = {
		subtitle = false,
		contextualInfo = Recommendation.contextType == nil
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
			recommendation = Recommendation,
			recommendationSessionId = p1.recommendationSessionId,
			fireAnalyticsEvent = p1.fireAnalyticsEvent,
			friendshipStatus = UseSelectorResult1,
			userPresenceType = UseUserPresenceModuleResult
		})
	})
	
	return if Row then ReactModule.cloneElement(Row, { ref = UseRefResult }) else nil
end