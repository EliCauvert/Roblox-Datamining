return function() --[[ Line: 1 ]]
	local Success, Result = pcall(function() --[[ Line: 2 ]]
		return game:GetFastInt("CanHideGuiGroupId")
	end)
	
	return Success and Result
end