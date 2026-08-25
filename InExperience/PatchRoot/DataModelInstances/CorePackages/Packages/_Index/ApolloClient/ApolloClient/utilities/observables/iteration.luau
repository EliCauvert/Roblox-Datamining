local array = require(script.Parent.Parent.Parent.Parent.LuauPolyfill).Array
local _ = require(script.Parent.Observable)

return {
	iterateObserversSafely = function(p0, p1, p2)
		-- upvalues: array (ref)
		local t = {}
		p0:forEach(function(p3)
			-- upvalues: p1 (ref), t (ref)
			if p3[p1] ~= nil then
				table.insert(t, p3)
			end
		end)
		array.forEach(t, function(p4)
			-- upvalues: p1 (ref), p2 (ref)
			p4[p1](p4, p2)
		end)
	end
}