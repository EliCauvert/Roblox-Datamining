local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local OtterModule = require(CorePackages.Packages.Otter)
local RoactModule = require(CorePackages.Packages.Roact)
local ReactModule = require(CorePackages.Packages.React)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local Focusable = RoactGamepadModule.Focusable
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactNavigationModule = require(CorePackages.Packages.RoactNavigation)
local TModule = require(CorePackages.Packages.t)
local AnalyticsModule = require(Modules.AvatarExperience.AvatarEditor.Services.Analytics)
local AnalyticsModule1 = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local AnalyticsModule2 = require(Modules.AvatarExperience.ProfilePictureEditor.Services.Analytics)
local AnalyticsModule3 = require(Modules.AvatarExperience.Common.Services.Analytics)
local DeviceOrientationMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local WithLastInputGroupModule = require(Modules.AvatarExperience.Common.Components.withLastInputGroup)
local LuaAppEventsModule = require(Modules.LuaApp.LuaAppEvents)
local AppPageModule = require(Modules.LuaApp.AppPage)
local AvatarExperienceNavigationModule = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local AvatarExperienceViewModule = require(Modules.AvatarExperience.Common.Components.AvatarExperienceView)
local AvatarPageButtonModule = require(Modules.AvatarExperience.Common.Components.Landing.AvatarPageButton)
local CatalogPageButtonModule = require(Modules.AvatarExperience.Common.Components.Landing.CatalogPageButton)
local ProfilePictureEditorPageButtonModule = require(Modules.AvatarExperience.Common.Components.Landing.ProfilePictureEditorPageButton)
local GamepadFocusHandlerForPageModule = require(Modules.AvatarExperience.Common.Components.GamepadFocusHandlerForPage)
local TopBarModule = require(Modules.LuaApp.Components.TopBar.TopBar)
local ConstantsModule = require(Modules.LuaApp.Constants)
local RobloxAppEnumsModule = require(CorePackages.Workspace.Packages.RobloxAppEnums)
local ConstantsModule1 = require(Modules.AvatarExperience.Common.Constants)
local WithStackVisibilityWrapperModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper)
local IsAvatarRouteVisibleModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.Utils.isAvatarRouteVisible)
local NavigationEventsLoggerModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.Debug.NavigationEventsLogger)
local SetFullViewModule = require(Modules.AvatarExperience.Common.Thunks.SetFullView)
local FullView = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Enums.FullView
local IsGamepadInputFunction = require(CorePackages.Workspace.Packages.RoactUtils).isGamepadInput
local ExternalEventConnection = require(CorePackages.Workspace.Packages.RoactUtils).ExternalEventConnection
local OnFocusExperimentExposureLoggerModule = require(Modules.AvatarExperience.Catalog.Components.OnFocusExperimentExposureLogger)
local SetCategoryAndSubcategoryModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.SetCategoryAndSubcategory)
local SetCategoryAndSubcategoryModule1 = require(Modules.AvatarExperience.Catalog.Thunks.SetCategoryAndSubcategory)
local FocusNavigationUtilsModule = require(CorePackages.Workspace.Packages.FocusNavigationUtils)
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local UseRegistryEntryFunction = FocusNavigationUtilsModule.FocusNavigableSurfaceRegistry.useRegistryEntry
local UseFirstFocusableDescendantRefFunction = FocusNavigationUtilsModule.useFirstFocusableDescendantRef
local UseDescendantHasFocusFunction = FocusNavigationUtilsModule.useDescendantHasFocus
local UseAvatarExperienceFocusNavigationBindingsModule = require(Modules.AvatarExperience.Common.Hooks.useAvatarExperienceFocusNavigationBindings)
local UseOverlayClosedCallbackModule = require(Modules.AvatarExperience.Common.Hooks.useOverlayClosedCallback)
local UseUiModeInfoFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useUiModeInfo
local UiMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).UiMode
local CatalogTilesLatencyTrackerModule = require(Modules.AvatarExperience.Catalog.Actions.CatalogTilesLatencyTracker)
local SpringAnimatedItem = require(CorePackages.Packages.UIBlox).Utility.SpringAnimatedItem
local GetFFlagAvatarAutocompleteEnabledForAllModule = require(Modules.AvatarExperience.Flags.GetFFlagAvatarAutocompleteEnabledForAll)
local GetFFlagAllowAvatarLandingPageSearchModule = require(Modules.AvatarExperience.Flags.GetFFlagAllowAvatarLandingPageSearch)
local AXDisableAlwaysRenderedScreensIXPModule = require(Modules.AvatarExperience.Experiments.AXDisableAlwaysRenderedScreensIXP)
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local FFlagAXMigrateAXToGlobalAutofocus1 = game:DefineFastFlag("AXMigrateLandingPageToAutoFocus", false) and FFlagAXMigrateAXToGlobalAutofocus
local AXFixLandingPageButtonsStuckOffscreen = game:DefineFastFlag("AXFixLandingPageButtonsStuckOffscreen", false)
local FFlagAXMoveAllTabToWidgetOnly = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXMoveAllTabToWidgetOnly
local AvatarExperienceTTIPerformanceModule = require(CorePackages.Workspace.Packages.AvatarExperienceTTIPerformance)
local TTIPerformanceManager = AvatarExperienceTTIPerformanceModule.TTIPerformanceManager
local WidgetsPercievedTTIManager = AvatarExperienceTTIPerformanceModule.WidgetsPercievedTTIManager
local GetCatalogCategoriesStoreModule = require(Modules.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore)
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local FFlagEnableLeftNavOnConsole = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole
local SpringOptions = { dampingRatio = 0.8, frequency = 4 }

