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
	run = function(p0, p1) --[[ line: 17 ]]
		-- upvalues: getFFlagUGCValidateAQMeshQualityBlockUploadModule (ref), errorSourceStringsModule (ref)
		local measureMeshWatertight = p1.aqsSummaryData.Measure_Mesh_Watertight
		
		if measureMeshWatertight == nil then
			if getFFlagUGCValidateAQMeshQualityBlockUploadModule() then
				error("Measure_Mesh_Watertight: AQS summary data is nil")
				
				return
			end
			p0:warn(errorSourceStringsModule.Keys.AQSWarn_MissingData, { measureName = "Measure_Mesh_Watertight" })
			
			return
		else
			local t = { Head = true, Head_Geo = true, Head_OuterCage = true }
			
			for i, v in measureMeshWatertight do
				if i ~= "measurement_score" then
					if v ~= nil and v.boundary_edges_percent ~= nil then
						if not t[i] and (tonumber(v.boundary_edges_percent) or 0) > 0 then
							local t_1 = {
								partName = i,
								boundary_edges_percent = string.format("%.2f", (tonumber(v.boundary_edges_percent) or 0) * 100)
							}
							
							if getFFlagUGCValidateAQMeshQualityBlockUploadModule() then
								p0:fail(errorSourceStringsModule.Keys.AQSWarn_MeshNotWatertight, t_1)
							else
								p0:warn(errorSourceStringsModule.Keys.AQSWarn_MeshNotWatertight, t_1)
							end
						end
					end
					p0:warn(errorSourceStringsModule.Keys.AQSWarn_MissingData, { measureName = "Measure_Mesh_Watertight" })
					
					return
				end
			end
		end
	end
}