local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent
local analyticsModule = require(parent.Analytics)
local failureReasonsAccumulatorModule = require(parent.util.FailureReasonsAccumulator)
local validateFacsJointBoundsModule = require(parent.validation.validateFacsJointBounds)
local getEngineFeatureEngineUGCValidateFACSJointTransformsWithinBoundsModule = require(parent.flags.getEngineFeatureEngineUGCValidateFACSJointTransformsWithinBounds)
local getFFlagUGCValidateMigrateDynamicHeadDataModule = require(parent.flags.getFFlagUGCValidateMigrateDynamicHeadData)
local var1 = game:DefineFastInt("UGCValidateFacialBoundsScale", 120) / 100
local var2 = game:DefineFastInt("UGCValidateFacialExpressivenessThreshold", 10) / 100
local var3 = game:DefineFastInt("UGCValidateFacialExpressivenessMinVertDelta", 2) / 100
local getExpectedPartSizeModule = require(parent.util.getExpectedPartSize)
local _ = require(parent.util.Types)
local pcallDeferredModule = require(parent.util.pcallDeferred)
local getEditableMeshFromContextModule = require(parent.util.getEditableMeshFromContext)
local getEngineFeatureEngineUGCValidateMinMaxMeshSizeAcrossAllFacsModule = require(parent.flags.getEngineFeatureEngineUGCValidateMinMaxMeshSizeAcrossAllFacs)
local list = {
	"LeftEyeClosed", "EyesLookDown", "RightEyeClosed", "JawDrop", "Pucker",
	"LeftLipCornerPuller", "RightLipCornerPuller", "ChinRaiser",
	"ChinRaiserUpperLip", "LeftCheekRaiser", "RightCheekRaiser",
	"LeftInnerBrowRaiser", "RightInnerBrowRaiser", "LeftLipCornerDown",
	"RightLipCornerDown", "LeftLowerLipDepressor", "RightLowerLipDepressor"
}

local function downloadFailure(p1, p2, p3)
	-- upvalues: analyticsModule (ref)
	local formattedText = string.format("Failed to load model for dynamic head '%s'. Make sure model exists and try again.", p2)
	
	if p1 then
		error(formattedText)
	end
	analyticsModule.reportFailure(analyticsModule.ErrorType.validateDynamicHeadMeshPartFormat_FailedToLoadMesh, nil, p3)
	
	return false, { formattedText }
end

local function validateFacialBounds(p1, p2)
	-- upvalues: pcallDeferredModule (ref), getExpectedPartSizeModule (ref), getEditableMeshFromContextModule (ref), UGCValidationService (ref), var1 (ref)
	local isServer = p2.isServer
	local var1, var2 = pcallDeferredModule(function()
		-- upvalues: getExpectedPartSizeModule (copy), p1 (ref), p2 (ref), getEditableMeshFromContextModule (copy), UGCValidationService (copy), var1 (copy)
		local var1 = getExpectedPartSizeModule(p1, p2)
		local var2, var3 = getEditableMeshFromContextModule(p1, "MeshId", p2)
		
		if not var2 then
			error("Failed to retrieve MeshContent")
		end
		return UGCValidationService:ValidateEditableMeshFacialBounds(var3, var1, var1)
	end, p2)
	
	if var1 then
		if var2 then
			return true
		end
		return false, {
			string.format("DynamicHead (%s) when emoting surpasses the expected bounding box", p1:GetFullName())
		}
	else
		local formattedText = string.format("Failed to load mesh data for '%s'. Make sure the mesh exists and try again.", p1:GetFullName())
		
		if isServer ~= nil and isServer then
			error(formattedText)
		end
		return false, { formattedText }
	end
end

