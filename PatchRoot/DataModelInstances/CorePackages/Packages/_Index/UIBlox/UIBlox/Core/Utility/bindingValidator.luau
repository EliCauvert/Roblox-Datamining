-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:04 2026 Pacific Standard Time.

return function(p0) --[[ line: 4 | named "bindingValidator" ]]
	return function(p1) --[[ line: 5 ]]
		-- upvalues: p0 (ref)
		if typeof(p1) ~= "table" or not string.match(tostring(p1), "RoactBinding") then
			warn(string.format("RoactBinding expected, got %s", typeof(p1)))
			
			return false
		end
		local ok, status = pcall(function() --[[ line: 13 ]]
			-- upvalues: p1 (ref)
			return p1:getValue()
		end)
		
		if not ok then
			warn("getValue() not defined")
			
			return false
		end
		local var0, var1 = p0(status)
		
		if var0 then
			return true
		end
		warn(string.format("RoactBinding value: %s", var1))
		
		return false
	end
end