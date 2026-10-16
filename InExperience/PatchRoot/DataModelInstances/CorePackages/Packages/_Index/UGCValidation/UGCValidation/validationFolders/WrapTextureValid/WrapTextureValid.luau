local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent.Parent
local ConstantsModule = require(Parent.Constants)
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local WrapTargetCageUVReferenceValuesModule = require(Parent.WrapTargetCageUVReferenceValues)
local CreateEditableInstancesForContextModule = require(Parent.util.createEditableInstancesForContext)
local GetFFlagUGCValidationAllowFullVaasModule = require(Parent.flags.getFFlagUGCValidationAllowFullVaas)
local GetFFlagUGCValidateTransitionMakeupBoundsModule = require(Parent.flags.getFFlagUGCValidateTransitionMakeupBounds)
local config = {
	Publish = true,
	Backend = true,
	Internal = true,
	InExpServer = true
}
local config1 = { InExpServer = true, InExpClient = true }
local _Vector2 = Vector2.new(3.28941798, 0.313124001)
local _Vector2_1 = Vector2.new(3.71058202, 0.734287024)

return {
	categories = { ValidationEnumsModule.UploadCategory.MAKEUP },
	requiredData = {
		ValidationEnumsModule.SharedDataMember.rootInstance,
		ValidationEnumsModule.SharedDataMember.consumerConfig
	},
	expectedFailures = {},
	run = function(p1, p2) --[[ Line: 43 ]]
		-- upvalues: GetFFlagUGCValidationAllowFullVaasModule (copy), ValidationEnumsModule (copy), config (copy), config1 (copy), CreateEditableInstancesForContextModule (copy), ErrorSourceStringsModule (copy), UGCValidationService (copy), WrapTargetCageUVReferenceValuesModule (copy), ConstantsModule (copy), GetFFlagUGCValidateTransitionMakeupBoundsModule (copy), _Vector2 (copy), _Vector2_1 (copy)
		local RootInstance = p2.rootInstance
		local WrapTextureTransfer = RootInstance:FindFirstChildOfClass("WrapTextureTransfer")
		
		if WrapTextureTransfer == nil then
			error(string.format("WrapTextureTransfer child not found for %s", RootInstance.Name))
		end
		local ConsumerConfig = p2.consumerConfig
		local IsVaaS = GetFFlagUGCValidationAllowFullVaasModule() and ConsumerConfig.isVaaS
		local IsValidationEnvMatch: boolean = if IsVaaS then ConsumerConfig.validationEnv == ValidationEnumsModule.ValidationEnv.Backend else config[ConsumerConfig.source] == true
		local IsEntry = config1[ConsumerConfig.source] == true
		p1:setReportingInstance(WrapTextureTransfer)
		local ReferenceCageMeshContent = WrapTextureTransfer.ReferenceCageMeshContent
		local IsNotUriMatch: boolean = ReferenceCageMeshContent.Uri ~= nil and ReferenceCageMeshContent.Uri ~= ""
		local EditableMeshEditableInstanceInfo, EditableMeshEditableInstanceInfo2 = CreateEditableInstancesForContextModule.getEditableInstanceInfo(ReferenceCageMeshContent, p2.consumerConfig.preloadedEditableMeshes, "EditableMesh", IsEntry)
		
		if EditableMeshEditableInstanceInfo and EditableMeshEditableInstanceInfo2 and EditableMeshEditableInstanceInfo2.instance then
			local EditableMeshEditableInstanceInfoInstance = EditableMeshEditableInstanceInfo2.instance
			local Success, Result = pcall(function() --[[ Line: 98 ]]
				-- upvalues: UGCValidationService (upval), WrapTargetCageUVReferenceValuesModule (upval), EditableMeshEditableInstanceInfoInstance (copy)
				return UGCValidationService:ValidateEditableMeshUVValuesInReference(WrapTargetCageUVReferenceValuesModule.Head, EditableMeshEditableInstanceInfoInstance)
			end)
			
			if Success then
				if not Result then
					p1:fail(ErrorSourceStringsModule.Keys.WrapTexture_InvalidUV, { instanceName = WrapTextureTransfer:GetFullName() })
					
					return
				end
				local MAKEUPINFO = ConstantsModule.MAKEUP_INFO
				local v1 = if GetFFlagUGCValidateTransitionMakeupBoundsModule() then WrapTextureTransfer.UVMinBound:FuzzyEq(_Vector2) and WrapTextureTransfer.UVMaxBound:FuzzyEq(_Vector2_1) else false
				
				if not v1 then
					if not WrapTextureTransfer.UVMinBound:FuzzyEq(MAKEUPINFO.WrapTextureTransferUVBounds.MinBound) then
						p1:fail(ErrorSourceStringsModule.Keys.WrapTexture_InvalidMinBound, {
							instanceName = WrapTextureTransfer:GetFullName(),
							actual = tostring(WrapTextureTransfer.UVMinBound),
							expected = tostring(MAKEUPINFO.WrapTextureTransferUVBounds.MinBound)
						})
						
						return
					end
					if not WrapTextureTransfer.UVMaxBound:FuzzyEq(MAKEUPINFO.WrapTextureTransferUVBounds.MaxBound) then
						p1:fail(ErrorSourceStringsModule.Keys.WrapTexture_InvalidMaxBound, {
							instanceName = WrapTextureTransfer:GetFullName(),
							actual = tostring(WrapTextureTransfer.UVMaxBound),
							expected = tostring(MAKEUPINFO.WrapTextureTransferUVBounds.MaxBound)
						})
						
						if GetFFlagUGCValidateTransitionMakeupBoundsModule() then return end
					end
				end
				if GetFFlagUGCValidateTransitionMakeupBoundsModule() and IsValidationEnvMatch then
					if v1 then
						p1:setTelemetryContext("makeupBounds=Old")
						
						return
					end
					p1:setTelemetryContext("makeupBounds=New")
				end
				return
			else
				if IsValidationEnvMatch then
					p1:forceError(string.format("Failed to load UVs for '%s'. Make sure the UV map exists and try again.", WrapTextureTransfer:GetFullName()))
				end
				p1:fail(ErrorSourceStringsModule.Keys.WrapTexture_FailedToLoadUV, { instanceName = WrapTextureTransfer:GetFullName() })
				
				return
			end
		else
			if not IsNotUriMatch then
				p1:fail(ErrorSourceStringsModule.Keys.WrapTexture_NoCage, { instanceName = WrapTextureTransfer:GetFullName() })
				
				return
			end
			if IsValidationEnvMatch then
				p1:forceError(string.format("Failed to load ReferenceCageContent for %s", WrapTextureTransfer:GetFullName()))
			end
			p1:fail(ErrorSourceStringsModule.Keys.WrapTexture_FailedToLoadCage, { instanceName = WrapTextureTransfer:GetFullName() })
		end
	end
}