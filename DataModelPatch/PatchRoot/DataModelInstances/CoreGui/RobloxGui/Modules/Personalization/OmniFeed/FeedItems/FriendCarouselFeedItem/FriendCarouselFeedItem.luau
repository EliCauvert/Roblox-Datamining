local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local ReactModule = require(CorePackages.Packages.React)
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local TModule = require(CorePackages.Packages.t)
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local OmniFeedProps = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules.Personalization.OmniFeed.OmniFeedProps
local NavigateDownTo3DQRCodePageModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Thunks.NavigateDownTo3DQRCodePage)
local SocialCarouselModule = require(CorePackages.Workspace.Packages.SocialCarousel)
local Constants = SocialCarouselModule.Constants
local FFlagLuaAppCompositionAlways = SharedFlagsModule.FFlagLuaAppCompositionAlways
local FFlagLuaAppAddSortDataToSocialCarouselClicks = SharedFlagsModule.FFlagLuaAppAddSortDataToSocialCarouselClicks
local FFlagFlyoutHideFriendsHeader = SocialCarouselModule.Flags.FFlagFlyoutHideFriendsHeader
local FFlagSocialCarouselShareQREnabled = SharedFlagsModule.FFlagSocialCarouselShareQREnabled
local FFlagEnableFlyoutFriendsHeaderFix = SharedFlagsModule.FFlagEnableFlyoutFriendsHeaderFix
local FlyoutSidePanelIXP = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).FlyoutSidePanelIXP
local StrictInterfaceResult = TModule.strictInterface({
	[OmniFeedProps.key] = OmniFeedProps.interface,
	topic = TModule.optional(TModule.string),
	topicId = TModule.optional(TModule.string),
	formFactor = TModule.string,
	refresh = TModule.callback,
	selectionOrderBase = TModule.optional(TModule.number),
	useGridPageLayout = TModule.optional(TModule.boolean),
	networking = TModule.any,
	uiModeInfo = TModule.any
})

return function(p1)
	-- upvalues: StrictInterfaceResult (copy), FFlagSocialCarouselShareQREnabled (copy), UseDispatchFunction (copy), ReactModule (copy), NavigateDownTo3DQRCodePageModule (copy), FFlagLuaAppCompositionAlways (copy), OmniFeedProps (copy), FFlagLuaAppAddSortDataToSocialCarouselClicks (copy), AppPage (copy), RoactModule (copy), SocialCarouselModule (copy), Constants (copy), FFlagFlyoutHideFriendsHeader (copy), FFlagEnableFlyoutFriendsHeaderFix (copy), FlyoutSidePanelIXP (copy)
	StrictInterfaceResult(p1)
	local UseDispatchResult = if FFlagSocialCarouselShareQREnabled then UseDispatchFunction() else nil
	local UseResult = if FFlagSocialCarouselShareQREnabled then ReactModule.useCallback(function(p2)
		-- upvalues: UseDispatchResult (copy), NavigateDownTo3DQRCodePageModule (upval)
		UseDispatchResult(NavigateDownTo3DQRCodePageModule(p2))
	end, { UseDispatchResult }) else nil
	local AppCompositionEnabled = if FFlagLuaAppCompositionAlways then true else p1[OmniFeedProps.key].appCompositionEnabled
	local SelectionOrderBase = p1[OmniFeedProps.key].selectionOrderBase or 0
	local UseMemoResult = nil
	local AppPage1 = nil
	local FeedItemPosition = nil
	
	if FFlagLuaAppAddSortDataToSocialCarouselClicks then
		AppPage1 = p1[OmniFeedProps.key] and p1[OmniFeedProps.key].appPage or AppPage.Home
		FeedItemPosition = p1[OmniFeedProps.key] and p1[OmniFeedProps.key].feedItemPosition or nil
		local FeedItemStartRow = p1[OmniFeedProps.key] and p1[OmniFeedProps.key].feedItemStartRow or nil
		UseMemoResult = ReactModule.useMemo(function()
			-- upvalues: FeedItemPosition (ref), AppPage1 (ref), p1 (copy), FeedItemStartRow (copy)
			return {
				sortIndex = FeedItemPosition or -1,
				appPage = AppPage1,
				sortId = p1.topicId,
				startRow = FeedItemStartRow or -1
			}
		end, { FeedItemPosition, AppPage1, p1.topicId, FeedItemStartRow })
	end
	return RoactModule.createElement(SocialCarouselModule.Entry, {
		unifiedLogging = {
			impressionTag = "HomeFriendCarousel",
			sortIndex = if FFlagLuaAppAddSortDataToSocialCarouselClicks then FeedItemPosition else p1[OmniFeedProps.key].feedItemPosition,
			appPage = if FFlagLuaAppAddSortDataToSocialCarouselClicks then AppPage1 else p1[OmniFeedProps.key].appPage,
			sortId = p1.topicId,
			scrollViewPositionChangedSignal = p1[OmniFeedProps.key].scrollViewPositionChangedSignal
		},
		sortAnalyticsData = if FFlagLuaAppAddSortDataToSocialCarouselClicks then UseMemoResult else nil,
		refreshSignal = p1[OmniFeedProps.key].refreshSignal,
		selectionOrderBase = SelectionOrderBase,
		source = Constants.ANALYTICS.SRC.HOMEPAGE_FRIENDS_CAROUSEL,
		hideCarouselHeader = if FFlagFlyoutHideFriendsHeader and (if FFlagEnableFlyoutFriendsHeaderFix then FlyoutSidePanelIXP.isFriendsSortHeaderHiddenInFlyoutIxp() else FlyoutSidePanelIXP.isFlyoutSidePanelEnabled()) then true else nil,
		appCompositionEnabled = AppCompositionEnabled,
		navigateToQRCodePage = if FFlagSocialCarouselShareQREnabled then UseResult else nil
	})
end