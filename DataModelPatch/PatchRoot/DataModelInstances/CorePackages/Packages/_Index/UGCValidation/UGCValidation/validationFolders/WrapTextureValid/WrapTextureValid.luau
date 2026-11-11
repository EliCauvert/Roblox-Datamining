local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent.Parent
local ConstantsModule = require(Parent.Constants)
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local WrapTargetCageUVReferenceValuesModule = require(Parent.WrapTargetCageUVReferenceValues)
local CreateEditableInstancesForContextModule = require(Parent.util.createEditableInstancesForContext)
local config = {
	Publish = true,
	Backend = true,
	Internal = true,
	InExpServer = true
}
local config1 = { InExpServer = true, InExpClient = true }

return {
	fflag = require(Parent.flags.getFFlagUGCValidateMigrateWrapAndMakeup),
	categories = { ValidationEnumsModule.UploadCategory.MAKEUP },
	requiredData = {
		ValidationEnumsModule.SharedDataMember.rootInstance,
		ValidationEnumsModule.SharedDataMember.consumerConfig
	},
	expectedFailures = {},
	run = function(p1, p2)
		-- upvalues: config (copy), config1 (copy), CreateEditableInstancesForContextModule (copy), ErrorSourceStringsModule (copy), UGCValidationService (copy), WrapTargetCageUVReferenceValuesModule (copy), ConstantsModule (copy)
		local RootInstance = p2.rootInstance
		local WrapTextureTransfer = RootInstance:FindFirstChildOfClass("WrapTextureTransfer")
		
		if WrapTextureTransfer == nil then
			error(string.format("WrapTextureTransfer child not found for %s", RootInstance.Name))
		end
		local Source = p2.consumerConfig.source
		local IsEntry = config[Source] == true
		local IsEntry1 = config1[Source] == true
		p1:setReportingInstance(WrapTextureTransfer)
		local ReferenceCageMeshContent = WrapTextureTransfer.ReferenceCageMeshContent
		local IsNotUriMatch: boolean = ReferenceCageMeshContent.Uri ~= nil and ReferenceCageMeshContent.Uri ~= ""
		local EditableMeshEditableInstanceInfo, EditableMeshEditableInstanceInfo2 = CreateEditableInstancesForContextModule.getEditableInstanceInfo(ReferenceCageMeshContent, p2.consumerConfig.preloadedEditableMeshes, "EditableMesh", IsEntry1)
		
		if EditableMeshEditableInstanceInfo and EditableMeshEditableInstanceInfo2 and EditableMeshEditableInstanceInfo2.instance then
			local EditableMeshEditableInstanceInfoInstance = EditableMeshEditableInstanceInfo2.instance
			local Success, Result = pcall(function()
				-- upvalues: UGCValidationService (upval), WrapTargetCageUVReferenceValuesModule (upval), EditableMeshEditableInstanceInfoInstance (copy)
				return UGCValidationService:ValidateEditableMeshUVValuesInReference(WrapTargetCageUVReferenceValuesModule.Head, EditableMeshEditableInstanceInfoInstance)
			end)
			
			if not Success then
				if IsEntry then
					p1:forceError(string.format("Failed to load UVs for '%s'. Make sure the UV map exists and try again.", WrapTextureTransfer:GetFullName()))
				end
				p1:fail(ErrorSourceStringsModule.Keys.WrapTexture_FailedToLoadUV, { instanceName = WrapTextureTransfer:GetFullName() })
				
				return
			elseif not Result then
				p1:fail(ErrorSourceStringsModule.Keys.WrapTexture_InvalidUV, { instanceName = WrapTextureTransfer:GetFullName() })
				
				return
			else
				local MAKEUPINFO = ConstantsModule.MAKEUP_INFO
				
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
				end
				return
			end
		else
			if not IsNotUriMatch then
				p1:fail(ErrorSourceStringsModule.Keys.WrapTexture_NoCage, { instanceName = WrapTextureTransfer:GetFullName() })
				
				return
			end
			if IsEntry then
				p1:forceError(string.format("Failed to load ReferenceCageContent for %s", WrapTextureTransfer:GetFullName()))
			end
			p1:fail(ErrorSourceStringsModule.Keys.WrapTexture_FailedToLoadCage, { instanceName = WrapTextureTransfer:GetFullName() })
		end
	end
}