local function mapValuesToPropsLeft(p1)
	return { Position = UDim2.new(0.5, -13, p1.yPosition, 0) }
end

local function mapValuesToPropsRight(p1)
	return { Position = UDim2.new(0.5, 13, p1.yPosition, 0) }
end

local function mapValuesToPropsMiddle(p1)
	return { Position = UDim2.new(0.5, 0, p1.yPosition, 13) }
end

local AvatarExperienceLandingPage = RoactModule.PureComponent:extend("AvatarExperienceLandingPage")
AvatarExperienceLandingPage.validateProps = TModule.strictInterface({
	avatarCategory = TModule.number,
	avatarSubcategory = TModule.number,
	catalogCategoryId = TModule.optional(TModule.string),
	catalogSubcategoryId = TModule.optional(TModule.string),
	deviceOrientation = TModule.string,
	statusBarHeight = TModule.number,
	resetAvatarCategories = TModule.callback,
	resetCatalogCategories = TModule.callback,
	setFullView = TModule.callback,
	startPercievedCatalogTTITracker = TModule.callback,
	avatarAnalytics = TModule.table,
	catalogAnalytics = TModule.table,
	profilePictureEditorAnalytics = TModule.table,
	avatarExperienceAnalytics = TModule.table,
	lastInputGroup = TModule.string,
	navigation = TModule.table,
	avatarRoute = AvatarExperienceNavigationModule.AvatarRoute.AvatarRoute.Interface,
	NextSelectionUp = TModule.optional(TModule.any),
	shouldCaptureFocus = TModule.boolean,
	is10ftUI = TModule.boolean,
	focusNavigationBindingsRef = TModule.callback,
	focusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else TModule.table
})

