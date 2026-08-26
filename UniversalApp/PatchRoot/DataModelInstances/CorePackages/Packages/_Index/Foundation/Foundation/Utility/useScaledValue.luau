local foundation = script:FindFirstAncestor("Foundation")
local loggerModule = require(foundation.Utility.Logger)
local useTokensModule = require(foundation.Providers.Style.useTokens)

return function(p1)
	-- upvalues: useTokensModule (ref), loggerModule (ref)
	local var1 = useTokensModule()
	local var2 = p1 * var1.Config.UI.Scale
	
	if var2 <= var1.Size.Size_3000 then
		loggerModule:warning("useScaledValue should be used for values larger than Size tokens. For smaller values, please align to a Size or derivative token.")
	end
	return var2
end