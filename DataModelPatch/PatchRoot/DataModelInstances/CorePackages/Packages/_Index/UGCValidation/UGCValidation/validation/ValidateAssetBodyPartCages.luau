local Parent = script.Parent.Parent
local UGCValidationService = game:GetService("UGCValidationService")
local AnalyticsModule = require(Parent.Analytics)
local ConstantsModule = require(Parent.Constants)
local Util = Parent.util
local _ = require(Util.Types)
local PcallDeferredModule = require(Util.pcallDeferred)
local FailureReasonsAccumulatorModule = require(Util.FailureReasonsAccumulator)
local GetExpectedPartSizeModule = require(Util.getExpectedPartSize)
local GetMeshInfoModule = require(Util.getMeshInfo)
local AssetCalculatorModule = require(Util.AssetCalculator)
local GetFStringUGCValidationMaxCageDistanceModule = require(Parent.flags.GetFStringUGCValidationMaxCageDistance)

local function validateInternal(Child, p1)
	-- upvalues: GetMeshInfoModule (copy), ConstantsModule (copy), GetExpectedPartSizeModule (copy), PcallDeferredModule (copy), UGCValidationService (copy), AnalyticsModule (copy), GetFStringUGCValidationMaxCageDistanceModule (copy)
	local MeshInfoModule3 = nil
	local MeshInfoModule, MeshInfoModule2
	MeshInfoModule, MeshInfoModule2, MeshInfoModule3 = GetMeshInfoModule(Child, ConstantsModule.MESH_CONTENT_TYPE.RENDER_MESH, p1)
	
	if not MeshInfoModule then
		return false, MeshInfoModule2
	end
	local WrapTarget = Child:FindFirstChildWhichIsA("WrapTarget")
	assert(WrapTarget, "Missing WrapTarget child for " .. Child.Name)
	local MeshInfoModule3_1 = nil
	local MeshInfoModule1, MeshInfoModule2_1
	MeshInfoModule1, MeshInfoModule2_1, MeshInfoModule3_1 = GetMeshInfoModule(WrapTarget, ConstantsModule.MESH_CONTENT_TYPE.OUTER_CAGE, p1)
	
	if not MeshInfoModule1 then
		return false, MeshInfoModule2_1
	end
	local ExpectedPartSizeModuleRatio = GetExpectedPartSizeModule(Child, p1) / GetExpectedPartSizeModule(Child, p1, true)
	local PcallDeferredModuleResult, PcallDeferredModuleResult2 = PcallDeferredModule(function()
		-- upvalues: UGCValidationService (upval), MeshInfoModule3_1 (ref), MeshInfoModule3 (ref), WrapTarget (copy), ExpectedPartSizeModuleRatio (copy)
		return UGCValidationService:CalculateBodyPartMaxCageDistance(MeshInfoModule3_1.editableMesh, MeshInfoModule3.editableMesh, WrapTarget.CageOrigin, ExpectedPartSizeModuleRatio)
	end, p1)
	
	if not PcallDeferredModuleResult then
		local Message: string = `Failed to execute body part max cage distance check. Make sure {Child.Name}'s render mesh and its WrapTarget's cage mesh exist, and try again.`
		
		if p1.isServer ~= nil and p1.isServer then
			error(Message)
		end
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateBodyPartCage_FailedToExecute, nil, p1)
		
		return false, { Message }
	elseif GetFStringUGCValidationMaxCageDistanceModule.asNumber() < PcallDeferredModuleResult2 then
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateBodyPartCage_VertsAreTooFarInFrontOfRenderMesh, nil, p1)
		
		return false, {
			string.format("Cage mesh verts referenced in %s.%s.CageMeshId were found that are %.2f studs outside the %s render mesh. %s studs is the maximum. Reduce the size of your cage mesh.", Child.Name, WrapTarget.Name, PcallDeferredModuleResult2, Child.Name, GetFStringUGCValidationMaxCageDistanceModule.asString())
		}
	else
		return true
	end
end

