local Parent = script:FindFirstAncestor("Charts").Parent
local FFlagSduiChartsRequestPlaceholders = require(Parent.SharedFlags).FFlagSduiChartsRequestPlaceholders
local _ = require(Parent.SduiSharedUtilities)

local function hasAnyOverlap(List, List1): boolean
	if List == nil or #List == 0 then
		return false
	end
	local t = {}
	
	for _, value in List do
		t[value] = true
	end
	for _, value1 in List1 do
		if t[value1] then
			return true
		end
	end
	return false
end

return function(Entry, p1, p2)
	-- upvalues: FFlagSduiChartsRequestPlaceholders (copy), hasAnyOverlap (copy)
	return if FFlagSduiChartsRequestPlaceholders and #Entry == 1 and Entry[1] == "entry_order" then if hasAnyOverlap(p2, p1) then "replace" else "append" else nil
end