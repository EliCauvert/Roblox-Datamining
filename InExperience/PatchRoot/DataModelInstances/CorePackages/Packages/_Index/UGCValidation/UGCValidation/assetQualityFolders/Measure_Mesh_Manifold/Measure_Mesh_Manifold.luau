local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getFFlagUGCValidateAQMeshQualityBlockUploadModule = require(parent.flags.getFFlagUGCValidateAQMeshQualityBlockUpload)

return {
	categories = {
		validationEnumsModule.UploadCategory.LAYERED_CLOTHING,
		validationEnumsModule.UploadCategory.FULL_BODY,
		validationEnumsModule.UploadCategory.RIGID_ACCESSORY,
		validationEnumsModule.UploadCategory.DYNAMIC_HEAD
	},
	fflag = require(parent.flags.getFFlagUGCValidateAQMeshQuality),
	run = function(p0, p1)
		-- upvalues: getFFlagUGCValidateAQMeshQualityBlockUploadModule (ref), errorSourceStringsModule (ref)
		local measureMeshManifold = p1.aqsSummaryData.Measure_Mesh_Manifold
		
		if measureMeshManifold == nil then
			if getFFlagUGCValidateAQMeshQualityBlockUploadModule() then
				error("Measure_Mesh_Manifold: AQS summary data is nil")
				
				return
			end
			p0:warn(errorSourceStringsModule.Keys.AQSWarn_MissingData, { measureName = "Measure_Mesh_Manifold" })
			
			return
		else
			for i, v in measureMeshManifold do
				if i ~= "measurement_score" then
					if v ~= nil and v.score ~= nil then
						if tonumber(v.score) ~= 100 then
							local t = {
								partName = i,
								score = tostring(math.floor(tonumber(v.score) or 0))
							}
							
							if getFFlagUGCValidateAQMeshQualityBlockUploadModule() then
								p0:fail(errorSourceStringsModule.Keys.AQSWarn_MeshManifold, t)
							else
								p0:warn(errorSourceStringsModule.Keys.AQSWarn_MeshManifold, t)
							end
						end
					end
					p0:warn(errorSourceStringsModule.Keys.AQSWarn_MissingData, { measureName = "Measure_Mesh_Manifold" })
					
					return
				end
			end
		end
	end
}