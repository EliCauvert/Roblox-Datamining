local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local reactModule = require(parent.React)
local useSignalState = require(parent.SignalsReact).useSignalState
local getBreakpointFromRowWidthModule = require(avatarExperienceCatalog.Utils.getBreakpointFromRowWidth)
local getUIScaleFromTokensModule = require(avatarExperienceCatalog.Utils.getUIScaleFromTokens)
local useTokens = require(parent.Foundation).Hooks.useTokens
local _ = require(avatarExperienceCatalog.Components.ResultsList.WidgetListBreakPointEnum)
local getAXMarketplaceWidgetStoreModule = require(avatarExperienceCatalog.Stores.GetAXMarketplaceWidgetStore)
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local fFlagAXSduiFeedPublishesBreakpoint = avatarExperienceFlagsModule.FFlagAXSduiFeedPublishesBreakpoint
local fFlagAXMarketplaceBreakpointMismatchCounter = avatarExperienceFlagsModule.FFlagAXMarketplaceBreakpointMismatchCounter

return function(p1, p2)
	-- upvalues: useTokens (ref), getUIScaleFromTokensModule (ref), getAXMarketplaceWidgetStoreModule (ref), useSignalState (ref), reactModule (ref), fFlagAXMarketplaceBreakpointMismatchCounter (ref), fFlagAXSduiFeedPublishesBreakpoint (ref), getBreakpointFromRowWidthModule (ref)
	local var1 = getUIScaleFromTokensModule(useTokens())
	local var2 = if p1 ~= nil then 0.2 else p1
	local var3 = if p2 and p2.horizontalInset then p2.horizontalInset else 0
	local var4 = p2 ~= nil and p2.publishToStore == true
	local var5 = if p2 and p2.measurementSource then p2.measurementSource else ""
	local var6 = getAXMarketplaceWidgetStoreModule(false)
	local var7 = useSignalState(var6.getScreenSize)
	local var8, var9 = reactModule.useState(nil)
	local var10 = reactModule.useRef(nil)
	local var11 = if fFlagAXMarketplaceBreakpointMismatchCounter then reactModule.useRef(false) else nil
	reactModule.useEffect(function()
		-- upvalues: var10 (ref)
		return function()
			-- upvalues: var10 (copy)
			if var10.current then
				task.cancel(var10.current)
				var10.current = nil
			end
		end
	end, {})
	
	return if var8 ~= nil then var7 else var8, reactModule.useCallback(function(p3)
		-- upvalues: fFlagAXSduiFeedPublishesBreakpoint (copy), var3 (ref), getBreakpointFromRowWidthModule (copy), var1 (ref), var10 (ref), var2 (ref), fFlagAXMarketplaceBreakpointMismatchCounter (copy), var11 (ref), var5 (ref), var6 (ref), var4 (ref), var9 (ref)
		local x = p3.AbsoluteSize.X
		
		if fFlagAXSduiFeedPublishesBreakpoint and var3 > 0 then
			x = math.max(x - var3, 0)
		end
		local var12 = getBreakpointFromRowWidthModule(x, var1)
		
		if var10.current then
			task.cancel(var10.current)
		end
		var10.current = task.delay(var2, function()
			-- upvalues: var10 (copy), fFlagAXMarketplaceBreakpointMismatchCounter (copy), var11 (copy), var5 (copy), var6 (copy), var12 (ref), fFlagAXSduiFeedPublishesBreakpoint (copy), var4 (copy), var9 (copy)
			var10.current = nil
			
			if fFlagAXMarketplaceBreakpointMismatchCounter and var11 and (var5 ~= "" and not var11.current) then
				var11.current = true
				var6.reportMeasuredBreakpoint(var12, var5)
			end
			if fFlagAXSduiFeedPublishesBreakpoint and var4 then
				var6.setScreenSize(var12)
			end
			var9(var12)
		end)
	end, if fFlagAXSduiFeedPublishesBreakpoint or fFlagAXMarketplaceBreakpointMismatchCounter then {
		var1, var2, var3, var4, var5, var6
	} else { var1, var2 })
end