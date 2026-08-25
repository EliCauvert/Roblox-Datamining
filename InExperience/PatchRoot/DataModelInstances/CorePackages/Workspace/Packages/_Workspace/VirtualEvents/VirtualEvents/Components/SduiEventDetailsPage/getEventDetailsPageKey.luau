local appPage = require(script:FindFirstAncestor("VirtualEvents").Parent.RobloxAppEnums).AppPage

return function(p0)
	-- upvalues: appPage (ref)
	return if p0 == nil then appPage.EventDetails .. "-Unknown" else appPage.EventDetails .. "-" .. p0
end