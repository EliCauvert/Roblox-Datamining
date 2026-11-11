local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local AvatarExperienceNavigationModule = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local UseAvatarRouteFunction = AvatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local Selectors = require(CorePackages.Workspace.Packages.NavigationRodux).Selectors
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseSelectionCursorFunction = UIBloxModule.App.SelectionImage.useSelectionCursor
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local IconSize = UIBloxModule.App.Constant.IconSize
local Interactable = UIBloxModule.Core.Control.Interactable
local UserLibModule = require(CorePackages.Workspace.Packages.UserLib)
local GetRbxthumbWithTypeSizeAndOptionsFunction = UserLibModule.Utils.getRbxthumbWithTypeSizeAndOptions
local FFlagAXMigrateQuickButtonsToGlobalAutoFocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateQuickButtonsToGlobalAutoFocus
local FFlagUseNavigationSelectors = require(CorePackages.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors
local FFlagSignalsNavP3gAvatarExperience = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3gAvatarExperience
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local GetLegacyNavigationStore = if FFlagSignalsNavP3gAvatarExperience then require(CorePackages.Workspace.Packages.NavigationRodux).GetLegacyNavigationStore else nil
local _UDim = UDim.new(0, 8)
local _UDim1 = UDim.new(0, _UDim.Offset - (44 - IconSize.Regular) / 2)
local AvatarHeadShot = UserLibModule.Utils.Constants.RbxthumbTypes.AvatarHeadShot
local config = {
	[AvatarScreen.AvatarEditor] = true,
	[AvatarScreen.Catalog] = true,
	[AvatarScreen.MySharedAvatars] = true
}

local function _(p1, p2): boolean
	-- upvalues: config (copy)
	return config[p2.opaque.name] ~= nil and (not p1.isUIFullView and not p1.isSceneFullView)
end

return (ReactModule.forwardRef(function(Gui, Ref)
	-- upvalues: UseStyleFunction (copy), UseAvatarRouteFunction (copy), UseNavigationFunction (copy), FFlagSignalsNavP3gAvatarExperience (copy), GetLegacyNavigationStore (copy), UseSignalStateFunction (copy), UseSelectorFunction (copy), FFlagUseNavigationSelectors (copy), Selectors (copy), UseSelectionCursorFunction (copy), CursorKind (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), AvatarHeadShot (copy), ReactModule (copy), AvatarScreen (copy), FFlagAXMigrateQuickButtonsToGlobalAutoFocus (copy), RoactGamepadModule (copy), config (copy), _UDim (copy), Interactable (copy), IconSize (copy), _UDim1 (copy)
	local Theme = UseStyleFunction().Theme
	local UseAvatarRouteResult = UseAvatarRouteFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseSignalStateResult = nil
	UseSignalStateResult = if FFlagSignalsNavP3gAvatarExperience then UseSignalStateFunction(GetLegacyNavigationStore(false).getHistory) else UseSelectorFunction(function(p1)
		-- upvalues: FFlagUseNavigationSelectors (upval), Selectors (upval)
		return if FFlagUseNavigationSelectors then Selectors.selectLegacyHistory(p1) else p1.Navigation.history
	end)
	
	return ReactModule.createElement(if FFlagAXMigrateQuickButtonsToGlobalAutoFocus then "Frame" else RoactGamepadModule.Focusable.Frame, {
		Size = UDim2.fromOffset(44, 44),
		BackgroundColor3 = Theme.BackgroundMuted.Color,
		BackgroundTransparency = Theme.BackgroundMuted.Transparency,
		Visible = config[UseAvatarRouteResult.opaque.name] ~= nil and (not Gui.isUIFullView and not Gui.isSceneFullView),
		LayoutOrder = Gui.layoutOrder,
		NextSelectionUp = if FFlagAXMigrateQuickButtonsToGlobalAutoFocus then nil else Gui.NextSelectionUp,
		NextSelectionDown = if FFlagAXMigrateQuickButtonsToGlobalAutoFocus then nil else Gui.NextSelectionDown,
		NextSelectionLeft = if FFlagAXMigrateQuickButtonsToGlobalAutoFocus then nil else Gui.NextSelectionLeft,
		NextSelectionRight = if FFlagAXMigrateQuickButtonsToGlobalAutoFocus then nil else Gui.NextSelectionRight,
		ref = Ref
	}, {
		Corner = ReactModule.createElement("UICorner", { CornerRadius = _UDim }),
		Button = ReactModule.createElement(if FFlagAXMigrateQuickButtonsToGlobalAutoFocus then Interactable else RoactGamepadModule.Focusable[Interactable], {
			Position = UDim2.new(0.5, 0, 0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.fromOffset(IconSize.Regular, IconSize.Regular),
			BackgroundTransparency = 1,
			Image = GetRbxthumbWithTypeSizeAndOptionsFunction(UseSelectorFunction(function(p1)
				return p1.LocalUserId
			end), AvatarHeadShot, 150),
			ZIndex = 2,
			SelectionImageObject = UseSelectionCursorFunction(CursorKind.RoundedRect),
			[ReactModule.Event.Activated] = ReactModule.useCallback(function()
				-- upvalues: UseAvatarRouteResult (copy), UseSignalStateResult (ref), UseNavigationResult (copy), AvatarScreen (upval)
				UseNavigationResult.navigate(AvatarScreen.ProfilePictureEditorEmotes, {
					prevNavPage = UseAvatarRouteResult.opaque.name,
					prevNavHistory = UseSignalStateResult
				})
			end, {
				UseNavigationResult,
				UseAvatarRouteResult,
				UseSignalStateResult
			})
		}, {
			Corner = ReactModule.createElement("UICorner", { CornerRadius = _UDim1 })
		})
	})
end))