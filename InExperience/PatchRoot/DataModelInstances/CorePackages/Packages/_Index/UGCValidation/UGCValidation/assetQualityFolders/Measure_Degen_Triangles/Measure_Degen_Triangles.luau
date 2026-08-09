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
		local measureDegenTriangles = p1.aqsSummaryData.Measure_Degen_Triangles
		
		if measureDegenTriangles == nil then
			p0:warn(errorSourceStringsModule.Keys.AQSWarn_MissingData, { measureName = "Measure_Degen_Triangles" })
			
			return
		end
		for i, v in measureDegenTriangles do
			if i ~= "measurement_score" then
				if v ~= nil and v.score ~= nil then
					if tonumber(v.score) ~= 100 then
						p0:warn(errorSourceStringsModule.Keys.AQSWarn_DegenTriangles, {
							partName = i,
							degenerate_triangle_percent = string.format("%.2f", (tonumber(v.degenerate_triangle_percent) or 0) * 100),
							score = tostring(math.floor(tonumber(v.score) or 0))
						})
					end
				end
				p0:warn(errorSourceStringsModule.Keys.AQSWarn_MissingData, { measureName = "Measure_Degen_Triangles" })
				
				return
			end
		end
	end
}