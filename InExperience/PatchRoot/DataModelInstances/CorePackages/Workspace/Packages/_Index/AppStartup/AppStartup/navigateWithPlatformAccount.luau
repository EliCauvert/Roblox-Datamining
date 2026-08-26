local appPage = require(script:FindFirstAncestor("AppStartup").Parent.RobloxAppEnums).AppPage

return function(p1, p2)
	-- upvalues: appPage (ref)
	if p1 then
		p2(appPage.SingleSignOnContainer)
		
		return
	end
	p2(appPage.Startup)
end