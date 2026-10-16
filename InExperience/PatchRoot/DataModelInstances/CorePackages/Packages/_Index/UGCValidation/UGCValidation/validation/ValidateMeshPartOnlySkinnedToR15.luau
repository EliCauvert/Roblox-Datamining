local Parent = script.Parent.Parent
local UGCValidationService = game:GetService("UGCValidationService")
local AnalyticsModule = require(Parent.Analytics)
local Util = Parent.util
local ConstantsModule = require(Parent.Constants)
local _ = require(Util.Types)
local PcallDeferredModule = require(Util.pcallDeferred)
local GetEditableMeshFromContextModule = require(Parent.util.getEditableMeshFromContext)
local GetEngineFeatureEngineUGCValidationConsolidateAccessorySkinningModule = require(Parent.flags.getEngineFeatureEngineUGCValidationConsolidateAccessorySkinning)
local GetFFlagUGCValidationEnableR15plusSkinningModule = require(Parent.flags.getFFlagUGCValidationEnableR15plusSkinning)
local ValidateMeshPartOnlySkinnedToR15Module = {
	validateMeshPart = function(Child, p1) --[[ Line: 22 ]]
		-- upvalues: GetEngineFeatureEngineUGCValidationConsolidateAccessorySkinningModule (copy), GetFFlagUGCValidationEnableR15plusSkinningModule (copy), GetEditableMeshFromContextModule (copy), AnalyticsModule (copy), PcallDeferredModule (copy), UGCValidationService (copy), ConstantsModule (copy)
		if GetEngineFeatureEngineUGCValidationConsolidateAccessorySkinningModule() and GetFFlagUGCValidationEnableR15plusSkinningModule() then
			error("ValidateMeshPartOnlySkinnedToR15 is deprecated. Use RigidSkinnedToSchema / LCSkinnedToSchema / BodySkinnedToSchema instead.")
		end
		local MeshId, MeshId2 = GetEditableMeshFromContextModule(Child, "MeshId", p1)
		
		if not MeshId then
			AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateBodyPartVertsSkinnedToR15_FailedToFetchSkinning, nil, p1)
			
			return false, {
				`Could not get editable mesh data for {Child}. Please retry later or make a bug report.`
			}
		end
		local PcallDeferredModuleResult, PcallDeferredModuleResult2 = PcallDeferredModule(function() --[[ Line: 46 ]]
			-- upvalues: UGCValidationService (upval), MeshId2 (copy)
			return {
				UGCValidationService:GetSkinnedJointNamesFromEditableMesh(MeshId2)
			}
		end, p1)
		
		if not PcallDeferredModuleResult then
			AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateBodyPartVertsSkinnedToR15_FailedToFetchSkinning, nil, p1)
			
			return false, {
				`Could not get skinning data for {Child}. Please retry later or make a bug report.`
			}
		end
		for _, value in PcallDeferredModuleResult2 do
			if ConstantsModule.R15_STANDARD_JOINT_NAMES[value] == nil then
				AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateBodyPartVertsSkinnedToR15_BodyIsSkinnedToFakeJoints, nil, p1)
				
				return false, {
					`{Child} is skinned to a non-standard joint {value}. This part may only be skinned to standard R15 joints.`
				}
			end
		end
		return true
	end
}

function ValidateMeshPartOnlySkinnedToR15Module.validateBodyParts(Object, p2) --[[ Line: 76 ]]
	-- upvalues: GetEngineFeatureEngineUGCValidationConsolidateAccessorySkinningModule (copy), GetFFlagUGCValidationEnableR15plusSkinningModule (copy), ConstantsModule (copy), ValidateMeshPartOnlySkinnedToR15Module (copy)
	if GetEngineFeatureEngineUGCValidationConsolidateAccessorySkinningModule() and GetFFlagUGCValidationEnableR15plusSkinningModule() then
		error("ValidateMeshPartOnlySkinnedToR15 is deprecated. Use RigidSkinnedToSchema / LCSkinnedToSchema / BodySkinnedToSchema instead.")
	end
	local ValidateMeshPartResult = nil
	local ValidateMeshPartResult2 = nil
	for _, r15BODYPART in ConstantsModule.R15_BODY_PARTS do
		local Child = Object:FindFirstChild(r15BODYPART)
		
		if Child then
			ValidateMeshPartResult, ValidateMeshPartResult2 = ValidateMeshPartOnlySkinnedToR15Module.validateMeshPart(Child, p2)
			
			if not ValidateMeshPartResult then
				return ValidateMeshPartResult, ValidateMeshPartResult2
			end
		end
	end
	return true
end

return ValidateMeshPartOnlySkinnedToR15Module