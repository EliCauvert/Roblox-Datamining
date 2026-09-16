local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local t = {
	categories = {
		require(parent.validationSystem.ValidationEnums).UploadCategory.LAYERED_CLOTHING
	},
	fflag = require(parent.flags.getFFlagUGCValidateAQCagePartPlacement)
}

local function collectViolationDetails(p1)
	local t = {}
	local var1 = 0
	while true do
		local var2 = p1[`violation_{var1}_type`]
		if var2 == nil then break end
		if var2 == "part_vertex_count_mismatch" then
			table.insert(t, {
				violationType = var2,
				partName = p1[`violation_{var1}_upper_part`] or "unknown",
				expectedCount = p1[`violation_{var1}_expected_vertex_count`] or "?",
				actualCount = p1[`violation_{var1}_actual_vertex_count`] or "?"
			})
		else
			table.insert(t, {
				violationType = var2,
				upperPart = p1[`violation_{var1}_upper_part`] or "unknown",
				lowerPart = p1[`violation_{var1}_lower_part`] or "unknown"
			})
		end
		var1 += 1
	end
	return t
end

function t.run(p2, p3)
	-- upvalues: errorSourceStringsModule (ref), collectViolationDetails (ref)
	local measureCagePartPlacement = p3.aqsSummaryData.Measure_Cage_Part_Placement
	
	if measureCagePartPlacement == nil then
		p2:warn(errorSourceStringsModule.Keys.AQSWarn_MissingData, { measureName = "Measure_Cage_Part_Placement" })
		
		return
	end
	for i, v in measureCagePartPlacement do
		if i ~= "measurement_score" then
			if v ~= nil and v.score ~= nil then
				if tonumber(v.score) ~= 100 then
					for i_1, v_1 in collectViolationDetails(v) do
						if v_1.violationType == "part_vertex_count_mismatch" then
							p2:fail(errorSourceStringsModule.Keys.AQSFail_CagePartVertexCount, {
								cageName = i,
								partName = v_1.partName,
								expectedCount = v_1.expectedCount,
								actualCount = v_1.actualCount
							})
						else
							p2:fail(errorSourceStringsModule.Keys.AQSFail_CagePartPlacement, {
								cageName = i,
								upperPart = v_1.upperPart,
								lowerPart = v_1.lowerPart
							})
						end
					end
				end
			end
			p2:warn(errorSourceStringsModule.Keys.AQSWarn_MissingData, { measureName = "Measure_Cage_Part_Placement" })
			
			return
		end
	end
end

return t