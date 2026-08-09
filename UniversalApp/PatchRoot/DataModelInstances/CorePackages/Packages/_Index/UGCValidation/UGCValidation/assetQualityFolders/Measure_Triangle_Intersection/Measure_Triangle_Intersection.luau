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
	run = function(p0, p1) --[[ line: 16 ]]
		-- upvalues: errorSourceStringsModule (ref)
		local measureTriangleIntersection = p1.aqsSummaryData.Measure_Triangle_Intersection
		
		if measureTriangleIntersection == nil then
			p0:warn(errorSourceStringsModule.Keys.AQSWarn_MissingData, { measureName = "Measure_Triangle_Intersection" })
			
			return
		end
		for i, v in measureTriangleIntersection do
			if i ~= "measurement_score" then
				if v ~= nil and v.score ~= nil then
					if tonumber(v.score) ~= 100 then
						p0:warn(errorSourceStringsModule.Keys.AQSWarn_TriangleIntersection, {
							partName = i,
							intersecting_tri_face_percent = string.format("%.2f", (tonumber(v.intersecting_tri_face_percent) or 0) * 100),
							score = tostring(math.floor(tonumber(v.score) or 0))
						})
					end
				end
				p0:warn(errorSourceStringsModule.Keys.AQSWarn_MissingData, { measureName = "Measure_Triangle_Intersection" })
				
				return
			end
		end
	end
}