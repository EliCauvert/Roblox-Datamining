game:DefineFastString("UGCValidateFrameDeltaKeyTimeTol", "0.85")
local t = {
	asString = function()
		return game:GetFastString("UGCValidateFrameDeltaKeyTimeTol")
	end
}

function t.asNumber()
	-- upvalues: t (ref)
	return tonumber(t.asString())
end

return t