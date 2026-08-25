local getFStringUGCValidateMaxAnimationMovementModule = require(script.Parent.Parent.flags.GetFStringUGCValidateMaxAnimationMovement)

local function getFallbackValue()
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
	Head = function()
		return game:GetFastString("UGCValidateMaxAnimationMovementHead")
	end,
	UpperTorso = function()
		return game:GetFastString("UGCValidateMaxAnimationMovementUpperTorso")
	end,
	LeftUpperLeg = function()
		return game:GetFastString("UGCValidateMaxAnimationMovementLeftUpperLeg")
	end,
	LeftLowerLeg = function()
		return game:GetFastString("UGCValidateMaxAnimationMovementLeftLowerLeg")
	end,
	LeftHand = function()
		return game:GetFastString("UGCValidateMaxAnimationMovementLeftHand")
	end,
	RightUpperArm = function()
		return game:GetFastString("UGCValidateMaxAnimationMovementRightUpperArm")
	end,
	RightLowerArm = function()
		return game:GetFastString("UGCValidateMaxAnimationMovementRightLowerArm")
	end,
	RightHand = function()
		return game:GetFastString("UGCValidateMaxAnimationMovementRightHand")
	end,
	LeftUpperArm = function()
		return game:GetFastString("UGCValidateMaxAnimationMovementLeftUpperArm")
	end,
	LeftLowerArm = function()
		return game:GetFastString("UGCValidateMaxAnimationMovementLeftLowerArm")
	end,
	LeftFoot = function()
		return game:GetFastString("UGCValidateMaxAnimationMovementLeftFoot")
	end,
	RightUpperLeg = function()
		return game:GetFastString("UGCValidateMaxAnimationMovementRightUpperLeg")
	end,
	RightLowerLeg = function()
		return game:GetFastString("UGCValidateMaxAnimationMovementRightLowerLeg")
	end,
	RightFoot = function()
		return game:GetFastString("UGCValidateMaxAnimationMovementRightFoot")
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