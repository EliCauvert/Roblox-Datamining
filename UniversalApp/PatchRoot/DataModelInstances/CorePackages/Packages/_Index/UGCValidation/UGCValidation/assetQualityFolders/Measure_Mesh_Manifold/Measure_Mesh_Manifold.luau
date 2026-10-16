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
	run = function(p1, p2) --[[ Line: 17 ]]
		-- upvalues: ErrorSourceStringsModule (copy)
		local MeasureMeshManifold = p2.aqsSummaryData.Measure_Mesh_Manifold
		
		if MeasureMeshManifold == nil then
			p1:warn(ErrorSourceStringsModule.Keys.AQSWarn_MissingData, { measureName = "Measure_Mesh_Manifold" })
			
			return
		end
		for PartName, value in MeasureMeshManifold do
			if PartName ~= "measurement_score" then
				if value == nil or value.score == nil then
					p1:warn(ErrorSourceStringsModule.Keys.AQSWarn_MissingData, { measureName = "Measure_Mesh_Manifold" })
					break
				end
				if tonumber(value.score) ~= 100 then
					p1:warn(ErrorSourceStringsModule.Keys.AQSWarn_MeshManifold, { partName = PartName })
				end
			end
		end
	end
}