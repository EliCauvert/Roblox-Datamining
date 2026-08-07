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

return function(p0, p1) --[[ line: 17 | named "getCageMeshInfos" ]]
	-- upvalues: list_1 (ref), list (ref), analyticsModule (ref), list_2 (ref), getEditableMeshFromContextModule (ref)
	local wrapLayer = p0:FindFirstChild("Handle"):FindFirstChildOfClass("WrapLayer")
	local t = {}
	local t_1 = {}
	
	if not wrapLayer then
		return false, { "Missing wraplayer" }, nil
	end
	local list_3 = { wrapLayer.ReferenceMeshId, wrapLayer.CageMeshId }
	
	for i, v in list_1 do
		local var10
		local t_2 = {
			fullName = string.format("%s %s", wrapLayer:GetFullName(), list[i]),
			fieldName = v,
			contentId = list_3[i],
			context = p0.Name
		}
		
		if t_2.contentId ~= "" then
			var10 = if t_2.contentId == nil then p1.allowEditableInstances else true
		end
		if var10 then
			local var11, var12 = getEditableMeshFromContextModule(wrapLayer, v, p1)
			
			if var11 then
				t_2.editableMesh = var12
				table.insert(t, t_2)
			else
				table.insert(t_1, string.format("Failed to %s for layered clothing accessory '%s'. Make sure mesh exists and try again.", list[i], p0.Name))
			end
		else
			analyticsModule.reportFailure(list_2[i], nil, p1)
			table.insert(t_1, string.format("Missing %s (i.e. invalid %s) on layered clothing accessory '%s'. Make sure you are using a valid meshId and try again.\n", list[i], v, p0.Name))
		end
	end
	if #t_1 > 0 then
		return false, t_1, nil
	end
	return true, nil, t
end