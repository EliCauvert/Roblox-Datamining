local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local UGCValidationMeshIslandMLMinScore = game:DefineFastInt("UGCValidationMeshIslandMLMinScore", 92)

return {
	categories = { validationEnumsModule.UploadCategory.FULL_BODY },
	fflag = require(parent.flags.getFFlagUGCValidateAQMeshIslandML),
	run = function(p0, p1)
		-- upvalues: UGCValidationMeshIslandMLMinScore (ref), errorSourceStringsModule (ref)
		local measureMeshIslandML = p1.aqsSummaryData.Measure_Mesh_Island_ML
		
		if measureMeshIslandML == nil then
			p0:err("Measure_Mesh_Island_ML: missing AQS summary data")
			
			return
		end
		for i, v in measureMeshIslandML do
			if i ~= "measurement_score" then
				if v ~= nil and v.score ~= nil then
					local score = tonumber(v.score) or 0
					
					if score < 0 then
						error("Measure_Mesh_Island_ML: received unexpected negative score, possible upstream bug")
					end
					if score < UGCValidationMeshIslandMLMinScore then
						p0:fail(errorSourceStringsModule.Keys.AQSFail_MeshIslandML)
					end
				end
				p0:err("Measure_Mesh_Island_ML: missing score data for " .. tostring(i))
				
				return
			end
		end
	end
}