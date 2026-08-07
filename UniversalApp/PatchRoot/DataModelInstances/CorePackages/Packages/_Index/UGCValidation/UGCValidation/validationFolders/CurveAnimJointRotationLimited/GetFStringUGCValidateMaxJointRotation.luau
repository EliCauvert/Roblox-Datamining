game:DefineFastString("UGCValidateMaxJointRotation", "180")
local t = {
	asString = function() --[[ line: 9 ]]
		return game:GetFastString("UGCValidateMaxJointRotation")
	end
}

function t.asNumber() --[[ line: 13 ]]
	-- upvalues: t (ref)
	return tonumber(t.asString())
end

return t