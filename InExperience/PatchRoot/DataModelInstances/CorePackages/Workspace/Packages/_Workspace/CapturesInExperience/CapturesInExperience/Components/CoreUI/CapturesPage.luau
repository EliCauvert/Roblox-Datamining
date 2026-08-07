local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local roactUtilsModule = require(parent_1.RoactUtils)
local useEffectOnce = roactUtilsModule.Hooks.useEffectOnce
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local captureConfigCTAsModule = require(parent.Components.CoreUI.CaptureConfigCTAs)
local capturesGalleryModule = require(parent.Components.CapturesGallery.CapturesGallery)
local constantsModule = require(parent.Constants)
local eventNamesModule = require(parent.Analytics.EventNames)
local useAnalyticsModule = require(parent.Analytics.useAnalytics)

return function(p0) --[[ line: 22 ]]
	-- upvalues: reactModule (ref), useAnalyticsModule (ref), useSelector (ref), constantsModule (ref), useEffectOnce (ref), eventNamesModule (ref), captureConfigCTAsModule (ref), capturesGalleryModule (ref)
	local var7 = reactModule.useCallback(function() --[[ line: 23 ]]
		-- upvalues: p0 (ref)
		p0.closeSettingsMenu()
	end, {})
	local var8 = useAnalyticsModule()
	local var9, var10 = reactModule.useState(0)
	local var11 = useSelector(function(p1) --[[ line: 30 ]]
		-- upvalues: constantsModule (copy)
		return p1[constantsModule.RoduxKey].IsMenuOpen
	end)
	useEffectOnce(function() --[[ line: 34 ]]
		-- upvalues: var8 (ref), eventNamesModule (copy)
		var8.fireEvent(eventNamesModule.CapturesPageOpenedInGameMenu)
	end, var11)
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		Visible = var11
	}, {
		Layout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			Padding = UDim.new(0, 12)
		}),
		CaptureConfigCTAs = reactModule.createElement(captureConfigCTAsModule, {
			LayoutOrder = 1,
			closeSettingsMenu = var7,
			onAbsoluteSizeChanged = reactModule.useCallback(function(p2) --[[ line: 38 ]]
				-- upvalues: var10 (ref)
				var10(p2.Y)
			end, {})
		}),
		CapturesGallery = reactModule.createElement(capturesGalleryModule, { LayoutOrder = 2, Size = UDim2.new(1, 0, 1, (-var9) - 12) })
	})
end