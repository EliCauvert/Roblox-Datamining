local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getFIntMaxTotalSurfaceAreaModule = require(parent.flags.getFIntMaxTotalSurfaceArea)

return {
	fflag = require(parent.flags.getFFlagUGCValidateMigrateMeshGeometry),
	categories = {
		validationEnumsModule.UploadCategory.LAYERED_CLOTHING,
		validationEnumsModule.UploadCategory.RIGID_ACCESSORY,
		validationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		validationEnumsModule.UploadCategory.DYNAMIC_HEAD
	},
	requiredData = { validationEnumsModule.SharedDataMember.renderMeshesData },
	expectedFailures = {},
	run = function(p0, p1) --[[ line: 24 ]]
		-- upvalues: UGCValidationService (ref), getFIntMaxTotalSurfaceAreaModule (ref), errorSourceStringsModule (ref)
		for i, v in p1.renderMeshesData do
			local editable = UGCValidationService:CalculateEditableMeshTotalSurfaceArea(v.editable, v.scale)
			
			if getFIntMaxTotalSurfaceAreaModule() < editable then
				p0:fail(errorSourceStringsModule.Keys.MeshGeometry_SurfaceAreaExceeded, {
					meshName = i,
					surfaceArea = string.format("%.2f", editable),
					maxSurfaceArea = tostring(getFIntMaxTotalSurfaceAreaModule())
				})
			end
		end
	end
}