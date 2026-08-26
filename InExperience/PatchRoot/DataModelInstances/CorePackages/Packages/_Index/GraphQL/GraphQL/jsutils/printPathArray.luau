local _ = require(script.Parent.Parent.Parent.LuauPolyfill)

return {
	printPathArray = function(p1)
		local t = {}
		
		for i = 1, #p1 do
			local var1 = p1[i]
			t[i] = if typeof(var1) == "number" then "[" .. tostring(var1) .. "]" else "." .. var1
		end
		return table.concat(t, "")
	end
}