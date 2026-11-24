local Parent = script:FindFirstAncestor("SearchResults").Parent
local FFlagSduiUseInputData = require(Parent.SharedFlags).FFlagSduiUseInputData
local ReactModule = require(Parent.React)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiErrors = SduiCoreSystemModule.SduiErrors
local SduiLogger = SduiCoreSystemModule.SduiLogger
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local UseInputDataFunction = SduiSharedUtilitiesModule.useInputData
local UseUiStatusFunction = SduiSharedUtilitiesModule.useUiStatus
local UiStatus = SduiSharedUtilitiesModule.UiStatus

return function(p1)
	-- upvalues: UseUiStatusFunction (copy), FFlagSduiUseInputData (copy), UseInputDataFunction (copy), ReactModule (copy), UiStatus (copy), SduiLogger (copy), SduiErrors (copy), AppPage (copy)
	local UseUiStatusResult = UseUiStatusFunction(p1)
	local SearchResultsFeed = if FFlagSduiUseInputData then UseInputDataFunction(p1, "search_results_feed") else nil
	local UseMemoResult, UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: UseUiStatusResult (copy), UiStatus (upval), SearchResultsFeed (copy)
		if UseUiStatusResult ~= UiStatus.Resolved or typeof(SearchResultsFeed) ~= "table" then
			return false, false
		end
		local EntryOrder = SearchResultsFeed.entry_order
		local EntryMap = SearchResultsFeed.entry_map
		local HasNextEntry: boolean = typeof(EntryMap) == "table" and next(EntryMap) ~= nil
		
		if EntryOrder == nil then
			return not HasNextEntry, false
		else
			local HasNextEntry1: boolean = typeof(EntryOrder) == "table" and next(EntryOrder) ~= nil
			
			return not HasNextEntry1 or not HasNextEntry, HasNextEntry1 ~= HasNextEntry
		end
	end, { UseUiStatusResult, SearchResultsFeed })
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult2 (copy), SduiLogger (upval), SduiErrors (upval), AppPage (upval)
		if UseMemoResult2 then
			SduiLogger.reportError(SduiErrors.SduiErrorType.InvalidFeedInResponse, {
				message = "SDUI search results feed empty with mismatched entry_order/entry_map",
				name = "useIsSearchResultsPageEmpty"
			}, AppPage.SearchPage)
		end
	end, { UseMemoResult2 })
	
	return UseMemoResult
end