-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:29 2026 Pacific Standard Time.

local _ = require(script:FindFirstAncestor("Foundation").Providers.Style.Tokens)
local var0 = nil
local t = {}
local t_1 = {
	getTokenOverrides = function() --[[ line: 35 ]]
		-- upvalues: var0 (write)
		return var0
	end,
	setTokenOverrides = function(value) --[[ line: 38 ]]
		-- upvalues: var0 (write), t (ref)
		var0 = value
		
		for i, v in t do
			v(value)
		end
	end,
	subscribe = function(p0) --[[ line: 44 ]]
		-- upvalues: t (ref)
		table.insert(t, p0)
		
		return function() --[[ line: 46 ]]
			-- upvalues: t (copy), p0 (ref)
			local index = table.find(t, p0)
			
			if index then
				table.remove(t, index)
			end
		end
	end
}

return function() --[[ line: 55 | named "getTokenOverridesStore" ]]
	-- upvalues: t_1 (ref)
	return t_1
end