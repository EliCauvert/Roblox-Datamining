local Array = require(script.Parent.Parent.Parent.Parent.LuauPolyfill).Array

return {
	filterInPlace = function(p1, Callback, p2) --[[ Line: 23 ]]
		-- upvalues: Array (copy)
		local Count = 1
		Array.forEach(p1, function(p3, p4) --[[ Line: 25 ]]
			-- upvalues: Callback (copy), p1 (copy), Count (ref)
			if Callback(p3, p4, p1) then
				p1[Count] = p3
				Count += 1
			end
		end, p2)
		p1[Count] = nil
		
		return p1
	end
}