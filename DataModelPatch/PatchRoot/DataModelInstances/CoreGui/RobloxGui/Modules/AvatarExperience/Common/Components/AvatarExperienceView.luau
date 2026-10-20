local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)
local ReactModule = require(CorePackages.Packages.React)
local RoactModule = require(CorePackages.Packages.Roact)
local UseEffectOnMountFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.useEffectOnMount
local RoactNavigationModule = require(CorePackages.Packages.RoactNavigation)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local Focusable = RoactGamepadModule.Focusable
local FoundationModule = require(CorePackages.Packages.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
local FocusNavigationUtilsModule = require(CorePackages.Workspace.Packages.FocusNavigationUtils)
local UseFocusNavigableSurfaceRegistryConnectionFunction = FocusNavigationUtilsModule.useFocusNavigableSurfaceRegistryConnection
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local PeekViewState = require(CorePackages.Workspace.Packages.PeekView).PeekViewState
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local TutilsModule = require(CorePackages.Packages.tutils)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local AvatarExperienceNavigationModule = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local UseAvatarRouteFunction = AvatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local ConstantsModule = require(Modules.LuaApp.Constants)
local DeviceOrientationMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode
local GetSafeAreaSizeFunction = require(CorePackages.Workspace.Packages.InputUi).getSafeAreaSize
local SpringAnimatedItem = UIBloxModule.Utility.SpringAnimatedItem
local WithStyleFunction = UIBloxModule.Style.withStyle
local WithNamedRefsModule = require(Modules.AvatarExperience.Common.Context.withNamedRefs)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local InsetBackground = require(CorePackages.Workspace.Packages.AppBlox).InsetBackground
local ConstantsModule1 = require(Modules.AvatarExperience.Common.Constants)
local NamedRefConstantsModule = require(Modules.AvatarExperience.Common.NamedRefConstants)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagRenameDeprecatedUIBloxTokens = SharedFlagsModule.FFlagRenameDeprecatedUIBloxTokens
local DisplayModule = require(CorePackages.Workspace.Packages.Display)
local SceneGamepadHandlerModule = if SharedFlagsModule.FFlagAXMigrateSceneGamepadHandlerInputBindings then require(Modules.AvatarExperience.Common.Components.Scene.SceneGamepadHandler) else require(Modules.AvatarExperience.Common.Components.Scene.SceneGamepadHandler_DEPRECATED)
local VRAvatarRotateHandlerModule = require(Modules.AvatarExperience.Common.Components.Scene.VRAvatarRotateHandler)
local SceneInteractionFrameModule = require(Modules.AvatarExperience.Common.Components.Scene.SceneInteractionFrame)
local AvatarLoadingSpinnerModule = require(Modules.AvatarExperience.Common.Components.Scene.AvatarLoadingSpinner)
local SceneUIContainerModule = require(Modules.AvatarExperience.Common.Components.Scene.SceneUIContainer)
local WithAppRouteModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withAppRoute)
local SceneButtonsModule = require(Modules.AvatarExperience.Common.Components.SceneButtons)
local BottomInsetBackgroundModule = require(Modules.AvatarExperience.Common.Components.BottomInsetBackground)
local VRAvatarEditorNavBarModule = require(Modules.AvatarExperience.Common.Components.NavBar.VRAvatarEditorNavBar)
local WithLastInputGroupModule = require(Modules.AvatarExperience.Common.Components.withLastInputGroup)
local AvatarVRPanelWrapperModule = require(Modules.AvatarExperience.Common.Components.AvatarVRPanelWrapper)
local AdaptiveScrollingViewModule = require(Modules.AvatarExperience.Common.Components.AdaptiveScrollingView)
local RobuxBalanceModule = require(Modules.AvatarExperience.Catalog.Components.RobuxBalance)
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local TimeoutBanner = AvatarExperienceCommonModule.Components.TimeoutBanner
local GetTimeoutStatusStoreFunction = AvatarExperienceCommonModule.Stores.getTimeoutStatusStore
local CheckoutActionBarContainer = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).Components.Checkout.CheckoutActionBarContainer
local OnFocusExperimentExposureLoggerModule = require(Modules.AvatarExperience.Catalog.Components.OnFocusExperimentExposureLogger)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local MultiTryOnBottomBarModule = require(Modules.AvatarExperience.Catalog.Components.ActionBar.MultiTryOnBottomBar)
local QuickButtonsModule = require(Modules.AvatarExperience.Common.Components.QuickButtons)
local SlotControlBarModule = require(Modules.AvatarExperience.SlotBasedEditor.Components.SlotControlBar)
local UndoRedoBar = require(CorePackages.Workspace.Packages.AvatarExperienceControlBar).UndoRedoBar
local SaveButton = require(CorePackages.Workspace.Packages.AvatarExperienceSave).Components.SaveButton
local FullViewEntryButtonModule = require(Modules.AvatarExperience.Common.Components.FullViewEntryButton)
local IxpUtilsModule = require(CorePackages.Workspace.Packages.IxpUtils)
local IsVRAppBuildFunction = require(CorePackages.Workspace.Packages.AppCommonLib).IsVRAppBuild
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local GetFFlagLuaAppEnableTopBannerFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagLuaAppEnableTopBanner
local GetFFlagAXFixRobuxBalanceButtonPositionSecondModule = require(Modules.AvatarExperience.Flags.GetFFlagAXFixRobuxBalanceButtonPositionSecond)
local GetFFlagAXEnableSlotBasedEditorModule = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor)
local FFlagAXMoveRobuxBalanceButtonLowerModule = require(Modules.AvatarExperience.Flags.FFlagAXMoveRobuxBalanceButtonLower)
local FFlagAXEnableManualSaving = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXEnableManualSaving
local GetUseSelectorDeepEqualsFunction = AvatarExperienceCommonModule.Utils.getUseSelectorDeepEquals
local FFlagAXEnableFullSceneInteractionFrame3 = GetFFlagAXEnableSlotBasedEditorModule() and game:DefineFastFlag("FFlagAXEnableFullSceneInteractionFrame3", false)
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local GetFFlagAXEnableCategoryPillsModule = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableCategoryPills)
local FFlagAXMISEnableMultiShopping = AvatarExperienceFlagsModule.FFlagAXMISEnableMultiShopping
local AXFixConsoleFullSceneViewPosition = game:DefineFastFlag("AXFixConsoleFullSceneViewPosition", false)
local AXQuickButtonsFrameShouldAlwaysExist = game:DefineFastFlag("AXQuickButtonsFrameShouldAlwaysExist", false)
local FFlagAXMigrateQuickButtonsToGlobalAutoFocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateQuickButtonsToGlobalAutoFocus
local FFlagAXSlotsPeekViewScrollFix = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXSlotsPeekViewScrollFix
local FFlagAXResetAvatarButton = AvatarExperienceFlagsModule.FFlagAXResetAvatarButton
local FFlagAXShowHeadAdjustmentInRightControlBar = AvatarExperienceFlagsModule.FFlagAXShowHeadAdjustmentInRightControlBar
local FFlagAXMigrateBuilderIcons = AvatarExperienceFlagsModule.FFlagAXMigrateBuilderIcons
local FFlagDynamicHeadsMigration = AvatarExperienceFlagsModule.FFlagDynamicHeadsMigration
local FFlagHeadRefinementFacialAnimationToggle = AvatarExperienceFlagsModule.FFlagHeadRefinementFacialAnimationToggle
local FFlagAXMoveContextualActionButtons = AvatarExperienceFlagsModule.FFlagAXMoveContextualActionButtons
local FFlagAXFixControlBarSubMenuOverlap = AvatarExperienceFlagsModule.FFlagAXFixControlBarSubMenuOverlap
local FFlagAXResetAvatarButtonExposureLogging = AvatarExperienceFlagsModule.FFlagAXResetAvatarButtonExposureLogging
local FFlagEnableLeftNavOnConsole = SharedFlagsModule.FFlagEnableLeftNavOnConsole
local FFlagEnableBottomNavOnMarketplace = SharedFlagsModule.FFlagEnableBottomNavOnMarketplace
local FFlagAppIaScopedScrollAway = SharedFlagsModule.FFlagAppIaScopedScrollAway
local FFlagStackedBottomNavMarketplaceCTA = SharedFlagsModule.FFlagStackedBottomNavMarketplaceCTA
local VisibilityControl = require(CorePackages.Workspace.Packages.AppNavBar).VisibilityControl
local AXFixLightThemeBorder = game:DefineFastFlag("AXFixLightThemeBorder", false)
local AXDeregisterSurfacesWhenNotVisible = game:DefineFastFlag("AXDeregisterSurfacesWhenNotVisible", false)
local FFlagAXModeratedItemsFlow = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXModeratedItemsFlow
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local RemoveUnavailableEquippedAssetsModule = require(Modules.AvatarExperience.Common.Thunks.RemoveUnavailableEquippedAssets)
local UseAvatarSaveContextFunction = require(CorePackages.Workspace.Packages.AvatarExperienceSave).Context.useAvatarSaveContext
local UniversalAppCameraIXPTestModule = require(Modules.AvatarExperience.Flags.UniversalAppCameraIXPTest)
local FFlagAXExpandPeekViewOnFirstScroll = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXExpandPeekViewOnFirstScroll
local FFlagAXHideMenuOnScroll = AvatarExperienceFlagsModule.FFlagAXHideMenuOnScroll
local FFlagAXMoveCatalogFilterToL1Navigation = AvatarExperienceFlagsModule.FFlagAXMoveCatalogFilterToL1Navigation
local FFlagAXAvatarTimeoutFlow = AvatarExperienceFlagsModule.FFlagAXAvatarTimeoutFlow
local FFlagAXCatalogOffersBannerEnabled = AvatarExperienceFlagsModule.FFlagAXCatalogOffersBannerEnabled
local FFlagAXFixContextualActionVisibility = AvatarExperienceFlagsModule.FFlagAXFixContextualActionVisibility
local FFlagAXFixRobuxButtonShowingInFullView = AvatarExperienceFlagsModule.FFlagAXFixRobuxButtonShowingInFullView
local SelectOutfitTryOnMostRecentAssetIdModule = require(Modules.AvatarExperience.Common.Selectors.SelectOutfitTryOnMostRecentAssetId)
local SlotBasedEditorAnalytics = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).Surfaces.SlotBasedEditorAnalytics
local AvatarExperienceControlBarModule = require(CorePackages.Workspace.Packages.AvatarExperienceControlBar)
local IconOnlyMenu = AvatarExperienceControlBarModule.IconOnlyMenu
local MenuItemEnum = AvatarExperienceControlBarModule.Enums.MenuItemEnum
local ContextualActionsModule = require(Modules.AvatarExperience.SlotBasedEditor.Components.ContextualActions.ContextualActions)
local IconName = FoundationModule.Enums.IconName
local config = {
	[AvatarScreen.UpdateOutfitPage] = true,
	[AvatarScreen.ManageOutfitPage] = true,
	[AvatarScreen.OutfitDetails] = true
}
local SpringOptions = { dampingRatio = 1, frequency = 3.5 }
local NewPeekHeaderHeight = ConstantsModule1.PeekHeaderHeight + (if GetFFlagAXEnableSlotBasedEditorModule() then 0 else ConstantsModule1.MainNavHeight) + ConstantsModule1.SubNavHeight
local NewPeekHeaderHeight1 = if GetFFlagAXEnableCategoryPillsModule() or FFlagAXMoveCatalogFilterToL1Navigation then ConstantsModule1.PeekHeaderHeight + ConstantsModule1.CatalogMainNavHeight else nil
local IsTenFootInterface = GuiService:IsTenFootInterface()

