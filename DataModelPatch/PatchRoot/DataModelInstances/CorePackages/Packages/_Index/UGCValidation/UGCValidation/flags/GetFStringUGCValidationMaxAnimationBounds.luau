game:DefineFastString("UGCValidationMaxAnimationBounds", "25")
local GetFStringUGCValidationMaxAnimationBoundsModule = {
	asString = function()
		return game:GetFastString("UGCValidationMaxAnimationBounds")
	end
}

function GetFStringUGCValidationMaxAnimationBoundsModule.asNumber(): number
	-- upvalues: GetFStringUGCValidationMaxAnimationBoundsModule (copy)
	return (tonumber(GetFStringUGCValidationMaxAnimationBoundsModule.asString()))
end

return GetFStringUGCValidationMaxAnimationBoundsModule