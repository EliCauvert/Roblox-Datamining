local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)

local function _(p1, EditableMesh, MeshName)
	-- upvalues: UGCValidationService (copy), ErrorSourceStringsModule (copy)
	if not UGCValidationService:ValidateEditableMeshTriangleArea(EditableMesh) then
		p1:fail(ErrorSourceStringsModule.Keys.MeshGeometry_ZeroAreaTriangle, { meshName = MeshName })
	end
end

return {
	categories = {
		ValidationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		ValidationEnumsModule.UploadCategory.DYNAMIC_HEAD
	},
	requiredData = { ValidationEnumsModule.SharedDataMember.renderMeshesData },
	conditionalData = { ValidationEnumsModule.SharedDataMember.outerCagesData },
	expectedFailures = {},
	run = function(p1, p2)
		-- upvalues: UGCValidationService (copy), ErrorSourceStringsModule (copy)
		for MeshName, value in p2.renderMeshesData do
			if not UGCValidationService:ValidateEditableMeshTriangleArea(value.editable) then
				p1:fail(ErrorSourceStringsModule.Keys.MeshGeometry_ZeroAreaTriangle, { meshName = MeshName })
			end
		end
		if p2.outerCagesData then
			for i, value1 in p2.outerCagesData do
				local Text = i .. "OuterCage"
				
				if not UGCValidationService:ValidateEditableMeshTriangleArea(value1.editable) then
					p1:fail(ErrorSourceStringsModule.Keys.MeshGeometry_ZeroAreaTriangle, { meshName = Text })
				end
			end
		end
	end
}