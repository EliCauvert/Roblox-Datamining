local socialServerDrivenUi = script:FindFirstAncestor("SocialServerDrivenUi")
local parent = socialServerDrivenUi.Parent
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local discoveryTypesModule = require(parent.DiscoveryTypes)
local findAnalyticsField = require(parent.SduiCoreSystem).findAnalyticsField
local socialCarouselModule = require(parent.SocialCarousel)
local flyoutSidePanelIXP = require(parent.SharedExperimentDefinition).FlyoutSidePanelIXP
local openProfileQRCodePageBridgeModule = require(socialServerDrivenUi.System.OpenProfileQRCodePageBridge)
local fFlagEnableFlyoutFriendsHeaderFix = sharedFlagsModule.FFlagEnableFlyoutFriendsHeaderFix
local fFlagFlyoutHideFriendsHeader = socialCarouselModule.Flags.FFlagFlyoutHideFriendsHeader
local fFlagLuaAppAddSortDataToSocialCarouselClicks = sharedFlagsModule.FFlagLuaAppAddSortDataToSocialCarouselClicks
local fFlagLuaAppCompositionAlways = sharedFlagsModule.FFlagLuaAppCompositionAlways
local fFlagLuaAppFriendsSortHeaderByPosition = sharedFlagsModule.FFlagLuaAppFriendsSortHeaderByPosition
local fFlagLuaAppHomeFriendsRemoveItemImpressions = sharedFlagsModule.FFlagLuaAppHomeFriendsRemoveItemImpressions
local fFlagSocialCarouselShareQREnabled = sharedFlagsModule.FFlagSocialCarouselShareQREnabled
local fIntLuaAppFriendsSortHeaderMaxHiddenPosition = sharedFlagsModule.FIntLuaAppFriendsSortHeaderMaxHiddenPosition
local SORT_INDEX_SELECTION_ORDER_MULTIPLIER = discoveryTypesModule.Constants.SORT_INDEX_SELECTION_ORDER_MULTIPLIER
local SORT_SELECTION_ORDER_BASE = discoveryTypesModule.Constants.SORT_SELECTION_ORDER_BASE

local function _(p1)
	-- upvalues: fIntLuaAppFriendsSortHeaderMaxHiddenPosition (ref), fFlagFlyoutHideFriendsHeader (ref), fFlagEnableFlyoutFriendsHeaderFix (ref), flyoutSidePanelIXP (ref)
	if fIntLuaAppFriendsSortHeaderMaxHiddenPosition < p1 then
		return false
	end
	local var1 = fFlagFlyoutHideFriendsHeader
	
	if var1 then
		if fFlagEnableFlyoutFriendsHeaderFix then
			return flyoutSidePanelIXP.isFriendsSortHeaderHiddenInFlyoutIxp()
		end
		var1 = flyoutSidePanelIXP.isFlyoutSidePanelEnabled()
	end
	return var1
end

return function(p1)
	-- upvalues: findAnalyticsField (ref), fFlagLuaAppAddSortDataToSocialCarouselClicks (ref), reactModule (ref), socialCarouselModule (ref), fFlagLuaAppHomeFriendsRemoveItemImpressions (ref), SORT_SELECTION_ORDER_BASE (ref), SORT_INDEX_SELECTION_ORDER_MULTIPLIER (ref), fFlagLuaAppFriendsSortHeaderByPosition (ref), fIntLuaAppFriendsSortHeaderMaxHiddenPosition (ref), fFlagFlyoutHideFriendsHeader (ref), fFlagEnableFlyoutFriendsHeaderFix (ref), flyoutSidePanelIXP (ref), fFlagLuaAppCompositionAlways (ref), fFlagSocialCarouselShareQREnabled (ref), openProfileQRCodePageBridgeModule (ref)
	local collectionPosition = tonumber(findAnalyticsField("collectionPosition", p1.analyticsContext.analyticsData or {}, -1)) or -1
	
	return reactModule.createElement(socialCarouselModule.Entry, {
		unifiedLogging = {
			impressionTag = "HomeFriendCarousel",
			sortIndex = collectionPosition,
			appPage = p1.sduiContext.appPage,
			sortId = p1.sortId or "",
			scrollViewPositionChangedSignal = p1.scrollViewPositionChangedSignal,
			skipItemImpressionsLog = if fFlagLuaAppHomeFriendsRemoveItemImpressions then true else nil
		},
		sortAnalyticsData = if fFlagLuaAppAddSortDataToSocialCarouselClicks then if fFlagLuaAppAddSortDataToSocialCarouselClicks then reactModule.useMemo(function()
			-- upvalues: collectionPosition (ref), p1 (ref)
			return {
				sortIndex = collectionPosition,
				appPage = p1.sduiContext.appPage,
				sortId = p1.sortId,
				startRow = p1.startRow
			}
		end, {
			collectionPosition,
			p1.sduiContext.appPage,
			p1.sortId,
			p1.startRow
		}) else nil else nil,
		refreshSignal = p1.refreshSignal,
		selectionOrderBase = SORT_SELECTION_ORDER_BASE + collectionPosition * SORT_INDEX_SELECTION_ORDER_MULTIPLIER,
		source = socialCarouselModule.Constants.ANALYTICS.SRC.HOMEPAGE_FRIENDS_CAROUSEL,
		hideCarouselHeader = if fFlagLuaAppFriendsSortHeaderByPosition then if fIntLuaAppFriendsSortHeaderMaxHiddenPosition < collectionPosition then false else fFlagFlyoutHideFriendsHeader and (if fFlagEnableFlyoutFriendsHeaderFix then flyoutSidePanelIXP.isFriendsSortHeaderHiddenInFlyoutIxp() else flyoutSidePanelIXP.isFlyoutSidePanelEnabled()) elseif fFlagFlyoutHideFriendsHeader and (if fFlagEnableFlyoutFriendsHeaderFix then flyoutSidePanelIXP.isFriendsSortHeaderHiddenInFlyoutIxp() else flyoutSidePanelIXP.isFlyoutSidePanelEnabled()) then true else nil,
		appCompositionEnabled = if fFlagLuaAppCompositionAlways then true else p1.sduiContext.appCompositionEnabled,
		navigateToQRCodePage = if fFlagSocialCarouselShareQREnabled then openProfileQRCodePageBridgeModule.requestOpen else nil
	})
end