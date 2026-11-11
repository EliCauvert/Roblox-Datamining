game:DefineFastString("UGCValidationMaxCageDistance", "0.3")
local GetFStringUGCValidationMaxCageDistanceModule = {
	asString = function()
		return game:GetFastString("UGCValidationMaxCageDistance")
	end
}

function GetFStringUGCValidationMaxCageDistanceModule.asNumber(): number
	-- upvalues: GetFStringUGCValidationMaxCageDistanceModule (copy)
	return (tonumber(GetFStringUGCValidationMaxCageDistanceModule.asString()))
end

return GetFStringUGCValidationMaxCageDistanceModule