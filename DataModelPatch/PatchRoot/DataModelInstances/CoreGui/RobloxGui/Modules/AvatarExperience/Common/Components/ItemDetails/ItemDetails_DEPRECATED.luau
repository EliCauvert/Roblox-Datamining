local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local TutilsModule = require(CorePackages.Packages.tutils)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local ReactModule = require(CorePackages.Packages.React)
local Focusable = RoactGamepadModule.Focusable
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local Skeleton = require(CorePackages.Packages.Foundation).Skeleton
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local GetSafeAreaSizeFunction = require(CorePackages.Workspace.Packages.InputUi).getSafeAreaSize
local UseLocalizationModule = require(Modules.LuaApp.Hooks.useLocalization)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local MemoizeFunction = require(CorePackages.Workspace.Packages.AppCommonLib).memoize
local TModule = require(CorePackages.Packages.t)
local ConstantsModule = require(Modules.LuaApp.Constants)
local ToastTypeModule = require(Modules.LuaApp.Enum.ToastType)
local PeekViewState = require(CorePackages.Workspace.Packages.PeekView).PeekViewState
local WithStyleFunction = UIBloxModule.Style.withStyle
local SetCurrentToastMessageModule = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor
local WithSelectionCursorProviderFunction = UIBloxModule.App.SelectionImage.withSelectionCursorProvider
local IsVRAppBuildFunction = require(CorePackages.Workspace.Packages.AppCommonLib).IsVRAppBuild
local Common = Modules.AvatarExperience.Common
local CloseFocusedScreenModule = require(Common.Thunks.CloseFocusedScreen)
local _ = require(Common.AvatarExperienceState)
local NavigationEventsLoggerModule = require(Common.Components.RoactNavigation.Debug.NavigationEventsLogger)
local ConstantsModule1 = require(Common.Constants)
local UtilsModule = require(Common.Utils)
local BoundInputsUpdaterModule = require(Common.Components.BoundInputsUpdater)
local ItemDetailsContainerModule = require(Common.Components.ItemDetails.ItemDetailsContainer)
local ItemDetailsContainerDEPRECATEDModule = require(Common.Components.ItemDetails.ItemDetailsContainer_DEPRECATED)
local PeekViewTopBarModule = require(Common.Components.ItemDetails.PeekViewTopBar)
local VRItemDetailsTopBarModule = require(Common.Components.ItemDetails.VRItemDetailsTopBar)
local GamepadFocusHandlerForPageModule = require(Common.Components.GamepadFocusHandlerForPage)
local NavigationUtilsModule = require(Common.Components.RoactNavigation.NavigationUtils)
local SetSelectedTimedOptionFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).State.Actions.SetSelectedTimedOption
local AvatarExperienceNavigationModule = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local WithMappedNavigationParamsModule = require(Common.Components.RoactNavigation.withMappedNavigationParams)
local SelectIsPortraitModule = require(Common.Selectors.selectIsPortrait)
local CloseAllPeekViewsModule = require(Common.Thunks.CloseAllPeekViews)
local CloseAllItemDetailsModule = require(Common.Thunks.CloseAllItemDetails)
local ToggleTryOnThunkModule = require(Common.Thunks.ToggleTryOnThunk)
local CloseMatchingScreensModule = require(Common.Thunks.CloseMatchingScreens)
local ItemDataModule = require(Common.Selectors.ItemData)
local SetItemDetailsExpandedModule = require(Common.Actions.SetItemDetailsExpanded)
local AvatarExperienceRoduxModule = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)
local SetItemDetailsPeekViewStateFunction = AvatarExperienceRoduxModule.Actions.SetItemDetailsPeekViewState
local SetItemTryOnPeekViewStateFunction = AvatarExperienceRoduxModule.Actions.SetItemTryOnPeekViewState
local ItemDetailsPeekViewModule = require(Common.Components.ItemDetails.ItemDetailsPeekView)
local ItemDetailsModalModule = require(Common.Components.ItemDetails.ItemDetailsModal)
local ItemDetailsFullModule = require(Common.Components.ItemDetails.ItemDetailsFull)
local WithLastInputGroupModule = require(Common.Components.withLastInputGroup)
local AxItemdetails = require(CorePackages.Workspace.Packages.AppDebug).LogTree.logger("ax.itemdetails")
local OpenItemPromptModule = require(Common.Thunks.OpenItemPrompt)
local UseAvatarExperienceFocusNavigationBindingsModule = require(Common.Hooks.useAvatarExperienceFocusNavigationBindings)
local UseOverlayClosedCallbackModule = require(Common.Hooks.useOverlayClosedCallback)
local GetTryOnItemReducerKeyFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.getTryOnItemReducerKey
local Catalog = Modules.AvatarExperience.Catalog
local AnalyticsModule = require(Catalog.Services.Analytics)
local CatalogUtilsModule = require(Catalog.CatalogUtils)
local BuyActionBarModule = require(Modules.AvatarExperience.Catalog.Components.ActionBar.BuyActionBar)
local CatalogConstantsModule = require(Catalog.CatalogConstants)
local RedeemQRCodeItemModule = require(Catalog.Thunks.RedeemQRCodeItem)
local OnFocusExposureLoggerModule = require(Catalog.Components.OnFocusExposureLogger)
local Flags = Modules.AvatarExperience.Flags
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local AvatarMarketplaceBackendIXPTestsModule = require(Flags.AvatarMarketplaceBackendIXPTests)
local FFlagQRCodeItemRedemptionEnabledModule = require(Flags.FFlagQRCodeItemRedemptionEnabled)
local GetFFlagAXDisableItemDetailsPageLayerExposureModule = require(Modules.AvatarExperience.Flags.GetFFlagAXDisableItemDetailsPageLayerExposure)
local GetFFlagAXItemDetailsScrollingEnabledCallbackModule = require(Modules.AvatarExperience.Flags.GetFFlagAXItemDetailsScrollingEnabledCallback)
local AXItemDetails3DPreviewIXPModule = require(Modules.AvatarExperience.Experiments.AXItemDetails3DPreviewIXP)
local FFlagAXEnableHomeTryOnComplexView = SharedFlagsModule.FFlagAXEnableHomeTryOnComplexView
local FFlagAXMISEnableMultiShopping = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXMISEnableMultiShopping
local FFlagAXMigrateItemDetailsContainerInputBindingsToFocusNavigation = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateItemDetailsContainerInputBindingsToFocusNavigation
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local FFlagAXDurablesForMIS = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXDurablesForMIS
local FFlagAXDurablesSupportForRFYMigration = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXDurablesSupportForRFYMigration
local FFlagAXDurablesSupportWithPostPurchaseFix = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXDurablesSupportWithPostPurchaseFix
local FFlagAXTryOnScreenImprovements = SharedFlagsModule.FFlagAXTryOnScreenImprovements
local FFlagAXFixPurchaseSurfaceLogging = SharedFlagsModule.FFlagAXFixPurchaseSurfaceLogging
local v1 = if FFlagAXMISEnableMultiShopping then 4 else nil
local config = {
	toastMessage = "Feature.Avatar.Message.InvalidItem",
	isLocalized = false,
	toastType = ToastTypeModule.InformationMessage
}
local IsTenFootInterface = GuiService:IsTenFootInterface()
local ItemDetails = RoactModule.PureComponent:extend("ItemDetails")
ItemDetails.validateProps = TModule.strictInterface({
	itemId = TModule.string,
	itemType = TModule.string,
	itemSubType = TModule.optional(TModule.string),
	isFirstItemDetails = TModule.optional(TModule.boolean),
	fromContentFeed = TModule.optional(TModule.boolean),
	fromProfile = TModule.optional(TModule.boolean),
	showDropDownTopBar = TModule.optional(TModule.boolean),
	showRobuxBalance = TModule.optional(TModule.boolean),
	fromHome = if FFlagAXTryOnScreenImprovements then nil else TModule.optional(TModule.boolean),
	simpleView = if FFlagAXTryOnScreenImprovements then TModule.optional(TModule.boolean) else nil,
	hideTab = if FFlagAXTryOnScreenImprovements then TModule.optional(TModule.boolean) else nil,
	shouldNavigateDown = if FFlagAXTryOnScreenImprovements then TModule.optional(TModule.boolean) else nil,
	fromSurface = if FFlagAXFixPurchaseSurfaceLogging then TModule.optional(TModule.number) else nil,
	itemSubTypeName = TModule.optional(TModule.string),
	mountAsFullView = TModule.optional(TModule.boolean),
	assetType = TModule.optional(TModule.string),
	mountAnimation = TModule.optional(TModule.boolean),
	itemDetailsPeekViewRefs = TModule.optional(TModule.table),
	resultsListRef = TModule.optional(TModule.table),
	detail = TModule.optional(TModule.string),
	prevNavPage = TModule.optional(TModule.string),
	prevNavHistory = TModule.optional(TModule.table),
	showFullWithNoPeekView = TModule.optional(TModule.boolean),
	widgetInfo = TModule.optional(TModule.table),
	onItemDetailsClosed = TModule.optional(TModule.callback),
	navigation = TModule.table,
	avatarRoute = AvatarExperienceNavigationModule.AvatarRoute.AvatarRoute.Interface,
	isSceneFullView = TModule.boolean,
	itemData = TModule.optional((require(Common.Validators.ItemDataValidator))),
	peekViewShowing = TModule.boolean,
	topBarHeight = TModule.number,
	itemDetailsExpanded = TModule.boolean,
	playerMembership = TModule.optional(TModule.enum(Enum.MembershipType)),
	lastInputGroup = TModule.string,
	itemDetailsTryOnViewState = TModule.any,
	itemDetailsViewState = TModule.any,
	screenSize = TModule.Vector2,
	globalGuiInset = TModule.table,
	wideMode = TModule.boolean,
	numberOfTryOnItems = if FFlagAXDurablesForMIS then TModule.number else nil,
	isCurrentItemInTryOns = if FFlagAXDurablesForMIS then TModule.boolean else nil,
	closeAllPeekViews = TModule.callback,
	closeFiltersAndItemDetails = TModule.callback,
	closeFocusedScreen = TModule.callback,
	setItemDetailsExpanded = TModule.callback,
	setCurrentToastMessage = TModule.callback,
	openItemPrompt = TModule.callback,
	redeemQRCodeItemPrompt = TModule.callback,
	setItemDetailsPeekViewState = TModule.callback,
	setItemTryOnPeekViewState = TModule.callback,
	isPortrait = TModule.optional(TModule.boolean),
	setSelectedTimedOption = if FFlagAXDurablesForMIS then TModule.callback else nil,
	toggleTryOnThunk = if FFlagAXDurablesForMIS then TModule.callback else nil,
	closeMatchingScreens = if FFlagAXDurablesForMIS then TModule.callback else nil,
	isAvatarEditorOpaqueRoute = if FFlagAXDurablesForMIS then TModule.boolean else nil,
	networking = TModule.callback,
	analytics = TModule.table,
	peekViewFullViewEnabled = TModule.boolean,
	showPremiumContent = TModule.boolean,
	overlayClosedCallback = TModule.callback,
	focusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else TModule.table,
	localization = if FFlagAXDurablesForMIS then TModule.table else nil
})

