return function() --[[ line: 1 ]]
	local ok, status = pcall(function() --[[ line: 2 ]]
		return game:GetFastInt("CanHideGuiGroupId")
	end)
	
	return ok and status
end