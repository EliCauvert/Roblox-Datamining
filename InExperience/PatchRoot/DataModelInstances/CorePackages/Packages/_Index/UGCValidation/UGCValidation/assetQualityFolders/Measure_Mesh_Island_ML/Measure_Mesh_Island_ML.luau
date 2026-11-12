local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local UGCValidationMeshIslandMLMinScore = game:DefineFastInt("UGCValidationMeshIslandMLMinScore", 9)

return {
	categories = {
		require(Parent.validationSystem.ValidationEnums).UploadCategory.FULL_BODY
	},
	fflag = require(Parent.flags.getFFlagUGCValidateAQMeshIslandML),
	run = function(p1, p2)
		-- upvalues: UGCValidationMeshIslandMLMinScore (copy), ErrorSourceStringsModule (copy)
		local MeasureMeshIslandML = p2.aqsSummaryData.Measure_Mesh_Island_ML
		
		if MeasureMeshIslandML == nil then
			p1:err("Measure_Mesh_Island_ML: missing AQS summary data")
			
			return
		end
		for i, value in MeasureMeshIslandML do
			if i ~= "measurement_score" then
				if value == nil or value.score == nil then
					p1:err("Measure_Mesh_Island_ML: missing score data for " .. tostring(i))
					break
				end
				local Number: number = tonumber(value.score) or 0
				
				if Number < 0 then
					error("Measure_Mesh_Island_ML: received unexpected negative score, possible upstream bug")
				end
				if Number < UGCValidationMeshIslandMLMinScore then
					p1:fail(ErrorSourceStringsModule.Keys.AQSFail_MeshIslandML)
				end
			end
		end
	end
}