local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local TextService = game:GetService("TextService")
local RoactModule = require(CorePackages.Packages.Roact)
local ReactModule = require(CorePackages.Packages.React)
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactAnalyticsModule = require(Modules.LuaApp.Services.RoactAnalytics)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local Focusable = RoactGamepadModule.Focusable
local TModule = require(CorePackages.Packages.t)
local IxpUtilsModule = require(CorePackages.Workspace.Packages.IxpUtils)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local RoactNavigationModule = require(CorePackages.Packages.RoactNavigation)
local RoactFitComponents = require(CorePackages.Packages.AvatarExperienceDeps).RoactFitComponents
local FitFrameVertical = RoactFitComponents.FitFrameVertical
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local RetrievalStatusModule = require(Modules.LuaApp.Enum.RetrievalStatus)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local AnalyticsModule = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local ItemViewportModule = require(Modules.AvatarExperience.Common.Components.ItemViewport.ItemViewport)
local Skeleton = require(CorePackages.Packages.Foundation).Skeleton
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithStyleFunction = UIBloxModule.Style.withStyle
local LoadableImage = UIBloxModule.App.Loading.LoadableImage
local GetCanExpandFunction = UIBloxModule.Core.Text.ExpandableText.GetCanExpand
local LoadingStateContainer = UIBloxModule.App.Container.LoadingStateContainer
local RetrievalStatus = UIBloxModule.App.Loading.Enum.RetrievalStatus
local EmptyState = UIBloxModule.App.Indicator.EmptyState
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local LinkButton = UIBloxModule.App.Button.LinkButton
local MenuDirection = UIBloxModule.App.Menu.MenuDirection
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local FitTextLabel = RoactFitComponents.FitTextLabel
local GetSafeAreaSizeFunction = require(CorePackages.Workspace.Packages.InputUi).getSafeAreaSize
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local NavigateDownToAvatarScreenModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.AppRouterWrapper.NavigateDownToAvatarScreen)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local CatalogUtilsModule = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local ItemDescriptionModule = require(Modules.AvatarExperience.Common.Components.ItemDetails.ItemDescription)
local ItemStatisticsModule = require(Modules.AvatarExperience.Common.Components.ItemDetails.ItemStatistics)
local ItemOwnershipButtonModule = require(Modules.AvatarExperience.Common.Components.ItemDetails.ItemOwnershipButton)
local ItemInfoListModule = require(Modules.AvatarExperience.Common.Components.ItemDetails.ItemInfo.ItemInfoList)
local RecommendedItemsGridModule = require(Modules.AvatarExperience.Common.Components.ItemDetails.RecommendedItemsGrid)
local BundleItemsGridModule = require(Modules.AvatarExperience.Common.Components.ItemDetails.BundleItemsGrid)
local LogItemDetailsIxpLayerExposureModule = require(Modules.AvatarExperience.Common.Components.ItemDetails.logItemDetailsIxpLayerExposure)
local PeekViewState = require(CorePackages.Workspace.Packages.PeekView).PeekViewState
local ToggleTryOnThunkModule = require(Modules.AvatarExperience.Common.Thunks.ToggleTryOnThunk)
local AvatarRoute = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.AvatarRoute
local WithAvatarRouteModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute)
local Signal = require(CorePackages.Workspace.Packages.AppCommonLib).Signal
local TagBasedImpressionsDetector = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).TagBasedImpressionsDetector
local UseUnifiedEventImpressionsReporterFunction = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).useUnifiedEventImpressionsReporter
local AvatarExperienceTimedOptionsModule = require(CorePackages.Workspace.Packages.AvatarExperienceTimedOptions)
local WearTimeOptionsCarousel = AvatarExperienceTimedOptionsModule.WearTimeOptionsCarousel
local ItemExpirationDisplay = AvatarExperienceTimedOptionsModule.ItemExpirationDisplay
local IsDurableItemExpiredFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.isDurableItemExpired
local FetchAssetOrBundleInfoModule = require(Modules.AvatarExperience.Catalog.Thunks.FetchAssetOrBundleInfo)
local FriendsOwnedChip = require(CorePackages.Workspace.Packages.SocialProof).Chips.FriendsOwnedChip
local ItemDataModule = require(Modules.AvatarExperience.Common.Selectors.ItemData)
local GetFFlagRestrictLimited2ToSoothsayersModule = require(Modules.AvatarExperience.Flags.GetFFlagRestrictLimited2ToSoothsayers)
local IsVRAppBuildFunction = require(CorePackages.Workspace.Packages.AppCommonLib).IsVRAppBuild
local GetFFlagL2ControllerSupportModule = require(Modules.AvatarExperience.Flags.GetFFlagL2ControllerSupport)
local GetRbxthumbWithTypeSizeAndOptionsFunction = require(CorePackages.Workspace.Packages.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions
local _ = require(Modules.AvatarExperience.Common.Types)
local GetFFlagAXItemDetailsScrollingEnabledCallbackModule = require(Modules.AvatarExperience.Flags.GetFFlagAXItemDetailsScrollingEnabledCallback)
local AXItemDetails3DPreviewIXPModule = require(Modules.AvatarExperience.Experiments.AXItemDetails3DPreviewIXP)
local GetFFlagAXHideRecommendationsOnFetchFailureModule = require(Modules.AvatarExperience.Flags.GetFFlagAXHideRecommendationsOnFetchFailure)
local GetFFlagAXSupportShoesInItemViewportModule = require(Modules.AvatarExperience.Flags.GetFFlagAXSupportShoesInItemViewport)
local FFlagEnableSocialProofOnItemDetails = SharedFlagsModule.FFlagEnableSocialProofOnItemDetails
local FFlagEnableSocialProofOnItemDetailsRoactGamepadNavigation = SharedFlagsModule.FFlagEnableSocialProofOnItemDetailsRoactGamepadNavigation
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXEnableHomeTryOnComplexView = SharedFlagsModule.FFlagAXEnableHomeTryOnComplexView
local FFlagAXItemDetailsIxpExposure = AvatarExperienceFlagsModule.FFlagAXItemDetailsIxpExposure
local FFlagAXThumbTypeNilCheck = AvatarExperienceFlagsModule.FFlagAXThumbTypeNilCheck
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local FFlagAXTryOnScreenImprovements = SharedFlagsModule.FFlagAXTryOnScreenImprovements
local FFlagAXInventoryDurablesSupport = AvatarExperienceFlagsModule.FFlagAXInventoryDurablesSupport
local FFlagAXTryOnScreenFixes = AvatarExperienceFlagsModule.FFlagAXTryOnScreenFixes
local FFlagAXRemoveExpiredItemsFromInventory = AvatarExperienceFlagsModule.FFlagAXRemoveExpiredItemsFromInventory
local FFlagAXCustomizeMakeupSupport = AvatarExperienceFlagsModule.FFlagAXCustomizeMakeupSupport
local ItemDetailsContainer = RoactModule.PureComponent:extend("ItemDetailsContainer")
ItemDetailsContainer.validateProps = TModule.strictInterface({
	actionBarHeaderRef = TModule.table,
	clipDetails = TModule.optional(TModule.boolean),
	listPadding = TModule.optional(TModule.numberPositive),
	itemId = TModule.string,
	itemType = TModule.string,
	onItemInvalid = TModule.optional(TModule.callback),
	showFullWithNoPeekView = TModule.optional(TModule.boolean),
	bottomDockedContainerHeight = TModule.optional(TModule.number),
	resultsListRef = TModule.optional(TModule.table),
	itemDetailsPeekViewRefs = TModule.optional(TModule.table),
	peekViewFocusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else TModule.table,
	NextSelectionDown = TModule.optional(TModule.table),
	NextSelectionUp = TModule.optional(TModule.table),
	NextSelectionLeft = TModule.optional(TModule.table),
	NextSelectionRight = TModule.optional(TModule.table),
	forwardRef = TModule.optional(TModule.table),
	setItemDetailsScrollingEnabled = if GetFFlagAXItemDetailsScrollingEnabledCallbackModule() then TModule.optional(TModule.callback) else nil,
	onWearTimeSelection = TModule.optional(TModule.callback),
	itemSubType = TModule.optional(TModule.string),
	assetType = TModule.optional(TModule.string),
	simpleView = if FFlagAXEnableHomeTryOnComplexView or FFlagAXTryOnScreenFixes then TModule.optional(TModule.boolean) else nil,
	tagBasedImpressionsDetectorExtensions = if FFlagAXItemDetailsIxpExposure then TModule.table else nil,
	globalGuiInset = TModule.strictInterface({
		left = TModule.integer,
		top = TModule.integer,
		right = TModule.integer,
		bottom = TModule.integer
	}),
	screenSize = TModule.Vector2,
	fetchingState = TModule.string,
	itemData = TModule.optional((require(Modules.AvatarExperience.Common.Validators.ItemDataValidator))),
	peekViewState = TModule.optional(TModule.valueOf(PeekViewState)),
	experiences = TModule.optional(TModule.table),
	collectibleData = TModule.optional(TModule.table),
	isCollectiblesEnabled = if GetFFlagRestrictLimited2ToSoothsayersModule() then TModule.optional(TModule.boolean) else nil,
	isLimitedCollectible = TModule.optional(TModule.boolean),
	fetchAssetOrBundleInfo = TModule.callback,
	navigateDownToAvatarScreen = TModule.callback,
	toggleTryOn = TModule.optional(TModule.callback),
	navigation = TModule.table,
	avatarRoute = if FFlagAXItemDetailsIxpExposure then AvatarRoute.Interface else nil,
	networking = TModule.callback,
	appAnalytics = TModule.table,
	catalogAnalytics = TModule.table,
	showPremiumContent = TModule.optional(TModule.boolean),
	enableAggregateLikesFavoritesCount = TModule.boolean
})
ItemDetailsContainer.defaultProps = { clipDetails = false, listPadding = 24 }

function ItemDetailsContainer.init(p1)
	-- upvalues: FFlagAXItemDetailsIxpExposure (copy), Signal (copy), RoactModule (copy), GetFFlagL2ControllerSupportModule (copy), FFlagEnableSocialProofOnItemDetails (copy), AXItemDetails3DPreviewIXPModule (copy), IxpUtilsModule (copy), GetFFlagAXHideRecommendationsOnFetchFailureModule (copy), FFlagAXTryOnScreenImprovements (copy), AvatarScreen (copy)
	if FFlagAXItemDetailsIxpExposure then
		p1.requestImpressionsSignal = Signal.new()
		p1.itemDetailsContainerRef = RoactModule.createRef()
	end
	p1.expandableTextRef = RoactModule.createRef()
	p1.ownershipButtonRef = if GetFFlagL2ControllerSupportModule() then RoactModule.createRef() else nil
	p1.resellerRef = RoactModule.createRef()
	p1.attributionRef = RoactModule.createRef()
	p1.recommendedItemsGridRef = RoactModule.createRef()
	p1.socialProofRef = if FFlagEnableSocialProofOnItemDetails then RoactModule.createRef() else nil
	p1.state = {
		width = 0,
		is3DPreviewEnabled = if AXItemDetails3DPreviewIXPModule.isEnabled() and IxpUtilsModule.readTestVariable(AXItemDetails3DPreviewIXPModule.EnableItemDetails3DPreview) then true else nil,
		fetchRecommendationsFailed = not GetFFlagAXHideRecommendationsOnFetchFailureModule() and nil,
		socialProofChipRendered = not FFlagEnableSocialProofOnItemDetails and nil
	}
	
	function p1.fetchAssetOrBundleInfo()
		-- upvalues: p1 (copy)
		return p1.props.fetchAssetOrBundleInfo(p1.props.networking, p1.props.appAnalytics, tostring(p1.props.itemId), p1.props.itemType)
	end
	
	if AXItemDetails3DPreviewIXPModule.isEnabled() then
		function p1.onItemViewportLoadingFailed()
			-- upvalues: p1 (copy)
			p1:setState({ is3DPreviewEnabled = false })
		end
	end
	p1:updateDurability()
	p1.itemHeaderVisibleBinding, p1.updateItemHeaderVisibleBinding = RoactModule.createBinding(false)
	
	function p1.onTryOnActivated()
		-- upvalues: p1 (copy), FFlagAXTryOnScreenImprovements (upval), AvatarScreen (upval)
		local config = {
			mountAsFullView = false,
			mountAnimation = false,
			itemId = p1.props.itemId,
			itemType = p1.props.itemType,
			itemDetailsPeekViewRefs = p1.props.itemDetailsPeekViewRefs,
			resultsListRef = p1.props.resultsListRef
		}
		local Text = config.itemType .. config.itemId
		
		if FFlagAXTryOnScreenImprovements then
			config.itemSubType = p1.props.itemSubType
		else
			p1.props.toggleTryOn(p1.props.networking, p1.props.catalogAnalytics, p1.props.itemType, p1.props.itemSubType, p1.props.itemId, true, nil, nil)
		end
		p1.props.navigateDownToAvatarScreen(AvatarScreen.TryOnItem, Text, config)
	end
	
	function p1.onItemOwnershipButtonActivated()
		-- upvalues: p1 (copy), AvatarScreen (upval)
		p1.props.navigation.navigate(AvatarScreen.ItemOwnershipPage, {
			itemId = p1.props.itemId,
			collectibleItemId = p1.props.itemData.collectibleItemId,
			itemType = p1.props.itemType
		})
	end
	
	function p1.onItemHeaderMoved(Frame)
		-- upvalues: p1 (copy)
		if not p1.props.actionBarHeaderRef then return end
		local Current = p1.props.actionBarHeaderRef.current
		
		if Current then
			local IsYBelow = Frame.AbsolutePosition.Y < Current.AbsolutePosition.Y
			Current.Visible = not IsYBelow
			p1.updateItemHeaderVisibleBinding(IsYBelow)
			
			return
		end
	end
	
	p1.hasCalledOnItemInvalid = false
	
	if GetFFlagAXHideRecommendationsOnFetchFailureModule() then
		function p1.onFetchRecommendationsFailed()
			-- upvalues: p1 (copy)
			p1:setState({ fetchRecommendationsFailed = true })
		end
	end
end

function ItemDetailsContainer.canItemDescriptionExpand(p1, p2)
	-- upvalues: GetCanExpandFunction (copy)
	local ItemData = p1.props.itemData
	
	return if ItemData and ItemData.description then GetCanExpandFunction(p2, p1.state.width - 48, ItemData.description, 3) else false
end

function ItemDetailsContainer.updateDurability(p1)
	if p1.props.itemData and p1.props.itemData.timedOptions then
		p1.wearTimeOptions = p1.props.itemData.timedOptions
	end
end

function ItemDetailsContainer.didMount(p1)
	p1.fetchAssetOrBundleInfo()
end

function ItemDetailsContainer.didUpdate(p1, p2)
	-- upvalues: RetrievalStatusModule (copy), GetFFlagAXHideRecommendationsOnFetchFailureModule (copy)
	p1:updateDurability()
	local ItemData = p1.props.itemData
	local OnItemInvalidFunction: () -> () = p1.props.onItemInvalid
	local NoItemData: boolean = p1.props.fetchingState == RetrievalStatusModule.Done and ItemData == nil
	local NoHasCalledOnItemInvalid = not p1.hasCalledOnItemInvalid
	
	if OnItemInvalidFunction ~= nil and NoHasCalledOnItemInvalid and NoItemData then
		OnItemInvalidFunction()
		p1.hasCalledOnItemInvalid = true
	end
	if GetFFlagAXHideRecommendationsOnFetchFailureModule() and (p2.itemType ~= p1.props.itemType or p2.itemId ~= p1.props.itemId) then
		p1:setState({ fetchRecommendationsFailed = false })
	end
end

if FFlagEnableSocialProofOnItemDetails then
	function ItemDetailsContainer.setSocialProofChipRendered(p1, SocialProofChipRendered)
		p1:setState({ socialProofChipRendered = SocialProofChipRendered })
	end
end
function ItemDetailsContainer.shouldShowRecommendedItems(p1, SimpleView): boolean
	-- upvalues: CatalogUtilsModule (copy), GetFFlagAXHideRecommendationsOnFetchFailureModule (copy)
	if SimpleView then
		return false
	elseif p1.props.assetType and not CatalogUtilsModule.doesAssetTypeHaveCatalogPage(p1.props.assetType) then
		return false
	else
		local ItemData = p1.props.itemData
		
		return (not ItemData or not ItemData.receivedRecommendedData or ItemData.recommendedItemSummaries ~= nil and #ItemData.recommendedItemSummaries ~= 0) and (not GetFFlagAXHideRecommendationsOnFetchFailureModule() or not p1.state.fetchRecommendationsFailed)
	end
end

function ItemDetailsContainer.renderDetailsWithProviders(p1, p2)
	-- upvalues: CatalogUtilsModule (copy), FFlagAXThumbTypeNilCheck (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), FFlagAXInventoryDurablesSupport (copy), FFlagAXRemoveExpiredItemsFromInventory (copy), IsDurableItemExpiredFunction (copy), AXItemDetails3DPreviewIXPModule (copy), ConstantsModule (copy), GetFFlagAXSupportShoesInItemViewportModule (copy), GetFFlagRestrictLimited2ToSoothsayersModule (copy), WithStyleFunction (copy), PeekViewState (copy), GetFFlagL2ControllerSupportModule (copy), FFlagEnableSocialProofOnItemDetails (copy), FFlagEnableSocialProofOnItemDetailsRoactGamepadNavigation (copy), AvatarScreen (copy), FFlagAXEnableHomeTryOnComplexView (copy), FFlagAXTryOnScreenImprovements (copy), TextService (copy), RoactModule (copy), LinkButton (copy), MenuDirection (copy), Focusable (copy), FitFrameVertical (copy), RoactFitComponents (copy), FFlagAXItemDetailsIxpExposure (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), RoactGamepadModule (copy), IsVRAppBuildFunction (copy), FitTextLabel (copy), Skeleton (copy), StyledTextLabel (copy), ItemViewportModule (copy), GetFFlagAXItemDetailsScrollingEnabledCallbackModule (copy), LoadableImage (copy), Button (copy), ButtonType (copy), BundleItemsGridModule (copy), FriendsOwnedChip (copy), ItemDescriptionModule (copy), ReactModule (copy), ItemExpirationDisplay (copy), WearTimeOptionsCarousel (copy), ItemStatisticsModule (copy), ItemOwnershipButtonModule (copy), ItemInfoListModule (copy), RecommendedItemsGridModule (copy), GetFFlagAXHideRecommendationsOnFetchFailureModule (copy), TagBasedImpressionsDetector (copy)
	local Text = tostring(p1.props.itemId)
	local ItemType = p1.props.itemType
	local ListPadding = p1.props.listPadding
	local ItemSubType = p1.props.itemSubType
	local ItemData = p1.props.itemData
	local CollectibleItemId = if ItemData then ItemData.collectibleItemId else nil
	local PeekViewState1 = p1.props.peekViewState
	local Width = p1.state.width
	local RbxThumbType = CatalogUtilsModule.GetRbxThumbType(ItemType)
	local RbxthumbWithTypeSizeAndOptions = nil
	RbxthumbWithTypeSizeAndOptions = if FFlagAXThumbTypeNilCheck and RbxThumbType then GetRbxthumbWithTypeSizeAndOptionsFunction(Text, RbxThumbType, 420) else GetRbxthumbWithTypeSizeAndOptionsFunction(Text, RbxThumbType, 420)
	local IsResellable = CatalogUtilsModule.IsResellable(ItemData)
	local HasAttribution = CatalogUtilsModule.HasAttribution(ItemData)
	local IsResellable1 = ItemData and (ItemData.isOwned and IsResellable)
	local v1 = p1.wearTimeOptions and #p1.wearTimeOptions > 0
	
	if FFlagAXInventoryDurablesSupport then
		local IsOwned = ItemData and ItemData.isOwned
		local ExpirationTime = ItemData and (ItemData.isOwned and ItemData.expirationTime)
		v1 = v1 and (not IsOwned or ExpirationTime)
	end
	local Inverted = if FFlagAXRemoveExpiredItemsFromInventory then ItemData and (ItemData.expirationTime and not IsDurableItemExpiredFunction(ItemData.expirationTime)) else nil
	local Is3DPreviewEnabled = nil
	local BundleType = nil
	local Id = nil
	local Items = nil
	
	if AXItemDetails3DPreviewIXPModule.isEnabled() then
		local AssetType = ItemData and ItemData.assetType
		BundleType = ItemData and ItemData.bundleType
		Items = ItemData and ItemData.items
		Is3DPreviewEnabled = p1.state.is3DPreviewEnabled
		
		if ItemType == ConstantsModule.ItemType.Asset then
			Is3DPreviewEnabled = Is3DPreviewEnabled and ConstantsModule.ItemViewportAssetTypes[AssetType]
		elseif ItemType == ConstantsModule.ItemType.Bundle then
			Is3DPreviewEnabled = Is3DPreviewEnabled and ConstantsModule.ItemViewportBundleTypes[BundleType]
		end
		if not GetFFlagAXSupportShoesInItemViewportModule() and Items then
			for _, item in Items do
				if item.type == ConstantsModule.ItemType.Outfit then
					Id = item.id
					break
				end
			end
		end
	end
	if GetFFlagRestrictLimited2ToSoothsayersModule() then
		IsResellable1 = IsResellable1 and p1.props.isCollectiblesEnabled
	end
	local WidthRatio = p1.state.width * 9 / 16
	local IsBottomDockedContainerHeightAbove: boolean = p1.props.showFullWithNoPeekView and p1.props.bottomDockedContainerHeight > 0
	
	return WithStyleFunction(function(p3)
		-- upvalues: ItemData (copy), PeekViewState1 (copy), PeekViewState (upval), p1 (copy), GetFFlagL2ControllerSupportModule (upval), IsResellable1 (ref), IsResellable (copy), HasAttribution (copy), FFlagEnableSocialProofOnItemDetails (upval), FFlagEnableSocialProofOnItemDetailsRoactGamepadNavigation (upval), AvatarScreen (upval), FFlagAXEnableHomeTryOnComplexView (upval), FFlagAXTryOnScreenImprovements (upval), p2 (copy), TextService (upval), RoactModule (upval), LinkButton (upval), CatalogUtilsModule (upval), MenuDirection (upval), Focusable (upval), FitFrameVertical (upval), ListPadding (copy), RoactFitComponents (upval), FFlagAXItemDetailsIxpExposure (upval), FFlagAXMigrateAXToGlobalAutofocus (upval), RoactGamepadModule (upval), IsVRAppBuildFunction (upval), FitTextLabel (upval), Skeleton (upval), StyledTextLabel (upval), WidthRatio (copy), AXItemDetails3DPreviewIXPModule (upval), Is3DPreviewEnabled (ref), ItemViewportModule (upval), Text (copy), ItemType (copy), BundleType (ref), GetFFlagAXSupportShoesInItemViewportModule (upval), Id (ref), Items (ref), GetFFlagAXItemDetailsScrollingEnabledCallbackModule (upval), LoadableImage (upval), RbxthumbWithTypeSizeAndOptions (ref), Button (upval), ButtonType (upval), ConstantsModule (upval), BundleItemsGridModule (upval), FriendsOwnedChip (upval), ItemDescriptionModule (upval), FFlagAXInventoryDurablesSupport (upval), FFlagAXRemoveExpiredItemsFromInventory (upval), Inverted (copy), ReactModule (upval), ItemExpirationDisplay (upval), v1 (ref), WearTimeOptionsCarousel (upval), ItemStatisticsModule (upval), Width (copy), ItemOwnershipButtonModule (upval), CollectibleItemId (copy), ItemInfoListModule (upval), RecommendedItemsGridModule (upval), ItemSubType (copy), GetFFlagAXHideRecommendationsOnFetchFailureModule (upval), IsBottomDockedContainerHeightAbove (copy), TagBasedImpressionsDetector (upval)
		local Theme = p3.Theme
		local _Font = p3.Font
		local ScaledBaseSize = _Font.BaseSize * _Font.Header1.RelativeSize
		local Name = if ItemData then ItemData.name else nil
		local HeaderFont = _Font.Header1.Font
		local IsPeekViewStateMatch: boolean = PeekViewState1 == PeekViewState.Full or PeekViewState1 == PeekViewState.Extended
		local CanItemDescriptionExpand = p1:canItemDescriptionExpand(_Font)
		local ExpandableTextRef = if CanItemDescriptionExpand then p1.expandableTextRef elseif GetFFlagL2ControllerSupportModule() and IsResellable1 then p1.ownershipButtonRef elseif IsResellable then p1.resellerRef elseif HasAttribution then p1.attributionRef else p1.recommendedItemsGridRef
		local Description = nil
		local FavoriteCount = nil
		
		if ItemData then
			Description = ItemData.description
			FavoriteCount = ItemData.favoriteCount
		end
		local ExpandableTextRef1 = if Description then ExpandableTextRef else nil
		local SocialProofRef = if FFlagEnableSocialProofOnItemDetails and p1.state.socialProofChipRendered then p1.socialProofRef else p1.props.NextSelectionUp
		local v2 = if FFlagEnableSocialProofOnItemDetails and FFlagEnableSocialProofOnItemDetailsRoactGamepadNavigation then function(SocialProofChipRendered)
			-- upvalues: p1 (upval)
			p1:setSocialProofChipRendered(SocialProofChipRendered)
		end else nil
		local FromProfileParam = p1.props.navigation.getParam("fromProfile")
		local SimpleView = if FFlagAXEnableHomeTryOnComplexView or FFlagAXTryOnScreenImprovements then p1.props.simpleView or false else p1.props.navigation.state.routeName == AvatarScreen.TryOnItem
		local ShouldShowRecommendedItems = p1:shouldShowRecommendedItems(SimpleView)
		local TryOn = p2.tryOn
		local NewX = 16 + TextService:GetTextSize(TryOn, _Font.BaseSize * _Font.Header2.RelativeSize, _Font.Header2.Font, Vector2.new(10000, 10000)).X
		local IsUnitsAvailableForConsumptionMatch: boolean = p1.props.collectibleData and p1.props.collectibleData.unitsAvailableForConsumption == 0
		local Element = if p1.props.experiences then RoactModule.createElement(LinkButton, {
			minPaddingX = 0,
			layoutOrder = 1,
			text = if p1.props.experiences and #p1.props.experiences == 1 and p1.props.experiences[1].name then p2.inSpecificExperience else p2.inMultipleExperiences,
			onActivated = function()
				-- upvalues: p1 (upval), AvatarScreen (upval), CatalogUtilsModule (upval), ItemData (upval), MenuDirection (upval)
				p1.props.navigation.navigate(AvatarScreen.ItemExperiencesMenu, {
					collectibleData = p1.props.collectibleData,
					isLimited = CatalogUtilsModule.isLimitedCollectible(ItemData),
					openPositionY = UDim.new(0, 100),
					menuDirection = MenuDirection.Down
				})
			end
		}) else nil
		
		return RoactModule.createElement(Focusable[FitFrameVertical], {
			width = UDim.new(1, 0),
			contentPadding = UDim.new(0, ListPadding),
			margin = RoactFitComponents.Rect.square(24),
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			BackgroundColor3 = Theme.BackgroundDefault.Color,
			BackgroundTransparency = Theme.BackgroundDefault.Transparency,
			BorderSizePixel = 0,
			Position = UDim2.new(0, 0, 0, 0),
			defaultChild = ExpandableTextRef1,
			restorePreviousChildFocus = true,
			[RoactModule.Ref] = if FFlagAXItemDetailsIxpExposure then p1.itemDetailsContainerRef else nil,
			inputBindings = if FFlagAXMigrateAXToGlobalAutofocus then nil else {
				MoveToTop = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonL2, function()
					-- upvalues: p1 (upval), ExpandableTextRef1 (copy)
					p1.props.peekViewFocusController.moveFocusTo(ExpandableTextRef1)
				end),
				MoveToRecItemsGrid = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonR2, function()
					-- upvalues: p1 (upval)
					p1.props.peekViewFocusController.moveFocusTo(p1.recommendedItemsGridRef)
				end)
			}
		}, {
			ItemThumbnail = RoactModule.createElement(FitFrameVertical, {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				width = UDim.new(1, 0),
				contentPadding = UDim.new(0, 12),
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}, {
				NameLabel = RoactModule.createElement(FitFrameVertical, {
					width = UDim.new(1, 0),
					LayoutOrder = 0,
					BackgroundTransparency = 1,
					[RoactModule.Change.AbsolutePosition] = p1.onItemHeaderMoved
				}, {
					TextLabel = if IsVRAppBuildFunction() then nil elseif Name then RoactModule.createElement(FitTextLabel, {
						BackgroundTransparency = 1,
						TextWrapped = true,
						width = UDim.new(1, 0),
						Visible = p1.itemHeaderVisibleBinding,
						Font = HeaderFont,
						Text = Name,
						TextSize = ScaledBaseSize,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextColor3 = Theme.TextEmphasis.Color
					}, {}) else RoactModule.createElement(Skeleton, { Size = UDim2.new(1, 0, 0, ScaledBaseSize) }),
					RefUpdater = RoactModule.createElement("Frame", {
						Size = UDim2.new(0, 0, 0, 0),
						BackgroundTransparency = 1,
						[RoactModule.Ref] = function(p4)
							-- upvalues: p1 (upval)
							if p4 and p4.Parent then
								p1.onItemHeaderMoved(p4.Parent)
							end
						end
					})
				}),
				ExperienceLinkDetails = if p1.props.experiences then RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 0,
					Size = UDim2.new(1, 0, 0, _Font.BaseSize * _Font.Body.RelativeSize)
				}, {
					UIListLayout = RoactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Horizontal,
						HorizontalAlignment = Enum.HorizontalAlignment.Left,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						SortOrder = Enum.SortOrder.LayoutOrder,
						Padding = UDim.new(0, 4)
					}),
					ExperienceLink = Element,
					DashDivider = if IsUnitsAvailableForConsumptionMatch then RoactModule.createElement(StyledTextLabel, {
						text = "-",
						layoutOrder = 2,
						automaticSize = Enum.AutomaticSize.XY,
						fontStyle = _Font.Body,
						colorStyle = Theme.TextDefault
					}) else nil,
					SoldOutText = if IsUnitsAvailableForConsumptionMatch then RoactModule.createElement(StyledTextLabel, {
						layoutOrder = 3,
						automaticSize = Enum.AutomaticSize.XY,
						text = p2.soldOut,
						fontStyle = _Font.Body,
						colorStyle = Theme.TextDefault
					}) else nil
				}) else nil,
				ItemImageFrame = RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					ZIndex = 0,
					Size = UDim2.new(1, 0, 0, WidthRatio)
				}, {
					ItemBackground = RoactModule.createElement("Frame", {
						ZIndex = 0,
						BorderSizePixel = 0,
						AnchorPoint = Vector2.new(0.5, 0),
						Position = UDim2.fromScale(0.5, 0),
						Size = UDim2.new(1, 48, 1, 0),
						BackgroundColor3 = Theme.BackgroundMuted.Color,
						BackgroundTransparency = Theme.BackgroundMuted.Transparency
					}, {
						UIGradient = RoactModule.createElement("UIGradient", {
							Rotation = -90,
							Transparency = NumberSequence.new({
								NumberSequenceKeypoint.new(0, 1),
								NumberSequenceKeypoint.new(0.4, 0),
								NumberSequenceKeypoint.new(1, 1)
							})
						})
					}),
					ItemViewport = if AXItemDetails3DPreviewIXPModule.isEnabled() and Is3DPreviewEnabled then RoactModule.createElement(ItemViewportModule, {
						anchorPoint = Vector2.new(0.5, 0),
						position = UDim2.fromScale(0.5, 0),
						size = UDim2.new(1, 48, 1, 0),
						itemId = Text,
						itemType = ItemType,
						bundleType = BundleType,
						outfitId = if GetFFlagAXSupportShoesInItemViewportModule() then nil else Id,
						bundleItems = if GetFFlagAXSupportShoesInItemViewportModule() then Items else nil,
						setParentScrollingEnabled = if GetFFlagAXItemDetailsScrollingEnabledCallbackModule() then p1.props.setItemDetailsScrollingEnabled else nil,
						onLoadingFailed = p1.onItemViewportLoadingFailed
					}) else nil,
					Image = if AXItemDetails3DPreviewIXPModule.isEnabled() and Is3DPreviewEnabled then nil else RoactModule.createElement(LoadableImage, {
						BackgroundTransparency = 1,
						useShimmerAnimationWhileLoading = true,
						Image = RbxthumbWithTypeSizeAndOptions,
						AnchorPoint = Vector2.new(0.5, 0),
						Position = UDim2.fromScale(0.5, 0),
						Size = UDim2.fromOffset(WidthRatio, WidthRatio)
					}),
					TryOnButtonFrame = if FromProfileParam then RoactModule.createElement("Frame", {
						ZIndex = 2,
						BorderSizePixel = 0,
						BackgroundTransparency = 1,
						Size = UDim2.fromScale(1, 1)
					}, {
						TryOnButton = RoactModule.createElement(Button, {
							buttonType = ButtonType.Secondary,
							position = UDim2.new(1, -NewX - 8, 1, -44),
							size = UDim2.fromOffset(NewX, 36),
							text = TryOn,
							onActivated = p1.onTryOnActivated
						})
					}) else nil
				})
			}),
			IncludedItems = if SimpleView or ItemType ~= ConstantsModule.ItemType.Bundle then nil else RoactModule.createElement(BundleItemsGridModule, { LayoutOrder = 2, itemId = Text, itemType = ItemType }),
			ItemSocialProof = if FFlagEnableSocialProofOnItemDetails then RoactModule.createElement(FriendsOwnedChip, {
				layoutOrder = 3,
				itemId = Text,
				itemType = ItemType,
				fromProfile = FromProfileParam,
				ref = p1.socialProofRef,
				chipIsRenderedCallback = if FFlagEnableSocialProofOnItemDetailsRoactGamepadNavigation then v2 else nil,
				NextSelectionUp = p1.props.NextSelectionUp,
				NextSelectionDown = p1.expandableTextRef
			}) else nil,
			ItemDescription = RoactModule.createElement(ItemDescriptionModule, {
				compactNumberOfLines = 3,
				descriptionText = Description,
				LayoutOrder = if FFlagEnableSocialProofOnItemDetails then 4 else 3,
				[RoactModule.Ref] = p1.expandableTextRef,
				NextSelectionUp = if GetFFlagL2ControllerSupportModule() then if FFlagEnableSocialProofOnItemDetails then SocialProofRef else p1.props.NextSelectionUp else nil,
				NextSelectionDown = if GetFFlagL2ControllerSupportModule() then if IsPeekViewStateMatch and IsResellable1 then p1.ownershipButtonRef elseif IsPeekViewStateMatch and IsResellable then p1.resellerRef elseif IsPeekViewStateMatch and HasAttribution then p1.attributionRef elseif IsPeekViewStateMatch then p1.recommendedItemsGridRef else p1.props.NextSelectionDown elseif IsPeekViewStateMatch then if IsResellable then p1.resellerRef elseif HasAttribution then p1.attributionRef else p1.recommendedItemsGridRef else nil
			}),
			ExpirationTimeContainer = if FFlagAXInventoryDurablesSupport and p1.props.itemData and p1.props.itemData.expirationTime and not FFlagAXRemoveExpiredItemsFromInventory then ReactModule.createElement(ItemExpirationDisplay, {
				expirationTime = p1.props.itemData.expirationTime,
				LayoutOrder = if FFlagEnableSocialProofOnItemDetails then 5 else 4
			}) elseif FFlagAXRemoveExpiredItemsFromInventory and Inverted then ReactModule.createElement(ItemExpirationDisplay, {
				expirationTime = p1.props.itemData.expirationTime,
				LayoutOrder = if FFlagEnableSocialProofOnItemDetails then 5 else 4
			}) else nil,
			WearTimeOptionsCarousel = if v1 then RoactModule.createElement(WearTimeOptionsCarousel, {
				useWrapping = true,
				LayoutOrder = if FFlagEnableSocialProofOnItemDetails then 6 else 5,
				options = p1.wearTimeOptions,
				onOptionActivated = p1.props.onWearTimeSelection
			}) else nil,
			ItemStatistics = not SimpleView and p1.props.enableAggregateLikesFavoritesCount and RoactModule.createElement(ItemStatisticsModule, {
				listPadding = 10,
				favoritesCount = FavoriteCount,
				LayoutOrder = (if FFlagEnableSocialProofOnItemDetails then 1 else (if FFlagAXInventoryDurablesSupport then 1 else 0) + 0) + 5,
				width = Width - 48
			}),
			ItemOwnershipButton = if IsResellable1 then RoactModule.createElement(ItemOwnershipButtonModule, {
				size = UDim2.new(1, 0, 0, 0),
				automaticSize = Enum.AutomaticSize.Y,
				layoutOrder = (if FFlagEnableSocialProofOnItemDetails then 1 else (if FFlagAXInventoryDurablesSupport then 1 else 0) + 0) + 6,
				itemId = Text,
				isLimitedCollectible = p1.props.isLimitedCollectible,
				collectibleItemId = CollectibleItemId,
				onActivated = p1.onItemOwnershipButtonActivated,
				ref = if GetFFlagL2ControllerSupportModule() then p1.ownershipButtonRef else nil,
				NextSelectionUp = if GetFFlagL2ControllerSupportModule() then if IsPeekViewStateMatch and CanItemDescriptionExpand then p1.expandableTextRef elseif FFlagEnableSocialProofOnItemDetails then SocialProofRef else p1.props.NextSelectionUp else nil,
				NextSelectionDown = if GetFFlagL2ControllerSupportModule() then if IsPeekViewStateMatch and IsResellable then p1.resellerRef elseif IsPeekViewStateMatch and HasAttribution then p1.attributionRef elseif IsPeekViewStateMatch then p1.recommendedItemsGridRef else p1.props.NextSelectionDown else nil
			}) else nil,
			ItemInfoList = not SimpleView and RoactModule.createElement(ItemInfoListModule, {
				itemId = Text,
				itemType = ItemType,
				LayoutOrder = (if FFlagEnableSocialProofOnItemDetails then 1 else (if FFlagAXInventoryDurablesSupport then 1 else 0) + 0) + 7,
				resellerRef = p1.resellerRef,
				attributionRef = p1.attributionRef,
				NextSelectionUp = if GetFFlagL2ControllerSupportModule() then if IsPeekViewStateMatch and IsResellable1 then p1.ownershipButtonRef elseif IsPeekViewStateMatch and CanItemDescriptionExpand then p1.expandableTextRef elseif FFlagEnableSocialProofOnItemDetails then SocialProofRef else p1.props.NextSelectionUp else IsPeekViewStateMatch and CanItemDescriptionExpand and p1.expandableTextRef or nil,
				NextSelectionDown = if GetFFlagL2ControllerSupportModule() then if IsPeekViewStateMatch then p1.recommendedItemsGridRef else p1.props.NextSelectionDown else IsPeekViewStateMatch and p1.recommendedItemsGridRef or nil
			}),
			RecommendedLabel = ShouldShowRecommendedItems and RoactModule.createElement(FitTextLabel, {
				TextWrapped = true,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				width = FitTextLabel.Width.FitToText,
				AutomaticSize = Enum.AutomaticSize.Y,
				Font = _Font.Header1.Font,
				LayoutOrder = if FFlagEnableSocialProofOnItemDetails then 9 else (if FFlagAXInventoryDurablesSupport then 1 else 0) + 8,
				Position = UDim2.new(0, 0, 0, 0),
				Text = p2.recommendedLabel,
				TextSize = ScaledBaseSize,
				TextColor3 = Theme.TextEmphasis.Color
			}, {
				UISizeConstraint = RoactModule.createElement("UISizeConstraint", {
					MaxSize = Vector2.new(math.max(p1.state.width - 24, 0), 1e999)
				})
			}),
			RecommendedItemsGrid = ShouldShowRecommendedItems and RoactModule.createElement(RecommendedItemsGridModule, {
				itemId = Text,
				itemSubType = ItemSubType,
				itemType = ItemType,
				onFetchRecommendationsFailed = if GetFFlagAXHideRecommendationsOnFetchFailureModule() then p1.onFetchRecommendationsFailed else nil,
				LayoutOrder = if FFlagEnableSocialProofOnItemDetails then 10 else (if FFlagAXInventoryDurablesSupport then 1 else 0) + 9,
				[RoactModule.Ref] = p1.recommendedItemsGridRef,
				NextSelectionUp = if IsPeekViewStateMatch and HasAttribution then p1.attributionRef elseif GetFFlagL2ControllerSupportModule() then if IsPeekViewStateMatch and IsResellable then p1.resellerRef elseif IsPeekViewStateMatch and IsResellable1 then p1.ownershipButtonRef elseif IsPeekViewStateMatch and CanItemDescriptionExpand then p1.expandableTextRef elseif FFlagEnableSocialProofOnItemDetails then SocialProofRef else p1.props.NextSelectionUp else IsResellable and p1.resellerRef or (CanItemDescriptionExpand and p1.expandableTextRef or nil),
				NextSelectionDown = p1.props.NextSelectionDown,
				itemDetailsPeekViewRefs = p1.props.itemDetailsPeekViewRefs,
				resultsListRef = p1.props.resultsListRef
			}),
			BottomContainerPlaceHolder = IsBottomDockedContainerHeightAbove and RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Active = false,
				LayoutOrder = if FFlagEnableSocialProofOnItemDetails then 11 else (if FFlagAXInventoryDurablesSupport then 1 else 0) + 10,
				Size = UDim2.new(1, 0, 0, p1.props.bottomDockedContainerHeight)
			}),
			UnifiedImpressionsReporter = if FFlagAXItemDetailsIxpExposure then RoactModule.createElement(TagBasedImpressionsDetector, {
				parentRef = p1.itemDetailsContainerRef,
				pageFilter = function(): boolean
					-- upvalues: p1 (upval)
					return p1.props.navigation.state.key == p1.props.avatarRoute.current.key
				end,
				requestImpressionsSignal = p1.requestImpressionsSignal,
				extensions = p1.props.tagBasedImpressionsDetectorExtensions
			}) else nil
		})
	end)
