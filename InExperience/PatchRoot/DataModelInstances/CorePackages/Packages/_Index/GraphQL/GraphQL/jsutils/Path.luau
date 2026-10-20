local Array = require(script.Parent.Parent.Parent.LuauPolyfill).Array

return {
	addPath = function(Prev, Key, Typename)
		return { prev = Prev, key = Key, typename = Typename }
	end,
	pathToArray = function(Prev)
		-- upvalues: Array (copy)
		local Keys = {}
		local Prev1 = Prev
		while Prev1 do
			table.insert(Keys, Prev1.key)
			Prev1 = Prev1.prev
		end
		return Array.reverse(Keys)
	end
}