function AvatarExperienceLandingPage.init(p1)
	-- upvalues: RoactModule (copy), LuaAppEventsModule (copy), AppPageModule (copy), AvatarScreen (copy), UserInputService (copy), IsGamepadInputFunction (copy), OtterModule (copy), FFlagAXMoveAllTabToWidgetOnly (copy), WidgetsPercievedTTIManager (copy), TTIPerformanceManager (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), ConstantsModule (copy), AXFixLandingPageButtonsStuckOffscreen (copy), FullView (copy)
	p1.robuxBalanceRef = RoactModule.createRef()
	p1.quickMenuRef = RoactModule.createRef()
	p1.state = { buttonsOffscreen = false, buttonTransparencyModifier = 0 }
	p1.luaAppReloadPageEventConnection = LuaAppEventsModule.ReloadPage:connect(function(AvatarExperienceRoot)
		-- upvalues: AppPageModule (upval), p1 (copy), AvatarScreen (upval)
		if AvatarExperienceRoot == AppPageModule.AvatarExperienceRoot then
			if p1.props.is10ftUI then
				p1.props.navigation.navigate(AvatarScreen.AvatarExperienceLandingPage)
				
				return
			end
			p1.props.navigation.navigate(AvatarScreen.Catalog)
		end
	end)
	local LastInputType = UserInputService:GetLastInputType()
	
	function p1.lastInputTypeChangedCallback(p2)
		-- upvalues: IsGamepadInputFunction (upval), p1 (copy)
		local IsGamepadInput = IsGamepadInputFunction(p2)
		
		if IsGamepadInput ~= p1.state.lastInputIsGamepad then
			p1:setState({ lastInputIsGamepad = IsGamepadInput })
		end
	end
	
	p1.state.lastInputIsGamepad = IsGamepadInputFunction(LastInputType)
	
	function p1.updateButtonPositions()
		-- upvalues: p1 (copy), OtterModule (upval)
		p1:setState({ buttonsOffscreen = true })
		
		if p1.motor then
			p1.motor:setGoal(OtterModule.spring(1), { frequency = 3 })
		end
	end
	
	function p1.showProfilePictureEditorCallback()
		-- upvalues: p1 (copy), AvatarScreen (upval)
		p1.props.profilePictureEditorAnalytics.profilePictureEditorOpenedFromLandingPage()
		p1.updateButtonPositions()
		delay(0.2, function()
			-- upvalues: p1 (upval), AvatarScreen (upval)
			p1.props.navigation.navigate(AvatarScreen.ProfilePictureEditorEmotes)
		end)
	end
	
	function p1.showAvatarEditorCallback()
		-- upvalues: p1 (copy), AvatarScreen (upval)
		p1.props.avatarAnalytics.avatarEditorOpenedFromLandingPage()
		p1.updateButtonPositions()
		delay(0.2, function()
			-- upvalues: p1 (upval), AvatarScreen (upval)
			if p1.isMounted then
				p1.props.navigation.navigate(AvatarScreen.AvatarEditor)
			end
		end)
	end
	
	function p1.showCatalogCallback()
		-- upvalues: p1 (copy), FFlagAXMoveAllTabToWidgetOnly (upval), WidgetsPercievedTTIManager (upval), TTIPerformanceManager (upval), AvatarScreen (upval)
		p1.props.catalogAnalytics.catalogOpenedFromLandingPage()
		p1.updateButtonPositions()
		
		if FFlagAXMoveAllTabToWidgetOnly then
			WidgetsPercievedTTIManager.startPerceivedTracking()
		else
			TTIPerformanceManager.Surface.Marketplace.Root.startPerceivedTracking()
		end
		p1.props.startPercievedCatalogTTITracker()
		delay(0.2, function()
			-- upvalues: p1 (upval), AvatarScreen (upval)
			if p1.isMounted then
				p1.props.navigation.navigate(AvatarScreen.Catalog)
			end
		end)
	end
	
	function p1.transitionOnscreen()
		-- upvalues: p1 (copy), OtterModule (upval)
		p1:setState({ buttonsOffscreen = false })
		
		if p1.motor then
			p1.motor:setGoal(OtterModule.spring(0), { frequency = 3 })
		end
	end
	
	p1.pageButtonsRef = RoactModule.createRef()
	p1.catalogPageButtonRef = RoactModule.createRef()
	p1.avatarPageButtonRef = RoactModule.createRef()
	p1.topFrameRef = RoactModule.createRef()
	p1.topBarRef = RoactModule.createRef()
	p1.robuxButtonRef = RoactModule.createRef()
	p1.profilePictureEditorPageButtonRef = RoactModule.createRef()
	p1.topFrameRef = RoactModule.createRef()
	p1.sceneUIContainerRef = RoactModule.createRef()
	
	function p1.onComplete()
		-- upvalues: FFlagAXMigrateAXToGlobalAutofocus (upval), p1 (copy), ConstantsModule (upval)
		if not FFlagAXMigrateAXToGlobalAutofocus and (p1.isFocused and (p1.props.lastInputGroup == ConstantsModule.InputType.Gamepad and p1.props.avatarRoute.isVisible) and not p1.state.buttonsOffscreen and p1.props.shouldCaptureFocus) then
			p1.props.focusController.captureFocus()
		end
	end
	
	function p1.onWillFocus()
		-- upvalues: p1 (copy), OtterModule (upval), FFlagAXMigrateAXToGlobalAutofocus (upval), ConstantsModule (upval)
		if not p1.isMounted then return end
		p1.isFocused = true
		p1.motor = OtterModule.createSingleMotor(p1.state.buttonTransparencyModifier)
		p1.motor:onStep(function(ButtonTransparencyModifier)
			-- upvalues: p1 (upval)
			if p1.isFocused or p1.isMounted then
				p1:setState({ buttonTransparencyModifier = ButtonTransparencyModifier })
				
				return
			end
		end)
		p1.transitionOnscreen()
		
		if not FFlagAXMigrateAXToGlobalAutofocus and (p1.isFocused and (p1.props.lastInputGroup == ConstantsModule.InputType.Gamepad and p1.props.avatarRoute.isVisible) and p1.props.shouldCaptureFocus) then
			p1.props.focusController.captureFocus()
		end
	end
	
	function p1.onWillBlur()
		-- upvalues: p1 (copy), AXFixLandingPageButtonsStuckOffscreen (upval)
		if p1.motor then
			p1.motor:destroy()
			
			if AXFixLandingPageButtonsStuckOffscreen then
				p1.motor = nil
			end
		end
		p1.isFocused = false
	end
	
	function p1.resetCategoryNavigation()
		-- upvalues: p1 (copy)
		local AvatarSubcategory = p1.props.avatarSubcategory
		local CatalogCategoryId = p1.props.catalogCategoryId
		local CatalogSubcategoryId = p1.props.catalogSubcategoryId
		
		if p1.props.avatarCategory ~= 1 or AvatarSubcategory ~= 1 then
			p1.props.resetAvatarCategories(p1.props.avatarAnalytics)
			
			return
		end
		if CatalogCategoryId ~= "1" or CatalogSubcategoryId ~= "1" then
			p1.props.resetCatalogCategories(p1.props.catalogAnalytics)
		end
	end
	
	function p1.setUIFullView()
		-- upvalues: p1 (copy), AvatarScreen (upval), FullView (upval)
		p1.props.setFullView(p1.props.avatarExperienceAnalytics, AvatarScreen.CatalogSearch, FullView.UIFullView)
	end
