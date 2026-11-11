local Success, _ = pcall(function()
	return game:GetService("ProcessService")
end)

return function()
	-- upvalues: Success (copy)
	return Success
end