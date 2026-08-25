local appPage = require(script:FindFirstAncestor("AppStartup").Parent.RobloxAppEnums).AppPage

return function(p0, p1)
	-- upvalues: appPage (ref)
	if p0 then
		p1(appPage.SingleSignOnContainer)
		
		return
	end
	p1(appPage.Startup)
end