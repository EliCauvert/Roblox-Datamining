local Parent = script.Parent.Parent
local _ = require(Parent.Parent.LuauPolyfill)
local _ = require(script.Parent.helpers_types)

return {
	hasOwnProperty = require(Parent.luaUtils.hasOwnProperty),
	toArray = function(p1) --[[ Line: 23 ]]
		if p1._array then
			return table.clone(p1._array)
		else
			local List = {}
			p1:forEach(function(p2) --[[ Line: 31 ]]
				-- upvalues: List (copy)
				table.insert(List, p2)
			end)
			
			return List
		end
	end,
	maybeUnsubscribe = function(p1) --[[ Line: 41 ]]
		local UnsubscribeFunction: () -> () = p1.unsubscribe
		
		if type(UnsubscribeFunction) == "function" then
			p1.unsubscribe = nil
			UnsubscribeFunction()
		end
	end
}