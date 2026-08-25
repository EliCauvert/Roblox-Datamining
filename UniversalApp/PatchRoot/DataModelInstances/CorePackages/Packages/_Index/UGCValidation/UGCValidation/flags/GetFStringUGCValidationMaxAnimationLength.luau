game:DefineFastString("UGCValidationMaxAnimationLength", "10")
local t = {
	asString = function()
		return game:GetFastString("UGCValidationMaxAnimationLength")
	end
}

function t.asNumber()
	-- upvalues: t (ref)
	return tonumber(t.asString())
end

return t