end

function AvatarExperienceLandingPage.renderTopBar(p1)
	-- upvalues: GetFFlagAllowAvatarLandingPageSearchModule (copy), WithLocalizationFunction (copy), RoactModule (copy), FFlagAXMigrateAXToGlobalAutofocus1 (copy), TopBarModule (copy), Focusable (copy), RobloxAppEnumsModule (copy), GetFFlagAvatarAutocompleteEnabledForAllModule (copy)
	local ZIndex: number = if GetFFlagAllowAvatarLandingPageSearchModule() then 2 else 0
	
	return WithLocalizationFunction({ title = "CommonUI.Features.Label.Avatar" })(function(p2)
		-- upvalues: RoactModule (upval), FFlagAXMigrateAXToGlobalAutofocus1 (upval), TopBarModule (upval), Focusable (upval), GetFFlagAllowAvatarLandingPageSearchModule (upval), RobloxAppEnumsModule (upval), ZIndex (ref), GetFFlagAvatarAutocompleteEnabledForAllModule (upval), p1 (copy)
		return RoactModule.createElement(if FFlagAXMigrateAXToGlobalAutofocus1 then TopBarModule.Container else Focusable[TopBarModule.Container], {
			titleText = p2.title,
			searchType = GetFFlagAllowAvatarLandingPageSearchModule() and RobloxAppEnumsModule.SearchTypes.Catalog or nil,
			transparentBackground = true,
			ZIndex = ZIndex,
			onConfirmSearchCallback = GetFFlagAvatarAutocompleteEnabledForAllModule() and p1.setUIFullView or nil,
			rightItems = if GetFFlagAllowAvatarLandingPageSearchModule() then { TopBarModule.SearchButton } else {},
			[RoactModule.Ref] = p1.topBarRef,
			NextSelectionDown = if FFlagAXMigrateAXToGlobalAutofocus1 then nil else p1.catalogPageButtonRef,
			NextSelectionRight = if FFlagAXMigrateAXToGlobalAutofocus1 then nil else p1.sceneUIContainerRef,
			NextSelectionUp = if FFlagAXMigrateAXToGlobalAutofocus1 then nil else p1.props.NextSelectionUp
		})
	end)
end

