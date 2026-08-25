game:DefineFastString("UGCValidateAllowedLegOverlapMultiplier", "0.25")
local t = {
	asString = function()
		return game:GetFastString("UGCValidateAllowedLegOverlapMultiplier")
	end
}

function t.asNumber()
	-- upvalues: t (ref)
	return tonumber(t.asString())
end

return t