game:DefineFastString("UGCValidateMaxAnimationMovement", "0.3")
local GetFStringUGCValidateMaxAnimationMovementModule = {
	asString = function()
		return game:GetFastString("UGCValidateMaxAnimationMovement")
	end
}

function GetFStringUGCValidateMaxAnimationMovementModule.asNumber(): number
	-- upvalues: GetFStringUGCValidateMaxAnimationMovementModule (copy)
	return (tonumber(GetFStringUGCValidateMaxAnimationMovementModule.asString()))
end

return GetFStringUGCValidateMaxAnimationMovementModule