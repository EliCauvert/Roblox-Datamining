local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local reactModule = require(parent.React)
local useSignalState = require(parent.SignalsReact).useSignalState
local getBreakpointFromRowWidthModule = require(avatarExperienceCatalog.Utils.getBreakpointFromRowWidth)
local getUIScaleFromTokensModule = require(avatarExperienceCatalog.Utils.getUIScaleFromTokens)
local useTokens = require(parent.Foundation).Hooks.useTokens
local _ = require(avatarExperienceCatalog.Components.ResultsList.WidgetListBreakPointEnum)
local getAXMarketplaceWidgetStoreModule = require(avatarExperienceCatalog.Stores.GetAXMarketplaceWidgetStore)

return function(p0) --[[ line: 21 | named "useCatalogFeedBreakpoint" ]]
	-- upvalues: useTokens (ref), getUIScaleFromTokensModule (ref), getAXMarketplaceWidgetStoreModule (ref), useSignalState (ref), reactModule (ref), getBreakpointFromRowWidthModule (ref)
	local var5 = getUIScaleFromTokensModule(useTokens())
	local var6 = if p0 ~= nil then 0.2 else p0
	local var7 = useSignalState(getAXMarketplaceWidgetStoreModule(false).getScreenSize)
	local var8, var9 = reactModule.useState(nil)
	local var10 = reactModule.useRef(nil)
	reactModule.useEffect(function() --[[ line: 44 ]]
		-- upvalues: var10 (ref)
		return function() --[[ line: 45 ]]
			-- upvalues: var10 (copy)
			if var10.current then
				task.cancel(var10.current)
				var10.current = nil
			end
		end
	end, {})
	
	return if var8 ~= nil then var7 else var8, reactModule.useCallback(function(p1) --[[ line: 53 ]]
		-- upvalues: getBreakpointFromRowWidthModule (copy), var5 (ref), var10 (ref), var6 (ref), var9 (ref)
		local var11 = getBreakpointFromRowWidthModule(p1.AbsoluteSize.X, var5)
		
		if var10.current then
			task.cancel(var10.current)
		end
		var10.current = task.delay(var6, function() --[[ line: 59 ]]
			-- upvalues: var10 (copy), var9 (copy), var11 (ref)
			var10.current = nil
			var9(var11)
		end)
	end, { var5, var6 })
end