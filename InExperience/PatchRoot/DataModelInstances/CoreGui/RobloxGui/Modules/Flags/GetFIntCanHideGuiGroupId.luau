return function()
	local Success, Result = pcall(function()
		return game:GetFastInt("CanHideGuiGroupId")
	end)
	
	return Success and Result
end