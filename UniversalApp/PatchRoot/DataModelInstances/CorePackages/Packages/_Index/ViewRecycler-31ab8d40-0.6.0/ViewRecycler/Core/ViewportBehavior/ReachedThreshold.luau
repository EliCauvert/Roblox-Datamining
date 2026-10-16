local function _(p1: number, p2) --[[ Line: 9 | Named "validateNumber" ]]
	assert(p1 >= 0 and p1 < 1e999, `{p2} must be a finite non-negative number`)
end

return table.freeze({
	validate = function(p1: number, p2) --[[ Line: 13 ]]
		local P3 = p2 or "ReachedThreshold"
		
		if type(p1) == "number" then
			assert(p1 >= 0 and p1 < 1e999, `{P3} must be a finite non-negative number`)
			
			return
		else
			assert(type(p1) == "table", `{P3} must be a number or viewport-fraction table`)
			assert(type(p1.viewportFraction) == "number", `{P3}.viewportFraction must be a number`)
			local ViewportFraction: number = p1.viewportFraction
			assert(ViewportFraction >= 0 and ViewportFraction < 1e999, `{`{P3}.viewportFraction`} must be a finite non-negative number`)
		end
	end,
	resolve = function(p1, p2, p3) --[[ Line: 25 ]]
		local P4 = p1 or p3
		
		return if type(P4) == "number" then P4 else P4.viewportFraction * p2
	end
})