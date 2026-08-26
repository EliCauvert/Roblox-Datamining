local parent = script.Parent
local _ = require(parent.Types)
local reduceModule = require(parent.reduce)

return function(p1, p2)
	-- upvalues: reduceModule (ref)
	return reduceModule(p1, function(p3, p4, p5)
		-- upvalues: p2 (ref)
		local var1 = if p2 then p2(p4, p5) else p4
		
		if p3[var1] == nil then
			p3[var1] = 1
			
			return p3
		end
		p3[var1] += 1
		
		return p3
	end, {})
end