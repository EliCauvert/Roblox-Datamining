local _ = require(script.Parent.Types)

return function(p1, p2)
	local t = {}
	
	return function(...)
		-- upvalues: p2 (ref), t (ref), p1 (ref)
		local var1 = if p2 then p2(...) else table.concat({ ... }, "|")
		
		if t[var1] == nil then
			t[var1] = p1(...)
		end
		return t[var1]
	end
end