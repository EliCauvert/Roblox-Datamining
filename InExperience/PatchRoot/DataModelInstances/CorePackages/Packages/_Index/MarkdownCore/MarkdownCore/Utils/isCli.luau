local Success, _ = pcall(function() --[[ Line: 2 ]]
	return game:GetService("ProcessService")
end)

return function() --[[ Line: 7 ]]
	-- upvalues: Success (copy)
	return Success
end