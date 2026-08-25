game:DefineFastString("UGCValidationMaxAnimationDeltas", "1.5")
local t = {
	asString = function()
		return game:GetFastString("UGCValidationMaxAnimationDeltas")
	end
}

function t.asNumber()
	-- upvalues: t (ref)
	return tonumber(t.asString())
end

return t