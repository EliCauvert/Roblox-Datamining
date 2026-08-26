local appPage = require(script:FindFirstAncestor("VirtualEvents").Parent.RobloxAppEnums).AppPage

return function(p1)
	-- upvalues: appPage (ref)
	return if p1 == nil then appPage.EventDetails .. "-Unknown" else appPage.EventDetails .. "-" .. p0
end