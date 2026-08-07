-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:30 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local loggerModule = require(foundation.Utility.Logger)
local useTokensModule = require(foundation.Providers.Style.useTokens)

return function(p0) --[[ line: 6 | named "useScaledValue" ]]
	-- upvalues: useTokensModule (ref), loggerModule (ref)
	local var3 = useTokensModule()
	local var4 = p0 * var3.Config.UI.Scale
	
	if var4 <= var3.Size.Size_3000 then
		loggerModule:warning("useScaledValue should be used for values larger than Size tokens. For smaller values, please align to a Size or derivative token.")
	end
	return var4
end