function ItemDetails.init(p1)
	-- upvalues: RoactModule (copy), GetFFlagAXItemDetailsScrollingEnabledCallbackModule (copy), FFlagAXDurablesSupportForRFYMigration (copy), FFlagAXDurablesForMIS (copy), CryoModule (copy), NavigationUtilsModule (copy), config (copy), MemoizeFunction (copy), PeekViewState (copy), CatalogUtilsModule (copy), AvatarScreen (copy)
	p1.contentFrameRef = RoactModule.createRef()
	p1.actionBarContainerRef = RoactModule.createRef()
	p1.actionBarHeaderRef = RoactModule.createRef()
	p1.backButtonRef = RoactModule.createRef()
	local Config = if GetFFlagAXItemDetailsScrollingEnabledCallbackModule() then { scrollingEnabled = true } else nil
	
	if p1.props.itemData and p1.props.itemData.timedOptions then
		for _, timedOption in p1.props.itemData.timedOptions do
			if timedOption.selected then
				local Days = timedOption.days
				
				if Days == 0 then
					Days = nil
				end
				Config.selectedTimedOptionDays = Days
				break
			end
		end
	end
	p1.state = Config
	
	if p1.props.showRobuxBalance then
		p1.robuxBalanceRef = RoactModule.createRef()
	end
	if FFlagAXDurablesSupportForRFYMigration then
		p1.timedOptionDeeplinkUpdated = false
		
		function p1.onTimedOptionSelected(p2)
			-- upvalues: p1 (copy), RoactModule (upval), FFlagAXDurablesForMIS (upval)
			local Days = p1.props.itemData.timedOptions[p2].days
			
			if Days == 0 then
				Days = RoactModule.None
			end
			p1:setState({ selectedTimedOptionDays = Days })
			
			if FFlagAXDurablesForMIS then
				p1.timedOptionDeeplinkUpdated = true
			end
		end
	end
	if FFlagAXDurablesForMIS then
		function p1.updateTimedOptionSelection()
			-- upvalues: CryoModule (upval), p1 (copy), NavigationUtilsModule (upval)
			p1.props.setSelectedTimedOption(p1.props.itemId, p1.props.itemType, CryoModule.List.findWhere(p1.props.itemData.timedOptions, function(p2): boolean
				-- upvalues: p1 (upval)
				return p2.days == p1.state.selectedTimedOptionDays
			end) or #p1.props.itemData.timedOptions)
			NavigationUtilsModule.closeFocusedScreen(p1.props.navigation)
		end
	end
	function p1.closeBriefView()
		-- upvalues: p1 (copy)
		p1.props.analytics.closeItemDetailPage(p1.props.itemId, p1.props.itemType)
		p1.props.closeFiltersAndItemDetails(p1.props.navigation)
	end
	
	function p1.onItemInvalid()
		-- upvalues: p1 (copy), config (upval)
		if p1.isMounted then
			p1.closeBriefView()
			p1.props.setCurrentToastMessage(config)
		end
	end
	
	function p1.renderContentCallback()
		-- upvalues: p1 (copy)
		return p1:renderContent()
	end
	
	p1.getRenderTopBarCallback = MemoizeFunction(function(p2)
		-- upvalues: p1 (copy)
		return function()
			-- upvalues: p1 (upval), p2 (copy)
			return p1:renderTopBar(p2)
		end
	end)
	p1.getRenderActionBarCallback = MemoizeFunction(function(p2, p3, p4, p5, p6)
		-- upvalues: p1 (copy)
		return function()
			-- upvalues: p1 (upval), p2 (copy), p3 (copy), p4 (copy), p5 (copy), p6 (copy)
			return p1:renderActionBar(p2, p3, p4, p5, p6)
		end
	end)
	
	function p1.setPeekViewState(Brief)
		-- upvalues: p1 (copy)
		if p1:getIsTryOnPage() then
			p1.props.setItemTryOnPeekViewState(Brief)
			
			return
		else
			p1.props.setItemDetailsPeekViewState(Brief)
		end
	end
	
	function p1.closePeekView()
		-- upvalues: p1 (copy), PeekViewState (upval)
		p1.setPeekViewState(PeekViewState.Brief)
	end
	
	if FFlagAXDurablesForMIS then
		function p1.getShouldShowSecondaryButton(): boolean
			-- upvalues: p1 (copy)
			return not p1.props.fromProfile and not p1.props.isAvatarEditorOpaqueRoute and (p1.props.itemData and p1.props.itemData.timedOptions and p1.props.numberOfTryOnItems > 1 or not p1.props.isCurrentItemInTryOns)
		end
		
		function p1.onTryOnSecondaryButtonActivated()
			-- upvalues: CatalogUtilsModule (upval), p1 (copy), CryoModule (upval), AvatarScreen (upval)
			p1.props.toggleTryOnThunk(p1.props.networking, p1.props.analytics, p1.props.itemType, CatalogUtilsModule.GetItemSubType(p1.props.itemType, p1.props.itemData), p1.props.itemId, true, p1.props.avatarRoute, p1.props.navigation, if p1.props.itemData.timedOptions then CryoModule.List.findWhere(p1.props.itemData.timedOptions, function(p2): boolean
				-- upvalues: p1 (upval)
				return p2.days == p1.state.selectedTimedOptionDays
			end) or #p1.props.itemData.timedOptions else nil)
			p1.props.closeMatchingScreens(p1.props.navigation, { AvatarScreen.Checkout, AvatarScreen.ItemDetails })
		end
	end
	if GetFFlagAXItemDetailsScrollingEnabledCallbackModule() then
		function p1.setItemDetailsScrollingEnabled(ScrollingEnabled)
			-- upvalues: p1 (copy)
			p1:setState({ scrollingEnabled = ScrollingEnabled })
		end
	end
end

function ItemDetails.getBriefViewHeight(p2): number
	-- upvalues: ConstantsModule (copy), IsTenFootInterface (copy), CatalogConstantsModule (copy)
	return CatalogConstantsModule.ActionBar.ActionBarHeight + CatalogConstantsModule.ActionBar.ActionBarGradientHeight + (if p2.props.lastInputGroup == ConstantsModule.InputType.Gamepad and IsTenFootInterface then ConstantsModule.GAMEPAD_BOTTOM_BAR_SIZE else 0) + 20
end

function ItemDetails.renderTopBar(p2, p3)
	-- upvalues: PeekViewState (copy), FFlagAXEnableHomeTryOnComplexView (copy), RoactModule (copy), IsVRAppBuildFunction (copy), VRItemDetailsTopBarModule (copy), PeekViewTopBarModule (copy)
	local FromProfile = p2.props.fromProfile
	local TopBarHeight = p2.props.topBarHeight
	local Name = if p2.props.itemData then p2.props.itemData.name else nil
	local ItemDetailsTryOnViewState = if p2:getIsTryOnPage() then p2.props.itemDetailsTryOnViewState else p2.props.itemDetailsViewState
	
	return RoactModule.createElement("Frame", {
		BorderSizePixel = 0,
		ZIndex = 2,
		BackgroundTransparency = if FromProfile then 0 elseif p2.props.showDropDownTopBar and (ItemDetailsTryOnViewState == PeekViewState.Full or FFlagAXEnableHomeTryOnComplexView and ItemDetailsTryOnViewState == PeekViewState.Extended) then 0 else 1,
		BackgroundColor3 = p3.Theme.BackgroundDefault.Color,
		Position = UDim2.fromScale(0, 0),
		Size = UDim2.new(1, 0, 0, TopBarHeight),
		Visible = p2.topBarNavVisible
	}, {
		TopBar = if IsVRAppBuildFunction() then RoactModule.createElement(VRItemDetailsTopBarModule, {
			topBarHeight = TopBarHeight,
			title = Name,
			closeFocusedScreen = p2.props.closeFocusedScreen,
			navigation = p2.props.navigation
		}) else RoactModule.createElement(PeekViewTopBarModule, {
			[RoactModule.Ref] = p2.backButtonRef,
			NextSelectionDown = p2.contentFrameRef,
			itemId = p2.props.itemId,
			itemType = p2.props.itemType,
			itemData = p2.props.itemData,
			dropDownTopBar = p2.props.showDropDownTopBar,
			peekViewState = ItemDetailsTryOnViewState,
			closePeekView = p2.closePeekView,
			showRobuxBalance = p2.props.showRobuxBalance
		})
	})
end

function ItemDetails.renderActionBar(p2, _, p3, YOffset, p4, p5)
	-- upvalues: FFlagAXDurablesSupportWithPostPurchaseFix (copy), RoactModule (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), Focusable (copy), RoactGamepadModule (copy), BuyActionBarModule (copy), FFlagAXDurablesForMIS (copy), FFlagAXMISEnableMultiShopping (copy), v1 (ref), Skeleton (copy)
	local Theme = p3.Theme
	local _Font = p3.Font
	local ScaledBaseSize = _Font.BaseSize * _Font.Header1.RelativeSize
	local Name = p4 and p4.name
	local HeaderFont = _Font.Header1.Font
	local SelectedTimedOptionDays = if FFlagAXDurablesSupportWithPostPurchaseFix then p2.state.selectedTimedOptionDays else p5
	
	return RoactModule.createElement(if FFlagAXMigrateAXToGlobalAutofocus then "Frame" else Focusable.Frame, {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, YOffset),
		Position = UDim2.fromScale(0, 1),
		AnchorPoint = Vector2.new(0, 1),
		ZIndex = 3,
		[RoactModule.Ref] = p2.actionBarContainerRef,
		NextSelectionUp = if FFlagAXMigrateAXToGlobalAutofocus then nil else p2.contentFrameRef,
		inputBindings = if FFlagAXMigrateAXToGlobalAutofocus then nil else {
			MoveToItemDetailsContainer = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonL2, function()
				-- upvalues: p2 (copy)
				p2:getFocusController().moveFocusUp()
			end)
		}
	}, {
		BuyActionBar = RoactModule.createElement(BuyActionBarModule, {
			headerPadding = 24,
			leftPadding = 20,
			bottomPadding = 20,
			rightPadding = 20,
			ZIndex = 1,
			itemId = p2.props.itemId,
			itemType = p2.props.itemType,
			showTimedOptionInBuyButton = if p4 and p4.timedOptions then true else nil,
			hidePrice = if p4 and p4.timedOptions then true else nil,
			selectedTimedOptionDays = if p2.state then SelectedTimedOptionDays else nil,
			setSelectedTimedOptionDays = p2.onTimedOptionSelected,
			showSecondaryButton = if FFlagAXDurablesForMIS then p2:getShouldShowSecondaryButton() else nil,
			secondaryButtonText = if FFlagAXDurablesForMIS then if p2.props.isCurrentItemInTryOns then p2.props.localization.updateSecondaryButtonText else p2.props.localization.tryOnSecondaryButtonText else nil,
			onSecondaryButtonActivated = if FFlagAXDurablesForMIS then if p2.props.isCurrentItemInTryOns then p2.updateTimedOptionSelection else p2.onTryOnSecondaryButtonActivated else nil,
			topPadding = if FFlagAXMISEnableMultiShopping then v1 else nil
		}),
		ActionBarHeader = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, -48, 0, ScaledBaseSize),
			Position = UDim2.new(0, 24, 0, 5),
			ZIndex = 2,
			[RoactModule.Ref] = p2.actionBarHeaderRef
		}, {
			NameLabel = Name and RoactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				Position = UDim2.fromOffset(0, 0),
				Font = HeaderFont,
				Size = UDim2.new(1, 0, 0, ScaledBaseSize),
				Text = Name,
				TextSize = ScaledBaseSize,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextColor3 = Theme.TextEmphasis.Color,
				TextTruncate = Enum.TextTruncate.AtEnd
			}) or RoactModule.createElement(Skeleton, { Size = UDim2.new(1, 0, 0, ScaledBaseSize) })
		})
	})
