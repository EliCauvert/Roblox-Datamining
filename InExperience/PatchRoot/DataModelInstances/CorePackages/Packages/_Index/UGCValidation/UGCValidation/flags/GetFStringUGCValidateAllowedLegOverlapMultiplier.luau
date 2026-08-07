game:DefineFastString("UGCValidateAllowedLegOverlapMultiplier", "0.25")
local t = {
	asString = function() --[[ line: 9 ]]
		return game:GetFastString("UGCValidateAllowedLegOverlapMultiplier")
	end
}

function t.asNumber() --[[ line: 13 ]]
	-- upvalues: t (ref)
	return tonumber(t.asString())
end

return t