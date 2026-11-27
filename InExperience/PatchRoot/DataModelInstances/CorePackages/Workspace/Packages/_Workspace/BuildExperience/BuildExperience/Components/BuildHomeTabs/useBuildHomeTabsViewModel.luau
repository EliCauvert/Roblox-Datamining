local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local _ = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local GetBuildHomeTabStoreModule = require(BuildExperience.Stores.GetBuildHomeTabStore)
local GetSearchQueryStoreModule = require(BuildExperience.Stores.GetSearchQueryStore)
local _ = require(BuildExperience.Stores.GetSearchQueryStore.createSearchQueryStore)
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local UseBuildHomeTabsPageLayoutModule = require(script.Parent.useBuildHomeTabsPageLayout)
local SendBuildExperienceEventModule = require(BuildExperience.Telemetry.sendBuildExperienceEvent)
local FFlagBuildExperienceHomeTelemetryModule = require(BuildExperience.Flags.FFlagBuildExperienceHomeTelemetry)
local FFlagBuildUpdatedSearchUXForGAModule = require(BuildExperience.Flags.FFlagBuildUpdatedSearchUXForGA)
local FFlagBuildInspirationTabModule = require(BuildExperience.Flags.FFlagBuildInspirationTab)
local BUILDHOMETAB = require(BuildExperience.Stores.GetBuildHomeTabStore.createBuildHomeTabStore).BUILD_HOME_TAB
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization

return function(p1)
	-- upvalues: GetBuildHomeTabStoreModule (copy), FFlagBuildUpdatedSearchUXForGAModule (copy), GetSearchQueryStoreModule (copy), UseLocalizationFunction (copy), LocalizationStringsModule (copy), FFlagBuildInspirationTabModule (copy), ReactModule (copy), BUILDHOMETAB (copy), FFlagBuildExperienceHomeTelemetryModule (copy), SendBuildExperienceEventModule (copy), UseBuildHomeTabsPageLayoutModule (copy)
	local TabStore = p1.tabStore or GetBuildHomeTabStoreModule()
	local UseTabResult = TabStore.useTab()
	local UseIsSearchActiveResult = if FFlagBuildUpdatedSearchUXForGAModule then nil else (p1.searchQueryStore or GetSearchQueryStoreModule()).useIsSearchActive()
	local UseLocalizationResult = UseLocalizationFunction({
		games = LocalizationStringsModule.BUILD_HOME_TAB_GAMES,
		previews = LocalizationStringsModule.BUILD_HOME_TAB_PREVIEWS,
		inspiration = if FFlagBuildInspirationTabModule then LocalizationStringsModule.BUILD_HOME_TAB_INSPIRATION else nil
	})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: BUILDHOMETAB (upval), UseLocalizationResult (copy), FFlagBuildInspirationTabModule (upval)
		local List = {
			{
				id = BUILDHOMETAB.Games,
				text = UseLocalizationResult.games
			},
			{
				id = BUILDHOMETAB.Previews,
				text = UseLocalizationResult.previews
			}
		}
		
		if FFlagBuildInspirationTabModule then
			table.insert(List, {
				id = BUILDHOMETAB.Inspiration,
				text = UseLocalizationResult.inspiration
			})
		end
		return List
	end, {
		UseLocalizationResult.games,
		UseLocalizationResult.previews,
		UseLocalizationResult.inspiration
	})
	local UseResult = ReactModule.useCallback(function(Inspiration)
		-- upvalues: BUILDHOMETAB (upval), FFlagBuildInspirationTabModule (upval), FFlagBuildExperienceHomeTelemetryModule (upval), SendBuildExperienceEventModule (upval), TabStore (copy)
		if Inspiration ~= BUILDHOMETAB.Games and Inspiration ~= BUILDHOMETAB.Previews and Inspiration ~= BUILDHOMETAB.Inspiration then return end
		if Inspiration == BUILDHOMETAB.Inspiration and not FFlagBuildInspirationTabModule then return end
		if FFlagBuildExperienceHomeTelemetryModule then
			SendBuildExperienceEventModule("TAB_CLICK", {}, { context = "build_home", tab = tostring(Inspiration) })
		end
		TabStore.setTab(Inspiration)
	end, { TabStore })
	local NoUseIsSearchActiveResult = if FFlagBuildUpdatedSearchUXForGAModule then nil else not UseIsSearchActiveResult
	local UseTabResult1 = if FFlagBuildUpdatedSearchUXForGAModule or NoUseIsSearchActiveResult then UseTabResult else BUILDHOMETAB.Games
	local UseBuildHomeTabsPageLayoutModuleResult = UseBuildHomeTabsPageLayoutModule({
		tabs = UseMemoResult,
		activeTab = UseTabResult1,
		showTabs = if FFlagBuildUpdatedSearchUXForGAModule then nil else NoUseIsSearchActiveResult
	})
	
	if FFlagBuildExperienceHomeTelemetryModule then
		local IsIsFocused: boolean = if FFlagBuildUpdatedSearchUXForGAModule then p1.isFocused ~= false else NoUseIsSearchActiveResult and p1.isFocused ~= false
		ReactModule.useEffect(function()
			-- upvalues: IsIsFocused (copy), UseTabResult1 (copy), SendBuildExperienceEventModule (upval)
			if IsIsFocused then
				SendBuildExperienceEventModule("TAB_IMPRESSION", {}, { context = "build_home", tab = UseTabResult1 })
				
				return
			end
		end, { UseTabResult1, IsIsFocused })
	end
	return {
		showTabs = if FFlagBuildUpdatedSearchUXForGAModule then nil else NoUseIsSearchActiveResult,
		activeTab = UseTabResult1,
		tabs = UseMemoResult,
		onTabActivated = UseResult,
		pageOffset = UseBuildHomeTabsPageLayoutModuleResult.pageOffset,
		tabOrder = UseBuildHomeTabsPageLayoutModuleResult.tabOrder
	}
end