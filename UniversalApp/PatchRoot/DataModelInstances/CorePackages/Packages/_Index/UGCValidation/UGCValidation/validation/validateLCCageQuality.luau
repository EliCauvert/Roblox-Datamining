local Parent = script.Parent.Parent
local GetCageMeshInfosModule = require(Parent.validation.getCageMeshInfos)
local GetFStringLCCageQualityDocumentationLinkModule = require(Parent.flags.getFStringLCCageQualityDocumentationLink)
local ValidateLCCagingRelevancyModule = require(Parent.validation.validateLCCagingRelevancy)
local ValidateRenderMeshInsideOuterCageMeshModule = require(Parent.validation.validateRenderMeshInsideOuterCageMesh)
local _ = require(Parent.util.Types)

return function(Object, p1, p2)
	-- upvalues: GetCageMeshInfosModule (copy), ValidateLCCagingRelevancyModule (copy), ValidateRenderMeshInsideOuterCageMeshModule (copy), GetFStringLCCageQualityDocumentationLinkModule (copy)
	local Flag = true
	local List = {}
	local WrapLayer = Object:FindFirstChild("Handle"):FindFirstChildOfClass("WrapLayer")
	assert(WrapLayer, "calling validateInstanceTree() means we would not get this far if there was no WrapLayer")
	local CageMeshInfosModule, CageMeshInfosModule2, CageMeshInfosModule3 = GetCageMeshInfosModule(Object, p2)
	
	if not CageMeshInfosModule or CageMeshInfosModule3 == nil then
		return false, CageMeshInfosModule2
	end
	local Unpacked, Unpacked2 = unpack({ CageMeshInfosModule3[1], CageMeshInfosModule3[2] })
	local ValidateLCCagingRelevancyModuleResult, ValidateLCCagingRelevancyModuleResult2 = ValidateLCCagingRelevancyModule(Unpacked, Unpacked2, p1, WrapLayer.ReferenceOrigin.Position, WrapLayer.CageOrigin.Position, p2)
	
	if not ValidateLCCagingRelevancyModuleResult and ValidateLCCagingRelevancyModuleResult2 ~= nil then
		Flag = false
		
		for _, value in ValidateLCCagingRelevancyModuleResult2 do
			table.insert(List, value)
		end
	end
	local ValidateRenderMeshInsideOuterCageMeshModuleResult, ValidateRenderMeshInsideOuterCageMeshModuleResult2 = ValidateRenderMeshInsideOuterCageMeshModule(WrapLayer, Unpacked2, p1, p2)
	
	if not ValidateRenderMeshInsideOuterCageMeshModuleResult then
		table.insert(List, table.concat(ValidateRenderMeshInsideOuterCageMeshModuleResult2, "\n"))
		Flag = false
	end
	if Flag then
		return true
	end
	if GetFStringLCCageQualityDocumentationLinkModule() ~= "" then
		table.insert(List, (string.format("[Caging best practices](%s)", GetFStringLCCageQualityDocumentationLinkModule())))
	end
	return false, List
end