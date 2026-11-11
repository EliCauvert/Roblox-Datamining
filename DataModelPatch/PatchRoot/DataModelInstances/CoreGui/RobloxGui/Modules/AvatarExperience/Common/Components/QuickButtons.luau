local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local ReactModule = require(CorePackages.Packages.React)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local AvatarScreenProperties = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.AvatarScreenProperties
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local AvatarExperienceNavigationModule = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local UseAvatarRouteFunction = AvatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local SelectColorAdjustmentButtonColor = AvatarExperienceCommonModule.State.Selectors.selectColorAdjustmentButtonColor
local SelectShowColorQuickButton = if require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXColorAdjustmentButtonShouldAccountForTryOns then AvatarExperienceCommonModule.State.Selectors.selectShowColorQuickButton else require(Modules.AvatarExperience.Common.Selectors.selectShowColorQuickButton)
local UseTokensFunction = require(CorePackages.Packages.Foundation).Hooks.useTokens
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseNavigationFocusFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigationFocus
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseAppPolicyModule = require(Modules.LuaApp.Hooks.useAppPolicy)
local SelectIsPortraitModule = require(Modules.AvatarExperience.Common.Selectors.selectIsPortrait)
local SelectTopBarHeight = require(Modules.LuaApp.Components.TopBar.TopBar).selectTopBarHeight
local GetUseSelectorDeepEqualsFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals
local SetSelectedAccessoryModule = require(Modules.AvatarExperience.AccessoryAdjustment.Actions.SetSelectedAccessory)
local SetEntryPageModule = require(Modules.AvatarExperience.LayeredClothingSort.Actions.SetEntryPage)
local GetFFlagAXFixAccessoryAdjustmentAnalyticsEntryPageModule = require(Modules.AvatarExperience.Flags.GetFFlagAXFixAccessoryAdjustmentAnalyticsEntryPage)
local UseAccessoryAdjustmentQuickButtonDuringTryOnModule = require(Modules.AvatarExperience.Common.Hooks.useAccessoryAdjustmentQuickButtonDuringTryOn)
local RefinementEntryButtonModule = require(Modules.AvatarExperience.AvatarRefinement.Components.RefinementEntryButton)
local ColorAdjustmentEntryButtonModule = require(Modules.AvatarExperience.Common.Components.ColorAdjustmentEntryButton)
local AccessoryAdjustmentEntryButtonModule = require(Modules.AvatarExperience.Common.Components.AccessoryAdjustmentEntryButton)
local UniversalAppCameraToggleModule = require(Modules.AvatarExperience.UniversalAppCamera.Components.UniversalAppCameraToggle)
local AXProfilePictureQuickButtonModule = require(Modules.AvatarExperience.Common.Components.AXProfilePictureQuickButton)
local IsVRAppBuildFunction = require(CorePackages.Workspace.Packages.AppCommonLib).IsVRAppBuild
local UseUiModeInfoFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useUiModeInfo
local UiMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).UiMode
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local IxpUtilsModule = require(CorePackages.Workspace.Packages.IxpUtils)
local AXAlternateLandingPageIXPModule = require(Modules.AvatarExperience.Flags.AXAlternateLandingPageIXP)
local UniversalAppCameraIXPTestModule = require(Modules.AvatarExperience.Flags.UniversalAppCameraIXPTest)
local AXRecentlyViewedSearchItemsIXPTest = AvatarExperienceCommonModule.Experiments.AXRecentlyViewedSearchItemsIXPTest
local GetFFlagCleanUpAXAlternativeLandingPageIXPModule = require(Modules.AvatarExperience.Flags.GetFFlagCleanUpAXAlternativeLandingPageIXP)
local AXEnableAccessoryAdjustmentDuringTryOnIXP = require(CorePackages.Workspace.Packages.AvatarExperienceExperiments).AXEnableAccessoryAdjustmentDuringTryOnIXP
local GetCatalogCategoriesStoreModule = require(Modules.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore)

