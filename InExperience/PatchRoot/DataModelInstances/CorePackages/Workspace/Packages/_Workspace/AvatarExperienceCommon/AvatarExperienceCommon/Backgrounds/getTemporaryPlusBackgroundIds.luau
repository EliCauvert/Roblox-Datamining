local fStringAXPlusExclusiveBackgroundIds = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.AvatarExperienceFlags).FStringAXPlusExclusiveBackgroundIds
local var1 = nil
local frozen = table.freeze({})
local var2 = false

local function _(p1)
	return string.match(p1, "^%d+$") ~= nil
end

return function()
	-- upvalues: fStringAXPlusExclusiveBackgroundIds (ref), var1 (write), frozen (write), var2 (write)
	local var3 = fStringAXPlusExclusiveBackgroundIds()
	
	if var3 == var1 then
		return frozen, var2
	end
	var1 = var3
	
	if string.gsub(var3, "^%s*(.-)%s*$", "%1") == "" then
		var2 = false
		frozen = table.freeze({})
		
		return frozen, var2
	elseif string.find(var3, "[;|]") ~= nil then
		var2 = true
		frozen = table.freeze({})
		
		return frozen, var2
	end
	local replaced
	local t = {}
	
	for i, v in string.split(var3, ",") do
		replaced = string.gsub(v, "^%s*(.-)%s*$", "%1")
		
		if replaced ~= "" then
			if string.match(replaced, "^%d+$") ~= nil then
				t[replaced] = true
				continue
			end
			var2 = true
			frozen = table.freeze({})
			
			return frozen, var2
		end
	end
	var2 = false
	frozen = table.freeze(t)
	
	return frozen, var2
end