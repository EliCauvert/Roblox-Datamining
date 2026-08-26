local parent = script.Parent.Parent
local _ = require(parent.Parent.LuauPolyfill)
local _ = require(script.Parent.helpers_types)

return {
	hasOwnProperty = require(parent.luaUtils.hasOwnProperty),
	toArray = function(p1)
		if p1._array then
			return table.clone(p1._array)
		end
		local t = {}
		p1:forEach(function(p2)
			-- upvalues: t (ref)
			table.insert(t, p2)
		end)
		
		return t
	end,
	maybeUnsubscribe = function(p1)
		local unsubscribe = p1.unsubscribe
		
		if type(unsubscribe) == "function" then
			p1.unsubscribe = nil
			unsubscribe()
		end
	end
}