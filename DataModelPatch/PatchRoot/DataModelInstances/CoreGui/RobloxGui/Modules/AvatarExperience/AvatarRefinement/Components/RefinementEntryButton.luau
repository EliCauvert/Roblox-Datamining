local CoreGui = game:GetService("CoreGui")
local Modules = CoreGui.RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local ReactModule = require(CorePackages.Packages.React)
local RoactModule = require(CorePackages.Packages.Roact)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithTooltipFunction = UIBloxModule.App.Dialog.TooltipV2.withTooltip
local ImageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local TooltipOrientation = UIBloxModule.App.Dialog.Enum.TooltipOrientation
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local UseHeadRefinementEntryTooltipModule = require(Modules.AvatarExperience.AvatarRefinement.HeadRefinement.Hooks.useHeadRefinementEntryTooltip)
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local UseIsSpatialFunction = require(CorePackages.Workspace.Packages.Responsive).useIsSpatial
local UseSelectionCursorFunction = UIBloxModule.App.SelectionImage.useSelectionCursor
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local IconSize = UIBloxModule.App.Constant.IconSize
local AnalyticsModule = require(Modules.AvatarExperience.LayeredClothingSort.Services.Analytics)
local NavigateIntoRefinementPageModule = require(Modules.AvatarExperience.LayeredClothingSort.Thunks.NavigateIntoRefinementPage)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local FFlagAXMigrateQuickButtonsToGlobalAutoFocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateQuickButtonsToGlobalAutoFocus
local IconsActionsAdjust = UIBloxModule.App.ImageSet.Images["icons/actions/adjust"]

local function _(p1)
	-- upvalues: UtilsModule (copy)
	return (UtilsModule.isAvatarSceneButtonsVisible(p1.avatarRoute, p1.isFocused, p1.isUIFullView, p1.isSceneFullView, p1.navigation))
end

