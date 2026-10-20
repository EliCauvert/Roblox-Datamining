local FStringAXPlusExclusiveBackgroundIdsFunction = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.AvatarExperienceFlags).FStringAXPlusExclusiveBackgroundIds
local v1 = nil
local Frozen = table.freeze({})
local Flag = false

local function _(Text: string): boolean
	return string.match(Text, "^%d+$") ~= nil
end

return function()
	-- upvalues: FStringAXPlusExclusiveBackgroundIdsFunction (copy), v1 (ref), Frozen (ref), Flag (ref)
	local FStringAXPlusExclusiveBackgroundIdsResult: string = FStringAXPlusExclusiveBackgroundIdsFunction()
	
	if FStringAXPlusExclusiveBackgroundIdsResult == v1 then
		return Frozen, Flag
	end
	v1 = FStringAXPlusExclusiveBackgroundIdsResult
	
	if string.gsub(FStringAXPlusExclusiveBackgroundIdsResult, "^%s*(.-)%s*$", "%1") == "" then
		Flag = false
		Frozen = table.freeze({})
		
		return Frozen, Flag
	end
	if string.find(FStringAXPlusExclusiveBackgroundIdsResult, "[;|]") ~= nil then
		Flag = true
		Frozen = table.freeze({})
		
		return Frozen, Flag
	end
	local Tbl = {}
	
	for _, value in string.split(FStringAXPlusExclusiveBackgroundIdsResult, ",") do
		local Replaced = string.gsub(value, "^%s*(.-)%s*$", "%1")
		
		if Replaced ~= "" then
			if string.match(Replaced, "^%d+$") == nil then
				Flag = true
				Frozen = table.freeze({})
				
				return Frozen, Flag
			end
			Tbl[Replaced] = true
		end
	end
	Flag = false
	Frozen = table.freeze(Tbl)
	
	return Frozen, Flag
end