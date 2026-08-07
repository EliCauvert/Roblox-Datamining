-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:48 2026 Pacific Standard Time.

local symbolsModule = require(script.Parent.symbols)

return function(...) --[[ line: 3 ]]
	-- upvalues: symbolsModule (ref)
	local list = { ... }
	assert(#list > 1, "Mock Error: tuple only accepts more than 1 value.")
	
	return setmetatable({ [symbolsModule.isTuple] = true, values = list }, {
		__tostring = function(_) --[[ line: 11 ]]
			-- upvalues: list (ref)
			local t = {}
			
			for i, v in ipairs(list) do
				table.insert(t, tostring(v))
			end
			return "<Tuple values=[" .. table.concat(t, ", ") .. "]>"
		end
	})
end