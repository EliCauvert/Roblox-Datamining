-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:34 2026 Pacific Standard Time.

local _ = require(script.Parent.Parent.Parent.LuauPolyfill)

return {
	didYouMean = function(p0, p1) --[[ line: 20 ]]
		local var1
		local var0 = nil
		local _ = nil
		
		if p1 then
			var0 = p0
			var1 = p1
		else
			var1 = p0
		end
		local var2 = " Did you mean "
		
		if var0 then
			var2 ..= var0 .. " "
		end
		local t = {}
		
		for i = 1, #var1 do
			t[i] = ("%q"):format(var1[i])
		end
		local tCount = #t
		
		if tCount == 0 then
			return ""
		elseif tCount == 1 then
			return var2 .. t[1] .. "?"
		elseif tCount == 2 then
			return var2 .. t[1] .. " or " .. t[2] .. "?"
		end
		local t_1 = {}
		table.move(t, 1, 5, 1, t_1)
		
		return var2 .. table.concat(t_1, ", ") .. ", or " .. tostring(table.remove(t_1)) .. "?"
	end
}