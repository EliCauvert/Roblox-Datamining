local AppPage = require(script:FindFirstAncestor("SearchResults").Parent.RobloxAppEnums).AppPage

return function(Text): string
	-- upvalues: AppPage (copy)
	return AppPage.SearchPage .. "-" .. Text
end