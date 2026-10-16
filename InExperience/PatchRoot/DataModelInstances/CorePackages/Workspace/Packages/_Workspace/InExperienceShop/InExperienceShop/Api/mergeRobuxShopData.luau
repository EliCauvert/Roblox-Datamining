local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local _ = require(InExperienceShop.Types)
local ROBUXCATEGORYNAME = require(InExperienceShop.Constants).ROBUX_CATEGORY_NAME

local function _(p1): boolean --[[ Line: 12 | Named "isRobuxNamed" ]]
	-- upvalues: ROBUXCATEGORYNAME (copy)
	return p1.name == ROBUXCATEGORYNAME
end

local _ = function(List) --[[ Line: 16 | Named "findRobux" ]]
	-- upvalues: ROBUXCATEGORYNAME (copy)
	for _, value in ipairs(List) do
		if value.name == ROBUXCATEGORYNAME then
			return value
		end
	end
	return nil
end

local function replaceOrRemoveRobux(List, p1) --[[ Line: 28 ]]
	-- upvalues: ROBUXCATEGORYNAME (copy)
	local Buffer = table.create(#List)
	local Flag = false
	
	for _, value in ipairs(List) do
		if value.name ~= ROBUXCATEGORYNAME then
			table.insert(Buffer, value)
			continue
		end
		if p1 ~= nil then
			table.insert(Buffer, p1)
		end
		Flag = true
	end
	if not Flag and p1 ~= nil then
		table.insert(Buffer, p1)
	end
	return Buffer
end

return function(p2, p3, p4) --[[ Line: 51 | Named "mergeRobuxShopData" ]]
	-- upvalues: ROBUXCATEGORYNAME (copy), replaceOrRemoveRobux (copy)
	local v1 = nil
	
	for _, section in ipairs(p4.sections) do
		if section.name == ROBUXCATEGORYNAME then
			v1 = section
			break
		end
	end
	local v2 = nil
	if v1 == nil then
		v2 = nil
	else
		v2 = nil
		
		for _, category in ipairs(p4.categories) do
			if category.name == ROBUXCATEGORYNAME then
				v2 = category
				break
			end
		end
	end
	return replaceOrRemoveRobux(p2, v2), (replaceOrRemoveRobux(p3, v1))
end