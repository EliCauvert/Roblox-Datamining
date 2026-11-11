local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local ReactModule = require(CorePackages.Packages.React)
local RoactModule = require(CorePackages.Packages.Roact)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local Focusable = RoactGamepadModule.Focusable
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local UseSelectionCursorFunction = UIBloxModule.App.SelectionImage.useSelectionCursor
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UsePropertyFunction = require(CorePackages.Workspace.Packages.GuiObjectUtils).useProperty
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local UseAppliedDescriptionValueContextModule = require(Modules.AvatarExperience.Common.Context.AppliedDescription.useAppliedDescriptionValueContext)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local AccessoryAdjustmentUtilsModule = require(Modules.AvatarExperience.AccessoryAdjustment.AccessoryAdjustmentUtils)
local LoadableImage = UIBloxModule.App.Loading.LoadableImage
local UserLibModule = require(CorePackages.Workspace.Packages.UserLib)
local GetRbxthumbWithTypeSizeAndOptionsFunction = UserLibModule.Utils.getRbxthumbWithTypeSizeAndOptions
local Constants = UserLibModule.Utils.Constants
local SetSelectedAccessoryModule = require(Modules.AvatarExperience.AccessoryAdjustment.Actions.SetSelectedAccessory)
local ConstantsModule = require(Modules.AvatarExperience.AvatarRefinement.Constants)
local IsVRAppBuildFunction = require(CorePackages.Workspace.Packages.AppCommonLib).IsVRAppBuild
local AnalyticsModule = require(Modules.AvatarExperience.AccessoryAdjustment.Services.Analytics)
local SendRefinementAnalyticsModule = require(Modules.AvatarExperience.AccessoryAdjustment.Thunks.SendRefinementAnalytics)
local ConstantsModule1 = require(Modules.AvatarExperience.AvatarEditor.Constants)
local AXVerticalDrawerCropTiles = game:DefineFastFlag("AXVerticalDrawerCropTiles", false)
local AXFixUndoRedoAccessoryAdjustment = game:DefineFastFlag("AXFixUndoRedoAccessoryAdjustment", false)
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local _UDim = UDim.new(0, 6)

local function selectTopbarHeight(p1)
	return p1.TopBar.topBarHeight
end

local function selectMaxScreenHeight(p1): number
	-- upvalues: AXVerticalDrawerCropTiles (copy)
	local GlobalGuiInset = p1.GlobalGuiInset
	local YDelta = p1.ScreenSize.Y - p1.TopBar.topBarHeight - GlobalGuiInset.bottom - GlobalGuiInset.top - 32 - 48
	
	if AXVerticalDrawerCropTiles and (YDelta - 16) % 50 < 12.5 then
		YDelta -= 25
	end
	return YDelta
end

local function selectAllowedAATypes(p1)
	-- upvalues: ConstantsModule1 (copy)
	return p1.AvatarExperience.AvatarEditor.AvatarSettings[ConstantsModule1.AvatarSettings.accessoryRefinementTypes]
end

local function getChildren(Ref, UseRefCacheResult, p1)
	-- upvalues: UseSelectorFunction (copy), selectAllowedAATypes (copy), UseAppliedDescriptionValueContextModule (copy), AccessoryAdjustmentUtilsModule (copy), UseStyleFunction (copy), UseDispatchFunction (copy), UseRoactServiceModule (copy), AnalyticsModule (copy), UseSelectionCursorFunction (copy), CursorKind (copy), ReactModule (copy), Constants (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), AXFixUndoRedoAccessoryAdjustment (copy), RoactModule (copy), Focusable (copy), AvatarScreen (copy), SendRefinementAnalyticsModule (copy), SetSelectedAccessoryModule (copy), LoadableImage (copy), _UDim (copy)
	local AdjustableAccessories = {}
	local UseSelectorResult = UseSelectorFunction(selectAllowedAATypes)
	local Value = UseAppliedDescriptionValueContextModule().appliedDescriptionBinding:getValue()
	
	if Value then
		AdjustableAccessories = AccessoryAdjustmentUtilsModule.getAdjustableAccessories(Value, UseSelectorResult)
	end
	local Theme = UseStyleFunction().Theme
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceModuleResult = UseRoactServiceModule(AnalyticsModule)
	local UseSelectionCursorResult = UseSelectionCursorFunction(CursorKind.RoundedRectNoInset)
	local config = {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			FillDirection = Enum.FillDirection.Vertical,
			Padding = UDim.new(0, 8),
			ref = Ref
		}),
		UIPadding = ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, 16),
			PaddingBottom = UDim.new(0, 16),
			PaddingLeft = UDim.new(0, 8),
			PaddingRight = UDim.new(0, 8)
		})
	}
	
	for LayoutOrder, adjustableAccessory in AdjustableAccessories do
		config[if AXFixUndoRedoAccessoryAdjustment then LayoutOrder else adjustableAccessory] = RoactModule.createElement(Focusable.ImageButton, {
			Size = UDim2.fromOffset(50, 50),
			BackgroundTransparency = 1,
			SizeConstraint = Enum.SizeConstraint.RelativeXX,
			LayoutOrder = LayoutOrder,
			ref = UseRefCacheResult[LayoutOrder],
			[RoactModule.Event.Activated] = function()
				-- upvalues: p1 (copy), AvatarScreen (upval), UseDispatchResult (copy), SendRefinementAnalyticsModule (upval), UseRoactServiceModuleResult (copy), SetSelectedAccessoryModule (upval), adjustableAccessory (copy)
				p1.navigation.navigate(AvatarScreen.AdjustAccessoryView)
				UseDispatchResult(SendRefinementAnalyticsModule(UseRoactServiceModuleResult.avatarRefineAccessoryStart))
				UseDispatchResult(SetSelectedAccessoryModule(adjustableAccessory))
			end,
			NextSelectionDown = LayoutOrder < #AdjustableAccessories and UseRefCacheResult[LayoutOrder + 1] or nil,
			NextSelectionUp = LayoutOrder > 1 and UseRefCacheResult[LayoutOrder - 1] or nil,
			SelectionImageObject = UseSelectionCursorResult
		}, {
			BackgroundImage = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				ZIndex = 0,
				BackgroundColor3 = Theme.PlaceHolder.Color,
				BackgroundTransparency = Theme.PlaceHolder.Transparency,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				Size = UDim2.fromScale(1, 1)
			}, {
				Image = RoactModule.createElement(LoadableImage, {
					BackgroundTransparency = 1,
					ZIndex = 0,
					showFailedStateWhenLoadingFailed = true,
					useShimmerAnimationWhileLoading = true,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Image = GetRbxthumbWithTypeSizeAndOptionsFunction(adjustableAccessory, Constants.RbxthumbTypes.Asset, 150),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					Size = UDim2.fromScale(1, 1),
					cornerRadius = _UDim
				}),
				UICorner = RoactModule.createElement("UICorner", { CornerRadius = _UDim })
			})
		})
	end
	return config
