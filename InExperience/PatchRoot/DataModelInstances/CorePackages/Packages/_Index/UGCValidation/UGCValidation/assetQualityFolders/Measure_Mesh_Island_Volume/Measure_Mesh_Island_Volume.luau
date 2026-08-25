local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getFFlagUGCValidateAQMeshQualityBlockUploadModule = require(parent.flags.getFFlagUGCValidateAQMeshQualityBlockUpload)
local UGCValidationMeshIslandVolumeMaxComponents = game:DefineFastInt("UGCValidationMeshIslandVolumeMaxComponents", 10)

return {
	categories = {
		validationEnumsModule.UploadCategory.FULL_BODY,
		validationEnumsModule.UploadCategory.DYNAMIC_HEAD
	},
	fflag = require(parent.flags.getFFlagUGCValidateAQMeshIslandVolume),
	run = function(p0, p1)
		-- upvalues: getFFlagUGCValidateAQMeshQualityBlockUploadModule (ref), errorSourceStringsModule (ref), UGCValidationMeshIslandVolumeMaxComponents (ref)
		local measureMeshIslandVolume = p1.aqsSummaryData.Measure_Mesh_Island_Volume
		
		if measureMeshIslandVolume == nil then
			if getFFlagUGCValidateAQMeshQualityBlockUploadModule() then
				error("Measure_Mesh_Island_Volume: AQS summary data is nil")
				
				return
			end
			p0:warn(errorSourceStringsModule.Keys.AQSWarn_MissingData, { measureName = "Measure_Mesh_Island_Volume" })
			
			return
		else
			for i, v in measureMeshIslandVolume do
				if i ~= "measurement_score" then
					if v ~= nil and v.score ~= nil then
						local numDisconnectedComponents = tonumber(v.num_disconnected_components) or 0
						
						if UGCValidationMeshIslandVolumeMaxComponents < numDisconnectedComponents then
							local t = {
								partName = i,
								num_disconnected_components = tostring(numDisconnectedComponents),
								max_disconnected_components = tostring(UGCValidationMeshIslandVolumeMaxComponents)
							}
							
							if getFFlagUGCValidateAQMeshQualityBlockUploadModule() then
								p0:fail(errorSourceStringsModule.Keys.AQSFail_TooManyDisconnectedComponents, t)
							else
								p0:warn(errorSourceStringsModule.Keys.AQSFail_TooManyDisconnectedComponents, t)
							end
						end
						if tonumber(v.score) ~= 100 then
							local t = {
								partName = i,
								num_small_volume_islands = v.num_small_volume_islands or "unknown",
								num_disconnected_components = v.num_disconnected_components or "unknown",
								score = tostring(math.floor(tonumber(v.score) or 0))
							}
							
							if getFFlagUGCValidateAQMeshQualityBlockUploadModule() then
								p0:fail(errorSourceStringsModule.Keys.AQSWarn_MeshIslandVolume, t)
							else
								p0:warn(errorSourceStringsModule.Keys.AQSWarn_MeshIslandVolume, t)
							end
						end
					end
					p0:warn(errorSourceStringsModule.Keys.AQSWarn_MissingData, { measureName = "Measure_Mesh_Island_Volume" })
					
					return
				end
			end
		end
	end
}