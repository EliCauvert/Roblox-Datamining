local Foundation = script:FindFirstAncestor("Foundation")
local DashModule = require(Foundation.Parent.Dash)
local _ = require(Foundation.Providers.Style.Tokens)
local _ = require(script.Parent.Rules.Types)
local FormatTokensModule = require(script.Parent.formatTokens)

return function(p1, Callback)
	-- upvalues: FormatTokensModule (copy), DashModule (copy)
	local CallbackResult, CallbackResult2, CallbackResult3 = Callback(p1, (FormatTokensModule(p1)))
	
	return DashModule.joinArrays(CallbackResult, CallbackResult2, CallbackResult3), CallbackResult, CallbackResult2, CallbackResult3
end