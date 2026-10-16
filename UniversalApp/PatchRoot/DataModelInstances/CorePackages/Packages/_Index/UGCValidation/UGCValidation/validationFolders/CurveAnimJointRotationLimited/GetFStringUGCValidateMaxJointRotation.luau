game:DefineFastString("UGCValidateMaxJointRotation", "180")
local GetFStringUGCValidateMaxJointRotationModule = {
	asString = function() --[[ Line: 9 ]]
		return game:GetFastString("UGCValidateMaxJointRotation")
	end
}

function GetFStringUGCValidateMaxJointRotationModule.asNumber(): number --[[ Line: 13 ]]
	-- upvalues: GetFStringUGCValidateMaxJointRotationModule (copy)
	return (tonumber(GetFStringUGCValidateMaxJointRotationModule.asString()))
end

return GetFStringUGCValidateMaxJointRotationModule