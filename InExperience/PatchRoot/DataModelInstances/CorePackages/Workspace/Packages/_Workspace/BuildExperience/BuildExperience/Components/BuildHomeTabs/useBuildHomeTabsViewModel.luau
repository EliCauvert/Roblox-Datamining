local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local _ = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local GetBuildHomeTabStoreModule = require(BuildExperience.Stores.GetBuildHomeTabStore)
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local UseBuildHomeTabsPageLayoutModule = require(script.Parent.useBuildHomeTabsPageLayout)
local BUILDHOMETAB = require(BuildExperience.Stores.GetBuildHomeTabStore.createBuildHomeTabStore).BUILD_HOME_TAB
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization

return function(p1)
	-- upvalues: GetBuildHomeTabStoreModule (copy), UseLocalizationFunction (copy), LocalizationStringsModule (copy), ReactModule (copy), BUILDHOMETAB (copy), UseBuildHomeTabsPageLayoutModule (copy)
	local TabStore = p1.tabStore or GetBuildHomeTabStoreModule()
	local UseTabResult = TabStore.useTab()
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
	local UseRefResult = ReactModule.useRef(false)
	local HasPreviews = p1.hasPreviews or (p1.isPreviewsFiltered or p1.isPreviewsLoading and UseRefResult.current)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), HasPreviews (copy), UseTabResult (copy), BUILDHOMETAB (upval), TabStore (copy)
		UseRefResult.current = HasPreviews
		
		if not HasPreviews and UseTabResult ~= BUILDHOMETAB.Games then
			TabStore.setTab(BUILDHOMETAB.Games)
		end
	end, { HasPreviews, UseTabResult, TabStore })
	local UseTabResult1 = if HasPreviews then UseTabResult else BUILDHOMETAB.Games
	local UseBuildHomeTabsPageLayoutModuleResult = UseBuildHomeTabsPageLayoutModule({
		tabs = UseMemoResult,
		activeTab = UseTabResult1,
		showTabs = HasPreviews,
		onTabActivated = UseResult
	})
	
	return {
		showTabs = HasPreviews,
		activeTab = UseTabResult1,
		tabs = UseMemoResult,
		onTabActivated = UseBuildHomeTabsPageLayoutModuleResult.onTabActivated,
		layoutRef = UseBuildHomeTabsPageLayoutModuleResult.layoutRef,
		isSliding = UseBuildHomeTabsPageLayoutModuleResult.isSliding,
		tabOrder = UseBuildHomeTabsPageLayoutModuleResult.tabOrder,
		onStopped = UseBuildHomeTabsPageLayoutModuleResult.onStopped
	}
end