local function selectQuickItemsVisible(p1): boolean
	-- upvalues: PeekViewState (copy)
	local ItemDetailsPeekView = p1.AvatarExperience.Common.ItemDetailsPeekView
	local IsViewStateMatch = ItemDetailsPeekView.viewState == PeekViewState.Full
	local IsTryOnViewStateMatch = ItemDetailsPeekView.tryOnViewState == PeekViewState.Full
	
	return not (ItemDetailsPeekView.tryOnManagerViewState == PeekViewState.Full) and (not IsViewStateMatch and not IsTryOnViewStateMatch)
end

local AvatarExperienceView = RoactModule.PureComponent:extend("AvatarExperienceView")
AvatarExperienceView.defaultProps = {
	bottomBarEnabled = false,
	isDisabled = false,
	showRobuxBalance = true,
	showMultiTryOnBottomBar = true,
	showControlBar = true,
	itemDetailsPeekViewRefs = {}
}

local function mapStateToProps(p1, p2)
	-- upvalues: DeviceOrientationMode (copy), GetFFlagAXFixRobuxBalanceButtonPositionSecondModule (copy)
	local StatusBarHeight = if GetFFlagAXFixRobuxBalanceButtonPositionSecondModule() then p2.topBar and p1.TopBar.statusBarHeight or 0 else nil
	
	return {
		globalGuiInset = p1.GlobalGuiInset,
		isPortrait = p1.DeviceOrientation == DeviceOrientationMode.Portrait,
		screenSize = p1.ScreenSize,
		topBarHeight = p2.topBar and p1.TopBar.topBarHeight or 0,
		tryOnItems = p1.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems,
		lookId = p1.AvatarExperience.AvatarScene.OutfitTryOn.LookId,
		statusBarHeight = if GetFFlagAXFixRobuxBalanceButtonPositionSecondModule() then StatusBarHeight else nil
	}
end

local function mapValuesToProps(p1)
	return { Size = UDim2.new(0, p1.width, 0, p1.height) }
end

function AvatarExperienceView.init(p1)
	-- upvalues: FFlagAXMISEnableMultiShopping (copy), FFlagAXCatalogOffersBannerEnabled (copy), CryoModule (copy), RoactModule (copy), FFlagAXMoveRobuxBalanceButtonLowerModule (copy), FFlagAppIaScopedScrollAway (copy), FFlagEnableBottomNavOnMarketplace (copy), VisibilityControl (copy), FFlagStackedBottomNavMarketplaceCTA (copy), GetFFlagAXEnableSlotBasedEditorModule (copy), ReactModule (copy), AvatarScreen (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), ConstantsModule (copy), ConstantsModule1 (copy), FFlagEnableLeftNavOnConsole (copy), AXFixConsoleFullSceneViewPosition (copy)
	local SceneSize, SceneSize2 = p1:calculateSceneSize()
	p1.state = {
		sceneShowing = true,
		isVerticallyOffscreen = false,
		animatedValues = { height = SceneSize, width = SceneSize2 },
		bottomBarHeight = if FFlagAXMISEnableMultiShopping then 0 else nil
	}
	
	if FFlagAXCatalogOffersBannerEnabled then
		p1.state = CryoModule.Dictionary.join(p1.state, { catalogOffersBannerPeekHeaderBackgroundActive = true })
		
		function p1.onCatalogOffersBannerPeekHeaderBackgroundActiveChanged(CatalogOffersBannerPeekHeaderBackgroundActive)
			-- upvalues: p1 (copy)
			if p1.state.catalogOffersBannerPeekHeaderBackgroundActive ~= CatalogOffersBannerPeekHeaderBackgroundActive then
				p1:setState({
					catalogOffersBannerPeekHeaderBackgroundActive = CatalogOffersBannerPeekHeaderBackgroundActive
				})
			end
		end
	end
	p1.navItemsFrameRef = RoactModule.createRef()
	p1.sceneFrameRef = RoactModule.createRef()
	p1.robuxBalanceRef = if FFlagAXMoveRobuxBalanceButtonLowerModule then RoactModule.createRef() else nil
	
	if FFlagAppIaScopedScrollAway and FFlagEnableBottomNavOnMarketplace then
		function p1.onSheetCanvasYDelta(p2)
			-- upvalues: VisibilityControl (upval)
			VisibilityControl.onTouchMoved(-p2)
		end
		
		function p1.onSheetScrollTouchEnded()
			-- upvalues: VisibilityControl (upval)
			VisibilityControl.onTouchEnded()
		end
	end
	if FFlagStackedBottomNavMarketplaceCTA then
		p1.ctaBottomNavOffsetBinding = VisibilityControl.getFooterBinding()
	end
	if GetFFlagAXEnableSlotBasedEditorModule() then
		p1.quickButtonsZIndexBinding, p1.setQuickButtonsZIndexBinding = ReactModule.createBinding(nil)
		
		function p1:onActiveControlBarMenuItemChanged(p2)
			-- upvalues: p1 (copy)
			if p2 then
				p1.setQuickButtonsZIndexBinding(3)
				
				return
			else
				p1.setQuickButtonsZIndexBinding(nil)
			end
		end
	end
	function p1.onTransitionComplete(p2)
		-- upvalues: p1 (copy), AvatarScreen (upval), FFlagAXMigrateAXToGlobalAutofocus (upval), ConstantsModule (upval)
		local Props = p1.props
		local Name = Props.avatarRoute.current.name
		local IsPortrait = Props.isPortrait
		local IsSceneFullView = Props.isSceneFullView
		local SceneShowing = p1.state.sceneShowing
		
		if Props.isUIFullView and IsPortrait and SceneShowing then
			p1:setState({ sceneShowing = false })
		end
		if IsPortrait or not IsSceneFullView or Name ~= AvatarScreen.AvatarExperienceLandingPage then
			if p1.state.isVerticallyOffscreen then
				p1:setState({ isVerticallyOffscreen = false })
			end
		elseif not p1.state.isVerticallyOffscreen then
			p1:setState({ isVerticallyOffscreen = true })
		end
		if not FFlagAXMigrateAXToGlobalAutofocus then
			local NoIsOverlayVisible: boolean = Props.navigation.state.routeName == Name and not Props.avatarRoute.isOverlayVisible
			
			if p2 and NoIsOverlayVisible and Props.lastInputGroup == ConstantsModule.InputType.Gamepad and not IsSceneFullView then
				p2.captureFocus()
			end
		end
	end
	
	function p1:onNavItemsFrameResized()
		-- upvalues: p1 (copy)
		if p1.sceneFrameRef.current then
			p1.onSceneResized(p1.sceneFrameRef.current)
		end
	end
	
	function p1.onSceneResized(Frame: Frame)
		-- upvalues: p1 (copy), AvatarScreen (upval), ConstantsModule1 (upval), FFlagEnableLeftNavOnConsole (upval), AXFixConsoleFullSceneViewPosition (upval)
		local Current = p1.navItemsFrameRef.current
		
		if not Current then return end
		local Props = p1.props
		local Name = Props.avatarRoute.current.name
		local IsDisabled = Props.isDisabled
		local ScreenSize = Props.screenSize
		local AllowAdaptiveScrolling = Props.allowAdaptiveScrolling
		local TopBarHeight = p1:getTopBarHeight()
		local IsVerticallyOffscreen = p1.state.isVerticallyOffscreen or Name == AvatarScreen.AvatarExperienceLandingPage
		
		if not Props.isPortrait then
			Current.Size = UDim2.fromScale(if IsDisabled then 1 else ConstantsModule1.LandscapeNavWidth, 1)
			local NewLeft = if FFlagEnableLeftNavOnConsole then Props.globalGuiInset.left + Props.deviceSafePadding.left else 0
			local X = Current.AbsoluteSize.X
			local XDelta = ScreenSize.X - Frame.AbsoluteSize.X - (FFlagEnableLeftNavOnConsole and NewLeft or 0)
			local XOffset = if XDelta < X then if AXFixConsoleFullSceneViewPosition then XDelta - X - TopBarHeight else XDelta - X else 0
			
			if IsVerticallyOffscreen then
				Current.Position = UDim2.fromOffset(0, ScreenSize.Y * (-XOffset / X))
				
				return
			else
				Current.Position = UDim2.fromOffset(XOffset, 0)
				
				return
			end
		elseif AllowAdaptiveScrolling then
			Current.Position = UDim2.new(0, 0, 0, TopBarHeight)
			Current.Size = UDim2.new(1, 0, 1, -TopBarHeight)
			
			return
		else
			Current.Position = UDim2.new(0, 0, 0, Frame.AbsoluteSize.Y + TopBarHeight)
			Current.Size = UDim2.new(1, 0, 1, -Frame.AbsoluteSize.Y - TopBarHeight)
		end
	end
	
	p1.onBottomBarAbsoluteSizeChanged = if FFlagAXMISEnableMultiShopping then function(Frame)
		-- upvalues: p1 (copy)
		p1:setState({ bottomBarHeight = Frame.AbsoluteSize.Y })
	end else nil
