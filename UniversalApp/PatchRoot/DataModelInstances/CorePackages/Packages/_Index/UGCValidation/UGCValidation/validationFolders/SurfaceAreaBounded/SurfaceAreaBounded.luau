local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local GetFIntMaxTotalSurfaceAreaModule = require(Parent.flags.getFIntMaxTotalSurfaceArea)

return {
	categories = {
		ValidationEnumsModule.UploadCategory.LAYERED_CLOTHING,
		ValidationEnumsModule.UploadCategory.EYEBROW_EYELASH,
		ValidationEnumsModule.UploadCategory.RIGID_ACCESSORY,
		ValidationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		ValidationEnumsModule.UploadCategory.DYNAMIC_HEAD
	},
	requiredData = { ValidationEnumsModule.SharedDataMember.renderMeshesData },
	expectedFailures = {},
	run = function(p1, p2) --[[ Line: 21 ]]
		-- upvalues: UGCValidationService (copy), GetFIntMaxTotalSurfaceAreaModule (copy), ErrorSourceStringsModule (copy)
		for MeshName, value in p2.renderMeshesData do
			local EditableMeshTotalSurfaceArea = UGCValidationService:CalculateEditableMeshTotalSurfaceArea(value.editable, value.scale)
			
			if GetFIntMaxTotalSurfaceAreaModule() < EditableMeshTotalSurfaceArea then
				p1:fail(ErrorSourceStringsModule.Keys.MeshGeometry_SurfaceAreaExceeded, {
					meshName = MeshName,
					surfaceArea = string.format("%.2f", EditableMeshTotalSurfaceArea),
					maxSurfaceArea = tostring(GetFIntMaxTotalSurfaceAreaModule())
				})
			end
		end
	end
}