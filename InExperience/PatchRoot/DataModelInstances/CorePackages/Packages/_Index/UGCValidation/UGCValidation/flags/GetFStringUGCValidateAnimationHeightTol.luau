game:DefineFastString("UGCValidateAnimationHeightTol", "-3.1")
local t = {
	asString = function()
		return game:GetFastString("UGCValidateAnimationHeightTol")
	end
}

function t.asNumber()
	-- upvalues: t (ref)
	return tonumber(t.asString())
end

return t