end

function ItemDetails.renderContent(p2)
	-- upvalues: FFlagAXMigrateItemDetailsContainerInputBindingsToFocusNavigation (copy), ItemDetailsContainerModule (copy), ItemDetailsContainerDEPRECATEDModule (copy), RoactModule (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), Focusable (copy), GetFFlagAXItemDetailsScrollingEnabledCallbackModule (copy), FFlagAXTryOnScreenImprovements (copy), FFlagAXEnableHomeTryOnComplexView (copy)
	local ItemId = p2.props.itemId
	local ItemType = p2.props.itemType
	local ItemSubType = p2.props.itemSubType
	local ItemDetailsPeekViewRefs = p2.props.itemDetailsPeekViewRefs
	local ResultsListRef = p2.props.resultsListRef
	local PeekViewFullViewEnabled = p2.props.peekViewFullViewEnabled
	local AssetType = p2.props.assetType
	local IsTryOnPage = p2:getIsTryOnPage()
	
	if ItemId then
		local ItemDetailsContainerModule1 = if FFlagAXMigrateItemDetailsContainerInputBindingsToFocusNavigation then ItemDetailsContainerModule else ItemDetailsContainerDEPRECATEDModule
		
		return RoactModule.createElement(if FFlagAXMigrateAXToGlobalAutofocus then ItemDetailsContainerModule1 else Focusable[ItemDetailsContainerModule1], {
			actionBarHeaderRef = p2.actionBarHeaderRef,
			clipDetails = not PeekViewFullViewEnabled,
			itemId = ItemId,
			itemType = ItemType,
			itemSubType = ItemSubType,
			assetType = AssetType,
			onItemInvalid = p2.onItemInvalid,
			showFullWithNoPeekView = p2.props.showFullWithNoPeekView,
			bottomDockedContainerHeight = p2:getBriefViewHeight(),
			resultsListRef = ResultsListRef,
			itemDetailsPeekViewRefs = ItemDetailsPeekViewRefs,
			peekViewFocusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else p2:getFocusController(),
			NextSelectionDown = p2.actionBarContainerRef,
			NextSelectionUp = p2.backButtonRef,
			ref = if p2.props.showFullWithNoPeekView then p2.contentFrameRef else nil,
			setItemDetailsScrollingEnabled = if GetFFlagAXItemDetailsScrollingEnabledCallbackModule() then p2.setItemDetailsScrollingEnabled else nil,
			simpleView = if FFlagAXTryOnScreenImprovements then p2.props.simpleView elseif FFlagAXEnableHomeTryOnComplexView then IsTryOnPage and not p2.props.fromHome else nil,
			onWearTimeSelection = p2.onTimedOptionSelected
		})
	else
		return nil
	end
