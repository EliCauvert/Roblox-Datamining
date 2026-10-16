game:DefineFastString("UGCValidateFrameDeltaKeyTimeTol", "0.85")
local GetFStringUGCValidateFrameDeltaKeyTimeTolModule = {
	asString = function() --[[ Line: 9 ]]
		return game:GetFastString("UGCValidateFrameDeltaKeyTimeTol")
	end
}

function GetFStringUGCValidateFrameDeltaKeyTimeTolModule.asNumber(): number --[[ Line: 13 ]]
	-- upvalues: GetFStringUGCValidateFrameDeltaKeyTimeTolModule (copy)
	return (tonumber(GetFStringUGCValidateFrameDeltaKeyTimeTolModule.asString()))
end

return GetFStringUGCValidateFrameDeltaKeyTimeTolModule