local deepEqualModule = require(script.Parent.deepEqual)
local deepContainsModule = require(script.Parent.deepContains)

return function(p1, p2, p3)
	-- upvalues: deepContainsModule (ref), deepEqualModule (ref)
	for i, v in ipairs(p1) do
		if p3 then
			if deepContainsModule(v, p2) then
				return true
			end
		elseif deepEqualModule(v, p2) then
			return true
		end
	end
	return false
end