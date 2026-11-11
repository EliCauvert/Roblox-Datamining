local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local Focusable = RoactGamepadModule.Focusable
local AvatarExperienceHeadRefinementModule = require(CorePackages.Workspace.Packages.AvatarExperienceHeadRefinement)
local RobloxAppHooksModule = require(CorePackages.Workspace.Packages.RobloxAppHooks)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local FFlagRenameDeprecatedUIBloxTokens = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local UseTokensFunction = require(CorePackages.Packages.Foundation).Hooks.useTokens
local UseTopBarHeightFunction = RobloxAppHooksModule.useTopBarHeight
local UseDeviceOrientationFunction = RobloxAppHooksModule.useDeviceOrientation
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local UseHeadRefinementPagePropsModule = require(script.Parent.Hooks.useHeadRefinementPageProps)
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local GetMappedStyleTokensFunction = AvatarExperienceHeadRefinementModule.Utils.getMappedStyleTokens
local GetHeadShapeListHeightFunction = AvatarExperienceHeadRefinementModule.Utils.getHeadShapeListHeight
local SelectIsPortraitModule = require(Modules.AvatarExperience.Common.Selectors.selectIsPortrait)
local GetFoundationMappedStyleTokensFunction = AvatarExperienceHeadRefinementModule.Utils.getFoundationMappedStyleTokens
local HeadShapePicker = AvatarExperienceHeadRefinementModule.Features.HeadShapePicker
local GamepadFocusHandlerForPageModule = require(Modules.AvatarExperience.Common.Components.GamepadFocusHandlerForPage)
local SceneInteractionFrameModule = require(Modules.AvatarExperience.Common.Components.Scene.SceneInteractionFrame)
local TopBarModule = require(Modules.LuaApp.Components.TopBar.TopBar)
local RefinementNavBarModule = require(Modules.AvatarExperience.AvatarRefinement.Components.RefinementNavBar)
local RefinementControlBarModule = require(Modules.AvatarExperience.AvatarRefinement.Components.RefinementControlBar)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagHeadRefinementFacialAnimationToggle = AvatarExperienceFlagsModule.FFlagHeadRefinementFacialAnimationToggle
local GetFFlagAXEnableSlotBasedEditorModule = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor)
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local FFlagAXEnableResponsiveHeadRefinementMenu = AvatarExperienceFlagsModule.FFlagAXEnableResponsiveHeadRefinementMenu
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local AXHeadRefinementResizeFix = game:DefineFastFlag("AXHeadRefinementResizeFix", false)
local DeviceOrientationMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode

local function selectGlobalGuiInset(p1)
	return p1.GlobalGuiInset
end

local function selectScreenSize(p1)
	return p1.ScreenSize
end

