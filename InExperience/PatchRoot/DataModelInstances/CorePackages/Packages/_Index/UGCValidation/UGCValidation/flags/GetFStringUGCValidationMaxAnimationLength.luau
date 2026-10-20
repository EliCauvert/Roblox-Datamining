game:DefineFastString("UGCValidationMaxAnimationLength", "10")
local GetFStringUGCValidationMaxAnimationLengthModule = {
	asString = function()
		return game:GetFastString("UGCValidationMaxAnimationLength")
	end
}

function GetFStringUGCValidationMaxAnimationLengthModule.asNumber(): number
	-- upvalues: GetFStringUGCValidationMaxAnimationLengthModule (copy)
	return (tonumber(GetFStringUGCValidationMaxAnimationLengthModule.asString()))
end

return GetFStringUGCValidationMaxAnimationLengthModule