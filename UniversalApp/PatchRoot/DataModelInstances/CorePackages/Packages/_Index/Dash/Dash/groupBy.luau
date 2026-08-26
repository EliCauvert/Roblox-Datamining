local _ = require(script.Parent.Types)
local insert = table.insert

return function(p1, p2)
	-- upvalues: insert (ref)
	local t = {}
	
	for i, v in p1 do
		local var1 = if typeof(p2) == "function" then p2(v, i) else v[p2]
		
		if var1 ~= nil then
			if t[var1] == nil then
				t[var1] = { v }
			else
				insert(t[var1], v)
			end
		end
	end
	return t
end