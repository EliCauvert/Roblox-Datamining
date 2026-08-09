local parent = script:FindFirstAncestor("CollectionViews").Parent
local argCheckModule = require(parent.ArgCheck)
local fFlagLuaAppCompositionSupport = require(parent.SharedFlags).FFlagLuaAppCompositionSupport

return function(p0, p1, p2, p3, p4, p5) --[[ line: 10 | named "calculateItemWidth" ]]
	-- upvalues: argCheckModule (ref), fFlagLuaAppCompositionSupport (ref)
	if p0 <= 0 then
		return 0
	end
	argCheckModule.assert(p0 >= 1)
	
	if fFlagLuaAppCompositionSupport then
		return math.max(1, (p3 - (p2 * 2 + (p5 or 0)) - p1 * (p0 - 1)) / (p0 + p4))
	end
	argCheckModule.assert(p4 >= 0)
	
	return math.max(1, math.floor((p3 - (if p4 == 0 then p2 * 2 else p2) - (if p4 == 0 then p1 * (p0 - 1) else p1 * p0)) / (p0 + p4)))
end