local SocialServerDrivenUi = script:FindFirstAncestor("SocialServerDrivenUi")
local Parent = SocialServerDrivenUi.Parent
local ReactModule = require(Parent.React)
local SharedFlagsModule = require(Parent.SharedFlags)
local DiscoveryTypesModule = require(Parent.DiscoveryTypes)
local FindAnalyticsFieldFunction = require(Parent.SduiCoreSystem).findAnalyticsField
local SocialCarouselModule = require(Parent.SocialCarousel)
local FlyoutSidePanelIXP = require(Parent.SharedExperimentDefinition).FlyoutSidePanelIXP
local OpenProfileQRCodePageBridgeModule = require(SocialServerDrivenUi.System.OpenProfileQRCodePageBridge)
local FFlagEnableFlyoutFriendsHeaderFix = SharedFlagsModule.FFlagEnableFlyoutFriendsHeaderFix
local FFlagFlyoutHideFriendsHeader = SocialCarouselModule.Flags.FFlagFlyoutHideFriendsHeader
local FFlagLuaAppCompositionAlways = SharedFlagsModule.FFlagLuaAppCompositionAlways
local FFlagLuaAppFriendsSortHeaderByPosition = SharedFlagsModule.FFlagLuaAppFriendsSortHeaderByPosition
local FFlagLuaAppHomeFriendsRemoveItemImpressions = SharedFlagsModule.FFlagLuaAppHomeFriendsRemoveItemImpressions
local FFlagSocialCarouselShareQREnabled = SharedFlagsModule.FFlagSocialCarouselShareQREnabled
local FIntLuaAppFriendsSortHeaderMaxHiddenPosition = SharedFlagsModule.FIntLuaAppFriendsSortHeaderMaxHiddenPosition
local SORTINDEXSELECTIONORDERMULTIPLIER = DiscoveryTypesModule.Constants.SORT_INDEX_SELECTION_ORDER_MULTIPLIER
local SORTSELECTIONORDERBASE = DiscoveryTypesModule.Constants.SORT_SELECTION_ORDER_BASE

local function _(p1) --[[ Line: 44 | Named "getShouldHideCarouselHeader" ]]
	-- upvalues: FIntLuaAppFriendsSortHeaderMaxHiddenPosition (copy), FFlagFlyoutHideFriendsHeader (copy), FFlagEnableFlyoutFriendsHeaderFix (copy), FlyoutSidePanelIXP (copy)
	if FIntLuaAppFriendsSortHeaderMaxHiddenPosition < p1 then
		return false
	end
	local IsFlyoutSidePanelEnabled = FFlagFlyoutHideFriendsHeader
	
	if IsFlyoutSidePanelEnabled then
		if FFlagEnableFlyoutFriendsHeaderFix then
			return (FlyoutSidePanelIXP.isFriendsSortHeaderHiddenInFlyoutIxp())
		end
		IsFlyoutSidePanelEnabled = FlyoutSidePanelIXP.isFlyoutSidePanelEnabled()
	end
	return IsFlyoutSidePanelEnabled
end

return function(p1) --[[ Line: 57 | Named "SduiFriendCarousel" ]]
	-- upvalues: FindAnalyticsFieldFunction (copy), ReactModule (copy), SocialCarouselModule (copy), FFlagLuaAppHomeFriendsRemoveItemImpressions (copy), SORTSELECTIONORDERBASE (copy), SORTINDEXSELECTIONORDERMULTIPLIER (copy), FFlagLuaAppFriendsSortHeaderByPosition (copy), FIntLuaAppFriendsSortHeaderMaxHiddenPosition (copy), FFlagFlyoutHideFriendsHeader (copy), FFlagEnableFlyoutFriendsHeaderFix (copy), FlyoutSidePanelIXP (copy), FFlagLuaAppCompositionAlways (copy), FFlagSocialCarouselShareQREnabled (copy), OpenProfileQRCodePageBridgeModule (copy)
	local Number: number = tonumber(FindAnalyticsFieldFunction("collectionPosition", p1.analyticsContext.analyticsData or {}, -1)) or -1
	
	return ReactModule.createElement(SocialCarouselModule.Entry, {
		unifiedLogging = {
			impressionTag = "HomeFriendCarousel",
			sortIndex = Number,
			appPage = p1.sduiContext.appPage,
			sortId = p1.sortId or "",
			scrollViewPositionChangedSignal = p1.scrollViewPositionChangedSignal,
			skipItemImpressionsLog = if FFlagLuaAppHomeFriendsRemoveItemImpressions then true else nil
		},
		sortAnalyticsData = ReactModule.useMemo(function() --[[ Line: 62 ]]
			-- upvalues: Number (copy), p1 (copy)
			return {
				sortIndex = Number,
				appPage = p1.sduiContext.appPage,
				sortId = p1.sortId,
				startRow = p1.startRow
			}
		end, { Number, p1.sduiContext.appPage, p1.sortId, p1.startRow }),
		refreshSignal = p1.refreshSignal,
		selectionOrderBase = SORTSELECTIONORDERBASE + Number * SORTINDEXSELECTIONORDERMULTIPLIER,
		source = SocialCarouselModule.Constants.ANALYTICS.SRC.HOMEPAGE_FRIENDS_CAROUSEL,
		hideCarouselHeader = if FFlagLuaAppFriendsSortHeaderByPosition then FIntLuaAppFriendsSortHeaderMaxHiddenPosition >= Number and (FFlagFlyoutHideFriendsHeader and (if FFlagEnableFlyoutFriendsHeaderFix then FlyoutSidePanelIXP.isFriendsSortHeaderHiddenInFlyoutIxp() else FlyoutSidePanelIXP.isFlyoutSidePanelEnabled())) elseif FFlagFlyoutHideFriendsHeader and (if FFlagEnableFlyoutFriendsHeaderFix then FlyoutSidePanelIXP.isFriendsSortHeaderHiddenInFlyoutIxp() else FlyoutSidePanelIXP.isFlyoutSidePanelEnabled()) then true else nil,
		appCompositionEnabled = if FFlagLuaAppCompositionAlways then true else p1.sduiContext.appCompositionEnabled,
		navigateToQRCodePage = if FFlagSocialCarouselShareQREnabled then OpenProfileQRCodePageBridgeModule.requestOpen else nil
	})
end