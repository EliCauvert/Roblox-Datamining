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

return function(p1)
	-- upvalues: reactModule (ref), useAnalyticsModule (ref), useSelector (ref), constantsModule (ref), useEffectOnce (ref), eventNamesModule (ref), captureConfigCTAsModule (ref), capturesGalleryModule (ref)
	local var1 = reactModule.useCallback(function()
		-- upvalues: p1 (ref)
		p1.closeSettingsMenu()
	end, {})
	local var2 = useAnalyticsModule()
	local var3, var4 = reactModule.useState(0)
	local var5 = useSelector(function(p2)
		-- upvalues: constantsModule (copy)
		return p2[constantsModule.RoduxKey].IsMenuOpen
	end)
	useEffectOnce(function()
		-- upvalues: var2 (ref), eventNamesModule (copy)
		var2.fireEvent(eventNamesModule.CapturesPageOpenedInGameMenu)
	end, var5)
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		Visible = var5
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
			closeSettingsMenu = var1,
			onAbsoluteSizeChanged = reactModule.useCallback(function(p2)
				-- upvalues: var4 (ref)
				var4(p2.Y)
			end, {})
		}),
		CapturesGallery = reactModule.createElement(capturesGalleryModule, { LayoutOrder = 2, Size = UDim2.new(1, 0, 1, (-var3) - 12) })
	})
end