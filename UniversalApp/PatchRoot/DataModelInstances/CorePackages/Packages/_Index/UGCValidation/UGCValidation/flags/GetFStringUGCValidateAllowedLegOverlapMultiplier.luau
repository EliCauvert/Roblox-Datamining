game:DefineFastString("UGCValidateAllowedLegOverlapMultiplier", "0.25")
local GetFStringUGCValidateAllowedLegOverlapMultiplierModule = {
	asString = function() --[[ Line: 9 ]]
		return game:GetFastString("UGCValidateAllowedLegOverlapMultiplier")
	end
}

function GetFStringUGCValidateAllowedLegOverlapMultiplierModule.asNumber(): number --[[ Line: 13 ]]
	-- upvalues: GetFStringUGCValidateAllowedLegOverlapMultiplierModule (copy)
	return (tonumber(GetFStringUGCValidateAllowedLegOverlapMultiplierModule.asString()))
end

return GetFStringUGCValidateAllowedLegOverlapMultiplierModule