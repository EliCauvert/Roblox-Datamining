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

return function(p0)
	-- upvalues: useAnalyticsModule (ref), useDispatch (ref), useSelector (ref), constantsModule (ref), useLocalization (ref), reactModule (ref), onToggleActivationModule (ref), eventNamesModule (ref), segmentedControl (ref)
	local var7 = useAnalyticsModule()
	local var8 = useDispatch()
	local var9 = useSelector(function(p1)
		-- upvalues: constantsModule (copy)
		return p1[constantsModule.RoduxKey].IsCapturesCoreGuiEnabled
	end)
	local var10 = useSelector(function(p2)
		-- upvalues: constantsModule (copy)
		return p2[constantsModule.RoduxKey].IsActive
	end)
	local var11 = useLocalization({
		offText = "Feature.Captures.Control.Off",
		onText = "Feature.Captures.Control.On"
	})
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromOffset(p0.width, p0.height)
	}, {
		Control = reactModule.createElement(segmentedControl, {
			height = p0.height,
			onTabActivated = reactModule.useCallback(function(p3)
				-- upvalues: onToggleActivationModule (copy), var10 (ref), var7 (ref), var8 (ref), eventNamesModule (copy)
				onToggleActivationModule(var10, p3, var7.fireEvent, var8, eventNamesModule.CapturesActivatedInGameMenu, eventNamesModule.CapturesDeactivatedInGameMenu)
			end, { var10 }),
			selectedTabIndex = if var10 then 1 else 2,
			tabs = {
				{ tabName = var11.onText, isDisabled = not var9 },
				{ tabName = var11.offText, isDisabled = not var9 }
			},
			width = UDim.new(0, p0.width)
		})
	})
end