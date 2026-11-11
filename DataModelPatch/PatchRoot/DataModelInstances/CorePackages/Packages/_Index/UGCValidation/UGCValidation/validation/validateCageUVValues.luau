local Parent = script.Parent.Parent
local _ = require(Parent.util.Types)
local PcallDeferredModule = require(Parent.util.pcallDeferred)
local WrapTargetCageUVReferenceValuesModule = require(Parent.WrapTargetCageUVReferenceValues)
local AnalyticsModule = require(Parent.Analytics)
local UGCValidationService = game:GetService("UGCValidationService")

return function(p1, Object, p2)
	-- upvalues: WrapTargetCageUVReferenceValuesModule (copy), PcallDeferredModule (copy), UGCValidationService (copy), AnalyticsModule (copy)
	local CurrentTime = tick()
	local IsServer = p2.isServer
	local WrapTargetIsNotParentedToAMeshPart = assert(WrapTargetCageUVReferenceValuesModule[Object.Parent.Name], "WrapTarget is not parented to a MeshPart")
	local PcallDeferredModuleResult, PcallDeferredModuleResult2 = PcallDeferredModule(function()
		-- upvalues: UGCValidationService (upval), WrapTargetIsNotParentedToAMeshPart (copy), p1 (copy)
		return UGCValidationService:ValidateEditableMeshUVValuesInReference(WrapTargetIsNotParentedToAMeshPart, p1.editableMesh)
	end, p2)
	
	if not PcallDeferredModuleResult then
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateCageUVValues_FailedToLoadMesh, nil, p2)
		local Formatted = string.format("Failed to load UVs for '%s'. Make sure the UV map exists and try again.", Object:GetFullName())
		
		if IsServer then
			error(Formatted)
		end
		return false, { Formatted }
	elseif PcallDeferredModuleResult2 then
		AnalyticsModule.recordScriptTime(script.Name, CurrentTime, p2)
		
		return true
	else
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateCageUVValues_UnexpectedUVValue, nil, p2)
		
		return false, {
			string.format("Found invalid UV value outside [0, 1] range for '%s'. You need to edit the UV map to fix this issue.", Object:GetFullName())
		}
	end
end