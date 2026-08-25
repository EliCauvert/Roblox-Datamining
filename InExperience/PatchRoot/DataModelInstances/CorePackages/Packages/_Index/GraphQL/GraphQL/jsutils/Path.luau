local array = require(script.Parent.Parent.Parent.LuauPolyfill).Array

return {
	addPath = function(p0, p1, p2)
		return { prev = p0, key = p1, typename = p2 }
	end,
	pathToArray = function(p3)
		-- upvalues: array (ref)
		local t = {}
		local var1 = p3
		while var1 do
			table.insert(t, var1.key)
			var1 = var1.prev
		end
		return array.reverse(t)
	end
}