function AvatarExperienceLandingPage.makeLeftFrame(p1, YScale, p2, p3)
	-- upvalues: RoactModule (copy), SpringAnimatedItem (copy), mapValuesToPropsLeft (copy), SpringOptions (copy), FFlagAXMigrateAXToGlobalAutofocus1 (copy), AvatarPageButtonModule (copy), Focusable (copy)
	return RoactModule.createElement(SpringAnimatedItem.AnimatedFrame, {
		regularProps = {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			AnchorPoint = Vector2.new(1, 0.5),
			Size = UDim2.new(0.5, -p2 * 3 / 4, YScale, 0)
		},
		animatedValues = {
			xPosition = 0.5,
			yPosition = p1.state.buttonsOffscreen and p3 or 0.5
		},
		mapValuesToProps = mapValuesToPropsLeft,
		springOptions = SpringOptions,
		onComplete = p1.onComplete
	}, {
		AvatarPageButton = RoactModule.createElement(if FFlagAXMigrateAXToGlobalAutofocus1 then AvatarPageButtonModule else Focusable[AvatarPageButtonModule], {
			onActivated = p1.showAvatarEditorCallback,
			transparencyModifier = p1.state.buttonTransparencyModifier,
			[RoactModule.Ref] = p1.avatarPageButtonRef,
			NextSelectionRight = if FFlagAXMigrateAXToGlobalAutofocus1 then nil else p1.catalogPageButtonRef,
			NextSelectionDown = if FFlagAXMigrateAXToGlobalAutofocus1 then nil else p1.profilePictureEditorPageButtonRef,
			NextSelectionUp = if FFlagAXMigrateAXToGlobalAutofocus1 then nil else p1.topBarRef
		})
	})
end

function AvatarExperienceLandingPage.makeRightFrame(p1, YScale, p2, p3)
	-- upvalues: RoactModule (copy), SpringAnimatedItem (copy), mapValuesToPropsRight (copy), SpringOptions (copy), FFlagAXMigrateAXToGlobalAutofocus1 (copy), CatalogPageButtonModule (copy), Focusable (copy)
	return RoactModule.createElement(SpringAnimatedItem.AnimatedFrame, {
		regularProps = {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			AnchorPoint = Vector2.new(0, 0.5),
			Size = UDim2.new(0.5, -p2 * 3 / 4, YScale, 0)
		},
		animatedValues = {
			xPosition = 0.5,
			yPosition = p1.state.buttonsOffscreen and p3 or 0.5
		},
		mapValuesToProps = mapValuesToPropsRight,
		springOptions = SpringOptions
	}, {
		CatalogPageButton = RoactModule.createElement(if FFlagAXMigrateAXToGlobalAutofocus1 then CatalogPageButtonModule else Focusable[CatalogPageButtonModule], {
			onActivated = p1.showCatalogCallback,
			transparencyModifier = p1.state.buttonTransparencyModifier,
			[RoactModule.Ref] = p1.catalogPageButtonRef,
			NextSelectionLeft = if FFlagAXMigrateAXToGlobalAutofocus1 then nil else p1.avatarPageButtonRef,
			NextSelectionRight = if FFlagAXMigrateAXToGlobalAutofocus1 then nil else p1.sceneUIContainerRef,
			NextSelectionDown = if FFlagAXMigrateAXToGlobalAutofocus1 then nil else p1.profilePictureEditorPageButtonRef,
			NextSelectionUp = if FFlagAXMigrateAXToGlobalAutofocus1 then nil else p1.topBarRef
		})
	})
end

function AvatarExperienceLandingPage.makeMiddleFrame(p1, YScale, p2, p3)
	-- upvalues: RoactModule (copy), SpringAnimatedItem (copy), mapValuesToPropsMiddle (copy), SpringOptions (copy), FFlagAXMigrateAXToGlobalAutofocus1 (copy), ProfilePictureEditorPageButtonModule (copy), Focusable (copy)
	return RoactModule.createElement(SpringAnimatedItem.AnimatedFrame, {
		regularProps = {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.new(1, -p2, YScale, -p2 / 2)
		},
		animatedValues = {
			xPosition = 0.5,
			yPosition = p1.state.buttonsOffscreen and p3 or 0.5
		},
		mapValuesToProps = mapValuesToPropsMiddle,
		springOptions = SpringOptions,
		onComplete = p1.onComplete
	}, {
		ProfilePictureEditorPageButton = RoactModule.createElement(if FFlagAXMigrateAXToGlobalAutofocus1 then ProfilePictureEditorPageButtonModule else Focusable[ProfilePictureEditorPageButtonModule], {
			onActivated = p1.showProfilePictureEditorCallback,
			transparencyModifier = p1.state.buttonTransparencyModifier,
			[RoactModule.Ref] = p1.profilePictureEditorPageButtonRef,
			NextSelectionUp = if FFlagAXMigrateAXToGlobalAutofocus1 then nil else p1.topFrameRef
		})
	})
