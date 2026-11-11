local DeepEqualModule = require(script.Parent.deepEqual)
local DeepContainsModule = require(script.Parent.deepContains)

return function(List, p1, p2): boolean
	-- upvalues: DeepContainsModule (copy), DeepEqualModule (copy)
	for _, value in ipairs(List) do
		if p2 then
			if DeepContainsModule(value, p1) then
				return true
			end
		elseif DeepEqualModule(value, p1) then
			return true
		end
	end
	return false
end