local _ = require(script.Parent.Types)
local insert = table.insert

return function(p0, p1)
	-- upvalues: insert (ref)
	local t = {}
	
	for i, v in p0 do
		local var1 = p1(i, v)
		
		if var1 ~= nil then
			insert(t, var1)
		end
	end
	return t
end