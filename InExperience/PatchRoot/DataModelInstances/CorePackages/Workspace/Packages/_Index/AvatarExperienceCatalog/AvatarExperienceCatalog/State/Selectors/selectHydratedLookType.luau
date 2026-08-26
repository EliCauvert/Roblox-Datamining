local itemTypeEnum = require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.AvatarExperienceCommon).Enums.ItemTypeEnum
local selectHydratedWidgetDataModule = require(script.Parent.selectHydratedWidgetData)

return function(p1, p2)
	-- upvalues: selectHydratedWidgetDataModule (ref), itemTypeEnum (ref)
	local var1 = selectHydratedWidgetDataModule(p1)
	local look = var1 and var1[itemTypeEnum.Look]
	local var2 = look and look[p2]
	
	return if var2 then var2.lookType else nil
end