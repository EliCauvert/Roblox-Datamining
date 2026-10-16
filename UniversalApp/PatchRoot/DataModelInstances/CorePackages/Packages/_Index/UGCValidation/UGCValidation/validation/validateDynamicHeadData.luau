local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent
local AnalyticsModule = require(Parent.Analytics)
local FailureReasonsAccumulatorModule = require(Parent.util.FailureReasonsAccumulator)
local UGCValidateFacialBoundsScaleRatio = game:DefineFastInt("UGCValidateFacialBoundsScale", 120) / 100
local GetExpectedPartSizeModule = require(Parent.util.getExpectedPartSize)
local _ = require(Parent.util.Types)
local PcallDeferredModule = require(Parent.util.pcallDeferred)
local GetEditableMeshFromContextModule = require(Parent.util.getEditableMeshFromContext)
local GetEngineFeatureEngineUGCValidateMinMaxMeshSizeAcrossAllFacsModule = require(Parent.flags.getEngineFeatureEngineUGCValidateMinMaxMeshSizeAcrossAllFacs)

local function validateFacialBounds(Object, p1) --[[ Line: 27 ]]
	-- upvalues: PcallDeferredModule (copy), GetExpectedPartSizeModule (copy), GetEditableMeshFromContextModule (copy), UGCValidationService (copy), UGCValidateFacialBoundsScaleRatio (copy)
	local IsServer = p1.isServer
	local PcallDeferredModuleResult, PcallDeferredModuleResult2 = PcallDeferredModule(function() --[[ Line: 33 ]]
		-- upvalues: GetExpectedPartSizeModule (upval), Object (copy), p1 (copy), GetEditableMeshFromContextModule (upval), UGCValidationService (upval), UGCValidateFacialBoundsScaleRatio (upval)
		local ExpectedPartSizeModule = GetExpectedPartSizeModule(Object, p1)
		local MeshId, MeshId2 = GetEditableMeshFromContextModule(Object, "MeshId", p1)
		
		if not MeshId then
			error("Failed to retrieve MeshContent")
		end
		return UGCValidationService:ValidateEditableMeshFacialBounds(MeshId2, UGCValidateFacialBoundsScaleRatio, ExpectedPartSizeModule)
	end, p1)
	
	if not PcallDeferredModuleResult then
		local Formatted = string.format("Failed to load mesh data for '%s'. Make sure the mesh exists and try again.", Object:GetFullName())
		
		if IsServer ~= nil and IsServer then
			error(Formatted)
		end
		return false, { Formatted }
	elseif PcallDeferredModuleResult2 then
		return true
	else
		return false, {
			string.format("DynamicHead (%s) when emoting surpasses the expected bounding box", Object:GetFullName())
		}
	end
end

return function(p1, p2) --[[ Line: 67 | Named "validateDynamicHeadData" ]]
	-- upvalues: FailureReasonsAccumulatorModule (copy), GetEngineFeatureEngineUGCValidateMinMaxMeshSizeAcrossAllFacsModule (copy), validateFacialBounds (copy), AnalyticsModule (copy)
	local CurrentTime = tick()
	local NewFailureReasonsAccumulator = FailureReasonsAccumulatorModule.new()
	
	if not GetEngineFeatureEngineUGCValidateMinMaxMeshSizeAcrossAllFacsModule() then
		NewFailureReasonsAccumulator:updateReasons(validateFacialBounds(p1, p2))
	end
	AnalyticsModule.recordScriptTime(script.Name, CurrentTime, p2)
	
	return NewFailureReasonsAccumulator:getFinalResults()
end