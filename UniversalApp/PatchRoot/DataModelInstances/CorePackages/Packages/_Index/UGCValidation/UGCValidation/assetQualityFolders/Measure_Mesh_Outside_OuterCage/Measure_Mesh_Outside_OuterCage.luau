local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local GetFFlagUGCValidateAQScoreWarningsModule = require(Parent.flags.getFFlagUGCValidateAQScoreWarnings)
local UGCValidateRenderMeshOutsideOuterCageMeshThreshold = game:DefineFastInt("UGCValidateRenderMeshOutsideOuterCageMeshThreshold", 65)

return {
	categories = {
		ValidationEnumsModule.UploadCategory.LAYERED_CLOTHING,
		ValidationEnumsModule.UploadCategory.EYEBROW_EYELASH
	},
	fflag = require(Parent.flags.getFFlagUGCValidateAQCageQualityLC),
	run = function(p1, p2) --[[ Line: 19 ]]
		-- upvalues: UGCValidateRenderMeshOutsideOuterCageMeshThreshold (copy), ErrorSourceStringsModule (copy), GetFFlagUGCValidateAQScoreWarningsModule (copy)
		local Handle = p2.aqsSummaryData.Measure_Mesh_Outside_OuterCage.Handle
		local Number = Handle and tonumber(Handle.mesh_outside_outer_cage_percent)
		
		if Number == nil then
			error("Measure_Mesh_Outside_OuterCage: AQS summary missing required fields")
			
			return
		end
		if UGCValidateRenderMeshOutsideOuterCageMeshThreshold < Number * 100 then
			p1:fail(ErrorSourceStringsModule.Keys.MeasureMeshOutsideOuterCage, {
				mesh_outside_outer_cage_percent = string.format("%.2f", Number * 100)
			})
		end
		if GetFFlagUGCValidateAQScoreWarningsModule() and Handle.score ~= nil and tonumber(Handle.score) ~= 100 then
			p1:warn(ErrorSourceStringsModule.Keys.AQSWarn_MeshOutsideOuterCage, {
				mesh_outside_outer_cage_percent = string.format("%.2f", (tonumber(Handle.mesh_outside_outer_cage_percent) or 0) * 100)
			})
		end
	end
}