end

function AvatarExperienceView.getTopBarHeight(p1)
	return p1.props.topBarHeight
end

function AvatarExperienceView.instantResize(p1)
	local Current = p1.sceneFrameRef.current
	
	if Current then
		local SceneSize, SceneSize2 = p1:calculateSceneSize()
		Current.Size = UDim2.new(0, SceneSize2, 0, SceneSize)
		p1.onSceneResized(Current)
		
		return
	end
end

function AvatarExperienceView.calculatePortraitSceneHeight(p1)
	-- upvalues: GetSafeAreaSizeFunction (copy), ConstantsModule1 (copy)
	local Props = p1.props
	local IsLandingPage = Props.isLandingPage
	local Offset = GetSafeAreaSizeFunction(Props.screenSize, Props.globalGuiInset).Y.Offset
	local ScaledOffset = Offset * ConstantsModule1.PortraitSceneHeight
	
	if IsLandingPage then
		ScaledOffset = Offset * ConstantsModule1.LandingPagePortraitSceneHeight
		
		if Offset - ScaledOffset < ConstantsModule1.LandingPagePortraitMinItemsHeightPix then
			ScaledOffset = Offset - ConstantsModule1.LandingPagePortraitMinItemsHeightPix
		end
	end
	return ScaledOffset
end

function AvatarExperienceView.calculateFullHeight(p1)
	local Props = p1.props
	local TopBarHeight = p1:getTopBarHeight()
	
	return Props.screenSize.Y - Props.globalGuiInset.bottom - (Props.isPortrait and TopBarHeight or 0)
end

function AvatarExperienceView.calculateSceneSize(p1)
	-- upvalues: ConstantsModule1 (copy)
	local Props = p1.props
	local GlobalGuiInset = Props.globalGuiInset
	local IsDisabled = Props.isDisabled
	local IsSceneFullView = Props.isSceneFullView
	local IsPortrait = Props.isPortrait
	local ScreenSize = Props.screenSize
	local TopBarHeight = p1:getTopBarHeight()
	local Bottom = GlobalGuiInset.bottom
	local Left = GlobalGuiInset.left
	local TopBarHeight1 = IsPortrait and TopBarHeight or 0
	local YDelta = ScreenSize.Y - Bottom
	local ScaledX = (ScreenSize.X - Left) * ConstantsModule1.LandscapeSceneWidth
	local XDelta = ScreenSize.X - Left
	local PortraitSceneHeight = p1:calculatePortraitSceneHeight()
	local PortraitSceneHeight1 = IsPortrait and PortraitSceneHeight or YDelta
	local XDelta1 = IsPortrait and XDelta or ScaledX
	
	if Props.isUIFullView and IsPortrait then
		PortraitSceneHeight1 = 0
	elseif IsSceneFullView then
		XDelta1 = ScreenSize.X
		PortraitSceneHeight1 = ScreenSize.Y - Bottom - TopBarHeight1
	end
	if IsDisabled then
		PortraitSceneHeight1 = 0
		XDelta1 = 0
	end
	return PortraitSceneHeight1, XDelta1
end

function AvatarExperienceView.isConsoleWithGamepad(p1): boolean
	-- upvalues: IsTenFootInterface (copy), ConstantsModule (copy)
	local Props = p1.props
	
	return IsTenFootInterface and Props.lastInputGroup == ConstantsModule.InputType.Gamepad
end