end

function ItemDetails.getIsTryOnPage(p2): boolean
	-- upvalues: AvatarScreen (copy)
	return p2.props.navigation.state.routeName == AvatarScreen.TryOnItem
end

function ItemDetails.getItemDetailsComponent(p2, p3)
	-- upvalues: IsVRAppBuildFunction (copy), ItemDetailsFullModule (copy), ItemDetailsModalModule (copy), ItemDetailsPeekViewModule (copy)
	return if IsVRAppBuildFunction() then ItemDetailsFullModule elseif p3 then ItemDetailsModalModule elseif p2.props.showFullWithNoPeekView then ItemDetailsFullModule else ItemDetailsPeekViewModule
end

function ItemDetails.render(p2)
	-- upvalues: WithSelectionCursorProviderFunction (copy), WithStyleFunction (copy)
	return WithSelectionCursorProviderFunction(function(p3)
		-- upvalues: WithStyleFunction (upval), p2 (copy)
		return WithStyleFunction(function(p4)
			-- upvalues: p2 (upval), p3 (copy)
			return p2:renderWithProviders(p3, p4)
		end)
	end)
end

function ItemDetails.renderWithProviders(p2, p3, p4)
	-- upvalues: GetSafeAreaSizeFunction (copy), ConstantsModule1 (copy), PeekViewState (copy), RoactModule (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), Focusable (copy), RoactGamepadModule (copy), NavigationUtilsModule (copy), AvatarScreen (copy), GamepadFocusHandlerForPageModule (copy), GetFFlagAXDisableItemDetailsPageLayerExposureModule (copy), OnFocusExposureLoggerModule (copy), AvatarMarketplaceBackendIXPTestsModule (copy), AXItemDetails3DPreviewIXPModule (copy), NavigationEventsLoggerModule (copy), BoundInputsUpdaterModule (copy), FFlagAXDurablesSupportForRFYMigration (copy), GetFFlagAXItemDetailsScrollingEnabledCallbackModule (copy)
	local IsSceneFullView = p2.props.isSceneFullView
	local ItemId = p2.props.itemId
	local ItemType = p2.props.itemType
	local Key = p2.props.navigation.state.key
	local ItemDetailsPeekViewRefs = p2.props.itemDetailsPeekViewRefs
	local ResultsListRef = p2.props.resultsListRef
	local IsTryOnPage = p2:getIsTryOnPage()
	local WideMode = p2.props.wideMode
	local ItemDetailsTryOnViewState = if IsTryOnPage then p2.props.itemDetailsTryOnViewState else p2.props.itemDetailsViewState
	
	if not ItemId then return end
	local FromProfile = p2.props.fromProfile
	local NoIsTryOnPage: boolean = WideMode and (FromProfile and not IsTryOnPage)
	local ShowDropShadow = true
	local _UDim2 = UDim2.fromScale(0, 0)
	local _UDim2_1 = UDim2.fromScale(1, 1)
	
	if not p2.props.isPortrait then
		if FromProfile or IsTryOnPage then
			local Offset: number = GetSafeAreaSizeFunction(p2.props.screenSize, p2.props.globalGuiInset).X.Offset
			local Smallest = math.min(Offset, 640)
			
			if IsTryOnPage and Smallest < Offset then
				ShowDropShadow = false
			end
			_UDim2 = UDim2.fromOffset((Offset - Smallest) / 2, 0)
			_UDim2_1 = UDim2.new(0, Smallest, 1, 0)
		else
			_UDim2 = UDim2.fromScale(ConstantsModule1.LandscapeNavWidth, 0)
			_UDim2_1 = UDim2.fromScale(ConstantsModule1.LandscapeSceneWidth, 1)
		end
	end
	local BriefViewHeight = p2:getBriefViewHeight()
	local IsItemDetailsTryOnViewStateMatch: boolean = p2.props.mountAsFullView and (ItemDetailsTryOnViewState == PeekViewState.Full or ItemDetailsTryOnViewState == PeekViewState.Extended)
	
	return RoactModule.createElement(if FFlagAXMigrateAXToGlobalAutofocus then "Frame" else Focusable.Frame, {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 1, 0),
		Visible = not IsSceneFullView,
		[RoactModule.Ref] = ItemDetailsPeekViewRefs and ItemDetailsPeekViewRefs[Key] or nil,
		restorePreviousChildFocus = not FFlagAXMigrateAXToGlobalAutofocus or nil,
		focusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else p2:getFocusController(),
		defaultChild = if FFlagAXMigrateAXToGlobalAutofocus then nil else IsItemDetailsTryOnViewStateMatch and p2.contentFrameRef or p2.actionBarContainerRef,
		inputBindings = if FFlagAXMigrateAXToGlobalAutofocus then nil else {
			NavigateBack = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonB, function()
				-- upvalues: NavigationUtilsModule (upval), p2 (copy)
				NavigationUtilsModule.closeFocusedScreen(p2.props.navigation)
			end),
			OpenItemPrompt = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonX, function()
				-- upvalues: p2 (copy)
				p2.props.openItemPrompt(p2.props.networking, p2.props.analytics, p2.props.overlayClosedCallback, p2.props.navigation, p2.props.avatarRoute)
			end, { key = "Feature.Catalog.Action.Buy" }),
			OpenClosePeekView = if NoIsTryOnPage or p2.props.showFullWithNoPeekView then nil else RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonY, function()
				-- upvalues: p2 (copy), PeekViewState (upval)
				if p2.props.itemDetailsExpanded then
					p2.setPeekViewState(PeekViewState.Brief)
					p2:getFocusController().moveFocusTo(p2.actionBarContainerRef)
					
					return
				else
					p2.setPeekViewState(PeekViewState.Full)
				end
			end, {
				key = if p2.props.itemDetailsExpanded then "Feature.Catalog.Action.CloseDetails" else "Feature.Catalog.Action.OpenDetails"
			}),
			OpenCatalogContextMenu = if p2.props.showFullWithNoPeekView then nil else RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonL3, function()
				-- upvalues: p2 (copy), AvatarScreen (upval), ItemId (copy), ItemType (copy), FromProfile (copy), IsTryOnPage (copy)
				p2.props.navigation.navigate(AvatarScreen.CatalogContextMenu, {
					itemId = ItemId,
					itemType = ItemType,
					onOverlayClosed = p2.props.overlayClosedCallback,
					centered = FromProfile or IsTryOnPage
				})
			end, { key = "Feature.Catalog.Action.ItemOptions" })
		},
		NextSelectionLeft = if FFlagAXMigrateAXToGlobalAutofocus then nil else ResultsListRef
	}, {
		GamepadFocusHandlerForPage = if FFlagAXMigrateAXToGlobalAutofocus then nil else RoactModule.createElement(GamepadFocusHandlerForPageModule, { focusController = p2:getFocusController() }),
		ItemDetailsExposure = if GetFFlagAXDisableItemDetailsPageLayerExposureModule() then nil else RoactModule.createElement(OnFocusExposureLoggerModule, {
			ixpTest = AvatarMarketplaceBackendIXPTestsModule.ItemDetailsPage
		}),
		ItemDetails3DPreviewExposure = if AXItemDetails3DPreviewIXPModule.isEnabled() then RoactModule.createElement(OnFocusExposureLoggerModule, { ixpTest = AXItemDetails3DPreviewIXPModule }) else nil,
		NavigationEventsLogger = RoactModule.createElement(NavigationEventsLoggerModule, { pageName = "ItemDetails:" .. Key }),
		BoundInputsUpdater = if FFlagAXMigrateAXToGlobalAutofocus then nil else RoactModule.createElement(BoundInputsUpdaterModule),
		ItemDetailsContent = RoactModule.createElement(p2:getItemDetailsComponent(NoIsTryOnPage), {
			renderBottomBar = p2.getRenderActionBarCallback(p3, p4, BriefViewHeight, p2.props.itemData, if FFlagAXDurablesSupportForRFYMigration then p2.state.selectedTimedOptionDays else nil),
			renderContent = p2.renderContentCallback,
			renderTopBar = p2.getRenderTopBarCallback(p4),
			isTryOnPage = IsTryOnPage,
			peekViewState = ItemDetailsTryOnViewState,
			setPeekViewState = p2.setPeekViewState,
			focusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else p2:getFocusController(),
			actionBarContainerRef = p2.actionBarContainerRef,
			contentFrameRef = p2.contentFrameRef,
			closeBriefView = p2.closeBriefView,
			viewPosition = _UDim2,
			viewSize = _UDim2_1,
			briefViewHeight = BriefViewHeight,
			showDropShadow = ShowDropShadow,
			analytics = p2.props.analytics,
			avatarRoute = p2.props.avatarRoute,
			closeAllPeekViews = p2.props.closeAllPeekViews,
			closeFocusedScreen = p2.props.closeFocusedScreen,
			fromProfile = p2.props.fromProfile,
			itemDetailsExpanded = p2.props.itemDetailsExpanded,
			itemId = p2.props.itemId,
			itemType = p2.props.itemType,
			lastInputGroup = p2.props.lastInputGroup,
			mountAnimation = p2.props.mountAnimation,
			mountAsFullView = p2.props.mountAsFullView,
			navigation = p2.props.navigation,
			peekViewFullViewEnabled = p2.props.peekViewFullViewEnabled,
			peekViewShowing = p2.props.peekViewShowing,
			setItemDetailsExpanded = p2.props.setItemDetailsExpanded,
			topBarHeight = p2.props.topBarHeight,
			scrollingEnabled = if GetFFlagAXItemDetailsScrollingEnabledCallbackModule() then p2.state.scrollingEnabled else nil
		})
	})
