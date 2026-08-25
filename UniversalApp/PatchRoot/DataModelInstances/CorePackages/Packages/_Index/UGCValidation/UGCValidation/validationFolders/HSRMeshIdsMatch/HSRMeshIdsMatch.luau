local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local parseContentIdsModule = require(parent.util.ParseContentIds)
local pcallDeferredModule = require(parent.util.pcallDeferred)
local getFFlagUGCValidateHSRMeshIdsModule = require(parent.flags.getFFlagUGCValidateHSRMeshIds)
local t = {
	categories = {
		validationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		validationEnumsModule.UploadCategory.DYNAMIC_HEAD,
		validationEnumsModule.UploadCategory.LAYERED_CLOTHING
	},
	requiredData = {
		validationEnumsModule.SharedDataMember.rootInstance,
		validationEnumsModule.SharedDataMember.consumerConfig,
		validationEnumsModule.SharedDataMember.hsrAssets
	},
	fflag = require(parent.flags.getFFlagUGCValidateMigrateSchemaProperties),
	expectedFailures = {}
}

local function validateHSRStructure(p0, p1, p2)
	-- upvalues: errorSourceStringsModule (ref)
	if #p0 ~= 1 then
		p2:fail(errorSourceStringsModule.Keys.HSRAssetInvalidRoot, { InstancePath = p1:GetFullName() })
		
		return nil
	end
	local var8 = p0[1]
	
	if not var8:IsA("HiddenSurfaceRemovalAsset") then
		p2:fail(errorSourceStringsModule.Keys.HSRAssetInvalidRoot, { InstancePath = p1:GetFullName() })
		
		return nil
	elseif #var8:GetDescendants() > 0 then
		p2:fail(errorSourceStringsModule.Keys.HSRAssetHasChildren, { InstancePath = p1:GetFullName() })
		
		return nil
	end
	return var8
end

function t.run(p3, p4)
	-- upvalues: validationEnumsModule (ref), getFFlagUGCValidateHSRMeshIdsModule (ref), errorSourceStringsModule (ref), parseContentIdsModule (ref), validateHSRStructure (ref), pcallDeferredModule (ref), UGCValidationService (ref)
	if p4.consumerConfig.consumerEnv == validationEnumsModule.ConsumerEnv.IEC then return end
	local var9 = p4.consumerConfig.consumerEnv == validationEnumsModule.ConsumerEnv.Backend
	local var10 = getFFlagUGCValidateHSRMeshIdsModule()
	local descendants = p4.rootInstance:GetDescendants()
	table.insert(descendants, p4.rootInstance)
	
	for i, v in descendants do
		if v:IsA("WrapLayer") then
			local HSRAssetId = v.HSRAssetId
			
			if HSRAssetId and HSRAssetId ~= "" then
				local var12 = parseContentIdsModule.tryGetAssetIdFromContentId(HSRAssetId)
				
				if var12 then
					local var13 = p4.hsrAssets[var12]
					
					if var13 then
						local var14 = validateHSRStructure(var13, v, p3)
						
						if var14 and var10 then
							local var15, var16 = pcallDeferredModule(function()
								-- upvalues: UGCValidationService (copy), v (ref), var14 (ref)
								return UGCValidationService:ValidateHSRMeshIds(v, var14)
							end, {})
							
							if not var15 then
								p3:fail(errorSourceStringsModule.Keys.HSRMeshIdValidationError, { InstancePath = v:GetFullName() })
							elseif not var16 then
								p3:fail(errorSourceStringsModule.Keys.HSRMeshIdsMismatch, { InstancePath = v:GetFullName() })
							end
						end
					end
				else
					p3:fail(errorSourceStringsModule.Keys.HSRAssetIdInvalidUrl, { InstancePath = v:GetFullName() })
				end
			elseif var9 then
				p3:fail(errorSourceStringsModule.Keys.HSRAssetIdRequired, { InstancePath = v:GetFullName() })
			end
		end
	end
end

return t