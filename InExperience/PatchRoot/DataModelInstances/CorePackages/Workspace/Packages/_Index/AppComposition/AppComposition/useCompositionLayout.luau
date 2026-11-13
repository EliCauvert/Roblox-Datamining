local AppComposition = script:FindFirstAncestor("AppComposition")
local Parent = AppComposition.Parent
local DisplayModule = require(Parent.Display)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local _ = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local FFlagAppCompositionContainerWidth = require(Parent.SharedFlags).FFlagAppCompositionContainerWidth
local _ = require(AppComposition.AppCompositionTypes)
local CompositionConfigModule = require(AppComposition.CompositionConfig)
local CreateBreakpointComputedModule = require(AppComposition.createBreakpointComputed)
local GetGlobalViewportBreakpointModule = require(AppComposition.getGlobalViewportBreakpoint)
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(Callback)
	-- upvalues: UseTokensFunction (copy), FFlagAppCompositionContainerWidth (copy), ReactModule (copy), CreateBreakpointComputedModule (copy), DisplayModule (copy), GetGlobalViewportBreakpointModule (copy), SignalsReactModule (copy), CompositionConfigModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseMemoResult = if FFlagAppCompositionContainerWidth then ReactModule.useMemo(function()
		-- upvalues: Callback (copy), CreateBreakpointComputedModule (upval), DisplayModule (upval), GetGlobalViewportBreakpointModule (upval)
		return if Callback then CreateBreakpointComputedModule(function(p1)
			-- upvalues: Callback (upval), DisplayModule (upval)
			return Callback(p1) / DisplayModule.GetDisplayStore(p1).getPlatformScale(p1)
		end) else GetGlobalViewportBreakpointModule
	end, { Callback }) else nil
	local UseSignalStateResult = SignalsReactModule.useSignalState(if FFlagAppCompositionContainerWidth then UseMemoResult else GetGlobalViewportBreakpointModule)
	
	return ReactModule.useMemo(function()
		-- upvalues: CompositionConfigModule (upval), UseSignalStateResult (copy), UseTokensResult (copy)
		return CompositionConfigModule.getBaseConfig(UseSignalStateResult, UseTokensResult)
	end, { UseSignalStateResult, UseTokensResult })
end