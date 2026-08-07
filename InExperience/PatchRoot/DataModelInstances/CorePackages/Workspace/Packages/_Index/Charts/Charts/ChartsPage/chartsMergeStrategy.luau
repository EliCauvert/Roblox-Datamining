local parent = script:FindFirstAncestor("Charts").Parent
local fFlagSduiChartsRequestPlaceholders = require(parent.SharedFlags).FFlagSduiChartsRequestPlaceholders
local _ = require(parent.SduiSharedUtilities)

local function hasAnyOverlap(p0, p1) --[[ line: 10 ]]
	if p0 == nil or #p0 == 0 then
		return false
	end
	local t = {}
	
	for i, v in p0 do
		t[v] = true
	end
	for i, v_1 in p1 do
		if t[v_1] then
			return true
		end
	end
	return false
end

return function(p2, p3, p4) --[[ line: 41 | named "chartsMergeStrategy" ]]
	-- upvalues: fFlagSduiChartsRequestPlaceholders (ref), hasAnyOverlap (ref)
	return if not (not fFlagSduiChartsRequestPlaceholders or #p2 ~= 1 or p2[1] ~= "entry_order") then if hasAnyOverlap(p4, p3) then "replace" else "append" else nil
end