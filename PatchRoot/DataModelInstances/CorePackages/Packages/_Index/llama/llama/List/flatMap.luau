-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:42 2026 Pacific Standard Time.

local function flatMap(p0, p1) --[[ line: 2 ]]
	-- upvalues: flatMap (ref)
	local var1 = type(p0)
	assert(var1 == "table", "expected a table for first argument, got " .. var1)
	local var2 = type(p1)
	assert(var2 == "function", "expected a function for second argument, got " .. var2)
	local t = {}
	local var4 = 1
	
	for i_1 = 1, #p0 do
		if type(p0[i_1]) ~= "table" then
			local var6 = p1(p0[i_1], i_1)
			
			if var6 ~= nil then
				t[var4] = var6
				var4 += 1
			end
		end
		local var5 = flatMap(p0[i_1], p1)
		
		for i = 1, #var5 do
			t[var4] = var5[i]
			var4 += 1
		end
	end
	return t
end

return flatMap