function AvatarExperienceView.renderSceneFrame(p1)
	-- upvalues: FFlagAXMigrateAXToGlobalAutofocus (copy), IsVRAppBuildFunction (copy), AvatarScreen (copy), RoactModule (copy), SpringAnimatedItem (copy), mapValuesToProps (copy), SpringOptions (copy), SceneUIContainerModule (copy), GetFFlagAXFixRobuxBalanceButtonPositionSecondModule (copy), FFlagAXEnableFullSceneInteractionFrame3 (copy), SceneInteractionFrameModule (copy), AvatarLoadingSpinnerModule (copy), VRAvatarEditorNavBarModule (copy), RoactGamepadModule (copy), Focusable (copy)
	local Props = p1.props
	local IsSceneFullView = Props.isSceneFullView
	local IsUIFullView = Props.isUIFullView
	local IsPortrait = Props.isPortrait
	local TopBarHeight = p1:getTopBarHeight()
	local Name = Props.avatarRoute.opaque.name
	local SceneShowing = not Props.isDisabled and (p1.state.sceneShowing or not IsPortrait)
	
	if not FFlagAXMigrateAXToGlobalAutofocus then
		return RoactGamepadModule.withFocusController(function(p2)
			-- upvalues: Props (copy), IsSceneFullView (copy), IsUIFullView (copy), IsVRAppBuildFunction (upval), Name (copy), AvatarScreen (upval), RoactModule (upval), SpringAnimatedItem (upval), IsPortrait (copy), TopBarHeight (copy), p1 (copy), mapValuesToProps (upval), SpringOptions (upval), Focusable (upval), SceneUIContainerModule (upval), GetFFlagAXFixRobuxBalanceButtonPositionSecondModule (upval), SceneShowing (ref), FFlagAXEnableFullSceneInteractionFrame3 (upval), SceneInteractionFrameModule (upval), AvatarLoadingSpinnerModule (upval), VRAvatarEditorNavBarModule (upval)
			local ForwardRef = Props.forwardRef
			local NoIsUIFullView: boolean = not IsSceneFullView and not IsUIFullView
			
			if IsVRAppBuildFunction() then
				NoIsUIFullView = NoIsUIFullView and Name ~= AvatarScreen.LayeredClothingSort
			end
			return RoactModule.createElement(SpringAnimatedItem.AnimatedFrame, {
				regularProps = {
					AnchorPoint = Vector2.new(1, 0),
					BackgroundTransparency = 1,
					Position = UDim2.new(1, 0, 0, IsPortrait and TopBarHeight or 0),
					ZIndex = -1,
					[RoactModule.Change.AbsoluteSize] = p1.onSceneResized,
					[RoactModule.Event.AncestryChanged] = p1.onSceneResized,
					[RoactModule.Ref] = p1.sceneFrameRef
				},
				animatedValues = p1.state.animatedValues,
				mapValuesToProps = mapValuesToProps,
				springOptions = SpringOptions,
				onComplete = function()
					-- upvalues: p1 (upval), p2 (copy)
					p1.onTransitionComplete(p2)
				end
			}, {
				SceneUIContainer = RoactModule.createElement(Focusable[SceneUIContainerModule], {
					globalGuiInset = p1.props.globalGuiInset,
					statusBarHeight = if GetFFlagAXFixRobuxBalanceButtonPositionSecondModule() then p1.props.statusBarHeight else nil,
					changeViewFunction = Props.changeViewFunction,
					isVisible = SceneShowing,
					row1ChildrenVisible = NoIsUIFullView,
					showRobuxBalance = Props.showRobuxBalance,
					[RoactModule.Ref] = ForwardRef,
					NextSelectionDown = Props.NextSelectionDown,
					NextSelectionLeft = Props.NextSelectionLeft,
					NextSelectionUp = Props.NextSelectionUp
				}),
				SceneInteractionFrame = if FFlagAXEnableFullSceneInteractionFrame3 then nil elseif IsVRAppBuildFunction() then nil else RoactModule.createElement(SceneInteractionFrameModule),
				AvatarLoadingSpinner = if IsVRAppBuildFunction() then nil else RoactModule.createElement(AvatarLoadingSpinnerModule),
				VRAvatarEditorNavBar = if IsVRAppBuildFunction() then RoactModule.createElement(VRAvatarEditorNavBarModule, { currentPage = Name, navigation = Props.navigation }) else nil,
				SceneUi = Props.sceneUi
			})
		end)
	end
	local ForwardRef = Props.forwardRef
	local NoIsUIFullView: boolean = not IsSceneFullView and not IsUIFullView
	
	if IsVRAppBuildFunction() then
		NoIsUIFullView = NoIsUIFullView and Name ~= AvatarScreen.LayeredClothingSort
	end
	return RoactModule.createElement(SpringAnimatedItem.AnimatedFrame, {
		regularProps = {
			AnchorPoint = Vector2.new(1, 0),
			BackgroundTransparency = 1,
			Position = UDim2.new(1, 0, 0, IsPortrait and TopBarHeight or 0),
			ZIndex = -1,
			[RoactModule.Change.AbsoluteSize] = p1.onSceneResized,
			[RoactModule.Event.AncestryChanged] = p1.onSceneResized,
			[RoactModule.Ref] = p1.sceneFrameRef
		},
		animatedValues = p1.state.animatedValues,
		mapValuesToProps = mapValuesToProps,
		springOptions = SpringOptions,
		onComplete = function()
			-- upvalues: p1 (copy)
			p1.onTransitionComplete()
		end
	}, {
		SceneUIContainer = RoactModule.createElement(SceneUIContainerModule, {
			globalGuiInset = p1.props.globalGuiInset,
			statusBarHeight = if GetFFlagAXFixRobuxBalanceButtonPositionSecondModule() then p1.props.statusBarHeight else nil,
			changeViewFunction = Props.changeViewFunction,
			isVisible = SceneShowing,
			row1ChildrenVisible = NoIsUIFullView,
			showRobuxBalance = Props.showRobuxBalance,
			[RoactModule.Ref] = ForwardRef
		}),
		SceneInteractionFrame = if FFlagAXEnableFullSceneInteractionFrame3 then nil elseif IsVRAppBuildFunction() then nil else RoactModule.createElement(SceneInteractionFrameModule),
		AvatarLoadingSpinner = if IsVRAppBuildFunction() then nil else RoactModule.createElement(AvatarLoadingSpinnerModule),
		VRAvatarEditorNavBar = if IsVRAppBuildFunction() then RoactModule.createElement(VRAvatarEditorNavBarModule, { currentPage = Name, navigation = Props.navigation }) else nil,
		SceneUi = Props.sceneUi
	})
end

