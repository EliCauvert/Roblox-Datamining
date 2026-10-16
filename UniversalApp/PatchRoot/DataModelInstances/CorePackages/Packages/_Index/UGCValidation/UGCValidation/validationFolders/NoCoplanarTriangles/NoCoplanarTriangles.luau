local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local FloatEqualsModule = require(Parent.util.floatEquals)
local GetFIntMaxCoplanarIntersectionsPercentageModule = require(Parent.flags.getFIntMaxCoplanarIntersectionsPercentage)
local GetFFlagUGCValidateCoplanarTriTestBodyModule = require(Parent.flags.getFFlagUGCValidateCoplanarTriTestBody)

return {
	categories = {
		ValidationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		ValidationEnumsModule.UploadCategory.DYNAMIC_HEAD,
		ValidationEnumsModule.UploadCategory.LAYERED_CLOTHING,
		ValidationEnumsModule.UploadCategory.EYEBROW_EYELASH,
		ValidationEnumsModule.UploadCategory.RIGID_ACCESSORY
	},
	requiredData = { ValidationEnumsModule.SharedDataMember.renderMeshesData },
	expectedFailures = {},
	run = function(p1, p2) --[[ Line: 35 ]]
		-- upvalues: ValidationEnumsModule (copy), GetFFlagUGCValidateCoplanarTriTestBodyModule (copy), FloatEqualsModule (copy), UGCValidationService (copy), GetFIntMaxCoplanarIntersectionsPercentageModule (copy), ErrorSourceStringsModule (copy)
		local UploadCategory = p2.uploadCategory
		
		if (UploadCategory == ValidationEnumsModule.UploadCategory.TORSO_AND_LIMBS or UploadCategory == ValidationEnumsModule.UploadCategory.DYNAMIC_HEAD) and not GetFFlagUGCValidateCoplanarTriTestBodyModule() then return end
		for MeshName, value in p2.renderMeshesData do
			local Editable = value.editable
			local Scale = value.scale
			local OriginalSize = value.originalSize
			
			if not FloatEqualsModule(OriginalSize.X, 0) and not FloatEqualsModule(OriginalSize.Y, 0) and not FloatEqualsModule(OriginalSize.Z, 0) then
				local EditableMeshTriCount = UGCValidationService:GetEditableMeshTriCount(Editable)
				local Floored = math.floor(GetFIntMaxCoplanarIntersectionsPercentageModule() / 100 * EditableMeshTriCount)
				
				if UGCValidationService:IsEditableMeshNumCoplanarIntersectionsOverLimit(Editable, Floored, Scale, true) then
					p1:fail(ErrorSourceStringsModule.Keys.CoplanarTri_TooMany, {
						MeshName = MeshName,
						MaxIntersections = tostring(Floored),
						TriangleCount = tostring(EditableMeshTriCount)
					})
				end
			end
		end
	end
}