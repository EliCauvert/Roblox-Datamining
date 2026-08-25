game:DefineFastString("UGCValidateMaxAnimationMovement", "0.3")
local t = {
	asString = function()
		return game:GetFastString("UGCValidateMaxAnimationMovement")
	end
}

function t.asNumber()
	-- upvalues: t (ref)
	return tonumber(t.asString())
end

return t