end

if not FFlagAXMigrateAXToGlobalAutofocus then
	function ItemDetails.getFocusController(p2)
		return p2.props.focusController
	end
end
if FFlagAXMigrateAXToGlobalAutofocus then
	function ItemDetails.didUpdate(p2, p3, _)
		-- upvalues: FFlagAXDurablesSupportForRFYMigration (copy), FFlagAXDurablesSupportWithPostPurchaseFix (copy)
		if FFlagAXDurablesSupportForRFYMigration and not p2.timedOptionDeeplinkUpdated and p2.props.itemData and p2.props.itemData.timedOptions then
			for i, timedOption in p2.props.itemData.timedOptions do
				if timedOption.selected and (timedOption.days == 0 or true) then
					p2.onTimedOptionSelected(i)
					p2.timedOptionDeeplinkUpdated = true
					break
				end
			end
		end
		if FFlagAXDurablesSupportWithPostPurchaseFix and p2.props.itemData and p2.props.itemData.timedOptions and p2.props.itemData.isOwned and (not p3.itemData or not p3.itemData.isOwned) then
			for i1, timedOption1 in p2.props.itemData.timedOptions do
				if timedOption1.selected then
					p2.onTimedOptionSelected(i1)
					break
				end
			end
		end
	end
else
	function ItemDetails.didUpdate(p4, p5, _)
		-- upvalues: ConstantsModule (copy), AxItemdetails (copy), FFlagAXDurablesSupportForRFYMigration (copy), FFlagAXDurablesForMIS (copy)
		local Key = p4.props.avatarRoute.current.key
		local Key1 = p5.avatarRoute.current.key
		local Key2 = p4.props.navigation.state.key
		
		if p4.props.lastInputGroup == ConstantsModule.InputType.Gamepad then
			if Key == Key2 and not p4.props.avatarRoute.isOverlayVisible and p5.avatarRoute.isOverlayVisible then
				p4:getFocusController().captureFocus()
			end
			if Key == Key2 and Key1 ~= Key2 then
				AxItemdetails:debug("gamepad captureFocus: ItemDetails, current pageKey changed: {}", Key2)
				p4:getFocusController().captureFocus()
			end
		end
		if FFlagAXDurablesSupportForRFYMigration and not p4.timedOptionDeeplinkUpdated and p4.props.itemData and p4.props.itemData.timedOptions then
			for i, timedOption in p4.props.itemData.timedOptions do
				if timedOption.selected and (timedOption.days == 0 or true) then
					p4.onTimedOptionSelected(i)
					
					if FFlagAXDurablesForMIS then break end
					p4.timedOptionDeeplinkUpdated = true
					break
				else
					continue
				end
			end
		end
	end