local function ProfilePictureQuickButton(p1)
	-- upvalues: ReactModule (copy), AXProfilePictureQuickButtonModule (copy)
	return ReactModule.createElement(AXProfilePictureQuickButtonModule, {
		isUIFullView = p1.isUIFullView,
		isSceneFullView = p1.isSceneFullView,
		layoutOrder = p1.layoutOrder,
		ref = p1.profilePictureButtonRef,
		NextSelectionLeft = p1.NextSelectionLeft,
		NextSelectionDown = p1.refinementButtonsRef
	})
end

local function RefinementEntryQuickButton(Gui)
	-- upvalues: UseAvatarRouteFunction (copy), GetFFlagCleanUpAXAlternativeLandingPageIXPModule (copy), UseUiModeInfoFunction (copy), UiMode (copy), AvatarScreenProperties (copy), IxpUtilsModule (copy), AXAlternateLandingPageIXPModule (copy), ReactModule (copy), RefinementEntryButtonModule (copy)
	local IsUiModeMatch = if GetFFlagCleanUpAXAlternativeLandingPageIXPModule() then UseUiModeInfoFunction().uiMode == UiMode.TenFoot else nil
	local AvatarScreenProperty = AvatarScreenProperties[UseAvatarRouteFunction().opaque.name]
	local NoIsUiModeMatch = if GetFFlagCleanUpAXAlternativeLandingPageIXPModule() then not IsUiModeMatch else IxpUtilsModule.useTestVariables(AXAlternateLandingPageIXPModule.EnabledForUser)
	
	return (if AvatarScreenProperty then not AvatarScreenProperty.isRefinementPage else false) and ReactModule.createElement(RefinementEntryButtonModule, {
		layoutOrder = Gui.layoutOrder,
		ref = Gui.refinementButtonsRef,
		NextSelectionUp = if NoIsUiModeMatch then Gui.profilePictureButtonRef else nil,
		NextSelectionLeft = Gui.NextSelectionLeft,
		NextSelectionDown = Gui.NextSelectionDown
	})
end

local function CameraQuickButton(p1)
	-- upvalues: IxpUtilsModule (copy), UniversalAppCameraIXPTestModule (copy), GetCatalogCategoriesStoreModule (copy), UseSignalStateFunction (copy), IsVRAppBuildFunction (copy), ReactModule (copy), UniversalAppCameraToggleModule (copy)
	local UseTestVariablesResult = IxpUtilsModule.useTestVariables(UniversalAppCameraIXPTestModule.EnabledForUser)
	local UseSignalStateResult = UseSignalStateFunction(GetCatalogCategoriesStoreModule.getCatalogSelectionStore().selectedCategoryInfo)
	
	return if UseTestVariablesResult and not IsVRAppBuildFunction() then ReactModule.createElement(UniversalAppCameraToggleModule, {
		isUIFullView = p1.isUIFullView,
		isSceneFullView = p1.isSceneFullView,
		layoutOrder = p1.layoutOrder,
		selectedCategoryInfo = UseSignalStateResult
	}) else nil
end

