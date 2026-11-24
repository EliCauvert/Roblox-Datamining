local Parent = script:FindFirstAncestor("SearchResults").Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UIBloxModule = require(Parent.UIBlox)
local EmptyState = UIBloxModule.App.Indicator.EmptyState
local Images = UIBloxModule.App.ImageSet.Images
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local SduiPageEntryPoint = SduiSharedUtilitiesModule.SduiPageEntryPoint
local SduiLoadTimer = SduiSharedUtilitiesModule.SduiLoadTimer
local GetSduiClientPageScopeFunction = SduiSharedUtilitiesModule.getSduiClientPageScope
local GetSduiApiStoreFunction = SduiSharedUtilitiesModule.getSduiApiStore
local AppPage = require(Parent.RobloxAppEnums).AppPage
local CompositionTags = require(Parent.AppComposition).CompositionTags
local _ = require(Parent.VideoUtils)
local FFlagSduiPageEntryPointResolvedSlot = require(Parent.SharedFlags).FFlagSduiPageEntryPointResolvedSlot
local FFlagSduiSearchGuidedPills = require(Parent.SharedFlags).FFlagSduiSearchGuidedPills
local FFlagSduiReleaseSearchResultsPageState = require(Parent.SharedFlags).FFlagSduiReleaseSearchResultsPageState
local FFlagLuaAppSduiSearchResultsVideoPreview = require(Parent.SharedFlags).FFlagLuaAppSduiSearchResultsVideoPreview
local FetchSearchResultsPageIfNeededModule = require(script.Parent.fetchSearchResultsPageIfNeeded)
local GetSearchResultsPageConfigKeyModule = require(script.Parent.getSearchResultsPageConfigKey)
local UseIsSearchResultsPageEmptyModule = require(script.Parent.useIsSearchResultsPageEmpty)
local SduiSearchGuidedPillScopeModule = require(script.Parent.GuidedPill.SduiSearchGuidedPillScope)
local SearchGuidedPillRequestModule = require(script.Parent.GuidedPill.searchGuidedPillRequest)
local SearchPage = AppPage.SearchPage
local IconsStatusOofXlarge = Images["icons/status/oof_xlarge"]

return ReactModule.memo(function(p1)
	-- upvalues: GetSearchResultsPageConfigKeyModule (copy), ReactModule (copy), SduiLoadTimer (copy), SearchPage (copy), FetchSearchResultsPageIfNeededModule (copy), FFlagSduiSearchGuidedPills (copy), GetSduiClientPageScopeFunction (copy), FFlagSduiReleaseSearchResultsPageState (copy), SduiSearchGuidedPillScopeModule (copy), GetSduiApiStoreFunction (copy), SearchGuidedPillRequestModule (copy), UseIsSearchResultsPageEmptyModule (copy), UseLocalizationFunction (copy), SduiPageEntryPoint (copy), CompositionTags (copy), FFlagSduiPageEntryPointResolvedSlot (copy), EmptyState (copy), IconsStatusOofXlarge (copy), FFlagLuaAppSduiSearchResultsVideoPreview (copy)
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
	
	if FFlagSduiSearchGuidedPills then
		ReactModule.useMemo(function()
			-- upvalues: GetSduiClientPageScopeFunction (upval), SearchResultsPageConfigKeyModule (copy)
			return GetSduiClientPageScopeFunction(SearchResultsPageConfigKeyModule)
		end, { SearchResultsPageConfigKeyModule })
	end
	if FFlagSduiReleaseSearchResultsPageState then
		ReactModule.useEffect(function()
			-- upvalues: FFlagSduiSearchGuidedPills (upval), SduiSearchGuidedPillScopeModule (upval), SearchResultsPageConfigKeyModule (copy), GetSduiApiStoreFunction (upval)
			return function()
				-- upvalues: FFlagSduiSearchGuidedPills (upval), SduiSearchGuidedPillScopeModule (upval), SearchResultsPageConfigKeyModule (upval), GetSduiApiStoreFunction (upval)
				if FFlagSduiSearchGuidedPills then
					SduiSearchGuidedPillScopeModule.clear(SearchResultsPageConfigKeyModule)
				end
				GetSduiApiStoreFunction().releaseConfigKey(SearchResultsPageConfigKeyModule)
			end
		end, { SearchResultsPageConfigKeyModule })
	end
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: SearchKeyword (copy), SduiLoadTimer (upval), SearchPage (upval), FFlagSduiSearchGuidedPills (upval), SearchGuidedPillRequestModule (upval), SearchResultsPageConfigKeyModule (copy), FetchSearchResultsPageIfNeededModule (upval), SearchUuid (copy), GlobalSessionId (copy)
		if SearchKeyword and SearchKeyword ~= "" then
			local LoadTimer = SduiLoadTimer.createLoadTimer(SearchPage)
			LoadTimer.start("refresh")
			
			if FFlagSduiSearchGuidedPills then
				SearchGuidedPillRequestModule.refreshFeed({
					configKey = SearchResultsPageConfigKeyModule,
					loadTimer = LoadTimer
				})
				
				return
			end
			FetchSearchResultsPageIfNeededModule(SearchKeyword, SearchUuid, GlobalSessionId, LoadTimer, true)
		end
	end, {
		SearchKeyword,
		SearchUuid,
		GlobalSessionId,
		if FFlagSduiSearchGuidedPills then SearchResultsPageConfigKeyModule else nil
	})
	local UseIsSearchResultsPageEmptyModuleResult = UseIsSearchResultsPageEmptyModule(SearchResultsPageConfigKeyModule)
	local UseLocalizationResult = UseLocalizationFunction({ noResultsFound = "CommonUI.Controls.NoResultsFound" })
	
	return if SearchKeyword and SearchKeyword ~= "" then ReactModule.createElement(SduiPageEntryPoint, {
		includeNavigationHeaderBar = false,
		appPage = SearchPage,
		configKey = SearchResultsPageConfigKeyModule,
		pageTimer = UseMemoResult,
		refresh = UseResult,
		contentTag = CompositionTags.ContentRegion.Body,
		pageTopPadding = if UseIsSearchResultsPageEmptyModuleResult then nil else PageTopPadding,
		resolvedSlot = if FFlagSduiPageEntryPointResolvedSlot and UseIsSearchResultsPageEmptyModuleResult then ReactModule.createElement(EmptyState, {
			icon = IconsStatusOofXlarge,
			text = UseLocalizationResult.noResultsFound
		}) else nil,
		onScrollDirectionChanged = p1.onScrollDirectionChanged,
		videoPlaybackContext = if FFlagLuaAppSduiSearchResultsVideoPreview then p1.videoPlaybackContext else nil
	}) else nil
end)