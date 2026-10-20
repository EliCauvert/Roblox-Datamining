local GetFStringUGCValidateMaxJointRotationModule = require(script.Parent.GetFStringUGCValidateMaxJointRotation)

local function getFallbackValue()
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
local GetFStringUGCValidateMaxJointRotationPerPartModule = {
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

function GetFStringUGCValidateMaxJointRotationPerPartModule.asNumber(p1): number
	-- upvalues: GetFStringUGCValidateMaxJointRotationPerPartModule (copy)
	return (tonumber(GetFStringUGCValidateMaxJointRotationPerPartModule.asString(p1)))
end

return GetFStringUGCValidateMaxJointRotationPerPartModule