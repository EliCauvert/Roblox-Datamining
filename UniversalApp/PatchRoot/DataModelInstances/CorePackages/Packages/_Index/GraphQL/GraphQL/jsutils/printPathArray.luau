local _ = require(script.Parent.Parent.Parent.LuauPolyfill)

return {
	printPathArray = function(p0) --[[ line: 15 ]]
		local t = {}
		
		for i = 1, #p0 do
			local var1 = p0[i]
			t[i] = if typeof(var1) == "number" then "[" .. tostring(var1) .. "]" else "." .. var1
		end
		return table.concat(t, "")
	end
}