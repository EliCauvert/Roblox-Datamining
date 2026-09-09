local parent = script.Parent.Parent.Parent
local dependenciesModule = require(parent.dependencies)
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local impressionsTagUtility = require(parent_1.Impressions).ImpressionsTagUtility
local roduxFriends = dependenciesModule.RoduxFriends
local useSelector = dependenciesModule.Hooks.useSelector
local getDeepValue = dependenciesModule.SocialLibraries.Dictionary.getDeepValue
local usePrimaryCtaModule = require(parent.Components.PYMKUser.usePrimaryCta)
local useContextualInfoModule = require(parent.Components.PYMKUser.useContextualInfo)
local useUserPresenceModule = require(parent.Components.PYMKUser.useUserPresence)
local useOnActivatedTileModule = require(parent.Components.PYMKUser.useOnActivatedTile)
local _ = require(parent.Common.DirectRecommendationTypes)
local fFlagPymkCarouselPresenceStoreMigrationModule = require(parent.Flags.FFlagPymkCarouselPresenceStoreMigration)
local fFlagLuaAppEnableSduiHomePage = require(parent_1.SharedFlags).FFlagLuaAppEnableSduiHomePage
local _ = require(parent_1.UserList)

return function(p1)
	-- upvalues: reactModule (ref), impressionsTagUtility (ref), fFlagLuaAppEnableSduiHomePage (ref), useSelector (ref), getDeepValue (ref), roduxFriends (ref), usePrimaryCtaModule (ref), useContextualInfoModule (ref), useUserPresenceModule (ref), fFlagPymkCarouselPresenceStoreMigrationModule (ref), useOnActivatedTileModule (ref)
	local var1, var2
	local var3 = tostring(p1.entity.id)
	local var4 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: impressionsTagUtility (copy), var4 (ref), p1 (ref)
		impressionsTagUtility.AddTag(var4, p1.impressionsTag, p1.absolutePosition)
		
		return function()
			-- upvalues: impressionsTagUtility (copy), var4 (copy), p1 (copy)
			impressionsTagUtility.RemoveTag(var4, p1.impressionsTag, p1.absolutePosition)
		end
	end, { p1.impressionsTag, p1.absolutePosition })
	local var5 = if not fFlagLuaAppEnableSduiHomePage then useSelector(function(p2)
		return tostring(p2.LocalUserId)
	end) else nil
	local _ = nil
	local _ = nil
	
	if fFlagLuaAppEnableSduiHomePage then
		var1 = if p1.recommendation then p1.recommendation.hasIncomingFriendRequest else nil
		var2 = p1.recommendation or {}
	else
		var1 = useSelector(function(p2)
			-- upvalues: getDeepValue (copy), var3 (ref)
			return getDeepValue(p2, string.format("PYMKCarousel.Friends.recommendations.hasIncomingFriendRequest.%s", var3))
		end)
		var2 = useSelector(function(p2)
			-- upvalues: roduxFriends (copy), var5 (write), var3 (ref)
			return roduxFriends.Selectors.selectRecommendationsForUserId(p2)(var5)[var3] or {}
		end)
	end
	local var6 = useUserPresenceModule({
		userId = var3,
		entityType = if fFlagPymkCarouselPresenceStoreMigrationModule then p1.entity.type else nil,
		forceFetchUserPresence = if fFlagPymkCarouselPresenceStoreMigrationModule then p1.forceFetchUserPresence else nil
	})
	local var7 = p1.createRow({
		secondaryCta = nil,
		trailingContent = nil,
		primaryCta = usePrimaryCtaModule({
			entityId = var3,
			showToast = p1.showToast,
			fireAnalyticsEvent = p1.fireAnalyticsEvent,
			absolutePosition = p1.absolutePosition,
			entityType = p1.entity.type,
			recommendation = if fFlagLuaAppEnableSduiHomePage then p1.recommendation else nil
		}),
		contextualInfo = useContextualInfoModule({ recommendation = var2, hasIncomingFriendRequest = var1 }),
		loadingState = {
			subtitle = false,
			contextualInfo = var2.contextType == nil
		},
		presence = var6,
		onRowActivated = useOnActivatedTileModule({
			userId = var3,
			openProfilePeekView = p1.openProfilePeekView,
			absolutePosition = p1.absolutePosition,
			recommendation = var2,
			recommendationSessionId = p1.recommendationSessionId,
			fireAnalyticsEvent = p1.fireAnalyticsEvent,
			friendshipStatus = useSelector(function(p2)
				-- upvalues: roduxFriends (copy), var3 (ref)
				return roduxFriends.Selectors.selectFriendshipStatusesByUserIds(p2)({ userId = var3 })[var3] or nil
			end),
			userPresenceType = var6
		})
	})
	
	return if var7 then reactModule.cloneElement(var7, { ref = var4 }) else nil
end