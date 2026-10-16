local Parent = script.Parent.Parent
local _ = require(Parent.util.Types)
local AnalyticsModule = require(Parent.Analytics)
local GetEditableMeshFromContextModule = require(Parent.util.getEditableMeshFromContext)
local list = { "InnerCage", "OuterCage" }
local FieldNames = { "ReferenceMeshId", "CageMeshId" }
local list1 = {
	AnalyticsModule.ErrorType.validateLayeredClothingAccessory_NoInnerCageId,
	AnalyticsModule.ErrorType.validateLayeredClothingAccessory_NoOuterCageId
}

return function(Object, p1) --[[ Line: 17 | Named "getCageMeshInfos" ]]
	-- upvalues: FieldNames (copy), list (copy), AnalyticsModule (copy), list1 (copy), GetEditableMeshFromContextModule (copy)
	local WrapLayer = Object:FindFirstChild("Handle"):FindFirstChildOfClass("WrapLayer")
	local List = {}
	local List1 = {}
	
	if not WrapLayer then
		return false, { "Missing wraplayer" }, nil
	end
	local list2 = { WrapLayer.ReferenceMeshId, WrapLayer.CageMeshId }
	
	for i, fieldName in FieldNames do
		local config = {
			fullName = string.format("%s %s", WrapLayer:GetFullName(), list[i]),
			fieldName = fieldName,
			contentId = list2[i],
			context = Object.Name
		}
		
		if not (if config.contentId == "" then p1.allowEditableInstances else config.contentId ~= nil or p1.allowEditableInstances) then
			AnalyticsModule.reportFailure(list1[i], nil, p1)
			table.insert(List1, string.format("Missing %s (i.e. invalid %s) on layered clothing accessory '%s'. Make sure you are using a valid meshId and try again.\n", list[i], fieldName, Object.Name))
			continue
		end
		local EditableMeshFromContextModule, EditableMeshFromContextModule2 = GetEditableMeshFromContextModule(WrapLayer, fieldName, p1)
		
		if EditableMeshFromContextModule then
			config.editableMesh = EditableMeshFromContextModule2
			table.insert(List, config)
		else
			table.insert(List1, string.format("Failed to %s for layered clothing accessory '%s'. Make sure mesh exists and try again.", list[i], Object.Name))
		end
	end
	if #List1 > 0 then
		return false, List1, nil
	else
		return true, nil, List
	end
end