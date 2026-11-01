return function(p1)
	local P0 = p1 or game:GetService("AppStorageService")
	local t = {}
	local Success, Result = pcall(P0.GetItem, P0, "KidsAccountHasResetToDefaultTheme")
	
	if Success and typeof(Result) == "string" and Result ~= "" then
		t.KidsAccountHasResetToDefaultTheme = Result
	end
	return t
end