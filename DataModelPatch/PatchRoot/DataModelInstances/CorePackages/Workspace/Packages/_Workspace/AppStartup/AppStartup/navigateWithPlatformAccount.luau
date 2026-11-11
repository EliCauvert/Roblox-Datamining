local AppPage = require(script:FindFirstAncestor("AppStartup").Parent.RobloxAppEnums).AppPage

return function(p1, Callback: (any) -> ())
	-- upvalues: AppPage (copy)
	if p1 then
		Callback(AppPage.SingleSignOnContainer)
		
		return
	else
		Callback(AppPage.Startup)
	end
end