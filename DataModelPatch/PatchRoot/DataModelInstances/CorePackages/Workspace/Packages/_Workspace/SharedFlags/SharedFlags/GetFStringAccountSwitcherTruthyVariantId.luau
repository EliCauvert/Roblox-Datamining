return function()
	local Success, Result = pcall(function()
		return game:GetFastString("AccountSwitcherTruthyVariantId")
	end)
	
	return if Success then Result else "1"
end