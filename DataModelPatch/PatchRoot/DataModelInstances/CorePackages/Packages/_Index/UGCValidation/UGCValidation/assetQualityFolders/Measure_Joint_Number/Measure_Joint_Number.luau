local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)

return {
	categories = {
		require(Parent.validationSystem.ValidationEnums).UploadCategory.FULL_BODY
	},
	fflag = require(Parent.flags.getFFlagUGCValidateAQRiggingQuality),
	run = function(p1, p2)
		-- upvalues: ErrorSourceStringsModule (copy)
		local MeasureJointNumber = p2.aqsSummaryData.Measure_Joint_Number
		
		if MeasureJointNumber == nil then
			p1:warn(ErrorSourceStringsModule.Keys.AQSWarn_MissingData, { measureName = "Measure_Joint_Number" })
			
			return
		end
		local FullBodyMesh = MeasureJointNumber.full_body_mesh
		
		if FullBodyMesh == nil or FullBodyMesh.score == nil then
			p1:warn(ErrorSourceStringsModule.Keys.AQSWarn_MissingData, { measureName = "Measure_Joint_Number" })
			
			return
		end
		if tonumber(FullBodyMesh.score) ~= 100 then
			p1:warn(ErrorSourceStringsModule.Keys.AQSWarn_JointNumber, {
				score = tostring((math.floor(tonumber(FullBodyMesh.score) or 0))),
				joint_number = FullBodyMesh.joint_number or "unknown",
				left_hand_joint_number = FullBodyMesh.left_hand_joint_number or "unknown",
				right_hand_joint_number = FullBodyMesh.right_hand_joint_number or "unknown"
			})
		end
	end
}