local parent = script.Parent
local _ = require(parent.Types)
local reduceModule = require(parent.reduce)

return function(p0, p1)
	-- upvalues: reduceModule (ref)
	return reduceModule(p0, function(p2, p3, p4)
		-- upvalues: p1 (ref)
		local var1 = if p1 then p1(p3, p4) else p3
		
		if p2[var1] == nil then
			p2[var1] = 1
			
			return p2
		end
		p2[var1] += 1
		
		return p2
	end, {})
end