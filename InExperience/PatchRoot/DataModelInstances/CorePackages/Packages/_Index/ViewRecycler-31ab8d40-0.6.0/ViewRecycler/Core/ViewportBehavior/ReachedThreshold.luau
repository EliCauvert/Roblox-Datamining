local function _(p1, p2)
	assert(p1 >= 0 and p1 < 1e999, `{p2} must be a finite non-negative number`)
end

return table.freeze({
	validate = function(p1, p2)
		p2 = p2 or "ReachedThreshold"
		
		if type(p1) == "number" then
			assert(p1 >= 0 and p1 < 1e999, `{p2} must be a finite non-negative number`)
			
			return
		end
		assert(type(p1) == "table", `{p2} must be a number or viewport-fraction table`)
		assert(type(p1.viewportFraction) == "number", `{p2}.viewportFraction must be a number`)
		local viewportFraction = p1.viewportFraction
		assert(viewportFraction >= 0 and viewportFraction < 1e999, `{`{p2}.viewportFraction`} must be a finite non-negative number`)
	end,
	resolve = function(p1, p2, p3)
		p1 = p1 or p3
		
		return if type(p1) == "number" then p1 else p1.viewportFraction * p2
	end
})