end

function AvatarExperienceLandingPage.renderAvatarExperienceView(p1, p2)
	-- upvalues: DeviceOrientationMode (copy), RoactModule (copy), AvatarExperienceViewModule (copy), FFlagAXMigrateAXToGlobalAutofocus1 (copy), GetFFlagAllowAvatarLandingPageSearchModule (copy), NavigationEventsLoggerModule (copy), OnFocusExperimentExposureLoggerModule (copy), AXDisableAlwaysRenderedScreensIXPModule (copy), RoactNavigationModule (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), GamepadFocusHandlerForPageModule (copy), Focusable (copy), ConstantsModule1 (copy)
	local IsDeviceOrientationMatch = p1.props.deviceOrientation == DeviceOrientationMode.Portrait
	
	local v1: number = if IsDeviceOrientationMatch then 52 else 48
	local YScale: number = if IsDeviceOrientationMatch then 0.528 else 0.33
	local YScale1: number = if IsDeviceOrientationMatch then 0.27199999999999996 else 0.16999999999999998
	local v2: number = if IsDeviceOrientationMatch then 0.8 else 0.5
	local v3 = 1
	local NewYScale = 0.5 + (0.5 + 0.5 * v2) / YScale
	
	return RoactModule.createElement(AvatarExperienceViewModule, {
		topBar = p2 and p1:renderTopBar() or nil,
		ZIndex = 1,
		bottomBarEnabled = true,
		isSceneFullView = false,
		isUIFullView = false,
		isLandingPage = true,
		showRobuxBalance = false,
		[RoactModule.Ref] = p1.sceneUIContainerRef,
		NextSelectionLeft = if FFlagAXMigrateAXToGlobalAutofocus1 then nil elseif GetFFlagAllowAvatarLandingPageSearchModule() then p1.topBarRef else nil,
		NextSelectionDown = if FFlagAXMigrateAXToGlobalAutofocus1 then nil else p1.pageButtonsRef,
		NextSelectionUp = if FFlagAXMigrateAXToGlobalAutofocus1 then nil else p1.props.NextSelectionUp
	}, {
		NavigationEventsLogger = RoactModule.createElement(NavigationEventsLoggerModule, { pageName = "LandingPage" }),
		OnFocusExperimentExposureLogger = RoactModule.createElement(OnFocusExperimentExposureLoggerModule, {
			ixpTests = {
				if AXDisableAlwaysRenderedScreensIXPModule.isEnabled() then AXDisableAlwaysRenderedScreensIXPModule else nil
			}
		}),
		navigationEvents = RoactModule.createElement(RoactNavigationModule.NavigationEvents, {
			onWillFocus = p1.onWillFocus,
			onWillBlur = p1.onWillBlur
		}),
		GamepadFocusHandlerForPage = if FFlagAXMigrateAXToGlobalAutofocus or not p1.props.shouldCaptureFocus then nil else RoactModule.createElement(GamepadFocusHandlerForPageModule, { focusController = p1.props.focusController }),
		Buttons = RoactModule.createElement(if FFlagAXMigrateAXToGlobalAutofocus1 then "Frame" else Focusable.Frame, {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			[RoactModule.Ref] = p1.pageButtonsRef,
			NextSelectionUp = if FFlagAXMigrateAXToGlobalAutofocus1 then nil else p1.sceneUIContainerRef,
			defaultChild = if FFlagAXMigrateAXToGlobalAutofocus1 then nil else p1.topFrameRef,
			restorePreviousChildFocus = not FFlagAXMigrateAXToGlobalAutofocus1 or nil
		}, {
			TopFrame = RoactModule.createElement(if FFlagAXMigrateAXToGlobalAutofocus1 then "Frame" else Focusable.Frame, {
				Size = UDim2.new(1, 0, YScale, 0),
				Position = UDim2.new(0, 0, YScale + 0.5 - v2 / 2, 0),
				AnchorPoint = Vector2.new(0, 1),
				BackgroundTransparency = 1,
				[RoactModule.Ref] = p1.topFrameRef,
				defaultChild = if FFlagAXMigrateAXToGlobalAutofocus1 then nil else p1.avatarPageButtonRef,
				restorePreviousChildFocus = not FFlagAXMigrateAXToGlobalAutofocus1 or nil
			}, {
				LeftFrame = p1:makeLeftFrame(v3, v1, NewYScale),
				RightFrame = p1:makeRightFrame(v3, v1, NewYScale),
				uiSizeConstraint = RoactModule.createElement("UISizeConstraint", {
					MinSize = Vector2.new(0, ConstantsModule1.LandingPageMinTopFrameHeightPix)
				})
			}),
			BottomFrame = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, YScale1, 0),
				Position = UDim2.new(0, 0, 0.5 - v2 / 2 + YScale, 0)
			}, {
				MiddleFrame = p1:makeMiddleFrame(v3, v1, 0.5 + (0.5 + 0.5 * v2) / YScale1),
				uiSizeConstraint = RoactModule.createElement("UISizeConstraint", {
					MinSize = Vector2.new(0, ConstantsModule1.LandingPageMinBottomFrameHeightPix)
				})
			})
		})
	})
