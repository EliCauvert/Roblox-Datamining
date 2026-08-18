local itemTypeEnum = require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.AvatarExperienceCommon).Enums.ItemTypeEnum
local selectHydratedWidgetDataModule = require(script.Parent.selectHydratedWidgetData)

return function(p0, p1) --[[ line: 21 | named "selectHydratedLookType" ]]
	-- upvalues: selectHydratedWidgetDataModule (ref), itemTypeEnum (ref)
	local var1 = selectHydratedWidgetDataModule(p0)
	local look = var1 and var1[itemTypeEnum.Look]
	local var3 = look and look[p1]
	
	return if var3 then var3.lookType else nil
end