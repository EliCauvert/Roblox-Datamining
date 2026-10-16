game:DefineFastString("UGCValidateMaxAnimationMovement", "0.3")
local GetFStringUGCValidateMaxAnimationMovementModule = {
	asString = function() --[[ Line: 9 ]]
		return game:GetFastString("UGCValidateMaxAnimationMovement")
	end
}

function GetFStringUGCValidateMaxAnimationMovementModule.asNumber(): number --[[ Line: 13 ]]
	-- upvalues: GetFStringUGCValidateMaxAnimationMovementModule (copy)
	return (tonumber(GetFStringUGCValidateMaxAnimationMovementModule.asString()))
end

return GetFStringUGCValidateMaxAnimationMovementModule