local appStorageService = game:GetService("AppStorageService")

return function()
	-- upvalues: appStorageService (ref)
	local t = {}
	local ok, status = pcall(appStorageService.GetItem, appStorageService, "KidsAccountHasResetToDefaultTheme")
	
	if ok and typeof(status) == "string" and status ~= "" then
		t.KidsAccountHasResetToDefaultTheme = status
	end
	return if next(t) == nil then nil else t
end