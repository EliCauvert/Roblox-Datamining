game:DefineFastString("UGCValidateCurveAnimationMinLength", "0")
local t = {
	asString = function() --[[ line: 9 ]]
		return game:GetFastString("UGCValidateCurveAnimationMinLength")
	end
}

function t.asNumber() --[[ line: 13 ]]
	-- upvalues: t (ref)
	return tonumber(t.asString())
end

return t