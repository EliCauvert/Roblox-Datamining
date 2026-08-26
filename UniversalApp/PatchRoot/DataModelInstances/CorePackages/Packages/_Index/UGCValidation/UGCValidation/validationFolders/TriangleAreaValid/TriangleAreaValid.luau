local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)

local function _(vectorA, vectorB, p1)
	-- upvalues: UGCValidationService (ref), errorSourceStringsModule (ref)
	if not UGCValidationService:ValidateEditableMeshTriangleArea(vectorB) then
		vectorA:fail(errorSourceStringsModule.Keys.MeshGeometry_ZeroAreaTriangle, { meshName = p1 })
	end
end

return {
	fflag = require(parent.flags.getFFlagUGCValidateMigrateMeshGeometry),
	categories = {
		validationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		validationEnumsModule.UploadCategory.DYNAMIC_HEAD
	},
	requiredData = { validationEnumsModule.SharedDataMember.renderMeshesData },
	conditionalData = { validationEnumsModule.SharedDataMember.outerCagesData },
	expectedFailures = {},
	run = function(p1, p2)
		-- upvalues: UGCValidationService (ref), errorSourceStringsModule (ref)
		for i, v in p2.renderMeshesData do
			if not UGCValidationService:ValidateEditableMeshTriangleArea(v.editable) then
				p1:fail(errorSourceStringsModule.Keys.MeshGeometry_ZeroAreaTriangle, { meshName = i })
			end
		end
		if p2.outerCagesData then
			for i_1, v_1 in p2.outerCagesData do
				local text = i_1 .. "OuterCage"
				
				if not UGCValidationService:ValidateEditableMeshTriangleArea(v_1.editable) then
					p1:fail(errorSourceStringsModule.Keys.MeshGeometry_ZeroAreaTriangle, { meshName = text })
				end
			end
		end
	end
}