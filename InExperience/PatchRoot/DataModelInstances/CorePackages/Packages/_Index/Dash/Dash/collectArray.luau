local _ = require(script.Parent.Types)
local insert = table.insert

return function(p1, p2)
	-- upvalues: insert (ref)
	local t = {}
	
	for i, v in p1 do
		local var1 = p2(i, v)
		
		if var1 ~= nil then
			insert(t, var1)
		end
	end
	return t
end