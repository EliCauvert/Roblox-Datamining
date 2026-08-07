local getFStringUGCValidateMaxJointRotationModule = require(script.Parent.GetFStringUGCValidateMaxJointRotation)

local function getFallbackValue() --[[ line: 23 ]]
	-- upvalues: getFStringUGCValidateMaxJointRotationModule (ref)
	return getFStringUGCValidateMaxJointRotationModule.asString()
end

game:DefineFastString("UGCValidateMaxJointRotationHead", "")
game:DefineFastString("UGCValidateMaxJointRotationUpperTorso", "")
game:DefineFastString("UGCValidateMaxJointRotationLeftUpperLeg", "")
game:DefineFastString("UGCValidateMaxJointRotationLeftLowerLeg", "")
game:DefineFastString("UGCValidateMaxJointRotationLeftHand", "")
game:DefineFastString("UGCValidateMaxJointRotationRightUpperArm", "")
game:DefineFastString("UGCValidateMaxJointRotationRightLowerArm", "")
game:DefineFastString("UGCValidateMaxJointRotationRightHand", "")
game:DefineFastString("UGCValidateMaxJointRotationLeftUpperArm", "")
game:DefineFastString("UGCValidateMaxJointRotationLeftLowerArm", "")
game:DefineFastString("UGCValidateMaxJointRotationLeftFoot", "")
game:DefineFastString("UGCValidateMaxJointRotationRightUpperLeg", "")
game:DefineFastString("UGCValidateMaxJointRotationRightLowerLeg", "")
game:DefineFastString("UGCValidateMaxJointRotationRightFoot", "")
local t = {}
local t_1 = {
	Head = function() --[[ line: 45 ]]
		return game:GetFastString("UGCValidateMaxJointRotationHead")
	end,
	UpperTorso = function() --[[ line: 48 ]]
		return game:GetFastString("UGCValidateMaxJointRotationUpperTorso")
	end,
	LeftUpperLeg = function() --[[ line: 51 ]]
		return game:GetFastString("UGCValidateMaxJointRotationLeftUpperLeg")
	end,
	LeftLowerLeg = function() --[[ line: 54 ]]
		return game:GetFastString("UGCValidateMaxJointRotationLeftLowerLeg")
	end,
	LeftHand = function() --[[ line: 57 ]]
		return game:GetFastString("UGCValidateMaxJointRotationLeftHand")
	end,
	RightUpperArm = function() --[[ line: 60 ]]
		return game:GetFastString("UGCValidateMaxJointRotationRightUpperArm")
	end,
	RightLowerArm = function() --[[ line: 63 ]]
		return game:GetFastString("UGCValidateMaxJointRotationRightLowerArm")
	end,
	RightHand = function() --[[ line: 66 ]]
		return game:GetFastString("UGCValidateMaxJointRotationRightHand")
	end,
	LeftUpperArm = function() --[[ line: 69 ]]
		return game:GetFastString("UGCValidateMaxJointRotationLeftUpperArm")
	end,
	LeftLowerArm = function() --[[ line: 72 ]]
		return game:GetFastString("UGCValidateMaxJointRotationLeftLowerArm")
	end,
	LeftFoot = function() --[[ line: 75 ]]
		return game:GetFastString("UGCValidateMaxJointRotationLeftFoot")
	end,
	RightUpperLeg = function() --[[ line: 78 ]]
		return game:GetFastString("UGCValidateMaxJointRotationRightUpperLeg")
	end,
	RightLowerLeg = function() --[[ line: 81 ]]
		return game:GetFastString("UGCValidateMaxJointRotationRightLowerLeg")
	end,
	RightFoot = function() --[[ line: 84 ]]
		return game:GetFastString("UGCValidateMaxJointRotationRightFoot")
	end
}

function t.asString(p0) --[[ line: 89 ]]
	-- upvalues: t_1 (ref), getFallbackValue (ref)
	local var4 = t_1[p0]
	
	if not var4 then
		return getFallbackValue()
	end
	local var5 = var4()
	
	return if #var5 == 0 then getFallbackValue() else var5
end

function t.asNumber(p1) --[[ line: 101 ]]
	-- upvalues: t (ref)
	return tonumber(t.asString(p1))
end

return t