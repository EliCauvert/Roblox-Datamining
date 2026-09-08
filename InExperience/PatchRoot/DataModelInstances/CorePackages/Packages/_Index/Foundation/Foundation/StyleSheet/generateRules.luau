local foundation = script:FindFirstAncestor("Foundation")
local dashModule = require(foundation.Parent.Dash)
local _ = require(foundation.Providers.Style.Tokens)
local _ = require(script.Parent.Rules.Types)
local formatTokensModule = require(script.Parent.formatTokens)

return function(p1, p2)
	-- upvalues: formatTokensModule (ref), dashModule (ref)
	local var1, var2, var3, var4 = p2(p1, formatTokensModule(p1))
	
	return dashModule.joinArrays(var1, var2, var3), var1, var2, var3, var4
end