end

function AvatarExperienceLandingPage.renderMainView(p3)
	-- upvalues: DeviceOrientationMode (copy), RoactModule (copy), ExternalEventConnection (copy), UserInputService (copy)
	return if p3.props.deviceOrientation == DeviceOrientationMode.Portrait then p3:renderAvatarExperienceView(true) else RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		[RoactModule.Ref] = p3.props.focusNavigationBindingsRef
	}, {
		LastInputTypeChangedConnection = RoactModule.createElement(ExternalEventConnection, {
			event = UserInputService.LastInputTypeChanged,
			callback = p3.lastInputTypeChangedCallback
		}),
		TopBar = p3:renderTopBar(),
		AEView = p3:renderAvatarExperienceView(false)
	})
end

function AvatarExperienceLandingPage.render(p3)
	-- upvalues: RoactModule (copy), FFlagAXMigrateAXToGlobalAutofocus1 (copy), Focusable (copy), FFlagAXMigrateAXToGlobalAutofocus (copy)
	return RoactModule.createElement(if FFlagAXMigrateAXToGlobalAutofocus1 then "Frame" else Focusable.Frame, {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		focusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else p3.props.focusController,
		defaultChild = if FFlagAXMigrateAXToGlobalAutofocus1 then nil else p3.pageButtonsRef
	}, { p3:renderMainView() })
end

function AvatarExperienceLandingPage.didMount(p3)
	p3.isMounted = true
end

function AvatarExperienceLandingPage.didUpdate(p3, p4)
	-- upvalues: AXFixLandingPageButtonsStuckOffscreen (copy), IsAvatarRouteVisibleModule (copy)
	if AXFixLandingPageButtonsStuckOffscreen then
		local IsAvatarRouteVisibleModule1 = IsAvatarRouteVisibleModule(p4)
		local IsAvatarRouteVisibleModule2 = IsAvatarRouteVisibleModule(p3.props)
		
		if not IsAvatarRouteVisibleModule1 and IsAvatarRouteVisibleModule2 then
			p3:setState({ buttonTransparencyModifier = 0 })
			p3.transitionOnscreen()
		end
	end
end

function AvatarExperienceLandingPage.willUnmount(p3)
	p3.isFocused = false
	p3.isMounted = false
	
	if p3.luaAppReloadPageEventConnection ~= nil then
		p3.luaAppReloadPageEventConnection:disconnect()
		p3.luaAppReloadPageEventConnection = nil
	end
end

