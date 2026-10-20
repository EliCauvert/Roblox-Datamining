local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local Focusable = RoactGamepadModule.Focusable
local DeviceOrientationMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode
local TopBarModule = require(Modules.LuaApp.Components.TopBar.TopBar)
local RefinementNavBarModule = require(Modules.AvatarExperience.AvatarRefinement.Components.RefinementNavBar)
local GamepadFocusHandlerForPageModule = require(Modules.AvatarExperience.Common.Components.GamepadFocusHandlerForPage)
local SetFullViewModule = require(Modules.AvatarExperience.Common.Thunks.SetFullView)
local FullView = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Enums.FullView
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local AnalyticsModule = require(Modules.AvatarExperience.Common.Services.Analytics)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local UnlockCharacterUpdatesModule = require(Modules.AvatarExperience.LayeredClothingSort.Actions.UnlockCharacterUpdates)
local RefinementControlBarModule = require(Modules.AvatarExperience.AvatarRefinement.Components.RefinementControlBar)
local SceneGamepadHandlerModule = require(Modules.AvatarExperience.Common.Components.Scene.SceneGamepadHandler)
local GetFFlagAXEnableSlotBasedEditorModule = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor)
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local FFlagAXMigrateSceneGamepadHandlerInputBindings = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateSceneGamepadHandlerInputBindings

local function selectIsPortrait(p1): boolean
	-- upvalues: DeviceOrientationMode (copy)
	return p1.DeviceOrientation == DeviceOrientationMode.Portrait
end

return (require(Modules.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper)((require(Modules.AvatarExperience.Common.Components.RoactNavigation.withAppRoute)(function(p1)
	-- upvalues: FFlagAXMigrateAXToGlobalAutofocus (copy), RoactGamepadModule (copy), ReactModule (copy), UseSelectorFunction (copy), selectIsPortrait (copy), UseDispatchFunction (copy), UseRoactServiceModule (copy), AnalyticsModule (copy), UseLocalizationFunction (copy), SetFullViewModule (copy), AvatarScreen (copy), FullView (copy), UnlockCharacterUpdatesModule (copy), TopBarModule (copy), RoactModule (copy), GetFFlagAXEnableSlotBasedEditorModule (copy), RefinementControlBarModule (copy), RefinementNavBarModule (copy), GamepadFocusHandlerForPageModule (copy), Focusable (copy), FFlagAXMigrateSceneGamepadHandlerInputBindings (copy), SceneGamepadHandlerModule (copy)
	local UseRootFocusControllerResult = if FFlagAXMigrateAXToGlobalAutofocus then nil else RoactGamepadModule.useRootFocusController()
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseSelectorResult = UseSelectorFunction(selectIsPortrait)
	local UseDispatchResult: (any) -> () = UseDispatchFunction()
	local UseRoactServiceModuleResult = UseRoactServiceModule(AnalyticsModule)
	local UseLocalizationResult = UseLocalizationFunction({ titleText = "Feature.Avatar.Title.AvatarRefinement" })
	UseDispatchResult(SetFullViewModule(UseRoactServiceModuleResult, AvatarScreen.AvatarRefinement, FullView.SceneFullView))
	ReactModule.useEffect(function()
		-- upvalues: UseDispatchResult (copy), UnlockCharacterUpdatesModule (upval)
		return function()
			-- upvalues: UseDispatchResult (upval), UnlockCharacterUpdatesModule (upval)
			UseDispatchResult(UnlockCharacterUpdatesModule())
		end
	end, {})
	local config = {
		TopBar = ReactModule.createElement(TopBarModule.Container, {
			titleText = UseLocalizationResult.titleText,
			NextSelectionDown = UseRefResult,
			transparentBackground = true,
			hideSiteMessageBanner = UseSelectorResult,
			leftItem = TopBarModule.makeBackButton(function()
				-- upvalues: UseDispatchResult (copy), UnlockCharacterUpdatesModule (upval), p1 (copy)
				UseDispatchResult(UnlockCharacterUpdatesModule())
				p1.navigation.pop()
			end),
			[RoactModule.Ref] = UseRefResult1
		}),
		RefinementNavBar = ReactModule.createElement(if GetFFlagAXEnableSlotBasedEditorModule() then RefinementControlBarModule else RefinementNavBarModule, { ref = UseRefResult, NextSelectionUp = UseRefResult1 }),
		GamepadFocusHandlerForPage = if FFlagAXMigrateAXToGlobalAutofocus then nil else ReactModule.createElement(GamepadFocusHandlerForPageModule, {
			captureFocusOnMount = true,
			focusController = UseRootFocusControllerResult
		})
	}
	
	return ReactModule.createElement(Focusable.Frame, {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		focusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else UseRootFocusControllerResult,
		defaultChild = UseRefResult
	}, if FFlagAXMigrateSceneGamepadHandlerInputBindings then ReactModule.createElement(SceneGamepadHandlerModule, nil, config) else config)
end))))