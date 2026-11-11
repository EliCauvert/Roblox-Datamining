local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local ReactModule = require(CorePackages.Packages.React)
local RoactModule = require(CorePackages.Packages.Roact)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local IxpUtilsModule = require(CorePackages.Workspace.Packages.IxpUtils)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local IconButton = UIBloxModule.App.Button.IconButton
local Images = UIBloxModule.App.ImageSet.Images
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseTokensFunction = require(CorePackages.Packages.Foundation).Hooks.useTokens
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local SelectColorAdjustmentButtonColor = AvatarExperienceCommonModule.State.Selectors.selectColorAdjustmentButtonColor
local ColorGradientCircle = AvatarExperienceCommonModule.Components.ColorGradientCircle
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local DeviceOrientationMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode
local AnalyticsModule = require(Modules.AvatarExperience.AccessoryAdjustment.Services.Analytics)
local SendRefinementAnalyticsModule = require(Modules.AvatarExperience.AccessoryAdjustment.Thunks.SendRefinementAnalytics)
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local FFlagAXCustomizeMakeupSupport = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXCustomizeMakeupSupport
local AXEnableAccessoryAdjustmentDuringTryOnIXP = require(CorePackages.Workspace.Packages.AvatarExperienceExperiments).AXEnableAccessoryAdjustmentDuringTryOnIXP
local HeadRefinementEntryButton = require(CorePackages.Workspace.Packages.AvatarExperienceHeadRefinement).Components.HeadRefinementEntryButton
local IconSize = UIBloxModule.App.Constant.IconSize
local IconsMenuClothingHatsOn = Images["icons/menu/clothing/hats_on"]
local IconsMenuClothingHatsOff = Images["icons/menu/clothing/hats_off"]
local IconsMenuTransformSmall = Images["icons/menu/transform-small"]
local IconsMenuClothingClothingOn = Images["icons/menu/clothing/clothing_on"]
local IconsMenuClothingClothingOff = Images["icons/menu/clothing/clothing_off"]
local IconsMenuClothingEyelashOn = if FFlagAXCustomizeMakeupSupport then Images["icons/menu/clothing/eyelash_on"] else nil
local IconsMenuClothingEyelashOff = if FFlagAXCustomizeMakeupSupport then Images["icons/menu/clothing/eyelash_off"] else nil

local function selectIsPortrait(p1): boolean
	-- upvalues: DeviceOrientationMode (copy)
	return p1.DeviceOrientation == DeviceOrientationMode.Portrait
end

local function selectTopbarHeight(p1)
	return p1.TopBar.topBarHeight
end

