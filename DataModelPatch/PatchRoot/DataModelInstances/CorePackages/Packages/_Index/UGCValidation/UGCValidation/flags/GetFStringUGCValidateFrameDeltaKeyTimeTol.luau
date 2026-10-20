game:DefineFastString("UGCValidateFrameDeltaKeyTimeTol", "0.85")
local GetFStringUGCValidateFrameDeltaKeyTimeTolModule = {
	asString = function()
		return game:GetFastString("UGCValidateFrameDeltaKeyTimeTol")
	end
}

function GetFStringUGCValidateFrameDeltaKeyTimeTolModule.asNumber(): number
	-- upvalues: GetFStringUGCValidateFrameDeltaKeyTimeTolModule (copy)
	return (tonumber(GetFStringUGCValidateFrameDeltaKeyTimeTolModule.asString()))
end

return GetFStringUGCValidateFrameDeltaKeyTimeTolModule