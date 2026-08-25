game:DefineFastString("UGCValidateCurveAnimationMinLength", "0")
local t = {
	asString = function()
		return game:GetFastString("UGCValidateCurveAnimationMinLength")
	end
}

function t.asNumber()
	-- upvalues: t (ref)
	return tonumber(t.asString())
end

return t