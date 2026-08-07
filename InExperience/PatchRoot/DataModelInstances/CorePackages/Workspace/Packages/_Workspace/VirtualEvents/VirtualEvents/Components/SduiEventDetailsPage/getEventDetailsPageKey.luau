local appPage = require(script:FindFirstAncestor("VirtualEvents").Parent.RobloxAppEnums).AppPage

return function(p0) --[[ line: 6 | named "getEventDetailsPageKey" ]]
	-- upvalues: appPage (ref)
	return if p0 == nil then appPage.EventDetails .. "-Unknown" else appPage.EventDetails .. "-" .. p0
end