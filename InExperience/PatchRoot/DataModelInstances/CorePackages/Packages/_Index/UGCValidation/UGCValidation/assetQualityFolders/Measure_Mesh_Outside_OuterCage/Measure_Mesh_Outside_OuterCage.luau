local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getFFlagUGCValidateAQScoreWarningsModule = require(parent.flags.getFFlagUGCValidateAQScoreWarnings)
local UGCValidateRenderMeshOutsideOuterCageMeshThreshold = game:DefineFastInt("UGCValidateRenderMeshOutsideOuterCageMeshThreshold", 65)

return {
	categories = { validationEnumsModule.UploadCategory.LAYERED_CLOTHING },
	fflag = require(parent.flags.getFFlagUGCValidateAQCageQualityLC),
	run = function(p0, p1)
		-- upvalues: UGCValidateRenderMeshOutsideOuterCageMeshThreshold (ref), errorSourceStringsModule (ref), getFFlagUGCValidateAQScoreWarningsModule (ref)
		local handle = p1.aqsSummaryData.Measure_Mesh_Outside_OuterCage.Handle
		local meshOutsideOuterCagePercent = handle and tonumber(handle.mesh_outside_outer_cage_percent)
		
		if meshOutsideOuterCagePercent == nil then
			error("Measure_Mesh_Outside_OuterCage: AQS summary missing required fields")
			
			return
		elseif UGCValidateRenderMeshOutsideOuterCageMeshThreshold < meshOutsideOuterCagePercent * 100 then
			p0:fail(errorSourceStringsModule.Keys.MeasureMeshOutsideOuterCage, {
				mesh_outside_outer_cage_percent = string.format("%.2f", meshOutsideOuterCagePercent * 100)
			})
		end
		if getFFlagUGCValidateAQScoreWarningsModule() and handle.score ~= nil and tonumber(handle.score) ~= 100 then
			p0:warn(errorSourceStringsModule.Keys.AQSWarn_MeshOutsideOuterCage, {
				score = tostring(math.floor(tonumber(handle.score) or 0)),
				mesh_outside_outer_cage_percent = string.format("%.2f", (tonumber(handle.mesh_outside_outer_cage_percent) or 0) * 100)
			})
		end
	end
}