end
function ItemDetails.didMount(p4)
	-- upvalues: FFlagAXMigrateAXToGlobalAutofocus (copy), NavigationUtilsModule (copy), ConstantsModule (copy), AxItemdetails (copy), FFlagQRCodeItemRedemptionEnabledModule (copy), PeekViewState (copy)
	if not FFlagAXMigrateAXToGlobalAutofocus then
		local IsFirstItemDetailsPage = NavigationUtilsModule.isFirstItemDetailsPage(p4.props.navigation)
		
		if p4.props.lastInputGroup == ConstantsModule.InputType.Gamepad and not IsFirstItemDetailsPage then
			AxItemdetails:debug("gamepad captureFocus: ItemDetails, didMount")
			p4:getFocusController().captureFocus()
		end
	end
	if p4.props.redeemQRCodeItem and FFlagQRCodeItemRedemptionEnabledModule then
		p4.props.redeemQRCodeItemPrompt(p4.props.networking, p4.props.analytics, p4.props.itemId, p4.props.itemType)
	end
	if p4.props.showFullWithNoPeekView then
		p4.setPeekViewState(PeekViewState.Full)
	end
	p4.isMounted = true
end

function ItemDetails.willUnmount(p4)
	-- upvalues: AvatarScreen (copy), NavigationUtilsModule (copy), PeekViewState (copy)
	p4.isMounted = false
	local IsRouteNameMatch = p4.props.navigation.state.routeName == AvatarScreen.ItemDetails
	local Inverted = not (p4.props.avatarRoute.current.name == AvatarScreen.ItemDetails and IsRouteNameMatch)
	
	if NavigationUtilsModule.isFirstItemDetailsPage(p4.props.navigation) and Inverted then
		p4.props.setItemDetailsPeekViewState(PeekViewState.Closed)
		
		if p4.props.onItemDetailsClosed ~= nil then
			p4.props.onItemDetailsClosed()
		end
	end
