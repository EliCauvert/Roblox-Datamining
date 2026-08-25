local ok, _ = pcall(function()
	return game:GetService("ProcessService")
end)

return function()
	-- upvalues: ok (ref)
	return ok
end