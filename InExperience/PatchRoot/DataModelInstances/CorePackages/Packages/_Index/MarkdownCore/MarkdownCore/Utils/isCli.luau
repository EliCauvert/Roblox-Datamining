local ok, _ = pcall(function() --[[ line: 2 ]]
	return game:GetService("ProcessService")
end)

return function() --[[ line: 7 ]]
	-- upvalues: ok (ref)
	return ok
end