return (require(Modules.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper)((require(Modules.AvatarExperience.Common.Components.RoactNavigation.withAppRoute)(function(p1)
	-- upvalues: UseDesignTokensFunction (copy), FFlagAXEnableResponsiveHeadRefinementMenu (copy), UseTokensFunction (copy), GetFoundationMappedStyleTokensFunction (copy), GetMappedStyleTokensFunction (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), RoactGamepadModule (copy), UseLocalizationFunction (copy), UseSelectorFunction (copy), SelectIsPortraitModule (copy), selectGlobalGuiInset (copy), AXHeadRefinementResizeFix (copy), DeviceOrientationMode (copy), UseDeviceOrientationFunction (copy), UseTopBarHeightFunction (copy), ReactModule (copy), UseHeadRefinementPagePropsModule (copy), selectScreenSize (copy), GetHeadShapeListHeightFunction (copy), GetFFlagAXEnableSlotBasedEditorModule (copy), AvatarScreen (copy), Focusable (copy), GamepadFocusHandlerForPageModule (copy), TopBarModule (copy), RefinementControlBarModule (copy), RefinementNavBarModule (copy), SceneInteractionFrameModule (copy), FFlagRenameDeprecatedUIBloxTokens (copy), HeadShapePicker (copy), FFlagHeadRefinementFacialAnimationToggle (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseTokensResult = if FFlagAXEnableResponsiveHeadRefinementMenu then UseTokensFunction() else nil
	local FoundationMappedStyleTokens = if FFlagAXEnableResponsiveHeadRefinementMenu then GetFoundationMappedStyleTokensFunction(UseTokensResult) else GetMappedStyleTokensFunction(UseDesignTokensResult)
	local UseRootFocusControllerResult = if FFlagAXMigrateAXToGlobalAutofocus then nil else RoactGamepadModule.useRootFocusController()
	local UseLocalizationResult = UseLocalizationFunction({
		topBarTitle = "Feature.Avatar.Label.HeadRefinement.Adjust.Title"
	})
	local UseSelectorResult = UseSelectorFunction(SelectIsPortraitModule)
	local UseSelectorResult1 = UseSelectorFunction(selectGlobalGuiInset)
	local Portrait = if AXHeadRefinementResizeFix then if UseSelectorResult then DeviceOrientationMode.Portrait else DeviceOrientationMode.Landscape else UseDeviceOrientationFunction() or DeviceOrientationMode.Portrait
	local UseTopBarHeightResult = UseTopBarHeightFunction()
	local NewLargeTileContainerSize = FoundationMappedStyleTokens.largeTileContainerSize * 4 + FoundationMappedStyleTokens.tileListPaddingBetweenItems * 3 + FoundationMappedStyleTokens.tileListPaddingLeft + FoundationMappedStyleTokens.tileListPaddingRight
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseHeadRefinementPagePropsModuleResult, UseHeadRefinementPagePropsModuleResult2, UseHeadRefinementPagePropsModuleResult3, UseHeadRefinementPagePropsModuleResult4, UseHeadRefinementPagePropsModuleResult5 = UseHeadRefinementPagePropsModule()
	local HeadShapeListHeight = if FFlagAXEnableResponsiveHeadRefinementMenu then GetHeadShapeListHeightFunction({
		tokens = UseTokensResult,
		itemCount = if UseHeadRefinementPagePropsModuleResult then #UseHeadRefinementPagePropsModuleResult else 0,
		availableViewportHeight = UseSelectorFunction(selectScreenSize).Y - UseTopBarHeightResult - UseSelectorResult1.bottom
	}) else nil
	
	return ReactModule.createElement(Focusable.Frame, {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		focusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else UseRootFocusControllerResult,
		defaultChild = UseRefResult
	}, {
		GamepadFocusHandlerForPage = if FFlagAXMigrateAXToGlobalAutofocus then nil else ReactModule.createElement(GamepadFocusHandlerForPageModule, {
			captureFocusOnMount = true,
			focusController = UseRootFocusControllerResult
		}),
		HeadRefinementPageTopBar = ReactModule.createElement(TopBarModule.Container, {
			transparentBackground = true,
			ZIndex = 3,
			titleText = UseLocalizationResult.topBarTitle,
			leftItem = TopBarModule.makeBackButton(function()
				-- upvalues: GetFFlagAXEnableSlotBasedEditorModule (upval), p1 (copy), AvatarScreen (upval)
				if GetFFlagAXEnableSlotBasedEditorModule() then
					p1.navigation.pop()
					
					return
				else
					p1.navigation.navigate(AvatarScreen.AvatarRefinement)
				end
			end),
			ref = UseRefResult,
			NextSelectionDown = UseRefResult1
		}),
		RefinementNavBar = if UseSelectorResult then ReactModule.createElement(if GetFFlagAXEnableSlotBasedEditorModule() then RefinementControlBarModule else RefinementNavBarModule, {}) else nil,
		HeadRefinementPageContainer = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, -UseTopBarHeightResult + UseSelectorResult1.bottom),
			Position = UDim2.fromOffset(0, UseTopBarHeightResult)
		}, {
			HeadShapePickerUIListLayout = if AXHeadRefinementResizeFix or not UseSelectorResult then nil else ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Bottom
			}),
			HeadRefinementPageSceneInteractionFrame = ReactModule.createElement(SceneInteractionFrameModule),
			HeadRefinementPageControlPanel = ReactModule.createElement(Focusable.Frame, {
				BackgroundTransparency = 1,
				ZIndex = 3,
				AnchorPoint = if UseSelectorResult then Vector2.new(0, 1) else Vector2.new(0, 0.5),
				Position = if UseSelectorResult then UDim2.new(0, 0, 1, 0) else UDim2.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_900 else UseDesignTokensResult.Global.Size_450, 0.5, 0),
				Size = if UseSelectorResult then UDim2.new(1, 0, 0, 0) else UDim2.new(0, NewLargeTileContainerSize, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				HeadShapePicker = ReactModule.createElement(Focusable[HeadShapePicker], {
					isUnsupported = UseHeadRefinementPagePropsModuleResult2,
					items = UseHeadRefinementPagePropsModuleResult,
					orientation = Portrait,
					tileSize = if Portrait == DeviceOrientationMode.Portrait then "small" else "large",
					isLoading = UseHeadRefinementPagePropsModuleResult3,
					containerRef = UseRefResult1,
					NextSelectionUp = UseRefResult,
					isFacialAnimationEnabled = if FFlagHeadRefinementFacialAnimationToggle then UseHeadRefinementPagePropsModuleResult4 else nil,
					onFacialAnimationToggle = if FFlagHeadRefinementFacialAnimationToggle then UseHeadRefinementPagePropsModuleResult5 else nil,
					headShapeListMaxHeight = if FFlagAXEnableResponsiveHeadRefinementMenu and Portrait == DeviceOrientationMode.Landscape then HeadShapeListHeight else nil
				}),
				HeadRefinementPageBottomFiller = if UseSelectorResult then ReactModule.createElement("Frame", {
					BorderSizePixel = 0,
					Size = if AXHeadRefinementResizeFix then UDim2.new(1, 0, 0, UseSelectorResult1.bottom) else UDim2.new(1, 0, 1, 0),
					Position = if AXHeadRefinementResizeFix then UDim2.new(0, 0, 1, 0) else UDim2.new(0, 0, 0, UseSelectorResult1.bottom),
					BackgroundColor3 = (if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Color.Surface.Surface_0 else UseDesignTokensResult.Semantic.Color.Background.Default).Color3,
					BackgroundTransparency = (if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Color.Surface.Surface_0 else UseDesignTokensResult.Semantic.Color.Background.Default).Transparency,
					ZIndex = if AXHeadRefinementResizeFix then 0 else nil
				}) else nil
			})
		})
	})
end))))