game:DefineFastString("UGCValidateMaxAnimationMovement", "0.3")
local t = {
	asString = function() --[[ line: 9 ]]
		return game:GetFastString("UGCValidateMaxAnimationMovement")
	end
}

function t.asNumber() --[[ line: 13 ]]
	-- upvalues: t (ref)
	return tonumber(t.asString())
end

return t