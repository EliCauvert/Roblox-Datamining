local Parent = script:FindFirstAncestor("SearchResults").Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local SduiLoadTimer = require(Parent.SduiSharedUtilities).SduiLoadTimer
local FetchSearchResultsPageIfNeededModule = require(script.Parent.fetchSearchResultsPageIfNeeded)

return function(p1, p2, p3, Callback: () -> ())
	-- upvalues: SduiLoadTimer (copy), AppPage (copy), FetchSearchResultsPageIfNeededModule (copy)
	if p1 ~= nil and p1 ~= "" then
		local LoadTimer = SduiLoadTimer.createLoadTimer(AppPage.SearchPage)
		LoadTimer.start("navigate")
		FetchSearchResultsPageIfNeededModule(p1, p2, p3, LoadTimer)
	end
	Callback()
end