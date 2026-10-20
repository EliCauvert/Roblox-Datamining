local GetFStringUGCValidateMaxAnimationMovementModule = require(script.Parent.Parent.flags.GetFStringUGCValidateMaxAnimationMovement)

local function getFallbackValue()
	-- upvalues: GetFStringUGCValidateMaxAnimationMovementModule (copy)
	return GetFStringUGCValidateMaxAnimationMovementModule.asString()
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
local config = {
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
local GetFStringUGCValidateMaxAnimationMovementPerPartModule = {
	asString = function(p1)
		-- upvalues: config (copy), getFallbackValue (copy)
		local Entry = config[p1]
		
		if Entry then
			local EntryResult = Entry()
			
			return if #EntryResult == 0 then getFallbackValue() else EntryResult
		else
			return getFallbackValue()
		end
	end
}

function GetFStringUGCValidateMaxAnimationMovementPerPartModule.asNumber(p1): number
	-- upvalues: GetFStringUGCValidateMaxAnimationMovementPerPartModule (copy)
	return (tonumber(GetFStringUGCValidateMaxAnimationMovementPerPartModule.asString(p1)))
end

return GetFStringUGCValidateMaxAnimationMovementPerPartModule