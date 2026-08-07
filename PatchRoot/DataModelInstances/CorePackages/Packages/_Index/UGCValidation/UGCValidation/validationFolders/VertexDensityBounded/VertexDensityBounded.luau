-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:49 2026 Pacific Standard Time.

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
	run = function(p0, p1) --[[ line: 19 ]]
		-- upvalues: UGCValidationService (ref), getFIntUGCValidationVertexDensityThresholdModule (ref), errorSourceStringsModule (ref)
		for i, v in p1.renderMeshesData do
			if getFIntUGCValidationVertexDensityThresholdModule() < UGCValidationService:GetEditableMeshMaxNearbyVerticesCollisions(v.editable, v.scale) then
				p0:fail(errorSourceStringsModule.Keys.MeshGeometry_VertexDensityExceeded, {})
			end
		end
	end
}