local _ = require(script.Parent.Types)
local insert = table.insert

return function(p0, p1) --[[ line: 17 | named "groupBy" ]]
	-- upvalues: insert (ref)
	local t = {}
	
	for i, v in p0 do
		local var1 = if typeof(p1) == "function" then p1(v, i) else v[p1]
		
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