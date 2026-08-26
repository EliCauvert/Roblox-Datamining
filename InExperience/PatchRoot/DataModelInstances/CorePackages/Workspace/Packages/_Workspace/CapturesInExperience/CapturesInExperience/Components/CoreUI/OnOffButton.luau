local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local localizationModule = require(parent_1.Localization)
local reactModule = require(parent_1.React)
local roactUtilsModule = require(parent_1.RoactUtils)
local segmentedControl = require(parent_1.UIBlox).App.Control.SegmentedControl
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useLocalization = localizationModule.Hooks.useLocalization
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local constantsModule = require(parent.Constants)
local eventNamesModule = require(parent.Analytics.EventNames)
local onToggleActivationModule = require(parent.Utils.onToggleActivation)
local useAnalyticsModule = require(parent.Analytics.useAnalytics)

return function(p1)
	-- upvalues: useAnalyticsModule (ref), useDispatch (ref), useSelector (ref), constantsModule (ref), useLocalization (ref), reactModule (ref), onToggleActivationModule (ref), eventNamesModule (ref), segmentedControl (ref)
	local var1 = useAnalyticsModule()
	local var2 = useDispatch()
	local var3 = useSelector(function(p2)
		-- upvalues: constantsModule (copy)
		return p2[constantsModule.RoduxKey].IsCapturesCoreGuiEnabled
	end)
	local var4 = useSelector(function(p2)
		-- upvalues: constantsModule (copy)
		return p2[constantsModule.RoduxKey].IsActive
	end)
	local var5 = useLocalization({
		offText = "Feature.Captures.Control.Off",
		onText = "Feature.Captures.Control.On"
	})
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromOffset(p1.width, p1.height)
	}, {
		Control = reactModule.createElement(segmentedControl, {
			height = p1.height,
			onTabActivated = reactModule.useCallback(function(p2)
				-- upvalues: onToggleActivationModule (copy), var4 (ref), var1 (ref), var2 (ref), eventNamesModule (copy)
				onToggleActivationModule(var4, p2, var1.fireEvent, var2, eventNamesModule.CapturesActivatedInGameMenu, eventNamesModule.CapturesDeactivatedInGameMenu)
			end, { var4 }),
			selectedTabIndex = if var4 then 1 else 2,
			tabs = {
				{ tabName = var5.onText, isDisabled = not var3 },
				{ tabName = var5.offText, isDisabled = not var3 }
			},
			width = UDim.new(0, p1.width)
		})
	})
end