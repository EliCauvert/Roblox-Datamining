local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)

return {
	categories = {
		ValidationEnumsModule.UploadCategory.LAYERED_CLOTHING,
		ValidationEnumsModule.UploadCategory.EYEBROW_EYELASH,
		ValidationEnumsModule.UploadCategory.FULL_BODY,
		ValidationEnumsModule.UploadCategory.RIGID_ACCESSORY,
		ValidationEnumsModule.UploadCategory.DYNAMIC_HEAD
	},
	fflag = require(Parent.flags.getFFlagUGCValidateAQMeshQuality),
	run = function(p1, p2)
		-- upvalues: ErrorSourceStringsModule (copy)
		local MeasureMeshWatertight = p2.aqsSummaryData.Measure_Mesh_Watertight
		
		if MeasureMeshWatertight == nil then
			p1:warn(ErrorSourceStringsModule.Keys.AQSWarn_MissingData, { measureName = "Measure_Mesh_Watertight" })
			
			return
		end
		local config = { Head = true, Head_Geo = true, Head_OuterCage = true }
		
		for PartName, value in MeasureMeshWatertight do
			if PartName ~= "measurement_score" then
				if value == nil or value.boundary_edges_percent == nil then
					p1:warn(ErrorSourceStringsModule.Keys.AQSWarn_MissingData, { measureName = "Measure_Mesh_Watertight" })
					break
				end
				if not config[PartName] and (tonumber(value.boundary_edges_percent) or 0) > 0 then
					p1:warn(ErrorSourceStringsModule.Keys.AQSWarn_MeshNotWatertight, {
						partName = PartName,
						boundary_edges_percent = string.format("%.2f", (tonumber(value.boundary_edges_percent) or 0) * 100)
					})
				end
			end
		end
	end
}