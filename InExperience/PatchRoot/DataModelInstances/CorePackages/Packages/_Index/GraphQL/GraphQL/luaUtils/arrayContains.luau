local deepEqualModule = require(script.Parent.deepEqual)
local deepContainsModule = require(script.Parent.deepContains)

return function(p0, p1, p2) --[[ line: 4 ]]
	-- upvalues: deepContainsModule (ref), deepEqualModule (ref)
	for i, v in ipairs(p0) do
		if p2 then
			if deepContainsModule(v, p1) then
				return true
			end
		elseif deepEqualModule(v, p1) then
			return true
		end
	end
	return false
end