local WithNavigationFocusResult = require(CorePackages.Packages.RoactNavigation).withNavigationFocus((require(Modules.AvatarExperience.Common.Components.RoactNavigation.withAppRoute)(function(Gui)
	-- upvalues: UseDispatchFunction (copy), UseStyleFunction (copy), FFlagAXMigrateQuickButtonsToGlobalAutoFocus (copy), ReactModule (copy), UseRoactServiceModule (copy), AnalyticsModule (copy), UseIsSpatialFunction (copy), UseSelectionCursorFunction (copy), CursorKind (copy), UseLocalizationFunction (copy), UseHeadRefinementEntryTooltipModule (copy), UtilsModule (copy), NavigateIntoRefinementPageModule (copy), ImageSetButton (copy), Focusable (copy), IconSize (copy), IconsActionsAdjust (copy), RoactModule (copy), WithTooltipFunction (copy), TooltipOrientation (copy), CoreGui (copy)
	local UseDispatchResult = UseDispatchFunction()
	local Theme = UseStyleFunction().Theme
	local UseRefResult = if FFlagAXMigrateQuickButtonsToGlobalAutoFocus then nil else ReactModule.useRef(nil)
	local ForwardRef = Gui.forwardRef
	local UseRoactServiceModuleResult = UseRoactServiceModule(AnalyticsModule)
	local UseIsSpatialResult = UseIsSpatialFunction()
	local UseSelectionCursorResult = UseSelectionCursorFunction(CursorKind.RoundedRect)
	local UseLocalizationResult = UseLocalizationFunction({
		headRefinementTooltip = "Feature.Avatar.Label.HeadRefinement.Adjust.Tooltip"
	})
	local UseHeadRefinementEntryTooltipModuleResult, UseHeadRefinementEntryTooltipModuleResult2 = UseHeadRefinementEntryTooltipModule({
		avatarRoute = Gui.avatarRoute,
		shouldBeVisible = UtilsModule.isAvatarSceneButtonsVisible(Gui.avatarRoute, Gui.isFocused, Gui.isUIFullView, Gui.isSceneFullView, Gui.navigation)
	})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseHeadRefinementEntryTooltipModuleResult (copy), UseHeadRefinementEntryTooltipModuleResult2 (copy), UseDispatchResult (copy), NavigateIntoRefinementPageModule (upval), Gui (copy), UseRoactServiceModuleResult (copy)
		if UseHeadRefinementEntryTooltipModuleResult and UseHeadRefinementEntryTooltipModuleResult2 then
			UseHeadRefinementEntryTooltipModuleResult2({ saveDismissTime = true })
		end
		UseDispatchResult(NavigateIntoRefinementPageModule(Gui.navigation, Gui.avatarRoute, UseRoactServiceModuleResult))
	end, {
		Gui.navigation,
		Gui.avatarRoute,
		UseRoactServiceModuleResult,
		UseHeadRefinementEntryTooltipModuleResult2,
		UseHeadRefinementEntryTooltipModuleResult
	})
	
	local function renderImageSetButton(p1, p2)
		-- upvalues: ReactModule (upval), FFlagAXMigrateQuickButtonsToGlobalAutoFocus (upval), ImageSetButton (upval), Focusable (upval), IconSize (upval), IconsActionsAdjust (upval), Theme (copy), UseResult (copy), RoactModule (upval), UseRefResult (copy), Gui (copy), UseSelectionCursorResult (copy)
		return ReactModule.createElement(if FFlagAXMigrateQuickButtonsToGlobalAutoFocus then ImageSetButton else Focusable[ImageSetButton], {
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.fromOffset(IconSize.Regular, IconSize.Regular),
			BackgroundTransparency = 1,
			Image = IconsActionsAdjust,
			ImageColor3 = Theme.IconEmphasis.Color,
			ImageTransparency = 0,
			[ReactModule.Event.Activated] = UseResult,
			[RoactModule.Change.AbsoluteSize] = p1,
			[RoactModule.Change.AbsolutePosition] = p2,
			[RoactModule.Ref] = if FFlagAXMigrateQuickButtonsToGlobalAutoFocus then nil else UseRefResult,
			NextSelectionLeft = if FFlagAXMigrateQuickButtonsToGlobalAutoFocus then nil else Gui.NextSelectionLeft,
			NextSelectionDown = if FFlagAXMigrateQuickButtonsToGlobalAutoFocus then nil else Gui.NextSelectionDown,
			NextSelectionUp = if FFlagAXMigrateQuickButtonsToGlobalAutoFocus then nil else Gui.NextSelectionUp,
			SelectionImageObject = UseSelectionCursorResult
		})
	end
	
	local function renderImageSetButtonWithHeadRefinementTooltip()
		-- upvalues: WithTooltipFunction (upval), UseLocalizationResult (copy), TooltipOrientation (upval), CoreGui (upval), UseHeadRefinementEntryTooltipModuleResult (copy), renderImageSetButton (copy)
		return WithTooltipFunction({
			useLargeDropShadow = true,
			bodyText = UseLocalizationResult.headRefinementTooltip
		}, {
			preferredOrientation = TooltipOrientation.Right,
			guiTarget = CoreGui,
			active = UseHeadRefinementEntryTooltipModuleResult
		}, function(p1)
			-- upvalues: renderImageSetButton (upval)
			return renderImageSetButton(p1, p1)
		end)
	end
	
	return ReactModule.createElement(if FFlagAXMigrateQuickButtonsToGlobalAutoFocus then "Frame" else Focusable.Frame, {
		Size = UDim2.fromOffset(44, 44),
		Visible = UtilsModule.isAvatarSceneButtonsVisible(Gui.avatarRoute, Gui.isFocused, Gui.isUIFullView, Gui.isSceneFullView, Gui.navigation),
		BackgroundColor3 = Theme.BackgroundMuted.Color,
		BackgroundTransparency = Theme.BackgroundMuted.Transparency,
		LayoutOrder = Gui.layoutOrder,
		[RoactModule.Ref] = ForwardRef,
		defaultChild = if FFlagAXMigrateQuickButtonsToGlobalAutoFocus then nil else UseRefResult
	}, {
		Corner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
		Image = if UseIsSpatialResult then ReactModule.createElement(if FFlagAXMigrateQuickButtonsToGlobalAutoFocus then ImageSetButton else Focusable[ImageSetButton], {
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.fromOffset(IconSize.Regular, IconSize.Regular),
			BackgroundTransparency = 1,
			Image = IconsActionsAdjust,
			ImageColor3 = Theme.IconEmphasis.Color,
			ImageTransparency = 0,
			ZIndex = 2,
			[ReactModule.Event.Activated] = UseResult,
			[RoactModule.Ref] = if FFlagAXMigrateQuickButtonsToGlobalAutoFocus then nil else UseRefResult,
			NextSelectionLeft = if FFlagAXMigrateQuickButtonsToGlobalAutoFocus then nil else Gui.NextSelectionLeft,
			SelectionImageObject = UseSelectionCursorResult
		}) else renderImageSetButtonWithHeadRefinementTooltip()
	})
end)))

return RoactModule.forwardRef(function(p1, ForwardRef)
	-- upvalues: RoactModule (copy), WithNavigationFocusResult (ref), CryoModule (copy)
	return RoactModule.createElement(WithNavigationFocusResult, CryoModule.Dictionary.join(p1, { forwardRef = ForwardRef }))
end)