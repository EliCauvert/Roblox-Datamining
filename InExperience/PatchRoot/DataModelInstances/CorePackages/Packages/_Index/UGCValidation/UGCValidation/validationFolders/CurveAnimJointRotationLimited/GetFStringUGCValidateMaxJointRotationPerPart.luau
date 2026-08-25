local getFStringUGCValidateMaxJointRotationModule = require(script.Parent.GetFStringUGCValidateMaxJointRotation)

local function getFallbackValue()
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
	Head = function()
		return game:GetFastString("UGCValidateMaxJointRotationHead")
	end,
	UpperTorso = function()
		return game:GetFastString("UGCValidateMaxJointRotationUpperTorso")
	end,
	LeftUpperLeg = function()
		return game:GetFastString("UGCValidateMaxJointRotationLeftUpperLeg")
	end,
	LeftLowerLeg = function()
		return game:GetFastString("UGCValidateMaxJointRotationLeftLowerLeg")
	end,
	LeftHand = function()
		return game:GetFastString("UGCValidateMaxJointRotationLeftHand")
	end,
	RightUpperArm = function()
		return game:GetFastString("UGCValidateMaxJointRotationRightUpperArm")
	end,
	RightLowerArm = function()
		return game:GetFastString("UGCValidateMaxJointRotationRightLowerArm")
	end,
	RightHand = function()
		return game:GetFastString("UGCValidateMaxJointRotationRightHand")
	end,
	LeftUpperArm = function()
		return game:GetFastString("UGCValidateMaxJointRotationLeftUpperArm")
	end,
	LeftLowerArm = function()
		return game:GetFastString("UGCValidateMaxJointRotationLeftLowerArm")
	end,
	LeftFoot = function()
		return game:GetFastString("UGCValidateMaxJointRotationLeftFoot")
	end,
	RightUpperLeg = function()
		return game:GetFastString("UGCValidateMaxJointRotationRightUpperLeg")
	end,
	RightLowerLeg = function()
		return game:GetFastString("UGCValidateMaxJointRotationRightLowerLeg")
	end,
	RightFoot = function()
		return game:GetFastString("UGCValidateMaxJointRotationRightFoot")
	end
}

function t.asString(p0)
	-- upvalues: t_1 (ref), getFallbackValue (ref)
	local var4 = t_1[p0]
	
	if not var4 then
		return getFallbackValue()
	end
	local var5 = var4()
	
	return if #var5 == 0 then getFallbackValue() else var5
end

function t.asNumber(p1)
	-- upvalues: t (ref)
	return tonumber(t.asString(p1))
end

return t