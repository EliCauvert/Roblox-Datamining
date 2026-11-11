local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local GetFFlagUGCValidateEyebrowEyelashThumbnailSchemaModule = require(Parent.flags.getFFlagUGCValidateEyebrowEyelashThumbnailSchema)
local UGCValidationAddThumbnailFrustumCheckingv2 = game:DefineFastFlag("UGCValidationAddThumbnailFrustumCheckingv2", false)

return {
	categories = {
		ValidationEnumsModule.UploadCategory.LAYERED_CLOTHING,
		ValidationEnumsModule.UploadCategory.RIGID_ACCESSORY
	},
	requiredData = {
		ValidationEnumsModule.SharedDataMember.rootInstance,
		ValidationEnumsModule.SharedDataMember.renderMeshesData,
		ValidationEnumsModule.SharedDataMember.uploadEnum
	},
	fflag = require(Parent.flags.getFFlagUGCValidateMigrateSchemaProperties),
	expectedFailures = {},
	run = function(p1, p2)
		-- upvalues: GetFFlagUGCValidateEyebrowEyelashThumbnailSchemaModule (copy), ErrorSourceStringsModule (copy), UGCValidationAddThumbnailFrustumCheckingv2 (copy), UGCValidationService (copy)
		local RootInstance = p2.rootInstance
		
		if GetFFlagUGCValidateEyebrowEyelashThumbnailSchemaModule() then
			local AssetType = p2.uploadEnum and p2.uploadEnum.assetType
			
			if AssetType == Enum.AssetType.EyebrowAccessory or AssetType == Enum.AssetType.EyelashAccessory then return end
		end
		local ThumbnailConfiguration = RootInstance:FindFirstChild("ThumbnailConfiguration")
		
		if not ThumbnailConfiguration then return end
		local Handle = RootInstance:FindFirstChild("Handle")
		
		if not Handle or not Handle:IsA("BasePart") then return end
		local ThumbnailCameraTarget = ThumbnailConfiguration:FindFirstChild("ThumbnailCameraTarget")
		
		if not ThumbnailCameraTarget then return end
		if ThumbnailCameraTarget.Value ~= Handle then
			p1:fail(ErrorSourceStringsModule.Keys.ThumbnailInvalidTarget, { ExpectedTarget = Handle:GetFullName() })
			
			return
		end
		if game:GetEngineFeature("EngineUGCValidateThumbnailerMeshInFrustum") and UGCValidationAddThumbnailFrustumCheckingv2 then
			local RenderMeshesData = p2.renderMeshesData
			
			if not RenderMeshesData then return end
			local RenderMeshes = RenderMeshesData[Handle.Name]
			
			if not RenderMeshes then return end
			local ValueCFrame = ThumbnailCameraTarget.Value.CFrame
			local ThumbnailCameraValue = ThumbnailConfiguration:FindFirstChild("ThumbnailCameraValue")
			
			if not ThumbnailCameraValue then return end
			if UGCValidationService:CheckEditableMeshInCameraFrustum(RenderMeshes.editable, RenderMeshes.scale, ValueCFrame, ValueCFrame * ThumbnailCameraValue.Value) == false then
				p1:fail(ErrorSourceStringsModule.Keys.ThumbnailOutsideView, { InstancePath = Handle:GetFullName() })
			end
		end
	end
}