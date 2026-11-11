local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local IxpUtilsModule = require(CorePackages.Workspace.Packages.IxpUtils)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local SelectIsPortraitModule = require(Modules.AvatarExperience.Common.Selectors.selectIsPortrait)
local AccessoryAdjustmentUtilsModule = require(Modules.AvatarExperience.AccessoryAdjustment.AccessoryAdjustmentUtils)
local SetAccessoryAdjustmentsModule = require(Modules.AvatarExperience.AccessoryAdjustment.Actions.SetAccessoryAdjustments)
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local FoundationModule = require(CorePackages.Packages.Foundation)
local FFlagRenameDeprecatedUIBloxTokens = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local Button1 = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FillBehavior = FoundationModule.Enums.FillBehavior
local InputSize = FoundationModule.Enums.InputSize
local View = FoundationModule.View
local AdjustmentTypeButtonsModule = require(Modules.AvatarExperience.AccessoryAdjustment.Components.AdjustmentTypeButtons)
local AdjustmentSlidersModule = require(Modules.AvatarExperience.AccessoryAdjustment.Components.AdjustmentSliders)
local SendRefinementAnalyticsModule = require(Modules.AvatarExperience.AccessoryAdjustment.Thunks.SendRefinementAnalytics)
local AnalyticsModule = require(Modules.AvatarExperience.AccessoryAdjustment.Services.Analytics)
local _ = require(Modules.AvatarExperience.AccessoryAdjustment.Enum.AdjustmentType)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local FFlagAXMoveResetButtonToControlPanelModule = require(Modules.AvatarExperience.Flags.FFlagAXMoveResetButtonToControlPanel)
local AXEnableAccessoryAdjustmentDuringTryOnIXP = require(CorePackages.Workspace.Packages.AvatarExperienceExperiments).AXEnableAccessoryAdjustmentDuringTryOnIXP

local function mapTokens(p1)
	-- upvalues: FFlagRenameDeprecatedUIBloxTokens (copy)
	return {
		smallIconSize = if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_400 else p1.Semantic.Icon.Size.Small,
		buttonSize = if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_800 else p1.Global.Size_400,
		portraitPadding = if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_200 else p1.Global.Size_100,
		landscapePadding = if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_300 else p1.Global.Size_150,
		sidePadding = if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_300 else p1.Global.Size_150,
		cornerRadius = if FFlagRenameDeprecatedUIBloxTokens then p1.Radius.Medium else p1.Semantic.Radius.Medium,
		panelMargin = if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_900 else p1.Global.Size_450
	}
end

local function selectAdjustmentTypeSelected(p1)
	return p1.AvatarExperience.AccessoryAdjustment.AdjustmentTypeSelected
end

local function selectSelectedAccessory(p1)
	return p1.AvatarExperience.AccessoryAdjustment.SelectedAccessory
end

