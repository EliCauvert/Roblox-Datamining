local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent
local AnalyticsModule = require(Parent.Analytics)
local FailureReasonsAccumulatorModule = require(Parent.util.FailureReasonsAccumulator)
local ValidateFacsJointBoundsModule = require(Parent.validation.validateFacsJointBounds)
local GetEngineFeatureEngineUGCValidateFACSJointTransformsWithinBoundsModule = require(Parent.flags.getEngineFeatureEngineUGCValidateFACSJointTransformsWithinBounds)
local GetFFlagUGCValidateMigrateDynamicHeadDataModule = require(Parent.flags.getFFlagUGCValidateMigrateDynamicHeadData)
local UGCValidateFacialBoundsScaleRatio = game:DefineFastInt("UGCValidateFacialBoundsScale", 120) / 100
local UGCValidateFacialExpressivenessThresholdRatio = game:DefineFastInt("UGCValidateFacialExpressivenessThreshold", 10) / 100
local UGCValidateFacialExpressivenessMinVertDeltaRatio = game:DefineFastInt("UGCValidateFacialExpressivenessMinVertDelta", 2) / 100
local GetExpectedPartSizeModule = require(Parent.util.getExpectedPartSize)
local _ = require(Parent.util.Types)
local PcallDeferredModule = require(Parent.util.pcallDeferred)
local GetEditableMeshFromContextModule = require(Parent.util.getEditableMeshFromContext)
local GetEngineFeatureEngineUGCValidateMinMaxMeshSizeAcrossAllFacsModule = require(Parent.flags.getEngineFeatureEngineUGCValidateMinMaxMeshSizeAcrossAllFacs)
local ControlNames = {
	"LeftEyeClosed", "EyesLookDown", "RightEyeClosed", "JawDrop", "Pucker",
	"LeftLipCornerPuller", "RightLipCornerPuller", "ChinRaiser",
	"ChinRaiserUpperLip", "LeftCheekRaiser", "RightCheekRaiser",
	"LeftInnerBrowRaiser", "RightInnerBrowRaiser", "LeftLipCornerDown",
	"RightLipCornerDown", "LeftLowerLipDepressor", "RightLowerLipDepressor"
}

local function downloadFailure(IsServer, Name, p1)
	-- upvalues: AnalyticsModule (copy)
	local Formatted = string.format("Failed to load model for dynamic head '%s'. Make sure model exists and try again.", Name)
	
	if IsServer then
		error(Formatted)
	end
	AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateDynamicHeadMeshPartFormat_FailedToLoadMesh, nil, p1)
	
	return false, { Formatted }
end

