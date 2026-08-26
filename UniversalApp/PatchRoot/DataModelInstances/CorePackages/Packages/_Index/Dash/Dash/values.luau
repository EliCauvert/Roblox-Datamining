local _ = require(script.Parent.Types)
local insert = table.insert

return function(p1)
	-- upvalues: insert (ref)
	local t = {}
	
	for i, v in p1 do
		insert(t, v)
	end
	return t
end