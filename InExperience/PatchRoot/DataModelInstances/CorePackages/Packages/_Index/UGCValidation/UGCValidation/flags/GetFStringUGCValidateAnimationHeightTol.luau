game:DefineFastString("UGCValidateAnimationHeightTol", "-3.1")
local GetFStringUGCValidateAnimationHeightTolModule = {
	asString = function() --[[ Line: 9 ]]
		return game:GetFastString("UGCValidateAnimationHeightTol")
	end
}

function GetFStringUGCValidateAnimationHeightTolModule.asNumber(): number --[[ Line: 13 ]]
	-- upvalues: GetFStringUGCValidateAnimationHeightTolModule (copy)
	return (tonumber(GetFStringUGCValidateAnimationHeightTolModule.asString()))
end

return GetFStringUGCValidateAnimationHeightTolModule