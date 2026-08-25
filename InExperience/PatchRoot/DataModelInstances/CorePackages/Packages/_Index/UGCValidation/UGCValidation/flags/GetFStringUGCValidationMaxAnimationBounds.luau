game:DefineFastString("UGCValidationMaxAnimationBounds", "25")
local t = {
	asString = function()
		return game:GetFastString("UGCValidationMaxAnimationBounds")
	end
}

function t.asNumber()
	-- upvalues: t (ref)
	return tonumber(t.asString())
end

return t