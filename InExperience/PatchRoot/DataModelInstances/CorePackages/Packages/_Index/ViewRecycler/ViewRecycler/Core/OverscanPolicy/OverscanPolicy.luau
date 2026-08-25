local _ = require(script:FindFirstAncestor("ViewRecycler").Core.Types)

local function _(p0, p1)
	assert(p0 >= 0 and p0 % 1 == 0, `OverscanPolicy: {p1} must be a non-negative integer`)
end

return table.freeze({
	fixed = function(p2)
		p2 = p2 or 1
		assert(p2 >= 0 and p2 % 1 == 0, "OverscanPolicy: fixed overscan must be a non-negative integer")
		local frozen = table.freeze({ before = p2, after = p2 })
		
		return table.freeze({
			compute = function()
				-- upvalues: frozen (ref)
				return frozen
			end
		})
	end
})