local Foundation = script:FindFirstAncestor("Foundation")
local LoggerModule = require(Foundation.Utility.Logger)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)

return function(p1)
	-- upvalues: UseTokensModule (copy), LoggerModule (copy)
	local UseTokensModuleResult = UseTokensModule()
	local ScaledScale = p1 * UseTokensModuleResult.Config.UI.Scale
	
	if ScaledScale <= UseTokensModuleResult.Size.Size_3000 then
		LoggerModule:warning("useScaledValue should be used for values larger than Size tokens. For smaller values, please align to a Size or derivative token.")
	end
	return ScaledScale
end