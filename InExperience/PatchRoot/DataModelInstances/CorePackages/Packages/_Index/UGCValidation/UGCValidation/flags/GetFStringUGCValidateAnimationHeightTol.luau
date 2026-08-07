game:DefineFastString("UGCValidateAnimationHeightTol", "-3.1")
local t = {
	asString = function() --[[ line: 9 ]]
		return game:GetFastString("UGCValidateAnimationHeightTol")
	end
}

function t.asNumber() --[[ line: 13 ]]
	-- upvalues: t (ref)
	return tonumber(t.asString())
end

return t