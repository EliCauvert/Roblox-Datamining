local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local itemTypeEnum = require(parent.AvatarExperienceCommon).Enums.ItemTypeEnum
local fFlagAXMigrateAllTabToSduiDev = require(parent.AvatarExperienceFlags).FFlagAXMigrateAllTabToSduiDev
local _ = require(avatarExperienceCatalog.Components.ResultsList.WidgetListInfoViewModel)

return function(p0, p1, p2) --[[ line: 38 | named "getCatalogContentToHydrate" ]]
	-- upvalues: itemTypeEnum (ref), fFlagAXMigrateAllTabToSduiDev (ref)
	local t = {}
	
	if not p0 or #p0 == 0 then
		return t
	end
	local t_1 = {}
	
	for i = 1, if p2 ~= nil then #p0 else math.min(p2, #p0) do
		local var3 = p0[i]
		local type = var3.type
		local var4 = t_1[type]
		
		if var4 ~= nil then
			if (type == itemTypeEnum.Look and not fFlagAXMigrateAllTabToSduiDev) or not (if var4 then var4[var3.id] else nil) then
				table.insert(t, var3)
			end
		end
		var4 = if p1 and p1[type] then p1[type] else false
		t_1[type] = var4
	end
	return t
end