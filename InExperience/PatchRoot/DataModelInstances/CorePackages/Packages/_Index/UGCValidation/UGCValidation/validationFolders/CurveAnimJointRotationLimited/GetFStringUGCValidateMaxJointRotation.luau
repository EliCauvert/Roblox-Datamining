game:DefineFastString("UGCValidateMaxJointRotation", "180")
local t = {
	asString = function()
		return game:GetFastString("UGCValidateMaxJointRotation")
	end
}

function t.asNumber()
	-- upvalues: t (ref)
	return tonumber(t.asString())
end

return t