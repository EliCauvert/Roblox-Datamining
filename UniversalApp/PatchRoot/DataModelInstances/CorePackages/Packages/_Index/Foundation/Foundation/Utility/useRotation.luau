local parent = script:FindFirstAncestor("Foundation").Parent
local _ = require(parent.React)
local useClock = require(parent.ReactUtils).useClock

return function(p1)
	-- upvalues: useClock (ref)
	return useClock():map(function(p2)
		-- upvalues: p1 (ref)
		return p2 * 360 * (p1 or 1)
	end)
end