local array = require(script.Parent.Parent.Parent.Parent.LuauPolyfill).Array

return {
	filterInPlace = function(p0, p1, p2) --[[ line: 23 ]]
		-- upvalues: array (ref)
		local var0 = 1
		array.forEach(p0, function(p3, p4) --[[ line: 25 ]]
			-- upvalues: p1 (ref), p0 (ref), var0 (write)
			if p1(p3, p4, p0) then
				p0[var0] = p3
				var0 += 1
			end
		end, p2)
		p0[var0] = nil
		
		return p0
	end
}