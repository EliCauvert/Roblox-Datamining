game:DefineFastString("UGCValidationMaxAnimationDeltas", "1.5")
local t = {
	asString = function() --[[ line: 9 ]]
		return game:GetFastString("UGCValidationMaxAnimationDeltas")
	end
}

function t.asNumber() --[[ line: 13 ]]
	-- upvalues: t (ref)
	return tonumber(t.asString())
end

return t