function AvatarExperienceView.renderWithStyle(p1, _)
	-- upvalues: GetFFlagAXEnableSlotBasedEditorModule (copy), FFlagAXEnableManualSaving (copy), GetFFlagAXEnableCategoryPillsModule (copy), AvatarScreen (copy), NewPeekHeaderHeight1 (copy), NewPeekHeaderHeight (copy), FFlagAXCatalogOffersBannerEnabled (copy), ConstantsModule1 (copy), FFlagEnableBottomNavOnMarketplace (copy), CryoModule (copy), FFlagAXMISEnableMultiShopping (copy), RoactModule (copy), AdaptiveScrollingViewModule (copy), FFlagAXExpandPeekViewOnFirstScroll (copy), FFlagAXSlotsPeekViewScrollFix (copy), FFlagAXHideMenuOnScroll (copy), FFlagAXAvatarTimeoutFlow (copy), ReactModule (copy), TimeoutBanner (copy), FFlagAppIaScopedScrollAway (copy), FFlagEnableLeftNavOnConsole (copy), AXFixLightThemeBorder (copy), FFlagRenameDeprecatedUIBloxTokens (copy), FoundationModule (copy), InsetBackground (copy), SaveButton (copy), FullViewEntryButtonModule (copy), SceneButtonsModule (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), SlotControlBarModule (copy), FFlagAXResetAvatarButton (copy), QuickButtonsModule (copy), FFlagAXMoveRobuxBalanceButtonLowerModule (copy), ResponsiveModule (copy), FFlagAXShowHeadAdjustmentInRightControlBar (copy), FFlagAXFixRobuxButtonShowingInFullView (copy), RobuxBalanceModule (copy), FFlagAXMoveContextualActionButtons (copy), IconOnlyMenu (copy), MenuItemEnum (copy), FFlagAXMigrateBuilderIcons (copy), IconName (copy), FFlagAXFixContextualActionVisibility (copy), ContextualActionsModule (copy), FFlagAXFixControlBarSubMenuOverlap (copy), UndoRedoBar (copy), IsVRAppBuildFunction (copy), AvatarVRPanelWrapperModule (copy), VRAvatarRotateHandlerModule (copy), TutilsModule (copy), GetFFlagLuaAppEnableTopBannerFunction (copy), AXQuickButtonsFrameShouldAlwaysExist (copy), FFlagAXMigrateQuickButtonsToGlobalAutoFocus (copy), BottomInsetBackgroundModule (copy), MultiTryOnBottomBarModule (copy), NamedRefConstantsModule (copy), FFlagStackedBottomNavMarketplaceCTA (copy), CheckoutActionBarContainer (copy), FFlagAXEnableFullSceneInteractionFrame3 (copy), SceneInteractionFrameModule (copy), FFlagAXResetAvatarButtonExposureLogging (copy), OnFocusExperimentExposureLoggerModule (copy), AppUserLayers (copy)
	local Props = p1.props
	local AllowAdaptiveScrolling = Props.allowAdaptiveScrolling
	local GlobalGuiInset = Props.globalGuiInset
	local IsPortrait = Props.isPortrait
	local TopBarHeight = p1:getTopBarHeight()
	local Tokens = Props.tokens
	local IsTimedOut = Props.isTimedOut
	local ShowUndoRedo = if GetFFlagAXEnableSlotBasedEditorModule() then Props.showUndoRedo else nil
	local ShowSaveButton = if GetFFlagAXEnableSlotBasedEditorModule() and FFlagAXEnableManualSaving then Props.showSaveButton else nil
	local IsBottomAbove: boolean = not Props.bottomBarEnabled and GlobalGuiInset.bottom > 0
	local SceneSize = p1:calculateSceneSize()
	local AvatarRoute = Props.avatarRoute
	local v1 = nil
	
	if GetFFlagAXEnableCategoryPillsModule() then
		local IsNameMatch = Props.avatarRoute.opaque.name == AvatarScreen.Catalog
		v1 = if IsNameMatch then NewPeekHeaderHeight1 else NewPeekHeaderHeight
	end
	local IsCatalogMatch: boolean? = nil
	local v2 = nil
	
	if FFlagAXCatalogOffersBannerEnabled then
		local Name = AvatarRoute.opaque.name
		IsCatalogMatch = Name == AvatarScreen.Catalog or Name == AvatarScreen.CatalogSearch
		v2 = (if GetFFlagAXEnableCategoryPillsModule() and Name == AvatarScreen.Catalog then NewPeekHeaderHeight1 else NewPeekHeaderHeight) + (if IsCatalogMatch and p1.state.catalogOffersBannerPeekHeaderBackgroundActive then ConstantsModule1.CatalogOffersBannerPeekClosedExtraHeight else 0)
	end
	local Size1600 = if FFlagEnableBottomNavOnMarketplace and IsPortrait and Tokens then Tokens.Size.Size_1600 else 0
	local NoIsSceneFullView: boolean = not CryoModule.isEmpty(Props.tryOnItems) and (not Props.isSceneFullView or false)
	
	if Props.lookId ~= nil then
		if FFlagAXMISEnableMultiShopping then
			NoIsSceneFullView = AvatarRoute.opaque.name ~= AvatarScreen.MySharedAvatars and NoIsSceneFullView
		else
			NoIsSceneFullView = false
		end
	end
	local NoIsSceneFullView1: boolean = if Props.showMultiTryOnBottomBar then NoIsSceneFullView else false
	local FullHeight = nil
	local MidHeight = nil
	
	if AllowAdaptiveScrolling then
		FullHeight = p1:calculateFullHeight()
		MidHeight = FullHeight - p1:calculatePortraitSceneHeight()
	end
	local config = {
		TopBar = not IsPortrait and Props.topBar,
		Items = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 2,
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.new(0, 0, 1, 0),
			Size = UDim2.new(1, 0, 1, if IsPortrait then 0 else -TopBarHeight)
		}, if AllowAdaptiveScrolling and IsPortrait then {
			AdaptiveScrollingView = RoactModule.createElement(AdaptiveScrollingViewModule, {
				fullHeight = FullHeight,
				midHeight = MidHeight,
				alwaysShowingHeight = (if FFlagAXCatalogOffersBannerEnabled then v2 elseif GetFFlagAXEnableCategoryPillsModule() then v1 else NewPeekHeaderHeight) + (if FFlagEnableBottomNavOnMarketplace then Size1600 else 0),
				topBarHeight = Props.topBarHeight,
				fullHeightOptions = if Props.adaptiveScrollingProps then Props.adaptiveScrollingProps.fullHeightOptions else nil,
				enableExpandPeekViewOnUpwardScroll = if FFlagAXExpandPeekViewOnFirstScroll and Props.adaptiveScrollingProps then Props.adaptiveScrollingProps.enableExpandPeekViewOnUpwardScroll else nil,
				disableViewChangeByScroll = if FFlagAXSlotsPeekViewScrollFix then Props.disableScrollViewBindings else nil,
				enableAnimatedVisibility = if FFlagAXHideMenuOnScroll and Props.adaptiveScrollingProps then Props.adaptiveScrollingProps.enableAnimatedVisibility else nil,
				peekHeaderUsesElevatedBackground = if FFlagAXCatalogOffersBannerEnabled then IsCatalogMatch or FFlagAXAvatarTimeoutFlow and IsTimedOut == true else nil,
				peekHeaderBackgroundActive = if FFlagAXCatalogOffersBannerEnabled and IsCatalogMatch then p1.state.catalogOffersBannerPeekHeaderBackgroundActive else nil,
				onPeekHeaderBackgroundActiveChanged = if FFlagAXCatalogOffersBannerEnabled and IsCatalogMatch then p1.onCatalogOffersBannerPeekHeaderBackgroundActiveChanged else nil,
				banner = if FFlagAXAvatarTimeoutFlow and IsTimedOut then ReactModule.createElement(TimeoutBanner) else nil,
				onCanvasYDelta = if FFlagAppIaScopedScrollAway and FFlagEnableBottomNavOnMarketplace then p1.onSheetCanvasYDelta else nil,
				onScrollTouchEnded = if FFlagAppIaScopedScrollAway and FFlagEnableBottomNavOnMarketplace then p1.onSheetScrollTouchEnded else nil
			}, Props.children)
		} elseif FFlagAXAvatarTimeoutFlow and Props.tokens then {
			ScrollingView = RoactModule.createElement("Frame", {
				Size = UDim2.new(1, 0, 1, if FFlagEnableLeftNavOnConsole then Props.deviceSafePadding.bottom else 0),
				BorderSizePixel = if AXFixLightThemeBorder then 0 else nil,
				BackgroundColor3 = (if FFlagRenameDeprecatedUIBloxTokens then Props.tokens.Color.Surface.Surface_100 else Props.tokens.Semantic.Color.Background.Contrast).Color3,
				BackgroundTransparency = (if FFlagRenameDeprecatedUIBloxTokens then Props.tokens.Color.Surface.Surface_100 else Props.tokens.Semantic.Color.Background.Contrast).Transparency
			}, {
				Layout = RoactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				Banner = if FFlagAXAvatarTimeoutFlow and IsTimedOut then ReactModule.createElement(TimeoutBanner) else nil,
				Content = RoactModule.createElement(FoundationModule.View, { tag = "size-full-full", LayoutOrder = 1 }, Props.children)
			})
		} else Props.children),
		InsetBackground = if FFlagEnableLeftNavOnConsole and not IsPortrait then ReactModule.createElement(InsetBackground, { directions = { top = true } }) else nil
	}
	local RenderSceneFrameResult = p1:renderSceneFrame()
	local Element2 = nil
	
	if GetFFlagAXEnableSlotBasedEditorModule() and Tokens then
		local _UDim2 = UDim2.new(1, -Tokens.Size.Size_500, 0, p1:calculatePortraitSceneHeight() + TopBarHeight - Tokens.Size.Size_400)
		
		if not IsPortrait then
			local Size500_1 = Tokens.Size.Size_500
			
			if FFlagAXMISEnableMultiShopping then
				local BottomBarHeight = p1.state.bottomBarHeight
				
				if Props.isTryingOnItems and BottomBarHeight then
					Size500_1 += BottomBarHeight
				end
			elseif Props.isTryingOnItems and Props.multiTryOnBottomBarRef and Props.multiTryOnBottomBarRef.current then
				Size500_1 += Props.multiTryOnBottomBarRef.current.AbsoluteSize.Y
			end
			_UDim2 = UDim2.new(1, -Tokens.Size.Size_500, 1, -Size500_1)
		end
		Element2 = RoactModule.createElement(FoundationModule.View, {
			tag = "auto-xy anchor-bottom-right row",
			Position = _UDim2
		}, {
			SaveButton = if ShowSaveButton and not Props.isSceneFullView then RoactModule.createElement(SaveButton, {}) else nil,
			FullViewEntryButton = if Props.isSceneFullView and not IsPortrait then ReactModule.createElement(FullViewEntryButtonModule, {
				isUIFullView = Props.isUIFullView,
				isSceneFullView = Props.isSceneFullView,
				changeViewFunction = Props.changeViewFunction
			}) else nil
		})
	else
		Element2 = if AllowAdaptiveScrolling and IsPortrait then nil else RoactModule.createElement(SceneButtonsModule, {
			ZIndex = 3,
			sceneHeight = SceneSize,
			isUIFullView = Props.isUIFullView,
			isSceneFullView = Props.isSceneFullView,
			changeViewFunction = Props.changeViewFunction
		})
	end
	local Element3 = if GetFFlagAXEnableSlotBasedEditorModule() and Tokens then ReactModule.createElement(FoundationModule.View, {
		tag = "auto-xy col gap-small",
		ref = if FFlagAXMigrateAXToGlobalAutofocus then nil else Props.quickButtonsRef,
		SelectionGroup = if FFlagAXMigrateAXToGlobalAutofocus then true else nil,
		Position = if IsPortrait then UDim2.fromOffset(Tokens.Size.Size_500, TopBarHeight) else UDim2.new(ConstantsModule1.LandscapeNavWidth, Tokens.Size.Size_700, 0, TopBarHeight),
		Visible = not Props.isSceneFullView,
		ZIndex = p1.quickButtonsZIndexBinding
	}, {
		ControlBar = ReactModule.createElement(SlotControlBarModule, {
			LayoutOrder = 1,
			isUIFullView = Props.isUIFullView,
			isSceneFullView = Props.isSceneFullView,
			showControlBar = Props.showControlBar,
			showUndoRedo = ShowUndoRedo and (if FFlagAXResetAvatarButton then true else not IsPortrait),
			onActiveMenuItemChanged = p1.onActiveControlBarMenuItemChanged,
			NextSelectionLeft = Props.defaultChildRef
		})
	}) else RoactModule.createElement(QuickButtonsModule, {
		isUIFullView = Props.isUIFullView,
		isSceneFullView = Props.isSceneFullView,
		ref = if FFlagAXMigrateAXToGlobalAutofocus then nil else Props.quickButtonsRef,
		NextSelectionLeft = if FFlagAXMigrateAXToGlobalAutofocus then nil else Props.defaultChildRef
	})
	local Element4 = nil
	
	if FFlagAXMoveRobuxBalanceButtonLowerModule and p1.props.showRobuxBalance and p1.props.tokens then
		local Size500 = if IsPortrait then p1.props.tokens.Size.Size_500 elseif p1.props.preferredInput == ResponsiveModule.Input.Directional then p1.props.tokens.Size.Size_200 else p1.props.tokens.Size.Size_700
		local Tag = "auto-xy anchor-top-right"
		
		if FFlagAXShowHeadAdjustmentInRightControlBar then
			Tag ..= " col gap-small align-x-right"
		end
		local config1 = {
			RobuxBalance = if Inverted then ReactModule.createElement(RobuxBalanceModule, {
				ref = p1.robuxBalanceRef,
				NextSelectionLeft = if FFlagAXMigrateAXToGlobalAutofocus then nil else Props.quickButtonsRef
			}) else nil,
			WhiteSpace = if FFlagAXMoveContextualActionButtons or not FFlagAXShowHeadAdjustmentInRightControlBar then nil else ReactModule.createElement(FoundationModule.View, {
				LayoutOrder = 2,
				Size = UDim2.new(1, 0, 0, p1.props.tokens.Size.Size_1300)
			}),
			HeadAdjustmentButton = if FFlagAXMoveContextualActionButtons or not FFlagAXShowHeadAdjustmentInRightControlBar or not p1.props.supportsHeadShapes then nil else ReactModule.createElement(IconOnlyMenu, {
				LayoutOrder = 3,
				items = {
					{
						type = "icon",
						id = MenuItemEnum.AvatarRefinement.CustomizeHead,
						icon = if FFlagAXMigrateBuilderIcons then IconName.HeadBlank else "icons/menu/clothing/classicHead_off",
						iconSize = p1.props.tokens.Size.Size_600,
						onActivated = p1.props.onCustomizeHeadActivated
					}
				}
			})
		}
		local Inverted: boolean = if FFlagAXFixRobuxButtonShowingInFullView then not (Props.isSceneFullView or Props.isUIFullView) else not Props.isSceneFullView
		Element4 = ReactModule.createElement(FoundationModule.View, {
			tag = Tag,
			Position = UDim2.new(1, -Size500, 0, if p1.props.isSpatial then 0 else p1.props.topBarHeight)
		}, config1)
	end
	local Element = if FFlagAXMoveContextualActionButtons and Tokens then ReactModule.createElement(FoundationModule.View, {
		tag = "auto-xy anchor-center-right",
		Position = UDim2.new(1, -Tokens.Size.Size_500, 0, p1:calculatePortraitSceneHeight() / 2 + TopBarHeight),
		Visible = not FFlagAXFixContextualActionVisibility or not (Props.isSceneFullView or Props.isUIFullView)
	}, {
		ContextualActions = if p1.props.isPortrait then ReactModule.createElement(ContextualActionsModule, { LayoutOrder = 1 }) else nil
	}) else nil
	local Element1 = nil
	
	if GetFFlagAXEnableSlotBasedEditorModule() and Tokens then
		local Inverted1: boolean = ShowUndoRedo and (not Props.isSceneFullView and (IsPortrait and (not FFlagAXResetAvatarButton and not (FFlagAXFixControlBarSubMenuOverlap and Props.isUIFullView))))
		local _UDim2_1 = UDim2.fromOffset(Tokens.Size.Size_500, p1:calculatePortraitSceneHeight() + TopBarHeight - Tokens.Size.Size_400)
		
		if not IsPortrait then
			local Size500 = Tokens.Size.Size_500
			
			if FFlagAXMISEnableMultiShopping then
				local BottomBarHeight = p1.state.bottomBarHeight
				
				if Props.isTryingOnItems and BottomBarHeight then
					Size500 += BottomBarHeight
				end
			elseif Props.isTryingOnItems and Props.multiTryOnBottomBarRef and Props.multiTryOnBottomBarRef.current then
				Size500 += Props.multiTryOnBottomBarRef.current.AbsoluteSize.Y
			end
			_UDim2_1 = UDim2.new(ConstantsModule1.LandscapeNavWidth, Tokens.Size.Size_500, 1, -Size500)
		end
		Element1 = ReactModule.createElement(FoundationModule.View, { tag = "auto-xy anchor-bottom-left", Position = _UDim2_1 }, {
			UndoRedoBarPortrait = if Inverted1 then ReactModule.createElement(UndoRedoBar) else nil
		})
	end
	local Element5 = if IsVRAppBuildFunction() then RoactModule.createElement(AvatarVRPanelWrapperModule, { roundedCornersFrame = false, panelPlacement = "Center" }, {
		SceneFrame = RenderSceneFrameResult,
		QuickButtons = Element3,
		BottomRightButtons = Element2,
		GamepadHandler = if AvatarRoute.current.name == AvatarScreen.LayeredClothingSort then nil else RoactModule.createElement(VRAvatarRotateHandlerModule),
		TopRightButtons = if FFlagAXMoveRobuxBalanceButtonLowerModule then Element4 else nil,
		MiddleRightButtons = if FFlagAXMoveContextualActionButtons then Element else nil,
		BottomLeftButtons = if GetFFlagAXEnableSlotBasedEditorModule() then Element1 else nil
	}) else RoactModule.createFragment({
		SceneFrame = RenderSceneFrameResult,
		QuickButtons = Element3,
		BottomRightButtons = Element2,
		TopRightButtons = if FFlagAXMoveRobuxBalanceButtonLowerModule then Element4 else nil,
		MiddleRightButtons = if FFlagAXMoveContextualActionButtons then Element else nil,
		BottomLeftButtons = if GetFFlagAXEnableSlotBasedEditorModule() then Element1 else nil
	})
	local IsFieldCountResultAbove = TutilsModule.fieldCount(Props.tryOnItems) > 1
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Position = UDim2.fromOffset(0, if GetFFlagLuaAppEnableTopBannerFunction() then -Props.globalGuiInset.top else 0),
		Size = UDim2.fromScale(1, 1),
		ZIndex = Props.ZIndex,
		ref = if FFlagAXMigrateAXToGlobalAutofocus then Props.itemFrameRef else nil
	}, {
		TopBar = IsPortrait and Props.topBar,
		ItemsFrame = if IsVRAppBuildFunction() then RoactModule.createElement(AvatarVRPanelWrapperModule, {
			roundedCornersFrame = true,
			panelPlacement = "Left",
			visible = AvatarRoute.current.name ~= AvatarScreen.LayeredClothingSort
		}, config) else RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = if IsPortrait and not AllowAdaptiveScrolling then nil else 2,
			[RoactModule.Change.AbsoluteSize] = p1.onNavItemsFrameResized,
			[RoactModule.Ref] = p1.navItemsFrameRef,
			Visible = if FFlagAXMigrateAXToGlobalAutofocus then p1.props.isItemFrameVisible else nil
		}, config),
		OverlayedUI = if FFlagAXMigrateAXToGlobalAutofocus then if AXQuickButtonsFrameShouldAlwaysExist then ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ref = Props.quickButtonsRef,
			Size = UDim2.fromScale(1, 1),
			Visible = Props.isQuickButtonsVisible,
			SelectionGroup = if FFlagAXMigrateQuickButtonsToGlobalAutoFocus then true else nil,
			ZIndex = if FFlagAXFixControlBarSubMenuOverlap then 3 else nil
		}, Element5) elseif Props.isQuickButtonsVisible then ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ref = Props.quickButtonsRef,
			Size = UDim2.fromScale(1, 1),
			ZIndex = if FFlagAXFixControlBarSubMenuOverlap then 3 else nil
		}, Element5) else nil else Element5,
		BottomInsetBackground = if IsBottomAbove then RoactModule.createElement(BottomInsetBackgroundModule, { globalGuiInset = GlobalGuiInset }) else nil,
		MultiTryOnBottomBar = if FFlagAXMISEnableMultiShopping and IsFieldCountResultAbove then nil else RoactModule.createElement(MultiTryOnBottomBarModule, {
			bottomBarRef = Props.multiTryOnBottomBarRef,
			NextSelectionLeft = Props.namedRefs[Props.avatarRoute.opaque.name .. NamedRefConstantsModule.ItemsList],
			Visible = if FFlagAXMigrateAXToGlobalAutofocus then Props.isOpaqueRouteMatchingCurrentRoute and NoIsSceneFullView1 else NoIsSceneFullView1,
			isConsoleWithGamepad = p1:isConsoleWithGamepad(),
			itemDetailsPeekViewRefs = Props.itemDetailsPeekViewRefs,
			onAbsoluteSizeChanged = if FFlagAXMISEnableMultiShopping then p1.onBottomBarAbsoluteSizeChanged else nil,
			footerVisibilityBinding = if FFlagStackedBottomNavMarketplaceCTA then p1.ctaBottomNavOffsetBinding else nil
		}),
		CheckoutActionBar = if FFlagAXMISEnableMultiShopping and Props.isOpaqueRouteMatchingCurrentRoute and IsFieldCountResultAbove then ReactModule.createElement(CheckoutActionBarContainer, {
			ref = Props.multiTryOnBottomBarRef,
			onAbsoluteSizeChanged = p1.onBottomBarAbsoluteSizeChanged,
			Visible = NoIsSceneFullView1,
			footerVisibilityBinding = if FFlagStackedBottomNavMarketplaceCTA then p1.ctaBottomNavOffsetBinding else nil
		}) else nil,
		FullSceneInteractionFrame = if FFlagAXEnableFullSceneInteractionFrame3 then if p1.props.isSpatial then nil else RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = -2,
			Size = UDim2.fromScale(1, 1)
		}, {
			SceneInteractionFrame = RoactModule.createElement(SceneInteractionFrameModule)
		}) else nil,
		OnFocusExperimentExposureLogger = if FFlagAXResetAvatarButtonExposureLogging then RoactModule.createElement(OnFocusExperimentExposureLoggerModule, {
			ixpTests = {},
			flagIXPTestLayers = {
				if FFlagAXResetAvatarButtonExposureLogging then AppUserLayers.AvatarExperienceUAAllViews else nil
			}
		}) else nil
	})
