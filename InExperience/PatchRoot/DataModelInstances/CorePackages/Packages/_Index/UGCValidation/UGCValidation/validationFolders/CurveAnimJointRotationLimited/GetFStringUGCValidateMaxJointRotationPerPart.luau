local GetFStringUGCValidateMaxJointRotationModule = require(script.Parent.GetFStringUGCValidateMaxJointRotation)

local function getFallbackValue() --[[ Line: 23 ]]
	-- upvalues: GetFStringUGCValidateMaxJointRotationModule (copy)
	return GetFStringUGCValidateMaxJointRotationModule.asString()
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
local config = {
	Head = function() --[[ Line: 45 ]]
		return game:GetFastString("UGCValidateMaxJointRotationHead")
	end,
	UpperTorso = function() --[[ Line: 48 ]]
		return game:GetFastString("UGCValidateMaxJointRotationUpperTorso")
	end,
	LeftUpperLeg = function() --[[ Line: 51 ]]
		return game:GetFastString("UGCValidateMaxJointRotationLeftUpperLeg")
	end,
	LeftLowerLeg = function() --[[ Line: 54 ]]
		return game:GetFastString("UGCValidateMaxJointRotationLeftLowerLeg")
	end,
	LeftHand = function() --[[ Line: 57 ]]
		return game:GetFastString("UGCValidateMaxJointRotationLeftHand")
	end,
	RightUpperArm = function() --[[ Line: 60 ]]
		return game:GetFastString("UGCValidateMaxJointRotationRightUpperArm")
	end,
	RightLowerArm = function() --[[ Line: 63 ]]
		return game:GetFastString("UGCValidateMaxJointRotationRightLowerArm")
	end,
	RightHand = function() --[[ Line: 66 ]]
		return game:GetFastString("UGCValidateMaxJointRotationRightHand")
	end,
	LeftUpperArm = function() --[[ Line: 69 ]]
		return game:GetFastString("UGCValidateMaxJointRotationLeftUpperArm")
	end,
	LeftLowerArm = function() --[[ Line: 72 ]]
		return game:GetFastString("UGCValidateMaxJointRotationLeftLowerArm")
	end,
	LeftFoot = function() --[[ Line: 75 ]]
		return game:GetFastString("UGCValidateMaxJointRotationLeftFoot")
	end,
	RightUpperLeg = function() --[[ Line: 78 ]]
		return game:GetFastString("UGCValidateMaxJointRotationRightUpperLeg")
	end,
	RightLowerLeg = function() --[[ Line: 81 ]]
		return game:GetFastString("UGCValidateMaxJointRotationRightLowerLeg")
	end,
	RightFoot = function() --[[ Line: 84 ]]
		return game:GetFastString("UGCValidateMaxJointRotationRightFoot")
	end
}
local GetFStringUGCValidateMaxJointRotationPerPartModule = {
	asString = function(p1) --[[ Line: 89 ]]
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

function GetFStringUGCValidateMaxJointRotationPerPartModule.asNumber(p1): number --[[ Line: 101 ]]
	-- upvalues: GetFStringUGCValidateMaxJointRotationPerPartModule (copy)
	return (tonumber(GetFStringUGCValidateMaxJointRotationPerPartModule.asString(p1)))
end

return GetFStringUGCValidateMaxJointRotationPerPartModule