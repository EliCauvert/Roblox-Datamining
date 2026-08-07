game:DefineFastString("UGCValidationMaxCageDistance", "0.3")
local t = {
	asString = function() --[[ line: 9 ]]
		return game:GetFastString("UGCValidationMaxCageDistance")
	end
}

function t.asNumber() --[[ line: 13 ]]
	-- upvalues: t (ref)
	return tonumber(t.asString())
end

return t