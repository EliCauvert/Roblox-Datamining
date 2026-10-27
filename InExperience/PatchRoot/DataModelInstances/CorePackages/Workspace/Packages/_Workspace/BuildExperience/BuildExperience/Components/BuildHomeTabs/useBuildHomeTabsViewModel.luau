local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local _ = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local GetBuildHomeTabStoreModule = require(BuildExperience.Stores.GetBuildHomeTabStore)
local GetSearchQueryStoreModule = require(BuildExperience.Stores.GetSearchQueryStore)
local _ = require(BuildExperience.Stores.GetSearchQueryStore.createSearchQueryStore)
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local UseBuildHomeTabsPageLayoutModule = require(script.Parent.useBuildHomeTabsPageLayout)
local BUILDHOMETAB = require(BuildExperience.Stores.GetBuildHomeTabStore.createBuildHomeTabStore).BUILD_HOME_TAB
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization

return function(p1)
	-- upvalues: GetBuildHomeTabStoreModule (copy), GetSearchQueryStoreModule (copy), UseLocalizationFunction (copy), LocalizationStringsModule (copy), ReactModule (copy), BUILDHOMETAB (copy), UseBuildHomeTabsPageLayoutModule (copy)
	local TabStore = p1.tabStore or GetBuildHomeTabStoreModule()
	local UseTabResult = TabStore.useTab()
	local UseIsSearchActiveResult = (p1.searchQueryStore or GetSearchQueryStoreModule()).useIsSearchActive()
	local UseLocalizationResult = UseLocalizationFunction({
		games = LocalizationStringsModule.BUILD_HOME_TAB_GAMES,
		previews = LocalizationStringsModule.BUILD_HOME_TAB_PREVIEWS
	})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: BUILDHOMETAB (upval), UseLocalizationResult (copy)
		return {
			{
				id = BUILDHOMETAB.Games,
				text = UseLocalizationResult.games
			},
			{
				id = BUILDHOMETAB.Previews,
				text = UseLocalizationResult.previews
			}
		}
	end, {
		UseLocalizationResult.games,
		UseLocalizationResult.previews
	})
	local UseResult = ReactModule.useCallback(function(Games)
		-- upvalues: BUILDHOMETAB (upval), TabStore (copy)
		if Games == BUILDHOMETAB.Games or Games == BUILDHOMETAB.Previews then
			TabStore.setTab(Games)
			
			return
		end
	end, { TabStore })
	local NoUseIsSearchActiveResult = not UseIsSearchActiveResult
	local UseTabResult1 = if NoUseIsSearchActiveResult then UseTabResult else BUILDHOMETAB.Games
	local UseBuildHomeTabsPageLayoutModuleResult = UseBuildHomeTabsPageLayoutModule({
		tabs = UseMemoResult,
		activeTab = UseTabResult1,
		showTabs = NoUseIsSearchActiveResult
	})
	
	return {
		showTabs = NoUseIsSearchActiveResult,
		activeTab = UseTabResult1,
		tabs = UseMemoResult,
		onTabActivated = UseResult,
		pageOffset = UseBuildHomeTabsPageLayoutModuleResult.pageOffset,
		tabOrder = UseBuildHomeTabsPageLayoutModuleResult.tabOrder
	}
end