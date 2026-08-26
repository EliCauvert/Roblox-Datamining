local _ = require(script.Parent.Parent.Parent.LuauPolyfill)

return {
	didYouMean = function(p1, p2)
		local var1
		local var2 = nil
		local _ = nil
		
		if p2 then
			var2 = p1
			var1 = p2
		else
			var1 = p1
		end
		local var3 = " Did you mean "
		
		if var2 then
			var3 ..= var2 .. " "
		end
		local t = {}
		
		for i = 1, #var1 do
			t[i] = ("%q"):format(var1[i])
		end
		local tCount = #t
		
		if tCount == 0 then
			return ""
		elseif tCount == 1 then
			return var3 .. t[1] .. "?"
		elseif tCount == 2 then
			return var3 .. t[1] .. " or " .. t[2] .. "?"
		end
		local t_1 = {}
		table.move(t, 1, 5, 1, t_1)
		
		return var3 .. table.concat(t_1, ", ") .. ", or " .. tostring(table.remove(t_1)) .. "?"
	end
}