local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)

return {
	categories = {
		validationEnumsModule.UploadCategory.LAYERED_CLOTHING,
		validationEnumsModule.UploadCategory.FULL_BODY,
		validationEnumsModule.UploadCategory.RIGID_ACCESSORY,
		validationEnumsModule.UploadCategory.DYNAMIC_HEAD
	},
	fflag = require(parent.flags.getFFlagUGCValidateAQMeshQuality),
	run = function(p0, p1)
		-- upvalues: errorSourceStringsModule (ref)
		local measureMeshWatertight = p1.aqsSummaryData.Measure_Mesh_Watertight
		
		if measureMeshWatertight == nil then
			p0:warn(errorSourceStringsModule.Keys.AQSWarn_MissingData, { measureName = "Measure_Mesh_Watertight" })
			
			return
		end
		local t = { Head = true, Head_Geo = true, Head_OuterCage = true }
		
		for i, v in measureMeshWatertight do
			if i ~= "measurement_score" then
				if v ~= nil and v.boundary_edges_percent ~= nil then
					if not t[i] and (tonumber(v.boundary_edges_percent) or 0) > 0 then
						p0:warn(errorSourceStringsModule.Keys.AQSWarn_MeshNotWatertight, {
							partName = i,
							boundary_edges_percent = string.format("%.2f", (tonumber(v.boundary_edges_percent) or 0) * 100)
						})
					end
				end
				p0:warn(errorSourceStringsModule.Keys.AQSWarn_MissingData, { measureName = "Measure_Mesh_Watertight" })
				
				return
			end
		end
	end
}