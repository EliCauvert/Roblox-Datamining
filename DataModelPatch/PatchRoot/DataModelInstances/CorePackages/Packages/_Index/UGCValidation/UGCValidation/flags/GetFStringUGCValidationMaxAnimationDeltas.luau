game:DefineFastString("UGCValidationMaxAnimationDeltas", "1.5")
local GetFStringUGCValidationMaxAnimationDeltasModule = {
	asString = function()
		return game:GetFastString("UGCValidationMaxAnimationDeltas")
	end
}

function GetFStringUGCValidationMaxAnimationDeltasModule.asNumber(): number
	-- upvalues: GetFStringUGCValidationMaxAnimationDeltasModule (copy)
	return (tonumber(GetFStringUGCValidationMaxAnimationDeltasModule.asString()))
end

return GetFStringUGCValidationMaxAnimationDeltasModule