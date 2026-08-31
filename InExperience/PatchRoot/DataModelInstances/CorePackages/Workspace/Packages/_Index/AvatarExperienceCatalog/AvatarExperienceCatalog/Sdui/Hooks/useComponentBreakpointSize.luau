local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local reactModule = require(parent.React)
local useSignalState = require(parent.SignalsReact).useSignalState
local getBreakpointFromRowWidthModule = require(avatarExperienceCatalog.Utils.getBreakpointFromRowWidth)
local getUIScaleFromTokensModule = require(avatarExperienceCatalog.Utils.getUIScaleFromTokens)
local useTokens = require(parent.Foundation).Hooks.useTokens
local _ = require(avatarExperienceCatalog.Components.ResultsList.WidgetListBreakPointEnum)
local getAXMarketplaceWidgetStoreModule = require(avatarExperienceCatalog.Stores.GetAXMarketplaceWidgetStore)

return function(p1)
	-- upvalues: useTokens (ref), getUIScaleFromTokensModule (ref), getAXMarketplaceWidgetStoreModule (ref), useSignalState (ref), reactModule (ref), getBreakpointFromRowWidthModule (ref)
	local var1 = getUIScaleFromTokensModule(useTokens())
	local var2 = if p1 ~= nil then 0.2 else p1
	local var3 = useSignalState(getAXMarketplaceWidgetStoreModule(false).getScreenSize)
	local var4, var5 = reactModule.useState(nil)
	local var6 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: var6 (ref)
		return function()
			-- upvalues: var6 (copy)
			if var6.current then
				task.cancel(var6.current)
				var6.current = nil
			end
		end
	end, {})
	
	return if var4 ~= nil then var3 else var4, reactModule.useCallback(function(p2)
		-- upvalues: getBreakpointFromRowWidthModule (copy), var1 (ref), var6 (ref), var2 (ref), var5 (ref)
		local var7 = getBreakpointFromRowWidthModule(p2.AbsoluteSize.X, var1)
		
		if var6.current then
			task.cancel(var6.current)
		end
		var6.current = task.delay(var2, function()
			-- upvalues: var6 (copy), var5 (copy), var7 (ref)
			var6.current = nil
			var5(var7)
		end)
	end, { var1, var2 })
end