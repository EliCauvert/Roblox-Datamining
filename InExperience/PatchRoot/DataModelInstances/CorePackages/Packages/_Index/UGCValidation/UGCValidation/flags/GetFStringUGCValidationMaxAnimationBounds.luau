game:DefineFastString("UGCValidationMaxAnimationBounds", "25")
local t = {
	asString = function() --[[ line: 9 ]]
		return game:GetFastString("UGCValidationMaxAnimationBounds")
	end
}

function t.asNumber() --[[ line: 13 ]]
	-- upvalues: t (ref)
	return tonumber(t.asString())
end

return t