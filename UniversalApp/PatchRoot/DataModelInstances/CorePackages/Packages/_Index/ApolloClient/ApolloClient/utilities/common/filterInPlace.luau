local array = require(script.Parent.Parent.Parent.Parent.LuauPolyfill).Array

return {
	filterInPlace = function(p1, p2, p3)
		-- upvalues: array (ref)
		local var1 = 1
		array.forEach(p1, function(p4, p5)
			-- upvalues: p2 (ref), p1 (ref), var1 (write)
			if p2(p4, p5, p1) then
				p1[var1] = p4
				var1 += 1
			end
		end, p3)
		p1[var1] = nil
		
		return p1
	end
}