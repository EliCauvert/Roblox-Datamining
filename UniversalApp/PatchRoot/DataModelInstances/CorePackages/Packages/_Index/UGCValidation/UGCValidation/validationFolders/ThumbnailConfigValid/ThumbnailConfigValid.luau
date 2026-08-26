local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getFFlagUGCValidateMigrateSchemaPropertiesModule = require(parent.flags.getFFlagUGCValidateMigrateSchemaProperties)
local getFFlagUGCValidateEyebrowEyelashThumbnailSchemaModule = require(parent.flags.getFFlagUGCValidateEyebrowEyelashThumbnailSchema)
local UGCValidationAddThumbnailFrustumCheckingv2 = game:DefineFastFlag("UGCValidationAddThumbnailFrustumCheckingv2", false)

return {
	categories = {
		validationEnumsModule.UploadCategory.LAYERED_CLOTHING,
		validationEnumsModule.UploadCategory.RIGID_ACCESSORY
	},
	requiredData = {
		validationEnumsModule.SharedDataMember.rootInstance,
		validationEnumsModule.SharedDataMember.renderMeshesData,
		validationEnumsModule.SharedDataMember.uploadEnum
	},
	fflag = getFFlagUGCValidateMigrateSchemaPropertiesModule,
	expectedFailures = {},
	run = function(p1, p2)
		-- upvalues: getFFlagUGCValidateEyebrowEyelashThumbnailSchemaModule (ref), errorSourceStringsModule (ref), UGCValidationAddThumbnailFrustumCheckingv2 (ref), UGCValidationService (ref)
		local assetType
		local rootInstance = p2.rootInstance
		
		if getFFlagUGCValidateEyebrowEyelashThumbnailSchemaModule() then
			assetType = p2.uploadEnum and p2.uploadEnum.assetType
			
			if assetType == Enum.AssetType.EyebrowAccessory or assetType == Enum.AssetType.EyelashAccessory then return end
		end
		assetType = rootInstance:FindFirstChild("ThumbnailConfiguration")
		
		if not assetType then return end
		local handle = rootInstance:FindFirstChild("Handle")
		
		if not handle or not handle:IsA("BasePart") then return end
		local thumbnailCameraTarget = assetType:FindFirstChild("ThumbnailCameraTarget")
		
		if not thumbnailCameraTarget then return end
		if thumbnailCameraTarget.Value ~= handle then
			p1:fail(errorSourceStringsModule.Keys.ThumbnailInvalidTarget, { ExpectedTarget = handle:GetFullName() })
			
			return
		elseif game:GetEngineFeature("EngineUGCValidateThumbnailerMeshInFrustum") and UGCValidationAddThumbnailFrustumCheckingv2 then
			local renderMeshesData = p2.renderMeshesData
			
			if not renderMeshesData then return end
			local name = renderMeshesData[handle.Name]
			
			if not name then return end
			local cFrame = thumbnailCameraTarget.Value.CFrame
			local thumbnailCameraValue = assetType:FindFirstChild("ThumbnailCameraValue")
			
			if not thumbnailCameraValue then return end
			if UGCValidationService:CheckEditableMeshInCameraFrustum(name.editable, name.scale, cFrame, cFrame * thumbnailCameraValue.Value) == false then
				p1:fail(errorSourceStringsModule.Keys.ThumbnailOutsideView, { InstancePath = handle:GetFullName() })
			end
		end
	end
}