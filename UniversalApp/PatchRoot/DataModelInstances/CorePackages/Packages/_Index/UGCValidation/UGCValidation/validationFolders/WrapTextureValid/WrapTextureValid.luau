local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent.Parent
local constantsModule = require(parent.Constants)
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local wrapTargetCageUVReferenceValuesModule = require(parent.WrapTargetCageUVReferenceValues)
local createEditableInstancesForContextModule = require(parent.util.createEditableInstancesForContext)
local getFFlagUGCValidationAllowFullVaasModule = require(parent.flags.getFFlagUGCValidationAllowFullVaas)
local getFFlagUGCValidateTransitionMakeupBoundsModule = require(parent.flags.getFFlagUGCValidateTransitionMakeupBounds)
local t = {
	Publish = true,
	Backend = true,
	Internal = true,
	InExpServer = true
}
local t_1 = { InExpServer = true, InExpClient = true }
local vector2 = Vector2.new(3.28941798, 0.313124001)
local vector2_1 = Vector2.new(3.71058202, 0.734287024)

return {
	categories = { validationEnumsModule.UploadCategory.MAKEUP },
	requiredData = {
		validationEnumsModule.SharedDataMember.rootInstance,
		validationEnumsModule.SharedDataMember.consumerConfig
	},
	expectedFailures = {},
	run = function(p1, p2)
		-- upvalues: getFFlagUGCValidationAllowFullVaasModule (ref), validationEnumsModule (ref), t (ref), t_1 (ref), createEditableInstancesForContextModule (ref), errorSourceStringsModule (ref), UGCValidationService (ref), wrapTargetCageUVReferenceValuesModule (ref), constantsModule (ref), getFFlagUGCValidateTransitionMakeupBoundsModule (ref), vector2 (ref), vector2_1 (ref)
		local rootInstance = p2.rootInstance
		local wrapTextureTransfer = rootInstance:FindFirstChildOfClass("WrapTextureTransfer")
		
		if wrapTextureTransfer == nil then
			error(string.format("WrapTextureTransfer child not found for %s", rootInstance.Name))
		end
		local var1
		local consumerConfig = p2.consumerConfig
		
		if getFFlagUGCValidationAllowFullVaasModule() and consumerConfig.isVaaS then
			var1 = consumerConfig.validationEnv == validationEnumsModule.ValidationEnv.Backend
			var1 = nil
		else
			var1 = t[consumerConfig.source] == true
		end
		local var2 = t_1[consumerConfig.source] == true
		p1:setReportingInstance(wrapTextureTransfer)
		local referenceCageMeshContent = wrapTextureTransfer.ReferenceCageMeshContent
		local var3 = referenceCageMeshContent.Uri ~= nil and referenceCageMeshContent.Uri ~= ""
		local editableMesh, editableMesh_1 = createEditableInstancesForContextModule.getEditableInstanceInfo(referenceCageMeshContent, p2.consumerConfig.preloadedEditableMeshes, "EditableMesh", var2)
		
		if editableMesh and editableMesh_1 and editableMesh_1.instance then
			local instance = editableMesh_1.instance
			local ok, status = pcall(function()
				-- upvalues: UGCValidationService (copy), wrapTargetCageUVReferenceValuesModule (copy), instance (ref)
				return UGCValidationService:ValidateEditableMeshUVValuesInReference(wrapTargetCageUVReferenceValuesModule.Head, instance)
			end)
			
			if ok then
				if not status then
					p1:fail(errorSourceStringsModule.Keys.WrapTexture_InvalidUV, { instanceName = wrapTextureTransfer:GetFullName() })
					
					return
				end
				local MAKEUP_INFO = constantsModule.MAKEUP_INFO
				local var4 = false
				
				if getFFlagUGCValidateTransitionMakeupBoundsModule() then
					var4 = wrapTextureTransfer.UVMinBound:FuzzyEq(vector2) and wrapTextureTransfer.UVMaxBound:FuzzyEq(vector2_1)
				end
				if not var4 then
					if not wrapTextureTransfer.UVMinBound:FuzzyEq(MAKEUP_INFO.WrapTextureTransferUVBounds.MinBound) then
						p1:fail(errorSourceStringsModule.Keys.WrapTexture_InvalidMinBound, {
							instanceName = wrapTextureTransfer:GetFullName(),
							actual = tostring(wrapTextureTransfer.UVMinBound),
							expected = tostring(MAKEUP_INFO.WrapTextureTransferUVBounds.MinBound)
						})
						
						return
					elseif not wrapTextureTransfer.UVMaxBound:FuzzyEq(MAKEUP_INFO.WrapTextureTransferUVBounds.MaxBound) then
						p1:fail(errorSourceStringsModule.Keys.WrapTexture_InvalidMaxBound, {
							instanceName = wrapTextureTransfer:GetFullName(),
							actual = tostring(wrapTextureTransfer.UVMaxBound),
							expected = tostring(MAKEUP_INFO.WrapTextureTransferUVBounds.MaxBound)
						})
						
						if getFFlagUGCValidateTransitionMakeupBoundsModule() then return end
					end
				end
				if getFFlagUGCValidateTransitionMakeupBoundsModule() and var1 then
					if var4 then
						p1:setTelemetryContext("makeupBounds=Old")
						
						return
					end
					p1:setTelemetryContext("makeupBounds=New")
				end
				return
			elseif var1 then
				p1:forceError(string.format("Failed to load UVs for '%s'. Make sure the UV map exists and try again.", wrapTextureTransfer:GetFullName()))
			end
			p1:fail(errorSourceStringsModule.Keys.WrapTexture_FailedToLoadUV, { instanceName = wrapTextureTransfer:GetFullName() })
			
			return
		elseif not var3 then
			p1:fail(errorSourceStringsModule.Keys.WrapTexture_NoCage, { instanceName = wrapTextureTransfer:GetFullName() })
			
			return
		elseif var1 then
			p1:forceError(string.format("Failed to load ReferenceCageContent for %s", wrapTextureTransfer:GetFullName()))
		end
		p1:fail(errorSourceStringsModule.Keys.WrapTexture_FailedToLoadCage, { instanceName = wrapTextureTransfer:GetFullName() })
	end
}