return function()
	local Success, Result = pcall(function()
		return game:GetFastString("AccountSwitcherFalsyVariantId")
	end)
	
	return if Success then Result else "0"
end