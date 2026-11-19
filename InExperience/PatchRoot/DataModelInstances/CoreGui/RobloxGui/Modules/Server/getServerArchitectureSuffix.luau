return function(p1): string
	local Success, Result = pcall(function()
		-- upvalues: p1 (copy)
		return p1:GetRobloxArchitecture()
	end)
	
	return if Success and type(Result) == "string" and Result ~= "" then "/" .. Result else ""
end