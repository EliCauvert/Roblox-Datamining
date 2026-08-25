game:DefineFastString("UGCValidationMaxCageDistance", "0.3")
local t = {
	asString = function()
		return game:GetFastString("UGCValidationMaxCageDistance")
	end
}

function t.asNumber()
	-- upvalues: t (ref)
	return tonumber(t.asString())
end

return t