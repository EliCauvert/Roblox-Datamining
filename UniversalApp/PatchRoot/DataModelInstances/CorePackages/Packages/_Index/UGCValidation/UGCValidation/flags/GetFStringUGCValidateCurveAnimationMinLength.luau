game:DefineFastString("UGCValidateCurveAnimationMinLength", "0")
local GetFStringUGCValidateCurveAnimationMinLengthModule = {
	asString = function() --[[ Line: 9 ]]
		return game:GetFastString("UGCValidateCurveAnimationMinLength")
	end
}

function GetFStringUGCValidateCurveAnimationMinLengthModule.asNumber(): number --[[ Line: 13 ]]
	-- upvalues: GetFStringUGCValidateCurveAnimationMinLengthModule (copy)
	return (tonumber(GetFStringUGCValidateCurveAnimationMinLengthModule.asString()))
end

return GetFStringUGCValidateCurveAnimationMinLengthModule