end

function ItemDetailsContainer.renderDetails(p3)
	-- upvalues: WithLocalizationFunction (copy)
	return WithLocalizationFunction({
		recommendedLabel = "Feature.Catalog.Label.Recommendations",
		resellLabel = "Feature.Catalog.Heading.Sellers",
		tryOn = "Feature.Avatar.Action.TryOn",
		soldOut = "Feature.Catalog.Label.SoldOut",
		inMultipleExperiences = {
			"Feature.Catalog.Label.InMultipleExperiences",
			NUM_EXPERIENCES = if p3.props.experiences then #p3.props.experiences else 0
		},
		inSpecificExperience = {
			"Feature.Catalog.Label.InSpecificExperience",
			EXPERIENCE_NAME = if p3.props.experiences then p3.props.experiences[1].name else ""
		}
	})(function(p4)
		-- upvalues: p3 (copy)
		return p3:renderDetailsWithProviders(p4)
	end)
end

function ItemDetailsContainer.renderOnFailed(p3)
	-- upvalues: GetSafeAreaSizeFunction (copy), CatalogConstantsModule (copy), WithLocalizationFunction (copy), RoactModule (copy), EmptyState (copy)
	local FetchAssetOrBundleInfo = p3.fetchAssetOrBundleInfo
	local SafeAreaSize = GetSafeAreaSizeFunction(p3.props.screenSize, p3.props.globalGuiInset)
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, SafeAreaSize.Y.Scale, SafeAreaSize.Y.Offset - (CatalogConstantsModule.ActionBar.ActionBarHeight + CatalogConstantsModule.ActionBar.ActionBarGradientHeight))
	}, {
		EmptyStatePage = WithLocalizationFunction({ emptyText = "Feature.EmptyStatePage.Message.NoInternet" })(function(p4)
			-- upvalues: RoactModule (upval), EmptyState (upval), FetchAssetOrBundleInfo (copy)
			return RoactModule.createElement(EmptyState, {
				onActivated = FetchAssetOrBundleInfo,
				text = p4.emptyText
			})
		end)
	})
