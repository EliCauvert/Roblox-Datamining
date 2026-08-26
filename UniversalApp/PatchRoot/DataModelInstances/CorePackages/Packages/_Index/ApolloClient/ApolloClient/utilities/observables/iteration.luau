local array = require(script.Parent.Parent.Parent.Parent.LuauPolyfill).Array
local _ = require(script.Parent.Observable)

return {
	iterateObserversSafely = function(p1, p2, p3)
		-- upvalues: array (ref)
		local t = {}
		p1:forEach(function(p4)
			-- upvalues: p2 (ref), t (ref)
			if p4[p2] ~= nil then
				table.insert(t, p4)
			end
		end)
		array.forEach(t, function(p4)
			-- upvalues: p2 (ref), p3 (ref)
			p4[p2](p4, p3)
		end)
	end
}