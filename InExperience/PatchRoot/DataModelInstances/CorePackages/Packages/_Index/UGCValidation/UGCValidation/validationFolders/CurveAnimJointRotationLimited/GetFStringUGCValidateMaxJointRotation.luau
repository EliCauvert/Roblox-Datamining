game:DefineFastString("UGCValidateMaxJointRotation", "180")
local GetFStringUGCValidateMaxJointRotationModule = {
	asString = function()
		return game:GetFastString("UGCValidateMaxJointRotation")
	end
}

function GetFStringUGCValidateMaxJointRotationModule.asNumber(): number
	-- upvalues: GetFStringUGCValidateMaxJointRotationModule (copy)
	return (tonumber(GetFStringUGCValidateMaxJointRotationModule.asString()))
end

return GetFStringUGCValidateMaxJointRotationModule