local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local Parent = AvatarExperienceCatalog.Parent
local ReactModule = require(Parent.React)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local GetBreakpointFromRowWidthModule = require(AvatarExperienceCatalog.Utils.getBreakpointFromRowWidth)
local GetUIScaleFromTokensModule = require(AvatarExperienceCatalog.Utils.getUIScaleFromTokens)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local _ = require(AvatarExperienceCatalog.Components.ResultsList.WidgetListBreakPointEnum)
local GetAXMarketplaceWidgetStoreModule = require(AvatarExperienceCatalog.Stores.GetAXMarketplaceWidgetStore)
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local FFlagAXSduiFeedPublishesBreakpoint = AvatarExperienceFlagsModule.FFlagAXSduiFeedPublishesBreakpoint
local FFlagAXMarketplaceBreakpointMismatchCounter = AvatarExperienceFlagsModule.FFlagAXMarketplaceBreakpointMismatchCounter

return function(p1, p2)
	-- upvalues: UseTokensFunction (copy), GetUIScaleFromTokensModule (copy), GetAXMarketplaceWidgetStoreModule (copy), UseSignalStateFunction (copy), ReactModule (copy), FFlagAXMarketplaceBreakpointMismatchCounter (copy), FFlagAXSduiFeedPublishesBreakpoint (copy), GetBreakpointFromRowWidthModule (copy)
	local UIScaleFromTokensModule = GetUIScaleFromTokensModule((UseTokensFunction()))
	local Delay = if p1 == nil then 0.2 else p1
	local HorizontalInset = if p2 and p2.horizontalInset then p2.horizontalInset else 0
	local IsPublishToStore: boolean = p2 ~= nil and p2.publishToStore == true
	local MeasurementSource = if p2 and p2.measurementSource then p2.measurementSource else ""
	local AXMarketplaceWidgetStoreModule = GetAXMarketplaceWidgetStoreModule(false)
	local UseSignalStateResult = UseSignalStateFunction(AXMarketplaceWidgetStoreModule.getScreenSize)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = if FFlagAXMarketplaceBreakpointMismatchCounter then ReactModule.useRef(false) else nil
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy)
		return function()
			-- upvalues: UseRefResult (upval)
			if UseRefResult.current then
				task.cancel(UseRefResult.current)
				UseRefResult.current = nil
			end
		end
	end, {})
	
	return if UseStateResult == nil then UseSignalStateResult else UseStateResult, (ReactModule.useCallback(function(Frame)
		-- upvalues: FFlagAXSduiFeedPublishesBreakpoint (upval), HorizontalInset (copy), GetBreakpointFromRowWidthModule (upval), UIScaleFromTokensModule (copy), UseRefResult (copy), Delay (copy), FFlagAXMarketplaceBreakpointMismatchCounter (upval), UseRefResult1 (copy), MeasurementSource (copy), AXMarketplaceWidgetStoreModule (copy), IsPublishToStore (copy), UseStateResult2 (copy)
		local X = Frame.AbsoluteSize.X
		
		if FFlagAXSduiFeedPublishesBreakpoint and HorizontalInset > 0 then
			X = math.max(X - HorizontalInset, 0)
		end
		local BreakpointFromRowWidthModule = GetBreakpointFromRowWidthModule(X, UIScaleFromTokensModule)
		
		if UseRefResult.current then
			task.cancel(UseRefResult.current)
		end
		UseRefResult.current = task.delay(Delay, function()
			-- upvalues: UseRefResult (upval), FFlagAXMarketplaceBreakpointMismatchCounter (upval), UseRefResult1 (upval), MeasurementSource (upval), AXMarketplaceWidgetStoreModule (upval), BreakpointFromRowWidthModule (copy), FFlagAXSduiFeedPublishesBreakpoint (upval), IsPublishToStore (upval), UseStateResult2 (upval)
			UseRefResult.current = nil
			
			if FFlagAXMarketplaceBreakpointMismatchCounter and UseRefResult1 and MeasurementSource ~= "" and not UseRefResult1.current then
				UseRefResult1.current = true
				AXMarketplaceWidgetStoreModule.reportMeasuredBreakpoint(BreakpointFromRowWidthModule, MeasurementSource)
			end
			if FFlagAXSduiFeedPublishesBreakpoint and IsPublishToStore then
				AXMarketplaceWidgetStoreModule.setScreenSize(BreakpointFromRowWidthModule)
			end
			UseStateResult2(BreakpointFromRowWidthModule)
		end)
	end, if FFlagAXSduiFeedPublishesBreakpoint or FFlagAXMarketplaceBreakpointMismatchCounter then {
		UIScaleFromTokensModule, Delay, HorizontalInset, IsPublishToStore,
		MeasurementSource, AXMarketplaceWidgetStoreModule
	} else { UIScaleFromTokensModule, Delay }))
end