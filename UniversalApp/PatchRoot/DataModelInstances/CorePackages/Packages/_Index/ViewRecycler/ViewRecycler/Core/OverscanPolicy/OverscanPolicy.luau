local _ = require(script:FindFirstAncestor("ViewRecycler").Core.Types)

local function _(p1, p2)
	assert(p1 >= 0 and p1 % 1 == 0, `OverscanPolicy: {p2} must be a non-negative integer`)
end

return table.freeze({
	fixed = function(p1)
		p1 = p1 or 1
		assert(p1 >= 0 and p1 % 1 == 0, "OverscanPolicy: fixed overscan must be a non-negative integer")
		local frozen = table.freeze({ before = p1, after = p1 })
		
		return table.freeze({
			compute = function()
				-- upvalues: frozen (ref)
				return frozen
			end
		})
	end
})