end

function ItemDetailsContainer.render(p3)
	-- upvalues: FitFrameVertical (copy), FFlagAXCustomizeMakeupSupport (copy), RoactModule (copy), FFlagAXItemDetailsIxpExposure (copy), LoadingStateContainer (copy), RetrievalStatus (copy), WithStyleFunction (copy)
	local ClipDetails = p3.props.clipDetails
	local FetchingState = p3.props.fetchingState
	
	return WithStyleFunction(function(p4)
		-- upvalues: ClipDetails (copy), FitFrameVertical (upval), FFlagAXCustomizeMakeupSupport (upval), RoactModule (upval), p3 (copy), FFlagAXItemDetailsIxpExposure (upval), LoadingStateContainer (upval), RetrievalStatus (upval), FetchingState (copy)
		local Theme = p4.Theme
		
		return RoactModule.createElement(if FFlagAXCustomizeMakeupSupport then "Frame" elseif ClipDetails then "Frame" else FitFrameVertical, {
			width = if ClipDetails or FFlagAXCustomizeMakeupSupport then nil else UDim.new(1, 0),
			ClipsDescendants = ClipDetails,
			Size = if ClipDetails then UDim2.new(1, 0, 0, 0) elseif FFlagAXCustomizeMakeupSupport then UDim2.new(1, 0, 1, 0) else nil,
			AutomaticSize = if FFlagAXCustomizeMakeupSupport then if ClipDetails then nil else Enum.AutomaticSize.Y else nil,
			BackgroundColor3 = Theme.BackgroundDefault.Color,
			BackgroundTransparency = Theme.BackgroundDefault.Transparency,
			BorderSizePixel = 0,
			Position = UDim2.new(0, 0, 0, 0),
			[RoactModule.Ref] = p3.props.forwardRef,
			[RoactModule.Change.AbsoluteSize] = function(Frame: Frame)
				-- upvalues: p3 (upval)
				if p3.state.width ~= Frame.AbsoluteSize.X then
					p3:setState({ width = Frame.AbsoluteSize.X })
				end
			end,
			[RoactModule.Change.AbsolutePosition] = if FFlagAXItemDetailsIxpExposure then function(_)
				-- upvalues: p3 (upval)
				p3.requestImpressionsSignal:fire()
			end else nil
		}, {
			LoadingState = RoactModule.createElement(LoadingStateContainer, {
				dataStatus = RetrievalStatus.fromRawValue(FetchingState),
				renderOnLoading = function()
					-- upvalues: p3 (upval)
					return p3:renderDetails()
				end,
				renderOnLoaded = function()
					-- upvalues: p3 (upval)
					return p3:renderDetails()
				end,
				renderOnFailed = function()
					-- upvalues: p3 (upval)
					return p3:renderOnFailed()
				end
			})
		})
	end)
