game:DefineFastString("UGCValidateFrameDeltaKeyTimeTol", "0.85")
local t = {
	asString = function() --[[ line: 9 ]]
		return game:GetFastString("UGCValidateFrameDeltaKeyTimeTol")
	end
}

function t.asNumber() --[[ line: 13 ]]
	-- upvalues: t (ref)
	return tonumber(t.asString())
end

return t