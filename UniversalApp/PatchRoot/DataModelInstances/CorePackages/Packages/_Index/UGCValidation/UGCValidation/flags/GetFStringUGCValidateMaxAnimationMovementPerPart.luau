local getFStringUGCValidateMaxAnimationMovementModule = require(script.Parent.Parent.flags.GetFStringUGCValidateMaxAnimationMovement)

local function getFallbackValue() --[[ line: 25 ]]
	-- upvalues: getFStringUGCValidateMaxAnimationMovementModule (ref)
	return getFStringUGCValidateMaxAnimationMovementModule.asString()
end

game:DefineFastString("UGCValidateMaxAnimationMovementHead", "")
game:DefineFastString("UGCValidateMaxAnimationMovementUpperTorso", "")
game:DefineFastString("UGCValidateMaxAnimationMovementLeftUpperLeg", "")
game:DefineFastString("UGCValidateMaxAnimationMovementLeftLowerLeg", "")
game:DefineFastString("UGCValidateMaxAnimationMovementLeftHand", "")
game:DefineFastString("UGCValidateMaxAnimationMovementRightUpperArm", "")
game:DefineFastString("UGCValidateMaxAnimationMovementRightLowerArm", "")
game:DefineFastString("UGCValidateMaxAnimationMovementRightHand", "")
game:DefineFastString("UGCValidateMaxAnimationMovementLeftUpperArm", "")
game:DefineFastString("UGCValidateMaxAnimationMovementLeftLowerArm", "")
game:DefineFastString("UGCValidateMaxAnimationMovementLeftFoot", "")
game:DefineFastString("UGCValidateMaxAnimationMovementRightUpperLeg", "")
game:DefineFastString("UGCValidateMaxAnimationMovementRightLowerLeg", "")
game:DefineFastString("UGCValidateMaxAnimationMovementRightFoot", "")
local t = {}
local t_1 = {
	Head = function() --[[ line: 47 ]]
		return game:GetFastString("UGCValidateMaxAnimationMovementHead")
	end,
	UpperTorso = function() --[[ line: 50 ]]
		return game:GetFastString("UGCValidateMaxAnimationMovementUpperTorso")
	end,
	LeftUpperLeg = function() --[[ line: 53 ]]
		return game:GetFastString("UGCValidateMaxAnimationMovementLeftUpperLeg")
	end,
	LeftLowerLeg = function() --[[ line: 56 ]]
		return game:GetFastString("UGCValidateMaxAnimationMovementLeftLowerLeg")
	end,
	LeftHand = function() --[[ line: 59 ]]
		return game:GetFastString("UGCValidateMaxAnimationMovementLeftHand")
	end,
	RightUpperArm = function() --[[ line: 62 ]]
		return game:GetFastString("UGCValidateMaxAnimationMovementRightUpperArm")
	end,
	RightLowerArm = function() --[[ line: 65 ]]
		return game:GetFastString("UGCValidateMaxAnimationMovementRightLowerArm")
	end,
	RightHand = function() --[[ line: 68 ]]
		return game:GetFastString("UGCValidateMaxAnimationMovementRightHand")
	end,
	LeftUpperArm = function() --[[ line: 71 ]]
		return game:GetFastString("UGCValidateMaxAnimationMovementLeftUpperArm")
	end,
	LeftLowerArm = function() --[[ line: 74 ]]
		return game:GetFastString("UGCValidateMaxAnimationMovementLeftLowerArm")
	end,
	LeftFoot = function() --[[ line: 77 ]]
		return game:GetFastString("UGCValidateMaxAnimationMovementLeftFoot")
	end,
	RightUpperLeg = function() --[[ line: 80 ]]
		return game:GetFastString("UGCValidateMaxAnimationMovementRightUpperLeg")
	end,
	RightLowerLeg = function() --[[ line: 83 ]]
		return game:GetFastString("UGCValidateMaxAnimationMovementRightLowerLeg")
	end,
	RightFoot = function() --[[ line: 86 ]]
		return game:GetFastString("UGCValidateMaxAnimationMovementRightFoot")
	end
}

function t.asString(p0) --[[ line: 91 ]]
	-- upvalues: t_1 (ref), getFallbackValue (ref)
	local var4 = t_1[p0]
	
	if not var4 then
		return getFallbackValue()
	end
	local var5 = var4()
	
	return if #var5 == 0 then getFallbackValue() else var5
end

function t.asNumber(p1) --[[ line: 103 ]]
	-- upvalues: t (ref)
	return tonumber(t.asString(p1))
end

return t