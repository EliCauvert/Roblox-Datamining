local array = require(script.Parent.Parent.Parent.LuauPolyfill).Array

return {
	addPath = function(p1, p2, p3)
		return { prev = p1, key = p2, typename = p3 }
	end,
	pathToArray = function(p1)
		-- upvalues: array (ref)
		local t = {}
		local var1 = p1
		while var1 do
			table.insert(t, var1.key)
			var1 = var1.prev
		end
		return array.reverse(t)
	end
}