end

function AvatarExperienceView.render(p2)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), SceneGamepadHandlerModule (copy)
	return WithStyleFunction(function(p3)
		-- upvalues: RoactModule (upval), SceneGamepadHandlerModule (upval), p2 (copy)
		return RoactModule.createElement(SceneGamepadHandlerModule, nil, { AvatarExperienceView = p2:renderWithStyle(p3) })
	end)
end

function AvatarExperienceView.didUpdate(p2, p3)
	local Props = p2.props
	local IsUIFullView = Props.isUIFullView
	local SceneShowing = p2.state.sceneShowing
	
	if not IsUIFullView and not SceneShowing then
		p2:setState({ sceneShowing = true })
	end
	local IsPortrait = p3.isPortrait
	local IsPortrait1 = Props.isPortrait
	
	if IsPortrait1 ~= IsPortrait then
		if IsPortrait1 and IsUIFullView then
			p2:setState({ sceneShowing = false })
		elseif not IsPortrait and IsUIFullView then
			p2:setState({ sceneShowing = true })
		end
		p2:instantResize()
	end
	if Props.isDisabled then
		p2:instantResize()
	end
	if Props.screenSize ~= p3.screenSize then
		p2:instantResize()
	end
	if Props.topBarHeight ~= p3.topBarHeight then
		p2:instantResize()
	end
	local SceneSize, SceneSize2 = p2:calculateSceneSize()
	
	if SceneSize ~= p2.state.animatedValues.height or SceneSize2 ~= p2.state.animatedValues.width then
		p2:setState({
			animatedValues = { height = SceneSize, width = SceneSize2 }
		})
	end
