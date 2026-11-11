local ItemTypeEnum = require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.AvatarExperienceCommon).Enums.ItemTypeEnum
local SelectHydratedWidgetDataModule = require(script.Parent.selectHydratedWidgetData)

return function(p1, p2)
	-- upvalues: SelectHydratedWidgetDataModule (copy), ItemTypeEnum (copy)
	local SelectHydratedWidgetDataModuleResult = SelectHydratedWidgetDataModule(p1)
	local SelectHydratedWidgetDataModuleResultEntry = SelectHydratedWidgetDataModuleResult and SelectHydratedWidgetDataModuleResult[ItemTypeEnum.Look]
	local SelectHydratedWidgetDataModuleResultEntry1 = SelectHydratedWidgetDataModuleResultEntry and SelectHydratedWidgetDataModuleResultEntry[p2]
	
	return SelectHydratedWidgetDataModuleResultEntry1 and SelectHydratedWidgetDataModuleResultEntry1.lookType or nil
end