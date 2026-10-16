local Parent = script:FindFirstAncestor("Foundation").Parent
local ReactModule = require(Parent.React)
local UseClockFunction = require(Parent.ReactUtils).useClock
local _NumberRange = NumberRange.new(0, 1)

return function(p1, p2) --[[ Line: 15 | Named "usePulseBinding" ]]
	-- upvalues: UseClockFunction (copy), _NumberRange (copy), ReactModule (copy)
	local UseClockResult = UseClockFunction()
	local P0 = p1 or 1
	local _NumberRange1 = if p2 then p2 else _NumberRange
	
	return ReactModule.useMemo(function() --[[ Line: 21 ]]
		-- upvalues: UseClockResult (copy), P0 (copy), _NumberRange1 (copy)
		return UseClockResult:map(function(p3: number): number --[[ Line: 22 ]]
			-- upvalues: P0 (upval), _NumberRange1 (upval)
			return math.map(math.sin(p3 * 3.141592653589793 / P0) ^ 2, 0, 1, _NumberRange1.Min, _NumberRange1.Max)
		end)
	end, { p1, p2 })
end