local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local RoactUtilsModule = require(Parent1.RoactUtils)
local UseEffectOnceFunction = RoactUtilsModule.Hooks.useEffectOnce
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local CaptureConfigCTAsModule = require(Parent.Components.CoreUI.CaptureConfigCTAs)
local CapturesGalleryModule = require(Parent.Components.CapturesGallery.CapturesGallery)
local ConstantsModule = require(Parent.Constants)
local EventNamesModule = require(Parent.Analytics.EventNames)
local UseAnalyticsModule = require(Parent.Analytics.useAnalytics)

return function(p1)
	-- upvalues: ReactModule (copy), UseAnalyticsModule (copy), UseSelectorFunction (copy), ConstantsModule (copy), UseEffectOnceFunction (copy), EventNamesModule (copy), CaptureConfigCTAsModule (copy), CapturesGalleryModule (copy)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy)
		p1.closeSettingsMenu()
	end, {})
	local UseAnalyticsModuleResult = UseAnalyticsModule()
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local UseSelectorResult = UseSelectorFunction(function(p2)
		-- upvalues: ConstantsModule (upval)
		return p2[ConstantsModule.RoduxKey].IsMenuOpen
	end)
	UseEffectOnceFunction(function()
		-- upvalues: UseAnalyticsModuleResult (copy), EventNamesModule (upval)
		UseAnalyticsModuleResult.fireEvent(EventNamesModule.CapturesPageOpenedInGameMenu)
	end, UseSelectorResult)
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		Visible = UseSelectorResult
	}, {
		Layout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			Padding = UDim.new(0, 12)
		}),
		CaptureConfigCTAs = ReactModule.createElement(CaptureConfigCTAsModule, {
			LayoutOrder = 1,
			closeSettingsMenu = UseResult,
			onAbsoluteSizeChanged = ReactModule.useCallback(function(p2)
				-- upvalues: UseStateResult2 (copy)
				UseStateResult2(p2.Y)
			end, {})
		}),
		CapturesGallery = ReactModule.createElement(CapturesGalleryModule, {
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 1, -UseStateResult - 12)
		})
	})
end