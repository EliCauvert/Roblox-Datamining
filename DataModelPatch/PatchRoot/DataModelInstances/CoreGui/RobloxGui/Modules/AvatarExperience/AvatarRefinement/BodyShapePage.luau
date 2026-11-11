local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local Focusable = RoactGamepadModule.Focusable
local FoundationModule = require(CorePackages.Packages.Foundation)
local FFlagRenameDeprecatedUIBloxTokens = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local UseTopBarHeightFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useTopBarHeight
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local DebounceModule = require(Modules.LuaApp.Util.debounce)
local SelectIsPortraitModule = require(Modules.AvatarExperience.Common.Selectors.selectIsPortrait)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local GamepadFocusHandlerForPageModule = require(Modules.AvatarExperience.Common.Components.GamepadFocusHandlerForPage)
local SceneInteractionFrameModule = require(Modules.AvatarExperience.Common.Components.Scene.SceneInteractionFrame)
local TopBarModule = require(Modules.LuaApp.Components.TopBar.TopBar)
local RefinementControlBarModule = require(Modules.AvatarExperience.AvatarRefinement.Components.RefinementControlBar)
local ScalesPageModule = require(Modules.AvatarExperience.AvatarEditor.Components.ScalesPage)
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local NewPeekHeaderHeight = ConstantsModule.PeekHeaderHeight + ConstantsModule.MainNavHeight + ConstantsModule.SubNavHeight

return (require(Modules.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper)(function()
	-- upvalues: UseTokensFunction (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), RoactGamepadModule (copy), ReactModule (copy), UseSelectorFunction (copy), SelectIsPortraitModule (copy), UseTopBarHeightFunction (copy), UseNavigationFunction (copy), UseLocalizationFunction (copy), DebounceModule (copy), Focusable (copy), FFlagRenameDeprecatedUIBloxTokens (copy), ScalesPageModule (copy), FoundationModule (copy), NewPeekHeaderHeight (copy), GamepadFocusHandlerForPageModule (copy), TopBarModule (copy), RefinementControlBarModule (copy), SceneInteractionFrameModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseRootFocusControllerResult = if FFlagAXMigrateAXToGlobalAutofocus then nil else RoactGamepadModule.useRootFocusController()
	local UseStateResult, UseStateResult2 = ReactModule.useState(true)
	local UseSelectorResult = UseSelectorFunction(SelectIsPortraitModule)
	local UseTopBarHeightResult = UseTopBarHeightFunction()
	local UseNavigationResult = UseNavigationFunction()
	local FeatureAvatarLabelTitleBodyShape = UseLocalizationFunction({ title = "Feature.Avatar.Label.Title.BodyShape" })
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(true)
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, {})
	local UseResult2 = ReactModule.useCallback(DebounceModule(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(true)
	end, 1), {})
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), UseResult2 (copy)
		UseStateResult2(false)
		UseResult2()
	end, { UseResult2 })
	
	local function renderLandscapeBodyShapePanel()
		-- upvalues: ReactModule (upval), Focusable (upval), FFlagRenameDeprecatedUIBloxTokens (upval), UseTokensResult (copy), UseTopBarHeightResult (copy), ScalesPageModule (upval), UseResult1 (copy), UseResult (copy), UseResult3 (copy), UseRefResult (copy)
		return ReactModule.createElement(Focusable.Frame, {
			ZIndex = 2,
			BackgroundColor3 = (if FFlagRenameDeprecatedUIBloxTokens then UseTokensResult.Color.Surface.Surface_0 else UseTokensResult.Semantic.Color.Background.Default).Color3,
			Position = UDim2.fromOffset(UseTokensResult.Size.Size_2400, UseTopBarHeightResult + UseTokensResult.Size.Size_500),
			Size = UDim2.new(0.5, -UseTokensResult.Size.Size_2400, 0.8, 0)
		}, {
			CornerRadius = ReactModule.createElement("UICorner", {
				CornerRadius = UDim.new(0, UseTokensResult.Size.Size_200)
			}),
			ScalesPage = ReactModule.createElement(ScalesPageModule, {
				enableNavigation = true,
				lockNavigationCallback = UseResult1,
				unlockNavigationCallback = UseResult,
				onCanvasPositionChanged = UseResult3,
				NextSelectionUp = UseRefResult
			})
		})
	end
	
	local function renderPortraitBodyShapePanel()
		-- upvalues: ReactModule (upval), FoundationModule (upval), UseStateResult (copy), ScalesPageModule (upval), UseResult1 (copy), UseResult (copy), NewPeekHeaderHeight (upval)
		return ReactModule.createElement(FoundationModule.View, { tag = "size-full-full", ZIndex = 2 }, {
			ScalesPageContainer = ReactModule.createElement(FoundationModule.ScrollView, {
				tag = "bg-surface-0 anchor-bottom-left position-bottom-left auto-xy",
				scroll = {
					ScrollingDirection = Enum.ScrollingDirection.Y,
					AutomaticCanvasSize = Enum.AutomaticSize.Y
				},
				Size = UDim2.new(1, 0, 0.4, 0),
				isDisabled = not UseStateResult
			}, {
				ScalesPage = ReactModule.createElement(ScalesPageModule, {
					lockNavigationCallback = UseResult1,
					unlockNavigationCallback = UseResult,
					enableNavigation = UseStateResult
				})
			}),
			BodyShapePageBottomFiller = ReactModule.createElement(FoundationModule.View, {
				tag = "bg-surface-0 position-bottom-left",
				Size = UDim2.new(1, 0, 0, NewPeekHeaderHeight)
			})
		})
	end
	
	return ReactModule.createElement(Focusable.Frame, {
		BackgroundTransparency = 1,
		inputBindings = nil,
		Size = UDim2.fromScale(1, 1),
		focusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else UseRootFocusControllerResult,
		defaultChild = UseRefResult
	}, {
		GamepadFocusHandlerForPage = if FFlagAXMigrateAXToGlobalAutofocus then nil else ReactModule.createElement(GamepadFocusHandlerForPageModule, {
			captureFocusOnMount = true,
			focusController = UseRootFocusControllerResult
		}),
		BodyShapePageTopBar = ReactModule.createElement(TopBarModule.Container, {
			transparentBackground = true,
			ZIndex = 3,
			titleText = FeatureAvatarLabelTitleBodyShape.title,
			leftItem = TopBarModule.makeBackButton(function()
				-- upvalues: UseNavigationResult (copy)
				UseNavigationResult.pop()
			end),
			ref = UseRefResult,
			NextSelectionDown = UseRefResult1
		}),
		RefinementControlBar = ReactModule.createElement(RefinementControlBarModule),
		BodyShapePageSceneInteractionFrame = if UseStateResult then ReactModule.createElement(SceneInteractionFrameModule) else nil,
		BodyShapePageControlPanel = if UseSelectorResult then renderPortraitBodyShapePanel() else renderLandscapeBodyShapePanel()
	})
end))