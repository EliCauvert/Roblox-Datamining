local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)

return {
	categories = {
		require(parent.validationSystem.ValidationEnums).UploadCategory.FULL_BODY
	},
	fflag = require(parent.flags.getFFlagUGCValidateAQRiggingQuality),
	run = function(p0, p1)
		-- upvalues: errorSourceStringsModule (ref)
		local measureJointNumber = p1.aqsSummaryData.Measure_Joint_Number
		
		if measureJointNumber == nil then
			p0:warn(errorSourceStringsModule.Keys.AQSWarn_MissingData, { measureName = "Measure_Joint_Number" })
			
			return
		end
		local fullBodyMesh = measureJointNumber.full_body_mesh
		
		if fullBodyMesh == nil or fullBodyMesh.score == nil then
			p0:warn(errorSourceStringsModule.Keys.AQSWarn_MissingData, { measureName = "Measure_Joint_Number" })
			
			return
		elseif tonumber(fullBodyMesh.score) ~= 100 then
			p0:warn(errorSourceStringsModule.Keys.AQSWarn_JointNumber, {
				score = tostring(math.floor(tonumber(fullBodyMesh.score) or 0)),
				joint_number = fullBodyMesh.joint_number or "unknown",
				left_hand_joint_number = fullBodyMesh.left_hand_joint_number or "unknown",
				right_hand_joint_number = fullBodyMesh.right_hand_joint_number or "unknown"
			})
		end
	end
}