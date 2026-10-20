local Parent = script.Parent.Parent
local _ = require(Parent.util.Types)
local PcallDeferredModule = require(Parent.util.pcallDeferred)
local AnalyticsModule = require(Parent.Analytics)
local ConstantsModule = require(Parent.Constants)
local GetFIntUniqueUVToleranceModule = require(Parent.flags.getFIntUniqueUVTolerance)
local UGCValidationService = game:GetService("UGCValidationService")

return function(p1, Object, p2)
	-- upvalues: ConstantsModule (copy), PcallDeferredModule (copy), UGCValidationService (copy), GetFIntUniqueUVToleranceModule (copy), AnalyticsModule (copy)
	local CurrentTime = tick()
	local IsServer = p2.isServer
	local WrapTargetIsNotParentedToAMeshPart = assert(ConstantsModule.WRAP_TARGET_CAGE_MESH_UV_COUNTS[Object.Parent.Name], "WrapTarget is not parented to a MeshPart")
	local EditableMeshUniqueUVCount = nil
	local PcallDeferredModuleResult, PcallDeferredModuleResult2 = PcallDeferredModule(function(): boolean
		-- upvalues: EditableMeshUniqueUVCount (ref), UGCValidationService (upval), p1 (copy), WrapTargetIsNotParentedToAMeshPart (copy), GetFIntUniqueUVToleranceModule (upval)
		EditableMeshUniqueUVCount = UGCValidationService:CalculateEditableMeshUniqueUVCount(p1.editableMesh)
		
		return math.abs(EditableMeshUniqueUVCount - WrapTargetIsNotParentedToAMeshPart) <= GetFIntUniqueUVToleranceModule()
	end, p2)
	
	if not PcallDeferredModuleResult then
		local Formatted = string.format("Failed to execute UV check for '%s'. Make sure the UV map exists and try again.", Object:GetFullName())
		
		if IsServer then
			error(Formatted)
		end
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateCageUVs_TestExecutedSuccessfully, nil, p2)
		
		return false, { Formatted }
	elseif PcallDeferredModuleResult2 then
		AnalyticsModule.recordScriptTime(script.Name, CurrentTime, p2)
		
		return true
	else
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateCageUVs_TestPassed, nil, p2)
		
		return false, {
			string.format("%s.%s ( %s ) should have %d unique UVs, but has %d. Please make sure the mesh has the required number of unique UVs and try again.", Object:GetFullName(), p1.fieldName, if p1.contentId then p1.contentId else "", WrapTargetIsNotParentedToAMeshPart, EditableMeshUniqueUVCount)
		}
	end
end