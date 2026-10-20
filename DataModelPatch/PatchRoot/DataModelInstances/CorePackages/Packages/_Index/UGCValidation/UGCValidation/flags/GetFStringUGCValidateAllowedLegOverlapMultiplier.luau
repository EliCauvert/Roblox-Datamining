game:DefineFastString("UGCValidateAllowedLegOverlapMultiplier", "0.25")
local GetFStringUGCValidateAllowedLegOverlapMultiplierModule = {
	asString = function()
		return game:GetFastString("UGCValidateAllowedLegOverlapMultiplier")
	end
}

function GetFStringUGCValidateAllowedLegOverlapMultiplierModule.asNumber(): number
	-- upvalues: GetFStringUGCValidateAllowedLegOverlapMultiplierModule (copy)
	return (tonumber(GetFStringUGCValidateAllowedLegOverlapMultiplierModule.asString()))
end

return GetFStringUGCValidateAllowedLegOverlapMultiplierModule