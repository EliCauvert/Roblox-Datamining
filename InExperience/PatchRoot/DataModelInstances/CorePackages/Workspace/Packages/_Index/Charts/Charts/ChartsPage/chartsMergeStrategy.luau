local parent = script:FindFirstAncestor("Charts").Parent
local fFlagSduiChartsRequestPlaceholders = require(parent.SharedFlags).FFlagSduiChartsRequestPlaceholders
local _ = require(parent.SduiSharedUtilities)

local function hasAnyOverlap(p1, p2)
	if p1 == nil or #p1 == 0 then
		return false
	end
	local t = {}
	
	for i, v in p1 do
		t[v] = true
	end
	for i, v_1 in p2 do
		if t[v_1] then
			return true
		end
	end
	return false
end

return function(p3, p4, p5)
	-- upvalues: fFlagSduiChartsRequestPlaceholders (ref), hasAnyOverlap (ref)
	return if not (not fFlagSduiChartsRequestPlaceholders or #p3 ~= 1 or p3[1] ~= "entry_order") then if hasAnyOverlap(p5, p4) then "replace" else "append" else nil
end