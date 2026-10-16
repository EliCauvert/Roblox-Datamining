local GetFStringUGCValidateMaxAnimationMovementModule = require(script.Parent.Parent.flags.GetFStringUGCValidateMaxAnimationMovement)

local function getFallbackValue() --[[ Line: 25 ]]
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
	Head = function() --[[ Line: 47 ]]
		return game:GetFastString("UGCValidateMaxAnimationMovementHead")
	end,
	UpperTorso = function() --[[ Line: 50 ]]
		return game:GetFastString("UGCValidateMaxAnimationMovementUpperTorso")
	end,
	LeftUpperLeg = function() --[[ Line: 53 ]]
		return game:GetFastString("UGCValidateMaxAnimationMovementLeftUpperLeg")
	end,
	LeftLowerLeg = function() --[[ Line: 56 ]]
		return game:GetFastString("UGCValidateMaxAnimationMovementLeftLowerLeg")
	end,
	LeftHand = function() --[[ Line: 59 ]]
		return game:GetFastString("UGCValidateMaxAnimationMovementLeftHand")
	end,
	RightUpperArm = function() --[[ Line: 62 ]]
		return game:GetFastString("UGCValidateMaxAnimationMovementRightUpperArm")
	end,
	RightLowerArm = function() --[[ Line: 65 ]]
		return game:GetFastString("UGCValidateMaxAnimationMovementRightLowerArm")
	end,
	RightHand = function() --[[ Line: 68 ]]
		return game:GetFastString("UGCValidateMaxAnimationMovementRightHand")
	end,
	LeftUpperArm = function() --[[ Line: 71 ]]
		return game:GetFastString("UGCValidateMaxAnimationMovementLeftUpperArm")
	end,
	LeftLowerArm = function() --[[ Line: 74 ]]
		return game:GetFastString("UGCValidateMaxAnimationMovementLeftLowerArm")
	end,
	LeftFoot = function() --[[ Line: 77 ]]
		return game:GetFastString("UGCValidateMaxAnimationMovementLeftFoot")
	end,
	RightUpperLeg = function() --[[ Line: 80 ]]
		return game:GetFastString("UGCValidateMaxAnimationMovementRightUpperLeg")
	end,
	RightLowerLeg = function() --[[ Line: 83 ]]
		return game:GetFastString("UGCValidateMaxAnimationMovementRightLowerLeg")
	end,
	RightFoot = function() --[[ Line: 86 ]]
		return game:GetFastString("UGCValidateMaxAnimationMovementRightFoot")
	end
}
local GetFStringUGCValidateMaxAnimationMovementPerPartModule = {
	asString = function(p1) --[[ Line: 91 ]]
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

function GetFStringUGCValidateMaxAnimationMovementPerPartModule.asNumber(p1): number --[[ Line: 103 ]]
	-- upvalues: GetFStringUGCValidateMaxAnimationMovementPerPartModule (copy)
	return (tonumber(GetFStringUGCValidateMaxAnimationMovementPerPartModule.asString(p1)))
end

return GetFStringUGCValidateMaxAnimationMovementPerPartModule