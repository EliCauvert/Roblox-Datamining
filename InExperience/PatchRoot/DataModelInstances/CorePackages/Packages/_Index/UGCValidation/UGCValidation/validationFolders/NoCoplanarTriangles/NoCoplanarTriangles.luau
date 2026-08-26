local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local floatEqualsModule = require(parent.util.floatEquals)
local getFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule = require(parent.flags.getFFlagUGCValidateMigrateSurfaceAppearanceMeshQuality)
local getFIntMaxCoplanarIntersectionsPercentageModule = require(parent.flags.getFIntMaxCoplanarIntersectionsPercentage)
local getFFlagUGCValidateCoplanarTriTestBodyModule = require(parent.flags.getFFlagUGCValidateCoplanarTriTestBody)

return {
	fflag = getFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule,
	categories = {
		validationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		validationEnumsModule.UploadCategory.DYNAMIC_HEAD,
		validationEnumsModule.UploadCategory.LAYERED_CLOTHING,
		validationEnumsModule.UploadCategory.RIGID_ACCESSORY
	},
	requiredData = { validationEnumsModule.SharedDataMember.renderMeshesData },
	expectedFailures = {},
	run = function(p1, p2)
		-- upvalues: validationEnumsModule (ref), getFFlagUGCValidateCoplanarTriTestBodyModule (ref), floatEqualsModule (ref), UGCValidationService (ref), getFIntMaxCoplanarIntersectionsPercentageModule (ref), errorSourceStringsModule (ref)
		local uploadCategory = p2.uploadCategory
		
		if (if uploadCategory ~= validationEnumsModule.UploadCategory.TORSO_AND_LIMBS then uploadCategory == validationEnumsModule.UploadCategory.DYNAMIC_HEAD else true) and not getFFlagUGCValidateCoplanarTriTestBodyModule() then return end
		for i, v in p2.renderMeshesData do
			local editable = v.editable
			local scale = v.scale
			local originalSize = v.originalSize
			
			if not floatEqualsModule(originalSize.X, 0) and not floatEqualsModule(originalSize.Y, 0) and not floatEqualsModule(originalSize.Z, 0) then
				local var1 = UGCValidationService:GetEditableMeshTriCount(editable)
				local floored = math.floor(getFIntMaxCoplanarIntersectionsPercentageModule() / 100 * var1)
				
				if UGCValidationService:IsEditableMeshNumCoplanarIntersectionsOverLimit(editable, floored, scale, true) then
					p1:fail(errorSourceStringsModule.Keys.CoplanarTri_TooMany, {
						MeshName = i,
						MaxIntersections = tostring(floored),
						TriangleCount = tostring(var1)
					})
				end
			end
		end
	end
}