local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent
local analyticsModule = require(parent.Analytics)
local failureReasonsAccumulatorModule = require(parent.util.FailureReasonsAccumulator)
local validateFacsJointBoundsModule = require(parent.validation.validateFacsJointBounds)
local getEngineFeatureEngineUGCValidateFACSJointTransformsWithinBoundsModule = require(parent.flags.getEngineFeatureEngineUGCValidateFACSJointTransformsWithinBounds)
local getFFlagUGCValidateMigrateDynamicHeadDataModule = require(parent.flags.getFFlagUGCValidateMigrateDynamicHeadData)
local var6 = game:DefineFastInt("UGCValidateFacialBoundsScale", 120) / 100
local var7 = game:DefineFastInt("UGCValidateFacialExpressivenessThreshold", 10) / 100
local var8 = game:DefineFastInt("UGCValidateFacialExpressivenessMinVertDelta", 2) / 100
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

local function downloadFailure(p0, p1, p2) --[[ line: 52 ]]
	-- upvalues: analyticsModule (ref)
	local formattedText = string.format("Failed to load model for dynamic head '%s'. Make sure model exists and try again.", p1)
	
	if p0 then
		error(formattedText)
	end
	analyticsModule.reportFailure(analyticsModule.ErrorType.validateDynamicHeadMeshPartFormat_FailedToLoadMesh, nil, p2)
	
	return false, { formattedText }
end

local function validateFacialBounds(p3, p4) --[[ line: 79 ]]
	-- upvalues: pcallDeferredModule (ref), getExpectedPartSizeModule (ref), getEditableMeshFromContextModule (ref), UGCValidationService (ref), var6 (ref)
	local isServer = p4.isServer
	local var18, var19 = pcallDeferredModule(function() --[[ line: 85 ]]
		-- upvalues: getExpectedPartSizeModule (copy), p3 (ref), p4 (ref), getEditableMeshFromContextModule (copy), UGCValidationService (copy), var6 (copy)
		local var21 = getExpectedPartSizeModule(p3, p4)
		local var22, var23 = getEditableMeshFromContextModule(p3, "MeshId", p4)
		
		if not var22 then
			error("Failed to retrieve MeshContent")
		end
		return UGCValidationService:ValidateEditableMeshFacialBounds(var23, var6, var21)
	end, p4)
	
	if var18 then
		if var19 then
			return true
		end
		return false, {
			string.format("DynamicHead (%s) when emoting surpasses the expected bounding box", p3:GetFullName())
		}
	else
		local formattedText = string.format("Failed to load mesh data for '%s'. Make sure the mesh exists and try again.", p3:GetFullName())
		
		if isServer ~= nil and isServer then
			error(formattedText)
		end
		return false, { formattedText }
	end
end

local function validateFacialExpressiveness(p5, p6) --[[ line: 119 ]]
	-- upvalues: pcallDeferredModule (ref), getExpectedPartSizeModule (ref), getEditableMeshFromContextModule (ref), UGCValidationService (ref), var8 (ref), var7 (ref)
	local isServer = p6.isServer
	local var24, var25 = pcallDeferredModule(function() --[[ line: 125 ]]
		-- upvalues: getExpectedPartSizeModule (copy), p5 (ref), p6 (ref), getEditableMeshFromContextModule (copy), UGCValidationService (copy), var8 (copy)
		local var27 = getExpectedPartSizeModule(p5, p6)
		local var28, var29 = getEditableMeshFromContextModule(p5, "MeshId", p6)
		
		if not var28 then
			error("Failed to retrieve MeshContent")
		end
		return UGCValidationService:ValidateEditableMeshFacialExpressiveness(var29, var8, var27)
	end, p6)
	
	if var24 then
		if var25 < var7 then
			return false, {
				string.format("DynamicHead (%s) did not pass threshold (%f < %f) for percent change when emoting", p5:GetFullName(), var25, var7)
			}
		end
		return true
	else
		local formattedText = string.format("Failed to load mesh data for '%s'. Make sure the mesh exists and try again.", p5:GetFullName())
		
		if isServer ~= nil and isServer then
			error(formattedText)
		end
		return false, { formattedText }
	end
