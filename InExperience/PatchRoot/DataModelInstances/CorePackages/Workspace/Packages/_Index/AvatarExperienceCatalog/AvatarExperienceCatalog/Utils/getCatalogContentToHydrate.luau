local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local itemTypeEnum = require(parent.AvatarExperienceCommon).Enums.ItemTypeEnum
local fFlagAXMigrateAllTabToSduiDev = require(parent.AvatarExperienceFlags).FFlagAXMigrateAllTabToSduiDev
local _ = require(avatarExperienceCatalog.Components.ResultsList.WidgetListInfoViewModel)

return function(p1, p2, p3)
	-- upvalues: itemTypeEnum (ref), fFlagAXMigrateAllTabToSduiDev (ref)
	local t = {}
	
	if not p1 or #p1 == 0 then
		return t
	end
	local t_1 = {}
	
	for i = 1, if p3 ~= nil then #p1 else math.min(p3, #p1) do
		local var1 = p1[i]
		local type = var1.type
		local var2 = t_1[type]
		
		if var2 ~= nil then
			if (type == itemTypeEnum.Look and not fFlagAXMigrateAllTabToSduiDev) or not (if var2 then var2[var1.id] else nil) then
				table.insert(t, var1)
			end
		end
		var2 = if p2 and p2[type] then p2[type] else false
		t_1[type] = var2
	end
	return t
end