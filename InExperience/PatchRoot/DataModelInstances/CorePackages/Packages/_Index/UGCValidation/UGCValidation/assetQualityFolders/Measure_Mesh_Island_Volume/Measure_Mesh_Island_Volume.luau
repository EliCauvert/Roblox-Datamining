local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local GetFFlagUGCValidateAQMeshQualityBlockUploadModule = require(Parent.flags.getFFlagUGCValidateAQMeshQualityBlockUpload)
local UGCValidationMeshIslandVolumeMaxComponents = game:DefineFastInt("UGCValidationMeshIslandVolumeMaxComponents", 10)

return {
	categories = {
		ValidationEnumsModule.UploadCategory.FULL_BODY,
		ValidationEnumsModule.UploadCategory.DYNAMIC_HEAD
	},
	fflag = require(Parent.flags.getFFlagUGCValidateAQMeshIslandVolume),
	run = function(p1, p2)
		-- upvalues: GetFFlagUGCValidateAQMeshQualityBlockUploadModule (copy), ErrorSourceStringsModule (copy), UGCValidationMeshIslandVolumeMaxComponents (copy)
		local MeasureMeshIslandVolume = p2.aqsSummaryData.Measure_Mesh_Island_Volume
		
		if MeasureMeshIslandVolume ~= nil then
			for PartName, value in MeasureMeshIslandVolume do
				if PartName ~= "measurement_score" then
					if value == nil or value.score == nil then
						p1:warn(ErrorSourceStringsModule.Keys.AQSWarn_MissingData, { measureName = "Measure_Mesh_Island_Volume" })
						break
					end
					local Number: number = tonumber(value.num_disconnected_components) or 0
					
					if UGCValidationMeshIslandVolumeMaxComponents < Number then
						local config = {
							partName = PartName,
							num_disconnected_components = tostring(Number),
							max_disconnected_components = tostring(UGCValidationMeshIslandVolumeMaxComponents)
						}
						
						if GetFFlagUGCValidateAQMeshQualityBlockUploadModule() then
							p1:fail(ErrorSourceStringsModule.Keys.AQSFail_TooManyDisconnectedComponents, config)
						else
							p1:warn(ErrorSourceStringsModule.Keys.AQSFail_TooManyDisconnectedComponents, config)
						end
					end
					if tonumber(value.score) ~= 100 then
						local config = {
							partName = PartName,
							num_small_volume_islands = value.num_small_volume_islands or "unknown",
							num_disconnected_components = value.num_disconnected_components or "unknown"
						}
						
						if GetFFlagUGCValidateAQMeshQualityBlockUploadModule() then
							p1:fail(ErrorSourceStringsModule.Keys.AQSWarn_MeshIslandVolume, config)
						else
							p1:warn(ErrorSourceStringsModule.Keys.AQSWarn_MeshIslandVolume, config)
						end
					end
				end
			end
			return
		elseif GetFFlagUGCValidateAQMeshQualityBlockUploadModule() then
			error("Measure_Mesh_Island_Volume: AQS summary data is nil")
			
			return
		else
			p1:warn(ErrorSourceStringsModule.Keys.AQSWarn_MissingData, { measureName = "Measure_Mesh_Island_Volume" })
		end
	end
}