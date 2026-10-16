local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent.Parent
local GetEngineFeatureUGCValidateHSRMeshIdsModule = require(Parent.flags.getEngineFeatureUGCValidateHSRMeshIds)
local GetFFlagUGCValidateVersionedContentIdsModule = require(Parent.flags.getFFlagUGCValidateVersionedContentIds)
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local ParseContentIdsModule = require(Parent.util.ParseContentIds)
local PcallDeferredModule = require(Parent.util.pcallDeferred)

local function validateHSRStructure(Entry, Object, p1) --[[ Line: 29 ]]
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
		ValidationEnumsModule.UploadCategory.LAYERED_CLOTHING,
		ValidationEnumsModule.UploadCategory.EYEBROW_EYELASH
	},
	requiredData = {
		ValidationEnumsModule.SharedDataMember.rootInstance,
		ValidationEnumsModule.SharedDataMember.consumerConfig,
		ValidationEnumsModule.SharedDataMember.hsrAssets
	},
	expectedFailures = {},
	run = function(p1, p2) --[[ Line: 59 ]]
		-- upvalues: ValidationEnumsModule (copy), ErrorSourceStringsModule (copy), GetFFlagUGCValidateVersionedContentIdsModule (copy), ParseContentIdsModule (copy), validateHSRStructure (copy), GetEngineFeatureUGCValidateHSRMeshIdsModule (copy), PcallDeferredModule (copy), UGCValidationService (copy)
		if p2.consumerConfig.consumerEnv == ValidationEnumsModule.ConsumerEnv.IEC then return end
		local IsConsumerEnvMatch = p2.consumerConfig.consumerEnv == ValidationEnumsModule.ConsumerEnv.Backend
		local Descendants = p2.rootInstance:GetDescendants()
		table.insert(Descendants, p2.rootInstance)
		
		for _, WrapLayer in Descendants do
			if WrapLayer:IsA("WrapLayer") then
				local HSRAssetId = WrapLayer.HSRAssetId
				
				if not HSRAssetId or HSRAssetId == "" then
					if IsConsumerEnvMatch then
						p1:fail(ErrorSourceStringsModule.Keys.HSRAssetIdRequired, { InstancePath = WrapLayer:GetFullName() })
						continue
					end
					continue
				end
				local ReferenceKey = nil
				if GetFFlagUGCValidateVersionedContentIdsModule() then
					local TryParseContentIdResult, TryParseContentIdResult2 = ParseContentIdsModule.tryParseContentId(HSRAssetId)
					ReferenceKey = if TryParseContentIdResult then ParseContentIdsModule.getReferenceKey(TryParseContentIdResult, TryParseContentIdResult2) else nil
				else
					ReferenceKey = ParseContentIdsModule.tryGetAssetIdFromContentId(HSRAssetId)
				end
				if ReferenceKey then
					local HsrAsset = p2.hsrAssets[ReferenceKey]
					
					if HsrAsset then
						local ValidateHSRStructureResult = validateHSRStructure(HsrAsset, WrapLayer, p1)
						
						if ValidateHSRStructureResult and GetEngineFeatureUGCValidateHSRMeshIdsModule() then
							local PcallDeferredModuleResult, PcallDeferredModuleResult2 = PcallDeferredModule(function() --[[ Line: 115 ]]
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
			end
		end
	end
}