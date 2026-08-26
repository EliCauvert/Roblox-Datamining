local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getFIntUGCValidationVertexDensityThresholdModule = require(parent.flags.getFIntUGCValidationVertexDensityThreshold)

return {
	fflag = require(parent.flags.getFFlagUGCValidateMigrateMeshGeometry),
	categories = { validationEnumsModule.UploadCategory.LAYERED_CLOTHING },
	requiredData = { validationEnumsModule.SharedDataMember.renderMeshesData },
	expectedFailures = {},
	run = function(p1, p2)
		-- upvalues: UGCValidationService (ref), getFIntUGCValidationVertexDensityThresholdModule (ref), errorSourceStringsModule (ref)
		for i, v in p2.renderMeshesData do
			if getFIntUGCValidationVertexDensityThresholdModule() < UGCValidationService:GetEditableMeshMaxNearbyVerticesCollisions(v.editable, v.scale) then
				p1:fail(errorSourceStringsModule.Keys.MeshGeometry_VertexDensityExceeded, {})
			end
		end
	end
}