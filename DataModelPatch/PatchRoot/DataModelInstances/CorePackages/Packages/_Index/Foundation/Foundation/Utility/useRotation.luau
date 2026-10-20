local Parent = script:FindFirstAncestor("Foundation").Parent
local _ = require(Parent.React)
local UseClockFunction = require(Parent.ReactUtils).useClock

return function(p1)
	-- upvalues: UseClockFunction (copy)
	return UseClockFunction():map(function(p2: number)
		-- upvalues: p1 (copy)
		return p2 * 360 * (p1 or 1)
	end)
end