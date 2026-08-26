local reduceModule = require(script.Parent.reduce)

local var1 = function(p1, p2)
	return p2 < p1
end

return function(a, b, p1)
	-- upvalues: var1 (ref), reduceModule (ref)
	p1 = p1 or var1
	
	return if b then reduceModule(a, function(p2, p3, p4)
		-- upvalues: b (ref), p1 (ref)
		local var2 = b(p3, p4)
		
		return if p2 then if p1(var2, p2.value) then { value = var2, original = p3 } else p2 else { value = var2, original = p3 }
	end, nil).original else reduceModule(a, function(p2, p3)
		-- upvalues: p1 (ref)
		return if p2 then if p1(p3, p2) then p3 else p2 else p3
	end, nil)
end