return function()
	local ok, status = pcall(function()
		return game:GetFastInt("CanHideGuiGroupId")
	end)
	
	return ok and status
end