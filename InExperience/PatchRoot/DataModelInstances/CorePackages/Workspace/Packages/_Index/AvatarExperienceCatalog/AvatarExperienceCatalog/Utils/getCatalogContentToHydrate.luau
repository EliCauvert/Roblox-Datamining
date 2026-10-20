local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local Parent = AvatarExperienceCatalog.Parent
local ItemTypeEnum = require(Parent.AvatarExperienceModel).Enums.ItemTypeEnum
local FFlagAXMigrateAllTabToSduiDev = require(Parent.AvatarExperienceFlags).FFlagAXMigrateAllTabToSduiDev
local _ = require(AvatarExperienceCatalog.Components.ResultsList.WidgetListInfoViewModel)

return function(p1, p2, p3: number)
	-- upvalues: ItemTypeEnum (copy), FFlagAXMigrateAllTabToSduiDev (copy)
	local List = {}
	
	if not p1 or #p1 == 0 then
		return List
	end
	local t = {}
	
	for i = 1, if p3 == nil then #p1 else math.min(p3, #p1) do
		local v1 = p1[i]
		local Type = v1.type
		local Entry = t[Type]
		
		if Entry == nil then
			Entry = if p2 and p2[Type] then p2[Type] else false
			t[Type] = Entry
		end
		local Entry1 = if Entry then Entry[v1.id] else nil
		
		if Type == ItemTypeEnum.Look and not FFlagAXMigrateAllTabToSduiDev or not Entry1 then
			table.insert(List, v1)
		end
	end
	return List
end