local WithNavigationFocusResult = require(CorePackages.Packages.RoactNavigation).withNavigationFocus((require(Modules.AvatarExperience.Common.Components.RoactNavigation.withAppRoute)(function(Gui)
	-- upvalues: ReactModule (copy), FFlagAXCustomizeMakeupSupport (copy), UseStyleFunction (copy), UseTokensFunction (copy), UseDispatchFunction (copy), UseRoactServiceModule (copy), AnalyticsModule (copy), SendRefinementAnalyticsModule (copy), AvatarScreen (copy), UseSelectorFunction (copy), selectIsPortrait (copy), selectTopbarHeight (copy), SelectColorAdjustmentButtonColor (copy), AXEnableAccessoryAdjustmentDuringTryOnIXP (copy), IxpUtilsModule (copy), IconButton (copy), IconSize (copy), ColorGradientCircle (copy), IconsMenuTransformSmall (copy), IconsMenuClothingHatsOn (copy), IconsMenuClothingHatsOff (copy), Focusable (copy), RoactModule (copy), HeadRefinementEntryButton (copy), IconsMenuClothingClothingOn (copy), IconsMenuClothingClothingOff (copy), IconsMenuClothingEyelashOn (copy), IconsMenuClothingEyelashOff (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = if FFlagAXCustomizeMakeupSupport then ReactModule.useRef(nil) else nil
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseRefResult3 = ReactModule.useRef(nil)
	local UseRefResult4 = ReactModule.useRef(nil)
	local UseStyleResult = UseStyleFunction()
	local UseTokensResult = UseTokensFunction()
	local Theme = UseStyleResult.Theme
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceModuleResult = UseRoactServiceModule(AnalyticsModule)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), SendRefinementAnalyticsModule (upval), UseRoactServiceModuleResult (copy), Gui (copy), AvatarScreen (upval)
		UseDispatchResult(SendRefinementAnalyticsModule(UseRoactServiceModuleResult.avatarAARefineNavigationTap))
		Gui.navigation.navigate(AvatarScreen.AccessoryAdjustment)
	end, { Gui.navigation, UseRoactServiceModuleResult })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: Gui (copy), AvatarScreen (upval)
		Gui.navigation.navigate(AvatarScreen.ColorAdjustment)
	end, { Gui.navigation })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), SendRefinementAnalyticsModule (upval), UseRoactServiceModuleResult (copy), Gui (copy), AvatarScreen (upval)
		UseDispatchResult(SendRefinementAnalyticsModule(UseRoactServiceModuleResult.avatarLCRefineNavigationTap))
		Gui.navigation.navigate(AvatarScreen.LayeredClothingSort)
	end, { Gui.navigation, UseRoactServiceModuleResult })
	local UseResult3 = if FFlagAXCustomizeMakeupSupport then ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), SendRefinementAnalyticsModule (upval), UseRoactServiceModuleResult (copy), Gui (copy), AvatarScreen (upval)
		UseDispatchResult(SendRefinementAnalyticsModule(UseRoactServiceModuleResult.avatarLayeredMakeupNavigationTap))
		Gui.navigation.navigate(AvatarScreen.LayeredMakeupSort)
	end, { Gui.navigation, UseRoactServiceModuleResult }) else nil
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: Gui (copy), AvatarScreen (upval)
		Gui.navigation.navigate(AvatarScreen.HeadRefinement)
	end, { Gui.navigation })
	local UseSelectorResult = UseSelectorFunction(selectIsPortrait)
	local IsNameMatch = Gui.avatarRoute.opaque.name == AvatarScreen.AccessoryAdjustment
	local IsNameMatch1 = Gui.avatarRoute.opaque.name == AvatarScreen.LayeredClothingSort
	local IsNameMatch2 = if FFlagAXCustomizeMakeupSupport then Gui.avatarRoute.opaque.name == AvatarScreen.LayeredMakeupSort else nil
	local TestVariable = if AXEnableAccessoryAdjustmentDuringTryOnIXP.isEnabled() then IxpUtilsModule.readTestVariable(AXEnableAccessoryAdjustmentDuringTryOnIXP.EnabledForUser) else nil
	
	return ReactModule.createElement(Focusable.Frame, {
		AutomaticSize = Enum.AutomaticSize.XY,
		Position = UDim2.new(0, if UseSelectorResult then 24 else 88, 0, UseSelectorFunction(selectTopbarHeight) + 4),
		BackgroundColor3 = Theme.BackgroundMuted.Color,
		BackgroundTransparency = Theme.BackgroundMuted.Transparency,
		ZIndex = 2,
		[RoactModule.Ref] = Gui.defaultChildRef,
		defaultChild = UseRefResult3,
		NextSelectionUp = Gui.NextSelectionUp,
		NextSelectionRight = Gui.NextSelectionRight
	}, {
		Corner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
		UIListLayout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, 16)
		}),
		UIPadding = ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, 8),
			PaddingBottom = UDim.new(0, 8),
			PaddingLeft = UDim.new(0, 8),
			PaddingRight = UDim.new(0, 8)
		}),
		HeadRefinementEntryButton = ReactModule.createElement(Focusable[HeadRefinementEntryButton], {
			isSelected = Gui.avatarRoute.opaque.name == AvatarScreen.HeadRefinement,
			onActivated = UseResult4,
			buttonRef = UseRefResult3,
			NextSelectionDown = UseRefResult
		}),
		LCSort = ReactModule.createElement(IconButton, {
			layoutOrder = 1,
			showBackground = true,
			position = UDim2.fromScale(0.5, 0.5),
			anchorPoint = Vector2.new(0.5, 0.5),
			icon = if IsNameMatch1 then IconsMenuClothingClothingOn else IconsMenuClothingClothingOff,
			iconColor3 = if IsNameMatch1 then Theme.IconEmphasis.Color else Theme.IconDefault.Color,
			iconTransparency = if IsNameMatch1 then Theme.IconEmphasis.Transparency else Theme.IconDefault.Transparency,
			iconSize = IconSize.Medium,
			onActivated = UseResult2,
			buttonRef = UseRefResult,
			NextSelectionDown = if FFlagAXCustomizeMakeupSupport then UseRefResult1 else UseRefResult2,
			NextSelectionUp = UseRefResult3
		}),
		AccessoryAdjustment = ReactModule.createElement(IconButton, {
			showBackground = true,
			position = UDim2.fromScale(0.5, 0.5),
			anchorPoint = Vector2.new(0.5, 0.5),
			layoutOrder = if FFlagAXCustomizeMakeupSupport then 3 else 2,
			icon = if TestVariable then IconsMenuTransformSmall elseif IsNameMatch then IconsMenuClothingHatsOn else IconsMenuClothingHatsOff,
			iconSize = IconSize.Medium,
			iconColor3 = if IsNameMatch then Theme.IconEmphasis.Color else Theme.IconDefault.Color,
			iconTransparency = if IsNameMatch then Theme.IconEmphasis.Transparency else Theme.IconDefault.Transparency,
			onActivated = UseResult,
			buttonRef = UseRefResult2,
			NextSelectionUp = if FFlagAXCustomizeMakeupSupport then UseRefResult1 else UseRefResult,
			NextSelectionDown = UseRefResult4
		}),
		MakeupSort = if FFlagAXCustomizeMakeupSupport then ReactModule.createElement(IconButton, {
			showBackground = true,
			position = UDim2.fromScale(0.5, 0.5),
			anchorPoint = Vector2.new(0.5, 0.5),
			icon = if IsNameMatch2 then IconsMenuClothingEyelashOn else IconsMenuClothingEyelashOff,
			iconColor3 = if IsNameMatch2 then Theme.IconEmphasis.Color else Theme.IconDefault.Color,
			iconTransparency = if IsNameMatch2 then Theme.IconEmphasis.Transparency else Theme.IconDefault.Transparency,
			layoutOrder = if FFlagAXCustomizeMakeupSupport then 2 else 3,
			iconSize = IconSize.Medium,
			onActivated = UseResult3,
			buttonRef = UseRefResult1,
			NextSelectionDown = UseRefResult2,
			NextSelectionUp = if FFlagAXCustomizeMakeupSupport then UseRefResult else UseRefResult3
		}) else nil,
		ColorAdjustment = ReactModule.createElement(IconButton, {
			layoutOrder = 4,
			showBackground = true,
			position = UDim2.fromScale(0.5, 0.5),
			anchorPoint = Vector2.new(0.5, 0.5),
			iconSize = IconSize.Medium,
			onActivated = UseResult1,
			buttonRef = UseRefResult4,
			NextSelectionUp = UseRefResult2
		}, {
			Color = ReactModule.createElement(ColorGradientCircle, {
				Size = UDim2.fromOffset(UseTokensResult.Size.Size_700, UseTokensResult.Size.Size_700),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				Colors = { (UseSelectorFunction(SelectColorAdjustmentButtonColor)) }
			})
		})
	})
end)))

return ReactModule.forwardRef(function(p1, DefaultChildRef)
	-- upvalues: ReactModule (copy), WithNavigationFocusResult (ref), CryoModule (copy)
	return ReactModule.createElement(WithNavigationFocusResult, CryoModule.Dictionary.join(p1, { defaultChildRef = DefaultChildRef }))
end)