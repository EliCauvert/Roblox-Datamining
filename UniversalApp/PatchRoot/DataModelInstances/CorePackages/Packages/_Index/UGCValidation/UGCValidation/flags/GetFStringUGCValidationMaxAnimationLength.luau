game:DefineFastString("UGCValidationMaxAnimationLength", "10")
local GetFStringUGCValidationMaxAnimationLengthModule = {
	asString = function() --[[ Line: 9 ]]
		return game:GetFastString("UGCValidationMaxAnimationLength")
	end
}

function GetFStringUGCValidationMaxAnimationLengthModule.asNumber(): number --[[ Line: 13 ]]
	-- upvalues: GetFStringUGCValidationMaxAnimationLengthModule (copy)
	return (tonumber(GetFStringUGCValidationMaxAnimationLengthModule.asString()))
end

return GetFStringUGCValidationMaxAnimationLengthModule