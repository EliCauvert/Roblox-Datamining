-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:44 2026 Pacific Standard Time.

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
	validateMeshPart = function(p0, p1) --[[ line: 22 ]]
		-- upvalues: getEngineFeatureEngineUGCValidationConsolidateAccessorySkinningModule (ref), getFFlagUGCValidationEnableR15plusSkinningModule (ref), getEditableMeshFromContextModule (ref), analyticsModule (ref), pcallDeferredModule (ref), UGCValidationService (ref), constantsModule (ref)
		if getEngineFeatureEngineUGCValidationConsolidateAccessorySkinningModule() and getFFlagUGCValidationEnableR15plusSkinningModule() then
			error("ValidateMeshPartOnlySkinnedToR15 is deprecated. Use RigidSkinnedToSchema / LCSkinnedToSchema / BodySkinnedToSchema instead.")
		end
		local var8, var9 = getEditableMeshFromContextModule(p0, "MeshId", p1)
		
		if not var8 then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateBodyPartVertsSkinnedToR15_FailedToFetchSkinning, nil, p1)
			
			return false, {
				`Could not get editable mesh data for {p0}. Please retry later or make a bug report.`
			}
		end
		local var10, var11 = pcallDeferredModule(function() --[[ line: 46 ]]
			-- upvalues: UGCValidationService (copy), var9 (ref)
			return {
				UGCValidationService:GetSkinnedJointNamesFromEditableMesh(var9)
			}
		end, p1)
		
		if not var10 then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateBodyPartVertsSkinnedToR15_FailedToFetchSkinning, nil, p1)
			
			return false, {
				`Could not get skinning data for {p0}. Please retry later or make a bug report.`
			}
		end
		for i, v in var11 do
			if constantsModule.R15_STANDARD_JOINT_NAMES[v] == nil then
				analyticsModule.reportFailure(analyticsModule.ErrorType.validateBodyPartVertsSkinnedToR15_BodyIsSkinnedToFakeJoints, nil, p1)
				
				return false, {
					`{p0} is skinned to a non-standard joint {v}. This part may only be skinned to standard R15 joints.`
				}
			end
		end
		return true
	end
}

function t.validateBodyParts(p2, p3) --[[ line: 76 ]]
	-- upvalues: getEngineFeatureEngineUGCValidationConsolidateAccessorySkinningModule (ref), getFFlagUGCValidationEnableR15plusSkinningModule (ref), constantsModule (ref), t (ref)
	if getEngineFeatureEngineUGCValidationConsolidateAccessorySkinningModule() and getFFlagUGCValidationEnableR15plusSkinningModule() then
		error("ValidateMeshPartOnlySkinnedToR15 is deprecated. Use RigidSkinnedToSchema / LCSkinnedToSchema / BodySkinnedToSchema instead.")
	end
	for i, v in constantsModule.R15_BODY_PARTS do
		local var12 = p2:FindFirstChild(v)
		
		if var12 then
			local var13, var14 = t.validateMeshPart(var12, p3)
			
			if not var13 then
				return var13, var14
			end
		end
	end
	return true
end

return t