local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local AvatarExperienceControlBarModule = require(CorePackages.Workspace.Packages.AvatarExperienceControlBar)
local SelectIsPortraitModule = require(Modules.AvatarExperience.Common.Selectors.selectIsPortrait)
local SelectTopBarHeightModule = require(Modules.LuaApp.Components.TopBar.Utils.selectTopBarHeight)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseAvatarRouteFunction = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.Hooks.useAvatarRoute
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local AdvancedCustomizationControlBar = AvatarExperienceControlBarModule.AdvancedCustomizationControlBar
local UndoRedoBar = AvatarExperienceControlBarModule.UndoRedoBar
local FFlagAXRootSlotBasedEditorFlag = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag
local FFlagAXResetAvatarButton = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXResetAvatarButton

return ReactModule.memo(ReactModule.forwardRef(function(Gui, Ref)
	-- upvalues: UseTokensFunction (copy), UseAvatarRouteFunction (copy), UseSelectorFunction (copy), SelectIsPortraitModule (copy), SelectTopBarHeightModule (copy), ReactModule (copy), FoundationModule (copy), AdvancedCustomizationControlBar (copy), FFlagAXRootSlotBasedEditorFlag (copy), FFlagAXResetAvatarButton (copy), UndoRedoBar (copy)
	local UseTokensResult = UseTokensFunction()
	local UseAvatarRouteResult = UseAvatarRouteFunction()
	local UseSelectorResult = UseSelectorFunction(SelectIsPortraitModule)
	local UseSelectorResult1 = UseSelectorFunction(SelectTopBarHeightModule)
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "auto-xy col gap-medium",
		ZIndex = 2,
		ref = Ref,
		Position = if UseSelectorResult then UDim2.fromOffset(UseTokensResult.Size.Size_500, UseSelectorResult1) else UDim2.new(0, UseTokensResult.Size.Size_700, 0, UseSelectorResult1 + UseTokensResult.Size.Size_500),
		NextSelectionUp = Gui.NextSelectionUp,
		NextSelectionDown = Gui.NextSelectionDown,
		NextSelectionLeft = Gui.NextSelectionLeft,
		NextSelectionRight = Gui.NextSelectionRight
	}, {
		AdvancedCustomizationControlBar = ReactModule.createElement(AdvancedCustomizationControlBar, { LayoutOrder = 1, avatarRoute = UseAvatarRouteResult }),
		UndoRedoBar = if FFlagAXRootSlotBasedEditorFlag and not FFlagAXResetAvatarButton and not Gui.hideUndoRedo then ReactModule.createElement(UndoRedoBar, { direction = "vertical", LayoutOrder = 2 }) else nil
	})
end))