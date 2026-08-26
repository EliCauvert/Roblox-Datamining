local appComposition = script:FindFirstAncestor("AppComposition")
local parent = appComposition.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(appComposition.AppCompositionTypes)
local compositionConfigModule = require(appComposition.CompositionConfig)
local getGlobalViewportBreakpointModule = require(appComposition.getGlobalViewportBreakpoint)
local useTokens = foundationModule.Hooks.useTokens

return function()
	-- upvalues: useTokens (ref), signalsReactModule (ref), getGlobalViewportBreakpointModule (ref), reactModule (ref), compositionConfigModule (ref)
	local var1 = useTokens()
	local var2 = signalsReactModule.useSignalState(getGlobalViewportBreakpointModule)
	
	return reactModule.useMemo(function()
		-- upvalues: compositionConfigModule (copy), var2 (ref), var1 (ref)
		return compositionConfigModule.getBaseConfig(var2, var1)
	end, { var2, var1 })
end