end

function AvatarExperienceView.didMount(p2)
	p2:instantResize()
	local SceneSize, SceneSize2 = p2:calculateSceneSize()
	p2:setState({
		animatedValues = { height = SceneSize, width = SceneSize2 }
	})
end

local v3 = IxpUtilsModule.connectTestVariables({
	universalAppCameraEnabled = UniversalAppCameraIXPTestModule.EnabledForUser
})((WithNamedRefsModule((WithAppRouteModule((RoactNavigationModule.withNavigation((WithLastInputGroupModule((RoactRoduxModule.connect(mapStateToProps, nil)(AvatarExperienceView)))))))))))

local function selectTryingOnItems(p2): boolean
	-- upvalues: CryoModule (copy)
	return not CryoModule.isEmpty(p2.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems)
end

local function selectEquippedDynamicHeadAndTryOnBundle(p2)
	-- upvalues: ConstantsModule1 (copy), SelectOutfitTryOnMostRecentAssetIdModule (copy), FFlagDynamicHeadsMigration (copy), FFlagHeadRefinementFacialAnimationToggle (copy)
	local NextEntry = nil
	local EquippedDynamicHeadInfo = nil
	local EquippedAssets = p2.AvatarExperience and (p2.AvatarExperience.AvatarEditor and (p2.AvatarExperience.AvatarEditor.Character and p2.AvatarExperience.AvatarEditor.Character.EquippedAssets))
	
	if EquippedAssets and EquippedAssets[ConstantsModule1.AssetTypeIdStrings.DynamicHead] then
		NextEntry = next(EquippedAssets[ConstantsModule1.AssetTypeIdStrings.DynamicHead])
	end
	local AssetInfos = p2.AvatarExperience and (p2.AvatarExperience.Common and p2.AvatarExperience.Common.AssetInfos)
	
	if NextEntry and AssetInfos then
		EquippedDynamicHeadInfo = AssetInfos[NextEntry]
	end
	local SelectOutfitTryOnMostRecentAssetIdModuleResult, _ = SelectOutfitTryOnMostRecentAssetIdModule(p2, ConstantsModule1.AssetTypeIdStrings.DynamicHead)
	local AssetInfo = if SelectOutfitTryOnMostRecentAssetIdModuleResult and AssetInfos then AssetInfos[SelectOutfitTryOnMostRecentAssetIdModuleResult] else nil
	local SupportsHeadShapes = false
	
	if FFlagDynamicHeadsMigration then
		local TryOnItems = p2.AvatarExperience.AvatarScene.OutfitTryOn and p2.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems
		local ItemId = nil
		local v4 = nil
		local LookId = p2.AvatarExperience.AvatarScene.OutfitTryOn.LookId
		
		if TryOnItems and SelectOutfitTryOnMostRecentAssetIdModuleResult then
			for _, tryOnItem in TryOnItems do
				if tryOnItem.itemType == ConstantsModule1.ItemType.Bundle and tryOnItem.bundleInfo then
					if tryOnItem.bundleInfo[SelectOutfitTryOnMostRecentAssetIdModuleResult] then
						ItemId = tryOnItem.itemId
						v4 = tryOnItem
						break
					end
				elseif tryOnItem.itemType == ConstantsModule1.ItemType.Asset and tryOnItem.itemId == SelectOutfitTryOnMostRecentAssetIdModuleResult then
					ItemId = tryOnItem.itemId
					v4 = tryOnItem
					break
				end
			end
		end
		local BundleInfos = p2.AvatarExperience and (p2.AvatarExperience.Common and p2.AvatarExperience.Common.BundleInfos)
		local BundleInfo = if ItemId and BundleInfos then BundleInfos[ItemId] else nil
		local Flag: boolean? = nil
		
		if v4 and v4.itemSubType == ConstantsModule1.BundleTypeIdStrings.DynamicHead and v4.bundleInfo then
			for i, _ in v4.bundleInfo do
				local AssetInfo1 = if AssetInfos then AssetInfos[i] else nil
				
				if AssetInfo1 and AssetInfo1.supportsHeadShapes == true then
					Flag = true
					break
				end
			end
		end
		if AssetInfo and AssetInfo.supportsHeadShapes ~= nil then
			SupportsHeadShapes = AssetInfo.supportsHeadShapes
		elseif BundleInfo and BundleInfo.supportsHeadShapes ~= nil then
			SupportsHeadShapes = BundleInfo.supportsHeadShapes
		elseif Flag == nil then
			if SelectOutfitTryOnMostRecentAssetIdModuleResult == nil and EquippedDynamicHeadInfo and EquippedDynamicHeadInfo.supportsHeadShapes ~= nil then
				SupportsHeadShapes = EquippedDynamicHeadInfo.supportsHeadShapes
			elseif LookId then
				SupportsHeadShapes = false
			end
		else
			SupportsHeadShapes = Flag
		end
	elseif AssetInfo then
		SupportsHeadShapes = AssetInfo.supportsHeadShapes ~= nil and AssetInfo.supportsHeadShapes
	elseif EquippedDynamicHeadInfo then
		SupportsHeadShapes = EquippedDynamicHeadInfo.supportsHeadShapes ~= nil and EquippedDynamicHeadInfo.supportsHeadShapes
	end
	return {
		equippedDynamicHeadId = NextEntry,
		equippedDynamicHeadInfo = EquippedDynamicHeadInfo,
		tryOnAssetId = SelectOutfitTryOnMostRecentAssetIdModuleResult,
		tryOnDynamicHeadAssetInfo = AssetInfo,
		supportsHeadShapes = SupportsHeadShapes,
		hasDynamicHead = if FFlagHeadRefinementFacialAnimationToggle then NextEntry ~= nil or SelectOutfitTryOnMostRecentAssetIdModuleResult ~= nil else nil
	}
