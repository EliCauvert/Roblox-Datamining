local parent = script:FindFirstAncestor("Foundation").Parent
local _ = require(parent.React)
local useClock = require(parent.ReactUtils).useClock

return function(p0)
	-- upvalues: useClock (ref)
	return useClock():map(function(p1)
		-- upvalues: p0 (ref)
		return p1 * 360 * (p0 or 1)
	end)
end