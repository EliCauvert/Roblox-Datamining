local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local RoactUtilsModule = require(Parent1.RoactUtils)
local SegmentedControl = require(Parent1.UIBlox).App.Control.SegmentedControl
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseLocalizationFunction = require(Parent1.Localization).Hooks.useLocalization
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local ConstantsModule = require(Parent.Constants)
local EventNamesModule = require(Parent.Analytics.EventNames)
local OnToggleActivationModule = require(Parent.Utils.onToggleActivation)
local UseAnalyticsModule = require(Parent.Analytics.useAnalytics)

return function(p1) --[[ Line: 25 ]]
	-- upvalues: UseAnalyticsModule (copy), UseDispatchFunction (copy), UseSelectorFunction (copy), ConstantsModule (copy), UseLocalizationFunction (copy), ReactModule (copy), OnToggleActivationModule (copy), EventNamesModule (copy), SegmentedControl (copy)
	local UseAnalyticsModuleResult = UseAnalyticsModule()
	local UseDispatchResult = UseDispatchFunction()
	local UseSelectorResult = UseSelectorFunction(function(p2) --[[ Line: 29 ]]
		-- upvalues: ConstantsModule (upval)
		return p2[ConstantsModule.RoduxKey].IsCapturesCoreGuiEnabled
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p2) --[[ Line: 33 ]]
		-- upvalues: ConstantsModule (upval)
		return p2[ConstantsModule.RoduxKey].IsActive
	end)
	local UseLocalizationResult = UseLocalizationFunction({
		offText = "Feature.Captures.Control.Off",
		onText = "Feature.Captures.Control.On"
	})
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromOffset(p1.width, p1.height)
	}, {
		Control = ReactModule.createElement(SegmentedControl, {
			height = p1.height,
			onTabActivated = ReactModule.useCallback(function(p2) --[[ Line: 42 ]]
				-- upvalues: OnToggleActivationModule (upval), UseSelectorResult1 (copy), UseAnalyticsModuleResult (copy), UseDispatchResult (copy), EventNamesModule (upval)
				OnToggleActivationModule(UseSelectorResult1, p2, UseAnalyticsModuleResult.fireEvent, UseDispatchResult, EventNamesModule.CapturesActivatedInGameMenu, EventNamesModule.CapturesDeactivatedInGameMenu)
			end, { UseSelectorResult1 }),
			selectedTabIndex = if UseSelectorResult1 then 1 else 2,
			tabs = {
				{
					tabName = UseLocalizationResult.onText,
					isDisabled = not UseSelectorResult
				},
				{
					tabName = UseLocalizationResult.offText,
					isDisabled = not UseSelectorResult
				}
			},
			width = UDim.new(0, p1.width)
		})
	})
end