end

return RoactModule.forwardRef(function(p3, ForwardRef)
	-- upvalues: FFlagAXShowHeadAdjustmentInRightControlBar (copy), UseNavigationFunction (copy), FFlagAXMoveRobuxBalanceButtonLowerModule (copy), GetFFlagAXEnableSlotBasedEditorModule (copy), FFlagAXAvatarTimeoutFlow (copy), UseTokensFunction (copy), GetTimeoutStatusStoreFunction (copy), UseSignalStateFunction (copy), ResponsiveModule (copy), UseSelectorFunction (copy), selectTryingOnItems (copy), GetUseSelectorDeepEqualsFunction (copy), FFlagAXMoveContextualActionButtons (copy), selectEquippedDynamicHeadAndTryOnBundle (copy), ReactModule (copy), AvatarScreen (copy), SlotBasedEditorAnalytics (copy), MenuItemEnum (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), UseAvatarRouteFunction (copy), AXDeregisterSurfacesWhenNotVisible (copy), config (copy), selectQuickItemsVisible (copy), UseFocusNavigableSurfaceRegistryConnectionFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), FFlagAXMISEnableMultiShopping (copy), FFlagAXModeratedItemsFlow (copy), UseDispatchFunction (copy), UseAvatarSaveContextFunction (copy), UseEffectOnMountFunction (copy), RemoveUnavailableEquippedAssetsModule (copy), FFlagHeadRefinementFacialAnimationToggle (copy), FFlagEnableLeftNavOnConsole (copy), DisplayModule (copy), RoactModule (copy), v3 (ref), CryoModule (copy)
	local UseNavigationResult = if FFlagAXShowHeadAdjustmentInRightControlBar then UseNavigationFunction() else nil
	local UseTokensResult = if FFlagAXMoveRobuxBalanceButtonLowerModule or GetFFlagAXEnableSlotBasedEditorModule() or FFlagAXAvatarTimeoutFlow then UseTokensFunction() else nil
	local TimeoutStatusStore = if FFlagAXAvatarTimeoutFlow then GetTimeoutStatusStoreFunction(false) else nil
	local UseSignalStateResult = if TimeoutStatusStore then UseSignalStateFunction(TimeoutStatusStore.getIsTimedOut) else nil
	local UseIsSpatialResult = if FFlagAXMoveRobuxBalanceButtonLowerModule then ResponsiveModule.useIsSpatial() else nil
	local UsePreferredInputResult = if FFlagAXMoveRobuxBalanceButtonLowerModule then ResponsiveModule.usePreferredInput() else nil
	local UseSelectorResult = if GetFFlagAXEnableSlotBasedEditorModule() then UseSelectorFunction(selectTryingOnItems, GetUseSelectorDeepEqualsFunction()) else nil
	local UseSelectorResult1 = if FFlagAXMoveContextualActionButtons or not FFlagAXShowHeadAdjustmentInRightControlBar then nil else UseSelectorFunction(selectEquippedDynamicHeadAndTryOnBundle)
	local UseResult = if FFlagAXMoveContextualActionButtons or not FFlagAXShowHeadAdjustmentInRightControlBar then nil else ReactModule.useCallback(function()
		-- upvalues: UseNavigationResult (ref), AvatarScreen (upval), SlotBasedEditorAnalytics (upval), MenuItemEnum (upval)
		UseNavigationResult.navigate(AvatarScreen.HeadRefinement)
		SlotBasedEditorAnalytics.trackAdvancedCustomizationControlBarClick(MenuItemEnum.AvatarRefinement.CustomizeHead)
	end, { UseNavigationResult })
	local v5: boolean? = nil
	local v6 = nil
	local QuickButtonsRef = nil
	local UseRefResult = nil
	local v7: boolean? = nil
	
	if FFlagAXMigrateAXToGlobalAutofocus then
		UseRefResult = ReactModule.useRef(nil)
		local UseRefResult1 = ReactModule.useRef(nil)
		QuickButtonsRef = p3.quickButtonsRef or UseRefResult1
		
		if not FFlagAXShowHeadAdjustmentInRightControlBar then
			UseNavigationResult = UseNavigationFunction()
		end
		local UseAvatarRouteResult = UseAvatarRouteFunction()
		local RouteName = if UseNavigationResult and UseNavigationResult.state then UseNavigationResult.state.routeName else nil
		local Name = UseAvatarRouteResult.opaque.name
		local Name1 = UseAvatarRouteResult.current.name
		v7 = if AXDeregisterSurfacesWhenNotVisible then UseAvatarRouteResult.isVisible and (RouteName == Name and not config[Name1]) else RouteName == Name and not config[Name1]
		local UseSelectorResult2 = UseSelectorFunction(selectQuickItemsVisible)
		v6 = if AXDeregisterSurfacesWhenNotVisible then UseAvatarRouteResult.isVisible and UseSelectorResult2 else UseSelectorResult2
		v5 = RouteName == Name1
		UseFocusNavigableSurfaceRegistryConnectionFunction(UseRefResult.current, FocusNavigableSurfaceIdentifierEnum.SubRouterView, v7)
		UseFocusNavigableSurfaceRegistryConnectionFunction(QuickButtonsRef.current, FocusNavigableSurfaceIdentifierEnum.Auxiliary, v6)
	end
	if FFlagAXMISEnableMultiShopping then
		if not FFlagAXShowHeadAdjustmentInRightControlBar then
			UseNavigationResult = UseNavigationFunction()
		end
		local UseAvatarRouteResult = UseAvatarRouteFunction()
		local RouteName = UseNavigationResult and (UseNavigationResult.state and UseNavigationResult.state.routeName)
		local Name = UseAvatarRouteResult and (UseAvatarRouteResult.current and UseAvatarRouteResult.current.name)
		v5 = RouteName and RouteName == Name
	end
	if FFlagAXModeratedItemsFlow then
		if not FFlagAXShowHeadAdjustmentInRightControlBar then
			UseNavigationResult = UseNavigationFunction()
		end
		local UseDispatchResult = UseDispatchFunction()
		local UseAvatarSaveContextResult = UseAvatarSaveContextFunction()
		UseEffectOnMountFunction(function()
			-- upvalues: UseDispatchResult (copy), RemoveUnavailableEquippedAssetsModule (upval), UseNavigationResult (ref), UseAvatarSaveContextResult (copy)
			UseDispatchResult(RemoveUnavailableEquippedAssetsModule(UseNavigationResult, UseAvatarSaveContextResult.trySaveAvatar))
		end)
	end
	local HasDynamicHead = if FFlagAXMoveContextualActionButtons or not FFlagAXShowHeadAdjustmentInRightControlBar then nil elseif FFlagHeadRefinementFacialAnimationToggle then UseSelectorResult1 and UseSelectorResult1.hasDynamicHead else UseSelectorResult1 and UseSelectorResult1.supportsHeadShapes or false
	local UseSignalStateResult1 = if FFlagEnableLeftNavOnConsole then UseSignalStateFunction(DisplayModule.GetDisplayStore().getDeviceSafePadding) else nil
	
	return RoactModule.createElement(v3, CryoModule.Dictionary.join(p3, {
		controlBarFocusAnimation = nil,
		forwardRef = ForwardRef,
		tokens = UseTokensResult,
		isSpatial = UseIsSpatialResult,
		navigation = if FFlagAXShowHeadAdjustmentInRightControlBar then UseNavigationResult else nil,
		onCustomizeHeadActivated = if FFlagAXMoveContextualActionButtons or not FFlagAXShowHeadAdjustmentInRightControlBar then nil else UseResult,
		supportsHeadShapes = if FFlagAXMoveContextualActionButtons or not FFlagAXShowHeadAdjustmentInRightControlBar then nil else HasDynamicHead,
		preferredInput = UsePreferredInputResult,
		isTryingOnItems = UseSelectorResult,
		itemFrameRef = if FFlagAXMigrateAXToGlobalAutofocus then UseRefResult else nil,
		quickButtonsRef = if FFlagAXMigrateAXToGlobalAutofocus then QuickButtonsRef else nil,
		isQuickButtonsVisible = if FFlagAXMigrateAXToGlobalAutofocus then v6 else nil,
		isOpaqueRouteMatchingCurrentRoute = if FFlagAXMigrateAXToGlobalAutofocus or FFlagAXMISEnableMultiShopping then v5 else nil,
		isItemFrameVisible = if FFlagAXMigrateAXToGlobalAutofocus then v7 else nil,
		isTimedOut = if FFlagAXAvatarTimeoutFlow then UseSignalStateResult else nil,
		deviceSafePadding = if FFlagEnableLeftNavOnConsole then UseSignalStateResult1 else nil
	}))
end)