local WithStackVisibilityWrapperModuleResult = WithStackVisibilityWrapperModule((RoactRoduxModule.connect(function(p3, p4)
	return {
		avatarCategory = p3.AvatarExperience.AvatarEditor.Categories.category,
		avatarSubcategory = p3.AvatarExperience.AvatarEditor.Categories.subcategory,
		catalogCategory = p4.catalogCategory,
		catalogSubcategory = p4.catalogSubcategory,
		catalogCategoryId = p3.AvatarExperience.Catalog.Categories.categoryId,
		catalogSubcategoryId = p3.AvatarExperience.Catalog.Categories.subcategoryId,
		deviceOrientation = p3.DeviceOrientation,
		statusBarHeight = p3.TopBar.statusBarHeight
	}
end, function(Callback)
	-- upvalues: SetCategoryAndSubcategoryModule (copy), SetCategoryAndSubcategoryModule1 (copy), SetFullViewModule (copy), CatalogTilesLatencyTrackerModule (copy)
	return {
		resetAvatarCategories = function(p3)
			-- upvalues: Callback (copy), SetCategoryAndSubcategoryModule (upval)
			Callback(SetCategoryAndSubcategoryModule(1, nil, p3))
		end,
		resetCatalogCategories = function(p3)
			-- upvalues: Callback (copy), SetCategoryAndSubcategoryModule1 (upval)
			Callback(SetCategoryAndSubcategoryModule1(1, nil, p3))
		end,
		setFullView = function(p3, p4, p5)
			-- upvalues: Callback (copy), SetFullViewModule (upval)
			Callback(SetFullViewModule(p3, p4, p5))
		end,
		startPercievedCatalogTTITracker = function()
			-- upvalues: Callback (copy), CatalogTilesLatencyTrackerModule (upval)
			Callback(CatalogTilesLatencyTrackerModule.PercievedTrackingStarted())
		end
	}
end)((RoactServices.connect({
	avatarAnalytics = AnalyticsModule,
	catalogAnalytics = AnalyticsModule1,
	avatarExperienceAnalytics = AnalyticsModule3,
	profilePictureEditorAnalytics = AnalyticsModule2
})((WithLastInputGroupModule(AvatarExperienceLandingPage)))))))

return function(Tbl)
	-- upvalues: UseRegistryEntryFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), UseFirstFocusableDescendantRefFunction (copy), UseDescendantHasFocusFunction (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), ReactModule (copy), RoactGamepadModule (copy), UseOverlayClosedCallbackModule (copy), UseAvatarExperienceFocusNavigationBindingsModule (copy), UseUiModeInfoFunction (copy), UiMode (copy), FFlagEnableLeftNavOnConsole (copy), GetCatalogCategoriesStoreModule (copy), UseSignalStateFunction (copy), RoactModule (copy), WithStackVisibilityWrapperModuleResult (ref)
	local UseRegistryEntryResult = UseRegistryEntryFunction(FocusNavigableSurfaceIdentifierEnum.NavBar)
	local UseFirstFocusableDescendantRefResult = UseFirstFocusableDescendantRefFunction(UseRegistryEntryResult)
	local UseDescendantHasFocusResult = UseDescendantHasFocusFunction(UseRegistryEntryResult)
	local Copy = table.clone(Tbl)
	Copy.NextSelectionUp = if UseRegistryEntryResult then UseFirstFocusableDescendantRefResult else nil
	Copy.shouldCaptureFocus = not UseDescendantHasFocusResult
	local Current = if FFlagAXMigrateAXToGlobalAutofocus then nil else ReactModule.useRef(if Tbl.focusController then Tbl.focusController else RoactGamepadModule.createFocusController()).current
	local UseAvatarExperienceFocusNavigationBindingsModuleResult = UseAvatarExperienceFocusNavigationBindingsModule({
		overlayClosedCallback = UseOverlayClosedCallbackModule(if FFlagAXMigrateAXToGlobalAutofocus then nil else Current)
	})
	Copy.focusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else Current
	Copy.focusNavigationBindingsRef = UseAvatarExperienceFocusNavigationBindingsModuleResult
	Copy.is10ftUI = UseUiModeInfoFunction().uiMode == UiMode.TenFoot and not FFlagEnableLeftNavOnConsole
	local CatalogSelectionStore = GetCatalogCategoriesStoreModule.getCatalogSelectionStore()
	Copy.catalogCategoryId = UseSignalStateFunction(CatalogSelectionStore.selectedCategoryId)
	Copy.catalogSubcategoryId = UseSignalStateFunction(CatalogSelectionStore.selectedSubcategoryId)
	
	return RoactModule.createElement(WithStackVisibilityWrapperModuleResult, Copy)
end