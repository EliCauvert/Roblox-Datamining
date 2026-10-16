local AppPage = require(script:FindFirstAncestor("VirtualEvents").Parent.RobloxAppEnums).AppPage

return function(Text): string --[[ Line: 6 | Named "getEventDetailsPageKey" ]]
	-- upvalues: AppPage (copy)
	return if Text == nil then AppPage.EventDetails .. "-Unknown" else AppPage.EventDetails .. "-" .. Text
end