end

local WithNavigationResult = RoactNavigationModule.withNavigation((RoactAppPolicy.connect(function(p3, _)
	return {
		enableAggregateLikesFavoritesCount = p3.getEnableAggregateLikesFavoritesCount()
	}
end)((RoactRoduxModule.connect(function(p3, p4)
	-- upvalues: PerformFetch (copy), CatalogUtilsModule (copy), RetrievalStatusModule (copy), ItemDataModule (copy), AvatarScreen (copy), GetFFlagRestrictLimited2ToSoothsayersModule (copy)
	local Status = PerformFetch.GetStatus(p3, CatalogUtilsModule.GetItemDetailsKey(p4.itemId, p4.itemType))
	local ItemDataModuleResult = if Status ~= RetrievalStatusModule.NotStarted then ItemDataModule(p3.AvatarExperience.Common, p4.itemId, p4.itemType) else nil
	
	if p4.navigation.state.routeName == AvatarScreen.TryOnItem and ItemDataModuleResult ~= nil and ItemDataModuleResult.name == nil then
		ItemDataModuleResult = nil
	end
	local Experiences = nil
	local IsCollectiblesEnabled = nil
	local CollectiblesItem = if (if ItemDataModuleResult then ItemDataModuleResult.collectibleItemId else nil) and ItemDataModuleResult then p3.AvatarExperience.Common.Collectibles.CollectiblesItemInfo[ItemDataModuleResult.collectibleItemId] else nil
	local ItemSubType = CatalogUtilsModule.GetItemSubType(p4.itemType, ItemDataModuleResult)
	
	if CollectiblesItem ~= nil then
		Experiences = CollectiblesItem.experiences
	end
	if GetFFlagRestrictLimited2ToSoothsayersModule() then
		IsCollectiblesEnabled = p3.AvatarExperience.Catalog.Metadata.isCollectiblesEnabled
	end
	return {
		globalGuiInset = p3.GlobalGuiInset,
		screenSize = p3.ScreenSize,
		fetchingState = Status,
		itemData = ItemDataModuleResult,
		itemSubType = ItemSubType,
		peekViewState = p3.AvatarExperience.Common.ItemDetailsPeekView.viewState,
		experiences = Experiences,
		collectibleData = CollectiblesItem,
		isCollectiblesEnabled = IsCollectiblesEnabled,
		isLimitedCollectible = CatalogUtilsModule.isLimitedCollectible(ItemDataModuleResult)
	}
end, function(Callback, _)
	-- upvalues: FetchAssetOrBundleInfoModule (copy), NavigateDownToAvatarScreenModule (copy), ToggleTryOnThunkModule (copy)
	return {
		fetchAssetOrBundleInfo = function(p3, p4, p5, p6)
			-- upvalues: Callback (copy), FetchAssetOrBundleInfoModule (upval)
			return Callback(FetchAssetOrBundleInfoModule(p3, p4, p5, p6))
		end,
		navigateDownToAvatarScreen = function(p3, p4, p5)
			-- upvalues: Callback (copy), NavigateDownToAvatarScreenModule (upval)
			return Callback(NavigateDownToAvatarScreenModule(p3, p4, p5))
		end,
		toggleTryOn = function(p3, p4, p5, p6, p7, p8, p9, p10)
			-- upvalues: Callback (copy), ToggleTryOnThunkModule (upval)
			Callback(ToggleTryOnThunkModule(p3, p4, p5, p6, p7, p8, p9, p10))
		end
	}
end)(ItemDetailsContainer)))))

