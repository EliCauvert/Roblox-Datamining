local parent = script.Parent.Parent
local UGCValidationService = game:GetService("UGCValidationService")
local analyticsModule = require(parent.Analytics)
local util = parent.util
local constantsModule = require(parent.Constants)
local _ = require(util.Types)
local pcallDeferredModule = require(util.pcallDeferred)
local getEditableMeshFromContextModule = require(parent.util.getEditableMeshFromContext)
local getEngineFeatureEngineUGCValidationConsolidateAccessorySkinningModule = require(parent.flags.getEngineFeatureEngineUGCValidationConsolidateAccessorySkinning)
local getFFlagUGCValidationEnableR15plusSkinningModule = require(parent.flags.getFFlagUGCValidationEnableR15plusSkinning)
local t = {
	validateMeshPart = function(p1, p2)
		-- upvalues: getEngineFeatureEngineUGCValidationConsolidateAccessorySkinningModule (ref), getFFlagUGCValidationEnableR15plusSkinningModule (ref), getEditableMeshFromContextModule (ref), analyticsModule (ref), pcallDeferredModule (ref), UGCValidationService (ref), constantsModule (ref)
		if getEngineFeatureEngineUGCValidationConsolidateAccessorySkinningModule() and getFFlagUGCValidationEnableR15plusSkinningModule() then
			error("ValidateMeshPartOnlySkinnedToR15 is deprecated. Use RigidSkinnedToSchema / LCSkinnedToSchema / BodySkinnedToSchema instead.")
		end
		local var1, var2 = getEditableMeshFromContextModule(p1, "MeshId", p2)
		
		if not var1 then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateBodyPartVertsSkinnedToR15_FailedToFetchSkinning, nil, p2)
			
			return false, {
				`Could not get editable mesh data for {p1}. Please retry later or make a bug report.`
			}
		end
		local var3, var4 = pcallDeferredModule(function()
			-- upvalues: UGCValidationService (copy), var2 (ref)
			return {
				UGCValidationService:GetSkinnedJointNamesFromEditableMesh(var2)
			}
		end, p2)
		
		if not var3 then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateBodyPartVertsSkinnedToR15_FailedToFetchSkinning, nil, p2)
			
			return false, {
				`Could not get skinning data for {p1}. Please retry later or make a bug report.`
			}
		end
		for i, v in var4 do
			if constantsModule.R15_STANDARD_JOINT_NAMES[v] == nil then
				analyticsModule.reportFailure(analyticsModule.ErrorType.validateBodyPartVertsSkinnedToR15_BodyIsSkinnedToFakeJoints, nil, p2)
				
				return false, {
					`{p1} is skinned to a non-standard joint {v}. This part may only be skinned to standard R15 joints.`
				}
			end
		end
		return true
	end
}

function t.validateBodyParts(p3, p4)
	-- upvalues: getEngineFeatureEngineUGCValidationConsolidateAccessorySkinningModule (ref), getFFlagUGCValidationEnableR15plusSkinningModule (ref), constantsModule (ref), t (ref)
	if getEngineFeatureEngineUGCValidationConsolidateAccessorySkinningModule() and getFFlagUGCValidationEnableR15plusSkinningModule() then
		error("ValidateMeshPartOnlySkinnedToR15 is deprecated. Use RigidSkinnedToSchema / LCSkinnedToSchema / BodySkinnedToSchema instead.")
	end
	for i, v in constantsModule.R15_BODY_PARTS do
		local var5 = p3:FindFirstChild(v)
		
		if var5 then
			local var6, var7 = t.validateMeshPart(var5, p4)
			
			if not var6 then
				return var6, var7
			end
		end
	end
	return true
end

return t