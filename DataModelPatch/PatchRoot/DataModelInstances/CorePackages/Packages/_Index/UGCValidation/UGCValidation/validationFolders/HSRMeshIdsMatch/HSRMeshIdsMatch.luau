local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local ParseContentIdsModule = require(Parent.util.ParseContentIds)
local PcallDeferredModule = require(Parent.util.pcallDeferred)
local GetFFlagUGCValidateHSRMeshIdsModule = require(Parent.flags.getFFlagUGCValidateHSRMeshIds)

local function validateHSRStructure(Entry, Object, p1)
	-- upvalues: ErrorSourceStringsModule (copy)
	if #Entry ~= 1 then
		p1:fail(ErrorSourceStringsModule.Keys.HSRAssetInvalidRoot, { InstancePath = Object:GetFullName() })
		
		return nil
	end
	local Entry1 = Entry[1]
	
	if not Entry1:IsA("HiddenSurfaceRemovalAsset") then
		p1:fail(ErrorSourceStringsModule.Keys.HSRAssetInvalidRoot, { InstancePath = Object:GetFullName() })
		
		return nil
	elseif #Entry1:GetDescendants() > 0 then
		p1:fail(ErrorSourceStringsModule.Keys.HSRAssetHasChildren, { InstancePath = Object:GetFullName() })
		
		return nil
	else
		return Entry1
	end
end

return {
	categories = {
		ValidationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		ValidationEnumsModule.UploadCategory.DYNAMIC_HEAD,
		ValidationEnumsModule.UploadCategory.LAYERED_CLOTHING
	},
	requiredData = {
		ValidationEnumsModule.SharedDataMember.rootInstance,
		ValidationEnumsModule.SharedDataMember.consumerConfig,
		ValidationEnumsModule.SharedDataMember.hsrAssets
	},
	fflag = require(Parent.flags.getFFlagUGCValidateMigrateSchemaProperties),
	expectedFailures = {},
	run = function(p1, p2)
		-- upvalues: ValidationEnumsModule (copy), GetFFlagUGCValidateHSRMeshIdsModule (copy), ErrorSourceStringsModule (copy), ParseContentIdsModule (copy), validateHSRStructure (copy), PcallDeferredModule (copy), UGCValidationService (copy)
		if p2.consumerConfig.consumerEnv == ValidationEnumsModule.ConsumerEnv.IEC then return end
		local IsConsumerEnvMatch = p2.consumerConfig.consumerEnv == ValidationEnumsModule.ConsumerEnv.Backend
		local FFlagUGCValidateHSRMeshIdsModule = GetFFlagUGCValidateHSRMeshIdsModule()
		local Descendants = p2.rootInstance:GetDescendants()
		table.insert(Descendants, p2.rootInstance)
		
		for _, WrapLayer in Descendants do
			if WrapLayer:IsA("WrapLayer") then
				local HSRAssetId = WrapLayer.HSRAssetId
				
				if HSRAssetId and HSRAssetId ~= "" then
					local TryGetAssetIdFromContentIdResult = ParseContentIdsModule.tryGetAssetIdFromContentId(HSRAssetId)
					
					if TryGetAssetIdFromContentIdResult then
						local HsrAsset = p2.hsrAssets[TryGetAssetIdFromContentIdResult]
						
						if HsrAsset then
							local ValidateHSRStructureResult = validateHSRStructure(HsrAsset, WrapLayer, p1)
							
							if ValidateHSRStructureResult and FFlagUGCValidateHSRMeshIdsModule then
								local PcallDeferredModuleResult, PcallDeferredModuleResult2 = PcallDeferredModule(function()
									-- upvalues: UGCValidationService (upval), WrapLayer (copy), ValidateHSRStructureResult (copy)
									return UGCValidationService:ValidateHSRMeshIds(WrapLayer, ValidateHSRStructureResult)
								end, {})
								
								if not PcallDeferredModuleResult then
									p1:fail(ErrorSourceStringsModule.Keys.HSRMeshIdValidationError, { InstancePath = WrapLayer:GetFullName() })
								elseif not PcallDeferredModuleResult2 then
									p1:fail(ErrorSourceStringsModule.Keys.HSRMeshIdsMismatch, { InstancePath = WrapLayer:GetFullName() })
								end
							end
						end
					else
						p1:fail(ErrorSourceStringsModule.Keys.HSRAssetIdInvalidUrl, { InstancePath = WrapLayer:GetFullName() })
					end
				elseif IsConsumerEnvMatch then
					p1:fail(ErrorSourceStringsModule.Keys.HSRAssetIdRequired, { InstancePath = WrapLayer:GetFullName() })
				end
			end
		end
	end
}