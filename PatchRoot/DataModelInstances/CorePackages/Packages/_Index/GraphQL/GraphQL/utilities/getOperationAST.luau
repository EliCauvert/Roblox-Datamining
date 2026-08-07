-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:38 2026 Pacific Standard Time.

local _ = require(script.Parent.Parent.language.ast)
local kind = require(script.Parent.Parent.language.kinds).Kind

return {
	getOperationAST = function(p0, p1) --[[ line: 21 ]]
		-- upvalues: kind (ref)
		local var0 = nil
		
		for i, v in pairs(p0.definitions) do
			if v.kind == kind.OPERATION_DEFINITION then
				if p1 == nil then
					if not var0 then
						var0 = v
						continue
					end
					return nil
				elseif v.name and v.name.value == p1 then
					return v
				end
			end
		end
		return var0
	end
}