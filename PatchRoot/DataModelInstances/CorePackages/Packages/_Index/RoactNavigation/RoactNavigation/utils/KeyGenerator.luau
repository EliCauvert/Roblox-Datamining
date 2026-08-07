-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:02 2026 Pacific Standard Time.

local text = "id-" .. tostring(math.random(100000, 1000000))
local var1 = 0

return {
	_TESTING_ONLY_normalize_keys = function() --[[ line: 9 ]]
		-- upvalues: text (write), var1 (write)
		text = "id-"
		var1 = 0
	end,
	generateKey = function() --[[ line: 15 ]]
		-- upvalues: text (write), var1 (write)
		local text_1 = text .. tostring(var1)
		var1 += 1
		
		return text_1
	end
}