local function validateFacialExpressiveness(p1, p2)
	-- upvalues: pcallDeferredModule (ref), getExpectedPartSizeModule (ref), getEditableMeshFromContextModule (ref), UGCValidationService (ref), var3 (ref), var2 (ref)
	local isServer = p2.isServer
	local var1, var2 = pcallDeferredModule(function()
		-- upvalues: getExpectedPartSizeModule (copy), p1 (ref), p2 (ref), getEditableMeshFromContextModule (copy), UGCValidationService (copy), var3 (copy)
		local var1 = getExpectedPartSizeModule(p1, p2)
		local var2, var3 = getEditableMeshFromContextModule(p1, "MeshId", p2)
		
		if not var2 then
			error("Failed to retrieve MeshContent")
		end
		return UGCValidationService:ValidateEditableMeshFacialExpressiveness(var3, var3, var1)
	end, p2)
	
	if var1 then
		if var2 < var2 then
			return false, {
				string.format("DynamicHead (%s) did not pass threshold (%f < %f) for percent change when emoting", p1:GetFullName(), var2, var2)
			}
		end
		return true
	else
		local formattedText = string.format("Failed to load mesh data for '%s'. Make sure the mesh exists and try again.", p1:GetFullName())
		
		if isServer ~= nil and isServer then
			error(formattedText)
		end
		return false, { formattedText }
	end
end

return function(p1, p2)
	-- upvalues: getFFlagUGCValidateMigrateDynamicHeadDataModule (ref), getEditableMeshFromContextModule (ref), UGCValidationService (ref), downloadFailure (ref), analyticsModule (ref), failureReasonsAccumulatorModule (ref), list (ref), validateFacialExpressiveness (ref), getEngineFeatureEngineUGCValidateMinMaxMeshSizeAcrossAllFacsModule (ref), validateFacialBounds (ref), getEngineFeatureEngineUGCValidateFACSJointTransformsWithinBoundsModule (ref), validateFacsJointBoundsModule (ref)
	local currentTime = tick()
	local isServer = p2.isServer
	
	if not getFFlagUGCValidateMigrateDynamicHeadDataModule() then
		local ok, status = pcall(function()
			-- upvalues: getEditableMeshFromContextModule (copy), p1 (ref), p2 (ref), UGCValidationService (copy)
			local var1, var2 = getEditableMeshFromContextModule(p1, "MeshId", p2)
			
			if not var1 then
				error("Failed to retrieve MeshContent")
			end
			return UGCValidationService:ValidateDynamicHeadEditableMesh(var2)
		end)
		
		if not ok then
			return downloadFailure(isServer, p1.Name, p2)
		elseif not status then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateDynamicHeadMeshPartFormat_ValidateDynamicHeadMesh, nil, p2)
			
			return false, {
				string.format("Failed validation for dynamic head '%s' due to missing FACS information. You need to provide FACS controls for at least 17 poses (see documentation).", p1.Name)
			}
		end
	end
	local var1 = failureReasonsAccumulatorModule.new()
	
	if not getFFlagUGCValidateMigrateDynamicHeadDataModule() then
		local ok, status, var2 = pcall(function()
			-- upvalues: getEditableMeshFromContextModule (copy), p1 (ref), p2 (ref), UGCValidationService (copy), list (copy)
			local var1, var2 = getEditableMeshFromContextModule(p1, "MeshId", p2)
			
			if not var1 then
				error("Failed to retrieve MeshContent")
			end
			return UGCValidationService:GetDynamicHeadEditableMeshInactiveControls(var2, list)
		end)
		
		if not ok then
			if string.find(status, "Download Error") == 1 then
				return downloadFailure(isServer, p1.Name, p2)
			end
			assert(false, status)
		end
		local var3 = #status == 0
		local var4 = #var2 == 0
		
		if not var3 or not var4 then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateDynamicHeadMeshPartFormat_ValidateDynamicHeadMeshControls, nil, p2)
			var1:updateReasons(var3, {
				`{p1.Name}.MeshId ({p1.MeshId}) is missing FACS controls: {table.concat(status, ", ")}`
			})
			var1:updateReasons(var4, {
				`{p1.Name}.MeshId ({p1.MeshId}) has inactive FACS controls: {table.concat(var2, ", ")}`
			})
		end
	end
	if not getFFlagUGCValidateMigrateDynamicHeadDataModule() then
		var1:updateReasons(validateFacialExpressiveness(p1, p2))
	end
	if not getEngineFeatureEngineUGCValidateMinMaxMeshSizeAcrossAllFacsModule() then
		var1:updateReasons(validateFacialBounds(p1, p2))
	end
	if not getFFlagUGCValidateMigrateDynamicHeadDataModule() and getEngineFeatureEngineUGCValidateFACSJointTransformsWithinBoundsModule() then
		var1:updateReasons(validateFacsJointBoundsModule(p1, p2))
	end
	analyticsModule.recordScriptTime(script.Name, currentTime, p2)
	
	return var1:getFinalResults()
end