return (ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: AXRecentlyViewedSearchItemsIXPTest (copy), UseTokensFunction (copy), UseAvatarRouteFunction (copy), UseNavigationFunction (copy), UseDispatchFunction (copy), UseNavigationFocusFunction (copy), GetFFlagCleanUpAXAlternativeLandingPageIXPModule (copy), UseUiModeInfoFunction (copy), UiMode (copy), UtilsModule (copy), UseAppPolicyModule (copy), UseSelectorFunction (copy), SelectIsPortraitModule (copy), GetUseSelectorDeepEqualsFunction (copy), SelectTopBarHeight (copy), SelectShowColorQuickButton (copy), SelectColorAdjustmentButtonColor (copy), ReactModule (copy), AvatarScreen (copy), AXEnableAccessoryAdjustmentDuringTryOnIXP (copy), UseAccessoryAdjustmentQuickButtonDuringTryOnModule (copy), GetFFlagAXFixAccessoryAdjustmentAnalyticsEntryPageModule (copy), SetEntryPageModule (copy), SetSelectedAccessoryModule (copy), ConstantsModule (copy), IxpUtilsModule (copy), AXAlternateLandingPageIXPModule (copy), RoactGamepadModule (copy), ProfilePictureQuickButton (copy), CryoModule (copy), RefinementEntryQuickButton (copy), CameraQuickButton (copy), ColorAdjustmentEntryButtonModule (copy), AccessoryAdjustmentEntryButtonModule (copy)
	local UseTokensResult = if AXRecentlyViewedSearchItemsIXPTest.isEnabled() then UseTokensFunction() else nil
	local UseAvatarRouteResult = UseAvatarRouteFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseDispatchResult = UseDispatchFunction()
	local IsUiModeMatch = if GetFFlagCleanUpAXAlternativeLandingPageIXPModule() then UseUiModeInfoFunction().uiMode == UiMode.TenFoot else nil
	local Name = UseAvatarRouteResult.opaque.name
	local IsAvatarSceneButtonsVisible = UtilsModule.isAvatarSceneButtonsVisible(UseAvatarRouteResult, UseNavigationFocusFunction(), p1.isUIFullView, p1.isSceneFullView, UseNavigationResult)
	local UseAppPolicyModuleResult = UseAppPolicyModule(function(p2)
		return p2.getAllowCameraMovements()
	end)
	local UseSelectorResult = UseSelectorFunction(SelectIsPortraitModule, GetUseSelectorDeepEqualsFunction())
	local UseSelectorResult1: number = UseSelectorFunction(SelectTopBarHeight, GetUseSelectorDeepEqualsFunction())
	local UseSelectorResult2 = UseSelectorFunction(SelectShowColorQuickButton, GetUseSelectorDeepEqualsFunction())
	local UseSelectorResult3 = UseSelectorFunction(SelectColorAdjustmentButtonColor, GetUseSelectorDeepEqualsFunction())
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseNavigationResult (copy), AvatarScreen (upval)
		UseNavigationResult.navigate(AvatarScreen.ColorAdjustment)
	end, { UseNavigationResult })
	local ShouldEnableAccessoryAdjustmentDuringTryOn = nil
	local AdjustableLastTryOnItemId = nil
	local AccessoryAdjustmentQuickButtonFtux = nil
	
	if AXEnableAccessoryAdjustmentDuringTryOnIXP.isEnabled() then
		local UseAccessoryAdjustmentQuickButtonDuringTryOnModuleResult = UseAccessoryAdjustmentQuickButtonDuringTryOnModule()
		ShouldEnableAccessoryAdjustmentDuringTryOn = UseAccessoryAdjustmentQuickButtonDuringTryOnModuleResult.shouldEnableAccessoryAdjustmentDuringTryOn
		AdjustableLastTryOnItemId = UseAccessoryAdjustmentQuickButtonDuringTryOnModuleResult.adjustableLastTryOnItemId
		AccessoryAdjustmentQuickButtonFtux = UseAccessoryAdjustmentQuickButtonDuringTryOnModuleResult.accessoryAdjustmentQuickButtonFtux
	end
	local UseResult1 = if AXEnableAccessoryAdjustmentDuringTryOnIXP.isEnabled() then ReactModule.useCallback(function()
		-- upvalues: AccessoryAdjustmentQuickButtonFtux (ref), GetFFlagAXFixAccessoryAdjustmentAnalyticsEntryPageModule (upval), UseDispatchResult (copy), SetEntryPageModule (upval), Name (copy), UseNavigationResult (copy), AvatarScreen (upval), SetSelectedAccessoryModule (upval), AdjustableLastTryOnItemId (ref)
		if AccessoryAdjustmentQuickButtonFtux and AccessoryAdjustmentQuickButtonFtux.shouldShowFirstTimeGlow() then
			AccessoryAdjustmentQuickButtonFtux.completeFirstTimeGlow()
		end
		if GetFFlagAXFixAccessoryAdjustmentAnalyticsEntryPageModule() then
			UseDispatchResult(SetEntryPageModule(Name))
		end
		UseNavigationResult.navigate(AvatarScreen.AdjustAccessoryView, { fromRoute = Name })
		UseDispatchResult(SetSelectedAccessoryModule(AdjustableLastTryOnItemId))
	end, {
		UseNavigationResult,
		AdjustableLastTryOnItemId,
		Name,
		AccessoryAdjustmentQuickButtonFtux
	}) else nil
	local NoIsUiModeMatch = if GetFFlagCleanUpAXAlternativeLandingPageIXPModule() then not IsUiModeMatch else IxpUtilsModule.useTestVariables(AXAlternateLandingPageIXPModule.EnabledForUser)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseRefResult3 = if AXEnableAccessoryAdjustmentDuringTryOnIXP.isEnabled() then ReactModule.useRef(nil) else nil
	
	return ReactModule.createElement(RoactGamepadModule.Focusable.Frame, {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.Y,
		Position = UDim2.new(if UseSelectorResult then 0 else ConstantsModule.LandscapeNavWidth, if AXRecentlyViewedSearchItemsIXPTest.isEnabled() and Name == AvatarScreen.SearchLandingFocusedWidgetPage and UseTokensResult and UseSelectorResult then UseTokensResult.Size.Size_400 else 24, 0, UseSelectorResult1 + 4),
		Size = UDim2.fromOffset(44, 0),
		Visible = IsAvatarSceneButtonsVisible,
		ref = Ref,
		defaultChild = if NoIsUiModeMatch and (Name == AvatarScreen.AvatarEditor or Name == AvatarScreen.Catalog) then UseRefResult else UseRefResult1
	}, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 4)
		}),
		ProfilePictureButton = if NoIsUiModeMatch and UseAppPolicyModuleResult then ReactModule.createElement(ProfilePictureQuickButton, CryoModule.Dictionary.join(p1, {
			layoutOrder = 1,
			profilePictureButtonRef = UseRefResult,
			refinementButtonsRef = UseRefResult1
		})) else nil,
		RefinementEntryButton = ReactModule.createElement(RefinementEntryQuickButton, CryoModule.Dictionary.join(p1, {
			layoutOrder = 2,
			profilePictureButtonRef = UseRefResult,
			refinementButtonsRef = UseRefResult1,
			NextSelectionDown = if UseSelectorResult2 then UseRefResult2 elseif ShouldEnableAccessoryAdjustmentDuringTryOn and AdjustableLastTryOnItemId then UseRefResult3 else nil
		})),
		UniversalAppCameraButton = ReactModule.createElement(CameraQuickButton, CryoModule.Dictionary.join(p1, { layoutOrder = 3 })),
		ColorAdjustmentQuickButton = if UseSelectorResult2 then ReactModule.createElement(ColorAdjustmentEntryButtonModule, {
			LayoutOrder = 4,
			colors = { UseSelectorResult3 },
			onActivated = UseResult,
			ref = UseRefResult2,
			NextSelectionUp = UseRefResult1,
			NextSelectionLeft = p1.NextSelectionLeft
		}) else nil,
		AccessoryAdjustmentButton = if ShouldEnableAccessoryAdjustmentDuringTryOn and UseAvatarRouteResult.opaque.name == AvatarScreen.Catalog and AdjustableLastTryOnItemId then ReactModule.createElement(AccessoryAdjustmentEntryButtonModule, {
			LayoutOrder = 5,
			colors = { UseSelectorResult3 },
			onActivated = UseResult1,
			ref = UseRefResult3,
			NextSelectionUp = UseRefResult1,
			NextSelectionLeft = p1.NextSelectionLeft,
			enableFocusAnimation = AccessoryAdjustmentQuickButtonFtux and AccessoryAdjustmentQuickButtonFtux.shouldShowFirstTimeGlow()
		}) else nil
	})
end))