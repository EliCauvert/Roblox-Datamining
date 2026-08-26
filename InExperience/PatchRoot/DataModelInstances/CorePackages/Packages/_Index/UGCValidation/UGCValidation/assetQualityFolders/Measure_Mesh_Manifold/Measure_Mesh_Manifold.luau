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
	run = function(p1, p2)
		-- upvalues: errorSourceStringsModule (ref)
		local measureMeshManifold = p2.aqsSummaryData.Measure_Mesh_Manifold
		
		if measureMeshManifold == nil then
			p1:warn(errorSourceStringsModule.Keys.AQSWarn_MissingData, { measureName = "Measure_Mesh_Manifold" })
			
			return
		end
		for i, v in measureMeshManifold do
			if i ~= "measurement_score" then
				if v ~= nil and v.score ~= nil then
					if tonumber(v.score) ~= 100 then
						p1:warn(errorSourceStringsModule.Keys.AQSWarn_MeshManifold, {
							partName = i,
							score = tostring(math.floor(tonumber(v.score) or 0))
						})
					end
				end
				p1:warn(errorSourceStringsModule.Keys.AQSWarn_MissingData, { measureName = "Measure_Mesh_Manifold" })
				
				return
			end
		end
	end
}