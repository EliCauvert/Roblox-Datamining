local parent = script:FindFirstAncestor("Foundation").Parent
local reactModule = require(parent.React)
local useClock = require(parent.ReactUtils).useClock
local numberRange = NumberRange.new(0, 1)

return function(p0, p1) --[[ line: 15 | named "usePulseBinding" ]]
	-- upvalues: useClock (ref), numberRange (ref), reactModule (ref)
	local var2 = useClock()
	p0 = p0 or 1
	local var4 = p1 or numberRange
	
	return reactModule.useMemo(function() --[[ line: 21 ]]
		-- upvalues: var2 (ref), p0 (ref), var4 (ref)
		return var2:map(function(p2) --[[ line: 22 ]]
			-- upvalues: p0 (copy), var4 (copy)
			return math.map(math.sin(p2 * 3.14159265359 / p0) ^ 2, 0, 1, var4.Min, var4.Max)
		end)
	end, { p0, p1 })
end