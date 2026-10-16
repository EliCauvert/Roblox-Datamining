game:DefineFastString("UGCValidationMaxCageDistance", "0.3")
local GetFStringUGCValidationMaxCageDistanceModule = {
	asString = function() --[[ Line: 9 ]]
		return game:GetFastString("UGCValidationMaxCageDistance")
	end
}

function GetFStringUGCValidationMaxCageDistanceModule.asNumber(): number --[[ Line: 13 ]]
	-- upvalues: GetFStringUGCValidationMaxCageDistanceModule (copy)
	return (tonumber(GetFStringUGCValidationMaxCageDistanceModule.asString()))
end

return GetFStringUGCValidationMaxCageDistanceModule