if FFlagAXItemDetailsIxpExposure then
	WithNavigationResult = WithAvatarRouteModule(WithNavigationResult)
end
local v2 = RoactServices.connect({
	appAnalytics = RoactAnalyticsModule,
	catalogAnalytics = AnalyticsModule,
	networking = RoactNetworkingModule
})(WithNavigationResult)

return RoactModule.forwardRef(function(p3, ForwardRef)
	-- upvalues: FFlagAXItemDetailsIxpExposure (copy), UseUnifiedEventImpressionsReporterFunction (copy), ReactModule (copy), LogItemDetailsIxpLayerExposureModule (copy), RoactModule (copy), v2 (ref), CryoModule (copy)
	local UseMemoResult = nil
	
	if FFlagAXItemDetailsIxpExposure then
		local UseUnifiedEventImpressionsReporterResult = UseUnifiedEventImpressionsReporterFunction()
		UseMemoResult = ReactModule.useMemo(function()
			-- upvalues: UseUnifiedEventImpressionsReporterResult (copy), LogItemDetailsIxpLayerExposureModule (upval)
			return {
				UseUnifiedEventImpressionsReporterResult,
				LogItemDetailsIxpLayerExposureModule
			}
		end, {
			UseUnifiedEventImpressionsReporterResult,
			LogItemDetailsIxpLayerExposureModule
		})
	end
	return RoactModule.createElement(v2, CryoModule.Dictionary.join(p3, {
		forwardRef = ForwardRef,
		tagBasedImpressionsDetectorExtensions = UseMemoResult
	}))
end)