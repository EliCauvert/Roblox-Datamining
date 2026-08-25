local _ = require(script.Parent.Types)

return function(p0, p1)
	local t = {}
	
	return function(...)
		-- upvalues: p1 (ref), t (ref), p0 (ref)
		local var1 = if p1 then p1(...) else table.concat({ ... }, "|")
		
		if t[var1] == nil then
			t[var1] = p0(...)
		end
		return t[var1]
	end
end