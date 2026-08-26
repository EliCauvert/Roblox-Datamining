local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local analyticsModule = require(parent.Analytics)
local getEditableMeshFromContextModule = require(parent.util.getEditableMeshFromContext)
local list = { "InnerCage", "OuterCage" }
local list_1 = { "ReferenceMeshId", "CageMeshId" }
local list_2 = {
	analyticsModule.ErrorType.validateLayeredClothingAccessory_NoInnerCageId,
	analyticsModule.ErrorType.validateLayeredClothingAccessory_NoOuterCageId
}

return function(p1, p2)
	-- upvalues: list_1 (ref), list (ref), analyticsModule (ref), list_2 (ref), getEditableMeshFromContextModule (ref)
	local wrapLayer = p1:FindFirstChild("Handle"):FindFirstChildOfClass("WrapLayer")
	local t = {}
	local t_1 = {}
	
	if not wrapLayer then
		return false, { "Missing wraplayer" }, nil
	end
	local list_3 = { wrapLayer.ReferenceMeshId, wrapLayer.CageMeshId }
	
	for i, v in list_1 do
		local var1
		local t_2 = {
			fullName = string.format("%s %s", wrapLayer:GetFullName(), list[i]),
			fieldName = v,
			contentId = list_3[i],
			context = p1.Name
		}
		
		if t_2.contentId ~= "" then
			var1 = if t_2.contentId == nil then p2.allowEditableInstances else true
		end
		if var1 then
			local var2, var3 = getEditableMeshFromContextModule(wrapLayer, v, p2)
			
			if var2 then
				t_2.editableMesh = var3
				table.insert(t, t_2)
			else
				table.insert(t_1, string.format("Failed to %s for layered clothing accessory '%s'. Make sure mesh exists and try again.", list[i], p1.Name))
			end
		else
			analyticsModule.reportFailure(list_2[i], nil, p2)
			table.insert(t_1, string.format("Missing %s (i.e. invalid %s) on layered clothing accessory '%s'. Make sure you are using a valid meshId and try again.\n", list[i], v, p1.Name))
		end
	end
	if #t_1 > 0 then
		return false, t_1, nil
	end
	return true, nil, t
end