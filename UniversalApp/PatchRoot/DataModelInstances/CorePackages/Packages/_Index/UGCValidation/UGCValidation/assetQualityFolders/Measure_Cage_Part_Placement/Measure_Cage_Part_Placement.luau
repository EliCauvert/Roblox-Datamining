local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)

local function collectViolationDetails(p1) --[[ Line: 13 ]]
	local List = {}
	local Count = 0
	while true do
		local ViolationType = p1[`violation_{Count}_type`]
		if ViolationType == nil then break end
		if ViolationType == "part_vertex_count_mismatch" then
			table.insert(List, {
				violationType = ViolationType,
				partName = p1[`violation_{Count}_upper_part`] or "unknown",
				expectedCount = p1[`violation_{Count}_expected_vertex_count`] or "?",
				actualCount = p1[`violation_{Count}_actual_vertex_count`] or "?"
			})
		else
			table.insert(List, {
				violationType = ViolationType,
				upperPart = p1[`violation_{Count}_upper_part`] or "unknown",
				lowerPart = p1[`violation_{Count}_lower_part`] or "unknown"
			})
		end
		Count += 1
	end
	return List
end

return {
	categories = {
		require(Parent.validationSystem.ValidationEnums).UploadCategory.LAYERED_CLOTHING
	},
	fflag = require(Parent.flags.getFFlagUGCValidateAQCagePartPlacement),
	run = function(p2, p3) --[[ Line: 40 ]]
		-- upvalues: ErrorSourceStringsModule (copy), collectViolationDetails (copy)
		local MeasureCagePartPlacement = p3.aqsSummaryData.Measure_Cage_Part_Placement
		
		if MeasureCagePartPlacement == nil then
			p2:warn(ErrorSourceStringsModule.Keys.AQSWarn_MissingData, { measureName = "Measure_Cage_Part_Placement" })
			
			return
		end
		for CageName, value in MeasureCagePartPlacement do
			if CageName ~= "measurement_score" then
				if value == nil or value.score == nil then
					p2:warn(ErrorSourceStringsModule.Keys.AQSWarn_MissingData, { measureName = "Measure_Cage_Part_Placement" })
					break
				end
				if tonumber(value.score) ~= 100 then
					for _, value1 in collectViolationDetails(value) do
						if value1.violationType == "part_vertex_count_mismatch" then
							p2:fail(ErrorSourceStringsModule.Keys.AQSFail_CagePartVertexCount, {
								cageName = CageName,
								partName = value1.partName,
								expectedCount = value1.expectedCount,
								actualCount = value1.actualCount
							})
						else
							p2:fail(ErrorSourceStringsModule.Keys.AQSFail_CagePartPlacement, {
								cageName = CageName,
								upperPart = value1.upperPart,
								lowerPart = value1.lowerPart
							})
						end
					end
				end
			end
		end
	end
}