local function validateFacialBounds(Object, p1)
	-- upvalues: PcallDeferredModule (copy), GetExpectedPartSizeModule (copy), GetEditableMeshFromContextModule (copy), UGCValidationService (copy), UGCValidateFacialBoundsScaleRatio (copy)
	local IsServer = p1.isServer
	local PcallDeferredModuleResult, PcallDeferredModuleResult2 = PcallDeferredModule(function()
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

local function validateFacialExpressiveness(Object, p1)
	-- upvalues: PcallDeferredModule (copy), GetExpectedPartSizeModule (copy), GetEditableMeshFromContextModule (copy), UGCValidationService (copy), UGCValidateFacialExpressivenessMinVertDeltaRatio (copy), UGCValidateFacialExpressivenessThresholdRatio (copy)
	local IsServer = p1.isServer
	local PcallDeferredModuleResult, PcallDeferredModuleResult2 = PcallDeferredModule(function()
		-- upvalues: GetExpectedPartSizeModule (upval), Object (copy), p1 (copy), GetEditableMeshFromContextModule (upval), UGCValidationService (upval), UGCValidateFacialExpressivenessMinVertDeltaRatio (upval)
		local ExpectedPartSizeModule = GetExpectedPartSizeModule(Object, p1)
		local MeshId, MeshId2 = GetEditableMeshFromContextModule(Object, "MeshId", p1)
		
		if not MeshId then
			error("Failed to retrieve MeshContent")
		end
		return UGCValidationService:ValidateEditableMeshFacialExpressiveness(MeshId2, UGCValidateFacialExpressivenessMinVertDeltaRatio, ExpectedPartSizeModule)
	end, p1)
	
	if not PcallDeferredModuleResult then
		local Formatted = string.format("Failed to load mesh data for '%s'. Make sure the mesh exists and try again.", Object:GetFullName())
		
		if IsServer ~= nil and IsServer then
			error(Formatted)
		end
		return false, { Formatted }
	elseif PcallDeferredModuleResult2 < UGCValidateFacialExpressivenessThresholdRatio then
		return false, {
			string.format("DynamicHead (%s) did not pass threshold (%f < %f) for percent change when emoting", Object:GetFullName(), PcallDeferredModuleResult2, UGCValidateFacialExpressivenessThresholdRatio)
		}
	else
		return true
	end
end

return function(p1, p2)
	-- upvalues: GetFFlagUGCValidateMigrateDynamicHeadDataModule (copy), GetEditableMeshFromContextModule (copy), UGCValidationService (copy), downloadFailure (copy), AnalyticsModule (copy), FailureReasonsAccumulatorModule (copy), ControlNames (copy), validateFacialExpressiveness (copy), GetEngineFeatureEngineUGCValidateMinMaxMeshSizeAcrossAllFacsModule (copy), validateFacialBounds (copy), GetEngineFeatureEngineUGCValidateFACSJointTransformsWithinBoundsModule (copy), ValidateFacsJointBoundsModule (copy)
	local CurrentTime = tick()
	local IsServer = p2.isServer
	
	if not GetFFlagUGCValidateMigrateDynamicHeadDataModule() then
		local Success, Result = pcall(function()
			-- upvalues: GetEditableMeshFromContextModule (upval), p1 (copy), p2 (copy), UGCValidationService (upval)
			local MeshId, MeshId2 = GetEditableMeshFromContextModule(p1, "MeshId", p2)
			
			if not MeshId then
				error("Failed to retrieve MeshContent")
			end
			return UGCValidationService:ValidateDynamicHeadEditableMesh(MeshId2)
		end)
		
		if not Success then
			return downloadFailure(IsServer, p1.Name, p2)
		end
		if not Result then
			AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateDynamicHeadMeshPartFormat_ValidateDynamicHeadMesh, nil, p2)
			
			return false, {
				string.format("Failed validation for dynamic head '%s' due to missing FACS information. You need to provide FACS controls for at least 17 poses (see documentation).", p1.Name)
			}
		end
	end
	local NewFailureReasonsAccumulator = FailureReasonsAccumulatorModule.new()
	
	if not GetFFlagUGCValidateMigrateDynamicHeadDataModule() then
		local Success1, Result1, Result3 = pcall(function()
			-- upvalues: GetEditableMeshFromContextModule (upval), p1 (copy), p2 (copy), UGCValidationService (upval), ControlNames (upval)
			local MeshId, MeshId2 = GetEditableMeshFromContextModule(p1, "MeshId", p2)
			
			if not MeshId then
				error("Failed to retrieve MeshContent")
			end
			return UGCValidationService:GetDynamicHeadEditableMeshInactiveControls(MeshId2, ControlNames)
		end)
		
		if not Success1 then
			if string.find(Result1, "Download Error") == 1 then
				return downloadFailure(IsServer, p1.Name, p2)
			end
			assert(false, Result1)
		end
		local v1 = #Result1 == 0
		local v2 = #Result3 == 0
		
		if not v1 or not v2 then
			AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateDynamicHeadMeshPartFormat_ValidateDynamicHeadMeshControls, nil, p2)
			NewFailureReasonsAccumulator:updateReasons(v1, {
				`{p1.Name}.MeshId ({p1.MeshId}) is missing FACS controls: {table.concat(Result1, ", ")}`
			})
			NewFailureReasonsAccumulator:updateReasons(v2, {
				`{p1.Name}.MeshId ({p1.MeshId}) has inactive FACS controls: {table.concat(Result3, ", ")}`
			})
		end
	end
	if not GetFFlagUGCValidateMigrateDynamicHeadDataModule() then
		NewFailureReasonsAccumulator:updateReasons(validateFacialExpressiveness(p1, p2))
	end
	if not GetEngineFeatureEngineUGCValidateMinMaxMeshSizeAcrossAllFacsModule() then
		NewFailureReasonsAccumulator:updateReasons(validateFacialBounds(p1, p2))
	end
	if not GetFFlagUGCValidateMigrateDynamicHeadDataModule() and GetEngineFeatureEngineUGCValidateFACSJointTransformsWithinBoundsModule() then
		NewFailureReasonsAccumulator:updateReasons(ValidateFacsJointBoundsModule(p1, p2))
	end
	AnalyticsModule.recordScriptTime(script.Name, CurrentTime, p2)
	
	return NewFailureReasonsAccumulator:getFinalResults()
end