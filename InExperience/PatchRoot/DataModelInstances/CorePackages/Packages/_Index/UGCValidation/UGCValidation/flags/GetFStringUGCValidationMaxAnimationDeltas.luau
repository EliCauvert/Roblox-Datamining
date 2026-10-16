game:DefineFastString("UGCValidationMaxAnimationDeltas", "1.5")
local GetFStringUGCValidationMaxAnimationDeltasModule = {
	asString = function() --[[ Line: 9 ]]
		return game:GetFastString("UGCValidationMaxAnimationDeltas")
	end
}

function GetFStringUGCValidationMaxAnimationDeltasModule.asNumber(): number --[[ Line: 13 ]]
	-- upvalues: GetFStringUGCValidationMaxAnimationDeltasModule (copy)
	return (tonumber(GetFStringUGCValidationMaxAnimationDeltasModule.asString()))
end

return GetFStringUGCValidationMaxAnimationDeltasModule