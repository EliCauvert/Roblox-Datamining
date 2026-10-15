local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent.Parent
local getEngineFeatureUGCValidateHSRMeshIdsModule = require(parent.flags.getEngineFeatureUGCValidateHSRMeshIds)
local getFFlagUGCValidateVersionedContentIdsModule = require(parent.flags.getFFlagUGCValidateVersionedContentIds)
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local parseContentIdsModule = require(parent.util.ParseContentIds)
local pcallDeferredModule = require(parent.util.pcallDeferred)
local t = {
	categories = {
		validationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		validationEnumsModule.UploadCategory.DYNAMIC_HEAD,
		validationEnumsModule.UploadCategory.LAYERED_CLOTHING,
		validationEnumsModule.UploadCategory.EYEBROW_EYELASH
	},
	requiredData = {
		validationEnumsModule.SharedDataMember.rootInstance,
		validationEnumsModule.SharedDataMember.consumerConfig,
		validationEnumsModule.SharedDataMember.hsrAssets
	},
	expectedFailures = {}
}

local function validateHSRStructure(p1, p2, p3)
	-- upvalues: errorSourceStringsModule (ref)
	if #p1 ~= 1 then
		p3:fail(errorSourceStringsModule.Keys.HSRAssetInvalidRoot, { InstancePath = p2:GetFullName() })
		
		return nil
	end
	local var1 = p1[1]
	
	if not var1:IsA("HiddenSurfaceRemovalAsset") then
		p3:fail(errorSourceStringsModule.Keys.HSRAssetInvalidRoot, { InstancePath = p2:GetFullName() })
		
		return nil
	elseif #var1:GetDescendants() > 0 then
		p3:fail(errorSourceStringsModule.Keys.HSRAssetHasChildren, { InstancePath = p2:GetFullName() })
		
		return nil
	end
	return var1
end

function t.run(p1, p2)
	-- upvalues: validationEnumsModule (ref), errorSourceStringsModule (ref), getFFlagUGCValidateVersionedContentIdsModule (ref), parseContentIdsModule (ref), validateHSRStructure (ref), getEngineFeatureUGCValidateHSRMeshIdsModule (ref), pcallDeferredModule (ref), UGCValidationService (ref)
	if p2.consumerConfig.consumerEnv == validationEnumsModule.ConsumerEnv.IEC then return end
	local var1 = p2.consumerConfig.consumerEnv == validationEnumsModule.ConsumerEnv.Backend
	local descendants = p2.rootInstance:GetDescendants()
	table.insert(descendants, p2.rootInstance)
	
	for i, v in descendants do
		if v:IsA("WrapLayer") then
			local HSRAssetId = v.HSRAssetId
			
			if not HSRAssetId or HSRAssetId == "" then
				if var1 then
					p1:fail(errorSourceStringsModule.Keys.HSRAssetIdRequired, { InstancePath = v:GetFullName() })
				end
			end
			local var2
			local _ = nil
			
			if getFFlagUGCValidateVersionedContentIdsModule() then
				local var3, var4 = parseContentIdsModule.tryParseContentId(HSRAssetId)
				var2 = if var3 then parseContentIdsModule.getReferenceKey(var3, var4) else nil
			else
				var2 = parseContentIdsModule.tryGetAssetIdFromContentId(HSRAssetId)
			end
			if var2 then
				local var5 = p2.hsrAssets[var2]
				
				if var5 then
					local var6 = validateHSRStructure(var5, v, p1)
					
					if var6 and getEngineFeatureUGCValidateHSRMeshIdsModule() then
						local var7, var8 = pcallDeferredModule(function()
							-- upvalues: UGCValidationService (copy), v (ref), var6 (ref)
							return UGCValidationService:ValidateHSRMeshIds(v, var6)
						end, {})
						
						if not var7 then
							p1:fail(errorSourceStringsModule.Keys.HSRMeshIdValidationError, { InstancePath = v:GetFullName() })
						elseif not var8 then
							p1:fail(errorSourceStringsModule.Keys.HSRMeshIdsMismatch, { InstancePath = v:GetFullName() })
						end
					end
				end
			else
				p1:fail(errorSourceStringsModule.Keys.HSRAssetIdInvalidUrl, { InstancePath = v:GetFullName() })
			end
		end
	end
end

return t