game:DefineFastString("UGCValidateCurveAnimationMinLength", "0")
local GetFStringUGCValidateCurveAnimationMinLengthModule = {
	asString = function()
		return game:GetFastString("UGCValidateCurveAnimationMinLength")
	end
}

function GetFStringUGCValidateCurveAnimationMinLengthModule.asNumber(): number
	-- upvalues: GetFStringUGCValidateCurveAnimationMinLengthModule (copy)
	return (tonumber(GetFStringUGCValidateCurveAnimationMinLengthModule.asString()))
end

return GetFStringUGCValidateCurveAnimationMinLengthModule