end

local WithNavigationFocusResult = require(CorePackages.Packages.RoactNavigation).withNavigationFocus((require(Modules.AvatarExperience.Common.Components.RoactNavigation.withAppRoute)(function(p2)
	-- upvalues: UseStyleFunction (copy), RoactGamepadModule (copy), ReactModule (copy), UsePropertyFunction (copy), UseSelectorFunction (copy), selectMaxScreenHeight (copy), getChildren (copy), selectTopbarHeight (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), Focusable (copy), IsVRAppBuildFunction (copy), ConstantsModule (copy)
	local Theme = UseStyleFunction().Theme
	local ForwardRef = p2.forwardRef
	local UseRefCacheResult = RoactGamepadModule.useRefCache()
	local UseRefResult = ReactModule.useRef(nil)
	local AbsoluteContentSize = UsePropertyFunction(UseRefResult, "AbsoluteContentSize") or Vector2.new(0, 0)
	
	local function _(): number
		-- upvalues: UseSelectorFunction (upval), selectMaxScreenHeight (upval), AbsoluteContentSize (copy)
		return (math.min(UseSelectorFunction(selectMaxScreenHeight), AbsoluteContentSize.Y + 32))
	end
	
	local Smallest = math.min(UseSelectorFunction(selectMaxScreenHeight), AbsoluteContentSize.Y + 32)
	local Children = getChildren(UseRefResult, UseRefCacheResult, p2)
	local UseSelectorResult = UseSelectorFunction(selectTopbarHeight)
	
	return ReactModule.createElement(if FFlagAXMigrateAXToGlobalAutofocus then "Frame" else Focusable.Frame, {
		ClipsDescendants = true,
		ZIndex = 3,
		AnchorPoint = if IsVRAppBuildFunction() then Vector2.new(1, 0) else Vector2.new(1, 0),
		Size = UDim2.new(0, 66, 0, Smallest),
		Position = if IsVRAppBuildFunction() then UDim2.new(1, 0, 0, ConstantsModule.Tile.MoreIconSize + ConstantsModule.VerticalList.Padding) else UDim2.new(1, -ConstantsModule.RightMargin, 0, UseSelectorResult),
		BackgroundColor3 = Theme.BackgroundMuted.Color,
		BackgroundTransparency = Theme.BackgroundMuted.Transparency,
		defaultChild = if FFlagAXMigrateAXToGlobalAutofocus then nil else UseRefCacheResult[1],
		ref = ForwardRef,
		NextSelectionLeft = if FFlagAXMigrateAXToGlobalAutofocus then nil else p2.NextSelectionLeft,
		restorePreviousChildFocus = not FFlagAXMigrateAXToGlobalAutofocus or nil
	}, {
		UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
		ScrollingFrame = ReactModule.createElement("ScrollingFrame", {
			BackgroundTransparency = 1,
			ScrollBarThickness = 0,
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			CanvasSize = UDim2.new(1, 0, 0, 0),
			ScrollingDirection = Enum.ScrollingDirection.Y,
			Size = UDim2.fromScale(1, 1),
			Selectable = not FFlagAXMigrateAXToGlobalAutofocus and nil
		}, Children)
	})
end)))

return RoactModule.forwardRef(function(p2, ForwardRef)
	-- upvalues: RoactModule (copy), WithNavigationFocusResult (ref), CryoModule (copy)
	return RoactModule.createElement(WithNavigationFocusResult, CryoModule.Dictionary.join(p2, { forwardRef = ForwardRef }))
end)