end

local v2 = RoactAppPolicy.connect(function(p4, _)
	return {
		peekViewFullViewEnabled = p4.getItemDetailsFullView(),
		showPremiumContent = p4.getShowCatalogPremiumContent()
	}
end)((WithMappedNavigationParamsModule((RoactRoduxModule.connect(function(p4, p5)
	-- upvalues: ItemDataModule (copy), FFlagAXDurablesForMIS (copy), GetTryOnItemReducerKeyFunction (copy), AvatarScreen (copy), UtilsModule (copy), FormFactor (copy), SelectIsPortraitModule (copy), TutilsModule (copy)
	local ItemId = p5.itemId
	local ItemType = p5.itemType
	local ItemDataModuleResult = ItemDataModule(p4.AvatarExperience.Common, ItemId, ItemType)
	local TryOnItems = if FFlagAXDurablesForMIS then p4.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems else nil
	local HasTryOnItem = if FFlagAXDurablesForMIS then TryOnItems and TryOnItems[GetTryOnItemReducerKeyFunction(ItemId, ItemType)] ~= nil else nil
	local Key = p5.navigation.state.key
	local AvatarRoute = p5.avatarRoute
	local Key1 = AvatarRoute.current.key
	local IsRouteNameMatch = p5.navigation.state.routeName == AvatarScreen.TryOnItem
	local IsNameMatch: boolean = FFlagAXDurablesForMIS and (p5.avatarRoute.opaque and p5.avatarRoute.opaque.name == AvatarScreen.AvatarEditor)
	
	if IsRouteNameMatch and ItemDataModuleResult ~= nil and ItemDataModuleResult.name == nil then
		ItemDataModuleResult = nil
	end
	return {
		isSceneFullView = UtilsModule.getIsSceneFullViewFromState(p4, AvatarRoute),
		itemData = if IsRouteNameMatch and ItemDataModuleResult ~= nil and ItemDataModuleResult.name == nil then nil else ItemDataModuleResult,
		wideMode = p4.FormFactor == FormFactor.WIDE,
		peekViewShowing = Key1 == Key,
		topBarHeight = UtilsModule.getTopBarHeightAvatarScene(p4),
		itemDetailsExpanded = p4.AvatarExperience.Common.ItemDetailsExpanded,
		playerMembership = p4.Users[p4.LocalUserId] and p4.Users[p4.LocalUserId].membership or Enum.MembershipType.None,
		itemDetailsTryOnViewState = p4.AvatarExperience.Common.ItemDetailsPeekView.tryOnViewState,
		itemDetailsViewState = p4.AvatarExperience.Common.ItemDetailsPeekView.viewState,
		screenSize = p4.ScreenSize,
		globalGuiInset = p4.GlobalGuiInset,
		isPortrait = SelectIsPortraitModule(p4),
		numberOfTryOnItems = if FFlagAXDurablesForMIS then TutilsModule.fieldCount(TryOnItems) else nil,
		isCurrentItemInTryOns = if FFlagAXDurablesForMIS then HasTryOnItem else nil,
		isAvatarEditorOpaqueRoute = if FFlagAXDurablesForMIS then IsNameMatch else nil
	}
end, function(Callback)
	-- upvalues: CloseAllPeekViewsModule (copy), CloseAllItemDetailsModule (copy), CloseFocusedScreenModule (copy), SetItemDetailsExpandedModule (copy), SetCurrentToastMessageModule (copy), OpenItemPromptModule (copy), RedeemQRCodeItemModule (copy), SetItemDetailsPeekViewStateFunction (copy), SetItemTryOnPeekViewStateFunction (copy), FFlagAXDurablesForMIS (copy), SetSelectedTimedOptionFunction (copy), CloseMatchingScreensModule (copy), ToggleTryOnThunkModule (copy)
	return {
		closeAllPeekViews = function(p4)
			-- upvalues: Callback (copy), CloseAllPeekViewsModule (upval)
			Callback(CloseAllPeekViewsModule(p4))
		end,
		closeFiltersAndItemDetails = function(p4)
			-- upvalues: Callback (copy), CloseAllItemDetailsModule (upval)
			Callback(CloseAllItemDetailsModule(p4))
		end,
		closeFocusedScreen = function(Navigation)
			-- upvalues: Callback (copy), CloseFocusedScreenModule (upval)
			Callback(CloseFocusedScreenModule(Navigation))
		end,
		setItemDetailsExpanded = function(p4)
			-- upvalues: Callback (copy), SetItemDetailsExpandedModule (upval)
			Callback(SetItemDetailsExpandedModule(p4))
		end,
		setCurrentToastMessage = function(p4)
			-- upvalues: Callback (copy), SetCurrentToastMessageModule (upval)
			Callback(SetCurrentToastMessageModule(p4))
		end,
		openItemPrompt = function(p4, p5, p6, p7, p8)
			-- upvalues: Callback (copy), OpenItemPromptModule (upval)
			Callback(OpenItemPromptModule(p4, p5, p6, p7, p8))
		end,
		redeemQRCodeItemPrompt = function(p4, p5, p6, p7)
			-- upvalues: Callback (copy), RedeemQRCodeItemModule (upval)
			Callback(RedeemQRCodeItemModule(p4, p5, p6, p7))
		end,
		setItemDetailsPeekViewState = function(p4)
			-- upvalues: Callback (copy), SetItemDetailsPeekViewStateFunction (upval)
			Callback(SetItemDetailsPeekViewStateFunction(p4))
		end,
		setItemTryOnPeekViewState = function(p4)
			-- upvalues: Callback (copy), SetItemTryOnPeekViewStateFunction (upval)
			Callback(SetItemTryOnPeekViewStateFunction(p4))
		end,
		setSelectedTimedOption = if FFlagAXDurablesForMIS then function(ItemId, ItemType, SelectedTimedOptionIndex)
			-- upvalues: Callback (copy), SetSelectedTimedOptionFunction (upval)
			Callback(SetSelectedTimedOptionFunction({
				itemId = ItemId,
				itemType = ItemType,
				selectedTimedOptionIndex = SelectedTimedOptionIndex
			}))
		end else nil,
		closeMatchingScreens = if FFlagAXDurablesForMIS then function(p4, p5)
			-- upvalues: Callback (copy), CloseMatchingScreensModule (upval)
			Callback(CloseMatchingScreensModule(p4, p5))
		end else nil,
		toggleTryOnThunk = if FFlagAXDurablesForMIS then function(p4, p5, p6, p7, p8, p9, p10, p11, p12)
			-- upvalues: Callback (copy), ToggleTryOnThunkModule (upval)
			Callback(ToggleTryOnThunkModule(p4, p5, p6, p7, p8, p9, p10, p11, nil, false, false, p12))
		end else nil
	}
end)((RoactServices.connect({
	networking = RoactNetworkingModule,
	analytics = AnalyticsModule
})((WithLastInputGroupModule(ItemDetails)))))))))