end

return function(p7, p8) --[[ line: 161 | named "validateDynamicHeadData" ]]
	-- upvalues: getFFlagUGCValidateMigrateDynamicHeadDataModule (ref), getEditableMeshFromContextModule (ref), UGCValidationService (ref), downloadFailure (ref), analyticsModule (ref), failureReasonsAccumulatorModule (ref), list (ref), validateFacialExpressiveness (ref), getEngineFeatureEngineUGCValidateMinMaxMeshSizeAcrossAllFacsModule (ref), validateFacialBounds (ref), getEngineFeatureEngineUGCValidateFACSJointTransformsWithinBoundsModule (ref), validateFacsJointBoundsModule (ref)
	local currentTime = tick()
	local isServer = p8.isServer
	
	if not getFFlagUGCValidateMigrateDynamicHeadDataModule() then
		local ok, status = pcall(function() --[[ line: 170 ]]
			-- upvalues: getEditableMeshFromContextModule (copy), p7 (ref), p8 (ref), UGCValidationService (copy)
			local var35, var36 = getEditableMeshFromContextModule(p7, "MeshId", p8)
			
			if not var35 then
				error("Failed to retrieve MeshContent")
			end
			return UGCValidationService:ValidateDynamicHeadEditableMesh(var36)
		end)
		
		if not ok then
			return downloadFailure(isServer, p7.Name, p8)
		elseif not status then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateDynamicHeadMeshPartFormat_ValidateDynamicHeadMesh, nil, p8)
			
			return false, {
				string.format("Failed validation for dynamic head '%s' due to missing FACS information. You need to provide FACS controls for at least 17 poses (see documentation).", p7.Name)
			}
		end
	end
	local var31 = failureReasonsAccumulatorModule.new()
	
	if not getFFlagUGCValidateMigrateDynamicHeadDataModule() then
		local ok, status, var32 = pcall(function() --[[ line: 203 ]]
			-- upvalues: getEditableMeshFromContextModule (copy), p7 (ref), p8 (ref), UGCValidationService (copy), list (copy)
			local var37, var38 = getEditableMeshFromContextModule(p7, "MeshId", p8)
			
			if not var37 then
				error("Failed to retrieve MeshContent")
			end
			return UGCValidationService:GetDynamicHeadEditableMeshInactiveControls(var38, list)
		end)
		
		if not ok then
			if string.find(status, "Download Error") == 1 then
				return downloadFailure(isServer, p7.Name, p8)
			end
			assert(false, status)
		end
		local var33 = #status == 0
		local var34 = #var32 == 0
		
		if not var33 or not var34 then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateDynamicHeadMeshPartFormat_ValidateDynamicHeadMeshControls, nil, p8)
			var31:updateReasons(var33, {
				`{p7.Name}.MeshId ({p7.MeshId}) is missing FACS controls: {table.concat(status, ", ")}`
			})
			var31:updateReasons(var34, {
				`{p7.Name}.MeshId ({p7.MeshId}) has inactive FACS controls: {table.concat(var32, ", ")}`
			})
		end
	end
	if not getFFlagUGCValidateMigrateDynamicHeadDataModule() then
		var31:updateReasons(validateFacialExpressiveness(p7, p8))
	end
	if not getEngineFeatureEngineUGCValidateMinMaxMeshSizeAcrossAllFacsModule() then
		var31:updateReasons(validateFacialBounds(p7, p8))
	end
	if not getFFlagUGCValidateMigrateDynamicHeadDataModule() and getEngineFeatureEngineUGCValidateFACSJointTransformsWithinBoundsModule() then
		var31:updateReasons(validateFacsJointBoundsModule(p7, p8))
	end
	analyticsModule.recordScriptTime(script.Name, currentTime, p8)
	
	return var31:getFinalResults()
end