local _ = require(script.Parent.Parent.Parent.LuauPolyfill)

return {
	printPathArray = function(p1): string --[[ Line: 15 ]]
		local List = {}
		
		for i = 1, #p1 do
			local v1 = p1[i]
			List[i] = typeof(v1) == "number" and "[" .. tostring(v1) .. "]" or "." .. v1
		end
		return table.concat(List, "")
	end
}