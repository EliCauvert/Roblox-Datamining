return function() --[[ line: 4 ]]
	local ok, status = pcall(function() --[[ line: 5 ]]
		return game:GetFastString("AccountSwitcherFalsyVariantId")
	end)
	
	return if ok then status else "0"
end