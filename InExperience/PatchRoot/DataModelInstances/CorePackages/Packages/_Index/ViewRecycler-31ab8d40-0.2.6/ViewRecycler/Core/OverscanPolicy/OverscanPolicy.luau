local ViewRecycler = script:FindFirstAncestor("ViewRecycler")
local _ = require(ViewRecycler.Core.Enums.ScrollDirection)
local _ = require(ViewRecycler.Core.Types)

local function _(p1: number, p2) --[[ Line: 29 | Named "validateUnit" ]]
	assert(p1 >= 0 and p1 % 1 == 0, `OverscanPolicy: {p2} must be a non-negative integer`)
end

return table.freeze({
	fixed = function(p1) --[[ Line: 33 ]]
		local P2 = p1 or 1
		assert(P2 >= 0 and P2 % 1 == 0, "OverscanPolicy: fixed overscan must be a non-negative integer")
		local Frozen = table.freeze({ before = P2, after = P2 })
		
		return table.freeze({
			compute = function() --[[ Line: 41 ]]
				-- upvalues: Frozen (copy)
				return Frozen
			end
		})
	end
})