return (require(Modules.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper)(function(p1)
	-- upvalues: UseStyleFunction (copy), UseDesignTokensFunction (copy), mapTokens (copy), UseRoactServiceModule (copy), AnalyticsModule (copy), UseSelectorFunction (copy), SelectIsPortraitModule (copy), UseDispatchFunction (copy), UseLocalizationFunction (copy), FFlagAXMoveResetButtonToControlPanelModule (copy), selectAdjustmentTypeSelected (copy), selectSelectedAccessory (copy), AXEnableAccessoryAdjustmentDuringTryOnIXP (copy), IxpUtilsModule (copy), UseNavigationFunction (copy), ReactModule (copy), SendRefinementAnalyticsModule (copy), AccessoryAdjustmentUtilsModule (copy), SetAccessoryAdjustmentsModule (copy), Focusable (copy), AdjustmentTypeButtonsModule (copy), AdjustmentSlidersModule (copy), Button (copy), ButtonType (copy), View (copy), Button1 (copy), ButtonVariant (copy), InputSize (copy), FillBehavior (copy)
	local Theme = UseStyleFunction().Theme
	local UseDesignTokensResult = UseDesignTokensFunction(mapTokens)
	local UseRoactServiceModuleResult = UseRoactServiceModule(AnalyticsModule)
	local UseSelectorResult = UseSelectorFunction(SelectIsPortraitModule)
	local UseDispatchResult = UseDispatchFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		apply = "CommonUI.Messages.Action.Apply",
		reset = if FFlagAXMoveResetButtonToControlPanelModule then "Feature.Avatar.Action.Reset" else nil
	})
	local UseSelectorResult1 = UseSelectorFunction(selectAdjustmentTypeSelected)
	local UseSelectorResult2 = UseSelectorFunction(selectSelectedAccessory)
	local PortraitPadding = if UseSelectorResult then UseDesignTokensResult.portraitPadding else UseDesignTokensResult.landscapePadding
	local TestVariable = if AXEnableAccessoryAdjustmentDuringTryOnIXP.isEnabled() then IxpUtilsModule.readTestVariable(AXEnableAccessoryAdjustmentDuringTryOnIXP.EnabledForUser) else nil
	local Params = if AXEnableAccessoryAdjustmentDuringTryOnIXP.isEnabled() then UseNavigationFunction().state.params else nil
	local UseResult = if FFlagAXMoveResetButtonToControlPanelModule then ReactModule.useCallback(function()
		-- upvalues: p1 (copy), UseDispatchResult (copy), SendRefinementAnalyticsModule (upval), UseRoactServiceModuleResult (copy), AccessoryAdjustmentUtilsModule (upval), SetAccessoryAdjustmentsModule (upval), UseSelectorResult2 (copy), TestVariable (copy), Params (copy)
		p1.isApplyingAdjustment.current = true
		UseDispatchResult(SendRefinementAnalyticsModule(UseRoactServiceModuleResult.avatarRefineAccessoryApply(p1.sliderValues)))
		local SliderInfoToVector3sResult, SliderInfoToVector3sResult2, SliderInfoToVector3sResult3 = AccessoryAdjustmentUtilsModule.sliderInfoToVector3s(p1.sliderValues)
		UseDispatchResult(SetAccessoryAdjustmentsModule(SliderInfoToVector3sResult, SliderInfoToVector3sResult2, SliderInfoToVector3sResult3, UseSelectorResult2))
		
		if TestVariable and Params and Params.fromRoute then
			p1.navigation.popToTop()
			p1.navigation.navigate(Params.fromRoute)
			
			return
		else
			p1.navigation.pop()
		end
	end, {
		p1.sliderValues, UseSelectorResult2, TestVariable, Params, UseDispatchResult,
		UseRoactServiceModuleResult, p1.navigation, p1.isApplyingAdjustment
	}) else nil
	local UseResult1 = if FFlagAXMoveResetButtonToControlPanelModule then ReactModule.useCallback(function()
		-- upvalues: p1 (copy)
		if p1.onResetButtonPressed then
			p1.onResetButtonPressed()
		end
	end, { p1.onResetButtonPressed }) else nil
	
	return ReactModule.createElement(Focusable.Frame, {
		BackgroundTransparency = 1,
		ZIndex = 3,
		AnchorPoint = if UseSelectorResult then Vector2.new(0, 1) else Vector2.new(0, 0.5),
		Position = if UseSelectorResult then UDim2.new(0, 0, 1, 0) else UDim2.new(0, UseDesignTokensResult.panelMargin, 0.5, 0),
		Size = if UseSelectorResult then UDim2.new(1, 0, 0, 0) else UDim2.fromScale(0.4, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		Content = ReactModule.createElement(Focusable.Frame, {
			BorderSizePixel = 0,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = Theme.BackgroundDefault.Color,
			BackgroundTransparency = Theme.BackgroundDefault.Transparency
		}, {
			UIPadding = ReactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, PortraitPadding),
				PaddingBottom = UDim.new(0, PortraitPadding),
				PaddingLeft = UDim.new(0, UseDesignTokensResult.sidePadding),
				PaddingRight = UDim.new(0, UseDesignTokensResult.sidePadding)
			}),
			UICorner = ReactModule.createElement("UICorner", {
				CornerRadius = UDim.new(0, UseDesignTokensResult.cornerRadius)
			}),
			UIListLayout = ReactModule.createElement("UIListLayout", {
				Padding = UDim.new(0, PortraitPadding),
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			AdjustmentTypeButtons = ReactModule.createElement(AdjustmentTypeButtonsModule, {
				LayoutOrder = 1,
				adjustmentTypeSelected = UseSelectorResult1,
				frameRef = p1.adjustmentTypeFrameRef,
				NextSelectionDown = p1.sliderFrameRef,
				NextSelectionUp = p1.topBarRef,
				NextSelectionLeft = p1.topBarRef,
				NextSelectionRight = if FFlagAXMoveResetButtonToControlPanelModule then nil else p1.resetRef
			}),
			AdjustmentSliders = ReactModule.createElement(AdjustmentSlidersModule, {
				LayoutOrder = 2,
				adjustmentTypeSelected = UseSelectorResult1,
				updateCharacterCallback = p1.updateCharacterCallback,
				setSliderValuesCallback = p1.setSliderValuesCallback,
				sliderValues = p1.sliderValues,
				NextSelectionUp = p1.adjustmentTypeFrameRef,
				frameRef = p1.sliderFrameRef,
				NextSelectionDown = p1.applyButtonRef,
				NextSelectionRight = if FFlagAXMoveResetButtonToControlPanelModule then nil else p1.resetRef
			}),
			ApplyButton = if FFlagAXMoveResetButtonToControlPanelModule then nil else ReactModule.createElement(Button, {
				layoutOrder = 3,
				ref = p1.applyButtonRef,
				NextSelectionUp = p1.sliderFrameRef,
				buttonType = ButtonType.PrimarySystem,
				size = UDim2.new(1, 0, 0, UseDesignTokensResult.buttonSize),
				text = UseLocalizationResult.apply,
				onActivated = function()
					-- upvalues: p1 (copy), UseDispatchResult (copy), SendRefinementAnalyticsModule (upval), UseRoactServiceModuleResult (copy), AccessoryAdjustmentUtilsModule (upval), SetAccessoryAdjustmentsModule (upval), UseSelectorResult2 (copy), TestVariable (copy), Params (copy)
					p1.isApplyingAdjustment.current = true
					UseDispatchResult(SendRefinementAnalyticsModule(UseRoactServiceModuleResult.avatarRefineAccessoryApply(p1.sliderValues)))
					local SliderInfoToVector3sResult, SliderInfoToVector3sResult2, SliderInfoToVector3sResult3 = AccessoryAdjustmentUtilsModule.sliderInfoToVector3s(p1.sliderValues)
					UseDispatchResult(SetAccessoryAdjustmentsModule(SliderInfoToVector3sResult, SliderInfoToVector3sResult2, SliderInfoToVector3sResult3, UseSelectorResult2))
					
					if TestVariable and Params and Params.fromRoute then
						p1.navigation.popToTop()
						p1.navigation.navigate(Params.fromRoute)
						
						return
					else
						p1.navigation.pop()
					end
				end
			}),
			ButtonRow = if FFlagAXMoveResetButtonToControlPanelModule then ReactModule.createElement(View, {
				tag = "row gap-medium size-full-0 auto-y",
				LayoutOrder = 3
			}, {
				ApplyButton = ReactModule.createElement(Button1, {
					LayoutOrder = 1,
					ref = p1.applyButtonRef,
					text = UseLocalizationResult.apply,
					variant = ButtonVariant.Emphasis,
					size = InputSize.Small,
					fillBehavior = FillBehavior.Fill,
					onActivated = UseResult
				}),
				ResetButton = ReactModule.createElement(Button1, {
					LayoutOrder = 2,
					text = UseLocalizationResult.reset,
					variant = ButtonVariant.Standard,
					size = InputSize.Small,
					fillBehavior = FillBehavior.Fill,
					onActivated = UseResult1
				})
			}) else nil
		}),
		HideBottomCorners = if UseSelectorResult then ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			ZIndex = -5,
			Size = UDim2.fromScale(1, 0.3),
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.new(0, 0, 1, 0),
			BackgroundColor3 = Theme.BackgroundDefault.Color,
			BackgroundTransparency = Theme.BackgroundDefault.Transparency
		}) else nil
	})
end))