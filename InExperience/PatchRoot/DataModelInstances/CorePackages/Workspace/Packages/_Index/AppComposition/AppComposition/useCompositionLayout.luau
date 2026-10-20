local AppComposition = script:FindFirstAncestor("AppComposition")
local Parent = AppComposition.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(AppComposition.AppCompositionTypes)
local CompositionConfigModule = require(AppComposition.CompositionConfig)
local GetGlobalViewportBreakpointModule = require(AppComposition.getGlobalViewportBreakpoint)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens

return function()
	-- upvalues: UseTokensFunction (copy), SignalsReactModule (copy), GetGlobalViewportBreakpointModule (copy), ReactModule (copy), CompositionConfigModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseSignalStateResult = SignalsReactModule.useSignalState(GetGlobalViewportBreakpointModule)
	
	return ReactModule.useMemo(function()
		-- upvalues: CompositionConfigModule (upval), UseSignalStateResult (copy), UseTokensResult (copy)
		return CompositionConfigModule.getBaseConfig(UseSignalStateResult, UseTokensResult)
	end, { UseSignalStateResult, UseTokensResult })
end