game:DefineFastString("UGCValidateAnimationHeightTol", "-3.1")
local GetFStringUGCValidateAnimationHeightTolModule = {
	asString = function()
		return game:GetFastString("UGCValidateAnimationHeightTol")
	end
}

function GetFStringUGCValidateAnimationHeightTolModule.asNumber(): number
	-- upvalues: GetFStringUGCValidateAnimationHeightTolModule (copy)
	return (tonumber(GetFStringUGCValidateAnimationHeightTolModule.asString()))
end

return GetFStringUGCValidateAnimationHeightTolModule