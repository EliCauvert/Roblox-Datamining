game:DefineFastInt("UGCValidationAttRotRigAttachmentMaxThousandthsDegrees", 10)
game:DefineFastInt("UGCValidationAttRotLimitRootAttachment", 30)
game:DefineFastInt("UGCValidationAttRotLimitFaceFrontAttachment", 30)
game:DefineFastInt("UGCValidationAttRotLimitHatAttachment", 30)
game:DefineFastInt("UGCValidationAttRotLimitHairAttachment", 30)
game:DefineFastInt("UGCValidationAttRotLimitFaceCenterAttachment", 30)
game:DefineFastInt("UGCValidationAttRotLimitRightFootAttachment", 30)
game:DefineFastInt("UGCValidationAttRotLimitLeftFootAttachment", 30)
game:DefineFastInt("UGCValidationAttRotLimitBodyFrontAttachment", 30)
game:DefineFastInt("UGCValidationAttRotLimitBodyBackAttachment", 30)
game:DefineFastInt("UGCValidationAttRotLimitLeftCollarAttachment", 30)
game:DefineFastInt("UGCValidationAttRotLimitRightCollarAttachment", 30)
game:DefineFastInt("UGCValidationAttRotLimitNeckAttachment", 30)
game:DefineFastInt("UGCValidationAttRotLimitWaistCenterAttachment", 30)
game:DefineFastInt("UGCValidationAttRotLimitWaistFrontAttachment", 30)
game:DefineFastInt("UGCValidationAttRotLimitWaistBackAttachment", 30)
game:DefineFastInt("UGCValidationAttRotLimitLeftShoulderAttachment", 30)
game:DefineFastInt("UGCValidationAttRotLimitLeftGripAttachment", 30)
game:DefineFastInt("UGCValidationAttRotLimitRightShoulderAttachment", 30)
game:DefineFastInt("UGCValidationAttRotLimitRightGripAttachment", 30)

return {
	thresholdGetters = {
		RigAttachment = function() --[[ line: 27 ]]
			return game:GetFastInt("UGCValidationAttRotRigAttachmentMaxThousandthsDegrees") / 1000
		end,
		RootAttachment = function() --[[ line: 30 ]]
			return game:GetFastInt("UGCValidationAttRotLimitRootAttachment")
		end,
		FaceFrontAttachment = function() --[[ line: 33 ]]
			return game:GetFastInt("UGCValidationAttRotLimitFaceFrontAttachment")
		end,
		HatAttachment = function() --[[ line: 36 ]]
			return game:GetFastInt("UGCValidationAttRotLimitHatAttachment")
		end,
		HairAttachment = function() --[[ line: 39 ]]
			return game:GetFastInt("UGCValidationAttRotLimitHairAttachment")
		end,
		FaceCenterAttachment = function() --[[ line: 42 ]]
			return game:GetFastInt("UGCValidationAttRotLimitFaceCenterAttachment")
		end,
		RightFootAttachment = function() --[[ line: 45 ]]
			return game:GetFastInt("UGCValidationAttRotLimitRightFootAttachment")
		end,
		LeftFootAttachment = function() --[[ line: 48 ]]
			return game:GetFastInt("UGCValidationAttRotLimitLeftFootAttachment")
		end,
		BodyFrontAttachment = function() --[[ line: 51 ]]
			return game:GetFastInt("UGCValidationAttRotLimitBodyFrontAttachment")
		end,
		BodyBackAttachment = function() --[[ line: 54 ]]
			return game:GetFastInt("UGCValidationAttRotLimitBodyBackAttachment")
		end,
		LeftCollarAttachment = function() --[[ line: 57 ]]
			return game:GetFastInt("UGCValidationAttRotLimitLeftCollarAttachment")
		end,
		RightCollarAttachment = function() --[[ line: 60 ]]
			return game:GetFastInt("UGCValidationAttRotLimitRightCollarAttachment")
		end,
		NeckAttachment = function() --[[ line: 63 ]]
			return game:GetFastInt("UGCValidationAttRotLimitNeckAttachment")
		end,
		WaistCenterAttachment = function() --[[ line: 66 ]]
			return game:GetFastInt("UGCValidationAttRotLimitWaistCenterAttachment")
		end,
		WaistFrontAttachment = function() --[[ line: 69 ]]
			return game:GetFastInt("UGCValidationAttRotLimitWaistFrontAttachment")
		end,
		WaistBackAttachment = function() --[[ line: 72 ]]
			return game:GetFastInt("UGCValidationAttRotLimitWaistBackAttachment")
		end,
		LeftShoulderAttachment = function() --[[ line: 75 ]]
			return game:GetFastInt("UGCValidationAttRotLimitLeftShoulderAttachment")
		end,
		LeftGripAttachment = function() --[[ line: 78 ]]
			return game:GetFastInt("UGCValidationAttRotLimitLeftGripAttachment")
		end,
		RightShoulderAttachment = function() --[[ line: 81 ]]
			return game:GetFastInt("UGCValidationAttRotLimitRightShoulderAttachment")
		end,
		RightGripAttachment = function() --[[ line: 84 ]]
			return game:GetFastInt("UGCValidationAttRotLimitRightGripAttachment")
		end
	}
}