return function(p4)
	-- upvalues: FFlagAXMigrateAXToGlobalAutofocus (copy), ReactModule (copy), RoactGamepadModule (copy), FFlagAXDurablesForMIS (copy), UseLocalizationModule (copy), UseOverlayClosedCallbackModule (copy), UseAvatarExperienceFocusNavigationBindingsModule (copy), CryoModule (copy), RoactModule (copy), v2 (ref)
	local Current = if FFlagAXMigrateAXToGlobalAutofocus or not p4.focusController then if FFlagAXMigrateAXToGlobalAutofocus then nil else ReactModule.useRef(RoactGamepadModule.createFocusController()).current else p4.focusController
	local UseLocalizationModuleResult = if FFlagAXDurablesForMIS then UseLocalizationModule({
		updateSecondaryButtonText = "Feature.Avatar.Action.Update",
		tryOnSecondaryButtonText = "Feature.Avatar.Action.TryOn"
	}) else nil
	local UseOverlayClosedCallbackModuleResult = UseOverlayClosedCallbackModule(if FFlagAXMigrateAXToGlobalAutofocus then nil else Current)
	
	return RoactModule.createElement("Frame", {
		[RoactModule.Ref] = UseAvatarExperienceFocusNavigationBindingsModule({
			overlayClosedCallback = UseOverlayClosedCallbackModuleResult
		}),
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1)
	}, {
		ItemDetails = ReactModule.createElement(v2, (CryoModule.Dictionary.join(p4, {
			focusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else Current,
			overlayClosedCallback = UseOverlayClosedCallbackModuleResult,
			localization = if FFlagAXDurablesForMIS then UseLocalizationModuleResult else nil
		})))
	})
end