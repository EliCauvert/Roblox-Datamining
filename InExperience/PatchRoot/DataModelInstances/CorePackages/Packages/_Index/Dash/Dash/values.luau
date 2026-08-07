local _ = require(script.Parent.Types)
local insert = table.insert

return function(p0) --[[ line: 14 | named "values" ]]
	-- upvalues: insert (ref)
	local t = {}
	
	for i, v in p0 do
		insert(t, v)
	end
	return t
end