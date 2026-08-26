local parent = script:FindFirstAncestor("Foundation").Parent
local reactModule = require(parent.React)
local useClock = require(parent.ReactUtils).useClock
local numberRange = NumberRange.new(0, 1)

return function(p1, p2)
	-- upvalues: useClock (ref), numberRange (ref), reactModule (ref)
	local var1 = useClock()
	p1 = p1 or 1
	local var2 = p2 or numberRange
	
	return reactModule.useMemo(function()
		-- upvalues: var1 (ref), p1 (ref), var2 (ref)
		return var1:map(function(p3)
			-- upvalues: p1 (copy), var2 (copy)
			return math.map(math.sin(p3 * 3.14159265359 / p1) ^ 2, 0, 1, var2.Min, var2.Max)
		end)
	end, { p1, p2 })
end