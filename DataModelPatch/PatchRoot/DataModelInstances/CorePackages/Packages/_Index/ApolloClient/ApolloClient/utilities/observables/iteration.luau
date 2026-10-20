local Array = require(script.Parent.Parent.Parent.Parent.LuauPolyfill).Array
local _ = require(script.Parent.Observable)

return {
	iterateObserversSafely = function(p1, p2, p3)
		-- upvalues: Array (copy)
		local List = {}
		p1:forEach(function(p4)
			-- upvalues: p2 (copy), List (copy)
			if p4[p2] ~= nil then
				table.insert(List, p4)
			end
		end)
		Array.forEach(List, function(p4)
			-- upvalues: p2 (copy), p3 (copy)
			p4[p2](p4, p3)
		end)
	end
}