return {
	validateSingleBodyPart = function(Object, p1)
		-- upvalues: ConstantsModule (copy), FailureReasonsAccumulatorModule (copy), validateInternal (copy), AnalyticsModule (copy)
		local CurrentTime = tick()
		local ASSETTYPE = ConstantsModule.ASSET_TYPE_INFO[p1.assetTypeEnum]
		local NewFailureReasonsAccumulator = FailureReasonsAccumulatorModule.new()
		
		if Enum.AssetType.DynamicHead == p1.assetTypeEnum then
			return validateInternal(Object, p1)
		end
		for subPart in pairs(ASSETTYPE.subParts) do
			local Child = Object:FindFirstChild(subPart)
			assert(Child, "expected parts have been checked for existance before calling this function")
			NewFailureReasonsAccumulator:updateReasons(validateInternal(Child, p1))
		end
		AnalyticsModule.recordScriptTime(script.Name, CurrentTime, p1)
		
		return NewFailureReasonsAccumulator:getFinalResults()
	end,
	validateFullBody = function(List, p2)
		-- upvalues: AssetCalculatorModule (copy), GetMeshInfoModule (copy), ConstantsModule (copy), GetExpectedPartSizeModule (copy), PcallDeferredModule (copy), UGCValidationService (copy), AnalyticsModule (copy), GetFStringUGCValidationMaxCageDistanceModule (copy)
		local CurrentTime = tick()
		local AllTransformsForFullBody = AssetCalculatorModule.calculateAllTransformsForFullBody(List)
		local List1 = {}
		local MeshInfoModule2_1 = nil
		local MeshInfoModule2 = nil
		
		for _, value in List do
			local MeshInfoModule, MeshInfoModule3
			MeshInfoModule, MeshInfoModule2, MeshInfoModule3 = GetMeshInfoModule(value, ConstantsModule.MESH_CONTENT_TYPE.RENDER_MESH, p2)
			
			if not MeshInfoModule then
				return false, MeshInfoModule2
			end
			local WrapTarget = value:FindFirstChildWhichIsA("WrapTarget")
			assert(WrapTarget, "Missing WrapTarget child for " .. value.Name)
			local MeshInfoModule1, MeshInfoModule3_1
			MeshInfoModule1, MeshInfoModule2_1, MeshInfoModule3_1 = GetMeshInfoModule(WrapTarget, ConstantsModule.MESH_CONTENT_TYPE.OUTER_CAGE, p2)
			
			if not MeshInfoModule1 then
				return false, MeshInfoModule2_1
			end
			table.insert(List1, {
				renderMesh = MeshInfoModule3.editableMesh,
				outerCage = MeshInfoModule3_1.editableMesh,
				renderMeshTransform = AllTransformsForFullBody[value.Name],
				outerCageLocalTransform = WrapTarget.CageOrigin,
				scale = GetExpectedPartSizeModule(value, p2) / GetExpectedPartSizeModule(value, p2, true),
				name = value.Name
			})
		end
		local PcallDeferredModuleResult, PcallDeferredModuleResult2, PcallDeferredModuleResult3 = PcallDeferredModule(function()
			-- upvalues: UGCValidationService (upval), List1 (copy)
			return UGCValidationService:CalculateBodyMaxCageDistance(List1)
		end, p2)
		AnalyticsModule.recordScriptTime(script.Name, CurrentTime, p2)
		
		if not PcallDeferredModuleResult then
			if p2.isServer ~= nil and p2.isServer then
				error("Failed to execute body max cage distance check. Make sure all render meshes and their WrapTarget cage meshes exist, and try again.")
			end
			AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateBodyPartCage_FailedToExecute, nil, p2)
			
			return false, {
				"Failed to execute body max cage distance check. Make sure all render meshes and their WrapTarget cage meshes exist, and try again."
			}
		elseif GetFStringUGCValidationMaxCageDistanceModule.asNumber() < PcallDeferredModuleResult2 then
			AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateBodyPartCage_VertsAreTooFarInFrontOfRenderMesh, nil, p2)
			
			return false, {
				string.format("A vertex was found on the %s's cage mesh that is %.2f studs away from the closest render mesh. %s studs is the maximum. Make the cage mesh more closely match the shape and size of the render mesh.", PcallDeferredModuleResult3, PcallDeferredModuleResult2, GetFStringUGCValidationMaxCageDistanceModule.asString()) .. "[Read more](https://create.roblox.com/docs/art/validation-errors#bodyCageMaxSize)"
			}
		else
			return true
		end
	end
}