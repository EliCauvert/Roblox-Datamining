game:DefineFastString("UGCValidationMaxAnimationBounds", "25")
local GetFStringUGCValidationMaxAnimationBoundsModule = {
	asString = function() --[[ Line: 9 ]]
		return game:GetFastString("UGCValidationMaxAnimationBounds")
	end
}

function GetFStringUGCValidationMaxAnimationBoundsModule.asNumber(): number --[[ Line: 13 ]]
	-- upvalues: GetFStringUGCValidationMaxAnimationBoundsModule (copy)
	return (tonumber(GetFStringUGCValidationMaxAnimationBoundsModule.asString()))
end

return GetFStringUGCValidationMaxAnimationBoundsModule