local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local GetFIntUGCValidationVertexDensityThresholdModule = require(Parent.flags.getFIntUGCValidationVertexDensityThreshold)

return {
	fflag = require(Parent.flags.getFFlagUGCValidateMigrateMeshGeometry),
	categories = { ValidationEnumsModule.UploadCategory.LAYERED_CLOTHING },
	requiredData = { ValidationEnumsModule.SharedDataMember.renderMeshesData },
	expectedFailures = {},
	run = function(p1, p2)
		-- upvalues: UGCValidationService (copy), GetFIntUGCValidationVertexDensityThresholdModule (copy), ErrorSourceStringsModule (copy)
		for _, value in p2.renderMeshesData do
			if GetFIntUGCValidationVertexDensityThresholdModule() < UGCValidationService:GetEditableMeshMaxNearbyVerticesCollisions(value.editable, value.scale) then
				p1:fail(ErrorSourceStringsModule.Keys.MeshGeometry_VertexDensityExceeded, {})
			end
		end
	end
}