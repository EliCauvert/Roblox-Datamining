-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:28 2026 Pacific Standard Time.

local reactModule = require(script:FindFirstAncestor("Foundation").Parent.React)

return function(p0) --[[ line: 16 | named "createUseModalNavigation" ]]
	-- upvalues: reactModule (ref)
	return function() --[[ line: 17 ]]
		-- upvalues: reactModule (copy), p0 (ref)
		local var1 = reactModule.useContext(p0)
		
		return {
			closeAffordanceRef = var1.closeAffordanceRef,
			setContentStartRef = var1.setContentStartRef
		}
	end
end