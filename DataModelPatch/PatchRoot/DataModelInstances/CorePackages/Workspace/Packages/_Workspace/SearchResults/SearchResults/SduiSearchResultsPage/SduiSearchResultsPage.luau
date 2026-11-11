local Parent = script:FindFirstAncestor("SearchResults").Parent
local ReactModule = require(Parent.React)
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local SduiPageEntryPoint = SduiSharedUtilitiesModule.SduiPageEntryPoint
local SduiLoadTimer = SduiSharedUtilitiesModule.SduiLoadTimer
local CompositionTags = require(Parent.AppComposition).CompositionTags
local FetchSearchResultsPageIfNeededModule = require(script.Parent.fetchSearchResultsPageIfNeeded)
local GetSearchResultsPageConfigKeyModule = require(script.Parent.getSearchResultsPageConfigKey)
local SearchPage = require(Parent.RobloxAppEnums).AppPage.SearchPage

return ReactModule.memo(function(p1)
	-- upvalues: GetSearchResultsPageConfigKeyModule (copy), ReactModule (copy), SduiLoadTimer (copy), SearchPage (copy), FetchSearchResultsPageIfNeededModule (copy), SduiPageEntryPoint (copy), CompositionTags (copy)
	local SearchKeyword = p1.searchKeyword
	local SearchUuid = p1.searchUuid
	local GlobalSessionId = p1.globalSessionId
	local PageTopPadding = p1.pageTopPadding
	local SearchResultsPageConfigKeyModule = GetSearchResultsPageConfigKeyModule(SearchUuid)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: SduiLoadTimer (upval), SearchPage (upval)
		return SduiLoadTimer.createLoadTimer(SearchPage)
	end, { SearchResultsPageConfigKeyModule })
	ReactModule.useEffect(function()
		-- upvalues: SearchKeyword (copy), FetchSearchResultsPageIfNeededModule (upval), SearchUuid (copy), GlobalSessionId (copy), UseMemoResult (copy)
		if SearchKeyword and SearchKeyword ~= "" then
			FetchSearchResultsPageIfNeededModule(SearchKeyword, SearchUuid, GlobalSessionId, UseMemoResult)
		end
	end, {
		SearchKeyword,
		SearchUuid,
		GlobalSessionId,
		UseMemoResult
	})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: SearchKeyword (copy), SduiLoadTimer (upval), SearchPage (upval), FetchSearchResultsPageIfNeededModule (upval), SearchUuid (copy), GlobalSessionId (copy)
		if SearchKeyword and SearchKeyword ~= "" then
			local LoadTimer = SduiLoadTimer.createLoadTimer(SearchPage)
			LoadTimer.start("refresh")
			FetchSearchResultsPageIfNeededModule(SearchKeyword, SearchUuid, GlobalSessionId, LoadTimer, true)
		end
	end, { SearchKeyword, SearchUuid, GlobalSessionId })
	
	return if SearchKeyword and SearchKeyword ~= "" then ReactModule.createElement(SduiPageEntryPoint, {
		includeNavigationHeaderBar = false,
		appPage = SearchPage,
		configKey = SearchResultsPageConfigKeyModule,
		pageTimer = UseMemoResult,
		refresh = UseResult,
		contentTag = CompositionTags.ContentRegion.Body,
		pageTopPadding = PageTopPadding
	}) else nil
end)