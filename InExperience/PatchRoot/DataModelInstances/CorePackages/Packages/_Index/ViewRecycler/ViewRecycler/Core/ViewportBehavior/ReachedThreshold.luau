local function _(p1: number, p2)
	assert(p1 >= 0 and p1 < 1e999, `{p2} must be a finite non-negative number`)
end

local config = {
	validate = function(p1: number, p2)
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
	end
}

if require(script:FindFirstAncestor("ViewRecycler").Flags).FFlagViewRecyclerReact084 then
	function config.equal(p1, p2): boolean
		return p1 == p2 or type(p1) == "table" and type(p2) == "table" and p1.viewportFraction == p2.viewportFraction
	end
end
function config.resolve(p1, p2, p3)
	local P6 = p1 or p3
	
	return if type(P6) == "number" then P6 else P6.viewportFraction * p2
end

return table.freeze(config)