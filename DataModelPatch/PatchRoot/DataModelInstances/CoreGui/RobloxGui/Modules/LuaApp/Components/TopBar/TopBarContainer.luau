local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithStyleFunction = UIBloxModule.Style.withStyle
local GetPageMarginFunction = UIBloxModule.App.Container.getPageMargin
local WithGridConfigDEPRECATEDFunction = UIBloxModule.Core.Layout.Grid.withGridConfig_DEPRECATED
local TModule = require(CorePackages.Packages.t)
local CryoModule = require(CorePackages.Packages.Cryo)
local DashModule = require(CorePackages.Packages.Dash)
local ReactModule = require(CorePackages.Packages.React)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local UseTokensFunction = require(CorePackages.Packages.Foundation).Hooks.useTokens
local FFlagEnableAppNavGamepadRemoval = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableAppNavGamepadRemoval
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local RoactNavigationModule = require(CorePackages.Packages.RoactNavigation)
local Focusable = RoactGamepadModule.Focusable
local RoactAnalyticsTopBarModule = require(Modules.LuaApp.Services.RoactAnalyticsTopBar)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local AppSessionService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppSessionService
local AppEventIngestServiceModule = require(Modules.LuaApp.Services.AppEventIngestService)
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local RoactAppExperimentModule = require(CorePackages.Packages.RoactAppExperiment)
local VerticalEfficiencyExperimentation = require(CorePackages.Workspace.Packages.DiscoveryUtils).VerticalEfficiencyExperimentation
local DiscoveryUtilsModule = require(CorePackages.Workspace.Packages.DiscoveryUtils)
local NavigationRoduxModule = require(CorePackages.Workspace.Packages.NavigationRodux)
local Selectors = NavigationRoduxModule.Selectors
local ConfirmSearchModule = require(Modules.LuaApp.Thunks.ConfirmSearch)
local AppPageModule = require(Modules.LuaApp.AppPage)
local AppPagePropertiesModule = require(Modules.LuaApp.AppPageProperties)
local SetTopBarHeightModule = require(Modules.LuaApp.Actions.SetTopBarHeight)
local DisplayModule = require(CorePackages.Workspace.Packages.Display)
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor
local AppPageLocalizationKeysModule = require(Modules.LuaApp.AppPageLocalizationKeys)
local SearchBarModule = require(Modules.LuaApp.Components.SearchBar)
local SessionType = require(CorePackages.Workspace.Packages.RobloxAppSessionization).SessionType
local SearchModule = require(Modules.LuaApp.Analytics.Events.search)
local WrapComponentModule = require(Modules.LuaApp.Common.wrapComponent)
local ExternalEventConnection = require(CorePackages.Workspace.Packages.RoactUtils).ExternalEventConnection
local SearchTypes = require(CorePackages.Workspace.Packages.RobloxAppEnums).SearchTypes
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local UseBannerContainerModule = require(Modules.LuaApp.Components.Banner.useBannerContainer)
local UseGameDetailsPeekViewModule = require(Modules.LuaApp.Flags.UseGameDetailsPeekView)
local WithTopBarSearchSignalModule = require(Modules.LuaApp.Context.withTopBarSearchSignal)
local SignalConnectionModule = require(Modules.LuaApp.Components.SignalConnection)
local WithAvatarRouteModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute)
local ShouldShowProfileInHeaderBarModule = require(Modules.LuaApp.Components.TopBar.Utils.shouldShowProfileInHeaderBar)
local UseIsSpatialFunction = require(CorePackages.Workspace.Packages.Responsive).useIsSpatial
local SearchButtonModule = require(script.Parent.Buttons.SearchButton)
local LayoutConfig = require(CorePackages.Workspace.Packages.RobloxAppEnums).LayoutConfig
local AppHeaderBar = require(CorePackages.Workspace.Packages.AppHeaderBar).AppHeaderBar
local AppNavBarModule = require(CorePackages.Workspace.Packages.AppNavBar)
local VisibilityControl = AppNavBarModule.VisibilityControl
local GetFFlagAvatarAutocompleteEnabledForAllModule = require(Modules.AvatarExperience.Flags.GetFFlagAvatarAutocompleteEnabledForAll)
local FFlagSearchOmniAutocompletePage = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSearchOmniAutocompletePage
local FFlagSearchOmniAutocompletePageIXP = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSearchOmniAutocompletePageIXP
local GetFFlagLuaAppFixAppNavHeaderIconsAlignmentFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagLuaAppFixAppNavHeaderIconsAlignment
local FFlagLuaAppMoveProfileIntoTopBar = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppMoveProfileIntoTopBar
local FFlagLuaAppMoveProfileIntoTopBarIXP = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppMoveProfileIntoTopBarIXP
local LuaAppSlpIxpLayer = game:DefineFastString("LuaAppSlpIxpLayer", "Growth.Omnisearch.SearchLandingPage")
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagAppIaScrollAway = SharedFlagsModule.FFlagAppIaScrollAway
local FFlagAppIaHomeSubTab = SharedFlagsModule.FFlagAppIaHomeSubTab
local FFlagAppIaStatusBar = SharedFlagsModule.FFlagAppIaStatusBar
local FFlagEnableHeaderBarButtonsUpdate = SharedFlagsModule.FFlagEnableHeaderBarButtonsUpdate
local FFlagUseNavigationSelectors = SharedFlagsModule.FFlagUseNavigationSelectors
local FFlagLuaAppCompositionTopBarFullBleed = SharedFlagsModule.FFlagLuaAppCompositionTopBarFullBleed
local FFlagSignalsNavP3bTopBar = SharedFlagsModule.FFlagSignalsNavP3bTopBar
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local GetLegacyNavigationStore = if FFlagSignalsNavP3bTopBar then require(CorePackages.Workspace.Packages.NavigationRodux).GetLegacyNavigationStore else nil
local FFlagEnableFlyoutSidePanelModule = require(Modules.LuaApp.Flags.FFlagEnableFlyoutSidePanel)
local FFlagEnableHomeRobloxLogo = SharedFlagsModule.FFlagEnableHomeRobloxLogo
local FlyoutSidePanelIXP = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).FlyoutSidePanelIXP
local LuaAppEnableSlpForVr = game:DefineFastFlag("LuaAppEnableSlpForVr", false)
local ShouldShowLeftHeader = if FFlagEnableFlyoutSidePanelModule or FFlagEnableHomeRobloxLogo then require(CorePackages.Workspace.Packages.FlyoutSidePanel).Utils.shouldShowLeftHeader else nil
local NAVBARSIZE = require(Modules.LuaApp.Constants).NAV_BAR_SIZE
local NONCOMPACTSEARCHBARSIZE = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules.Personalization.Search.SearchConstants.NON_COMPACT_SEARCH_BAR_SIZE
local Config = if FFlagEnableAppNavGamepadRemoval then nil else {
	[Enum.UserInputType.Gamepad1] = true,
	[Enum.UserInputType.Gamepad2] = true,
	[Enum.UserInputType.Gamepad3] = true,
	[Enum.UserInputType.Gamepad4] = true,
	[Enum.UserInputType.Gamepad5] = true,
	[Enum.UserInputType.Gamepad6] = true,
	[Enum.UserInputType.Gamepad7] = true,
	[Enum.UserInputType.Gamepad8] = true
}
local TopBarContainer = RoactModule.Component:extend("TopBarContainer")
TopBarContainer.validateProps = TModule.strictInterface({
	searchType = TModule.string,
	ZIndex = TModule.number,
	hideSiteMessageBanner = TModule.boolean,
	forceCompactMode = TModule.boolean,
	transparentBackground = TModule.boolean,
	searchParameters = TModule.optional(TModule.table),
	onConfirmSearchCallback = TModule.optional(TModule.callback),
	titleText = TModule.optional(TModule.string),
	NextSelectionUp = TModule.optional(TModule.table),
	NextSelectionDown = TModule.optional(TModule.table),
	NextSelectionLeft = TModule.optional(TModule.table),
	NextSelectionRight = TModule.optional(TModule.table),
	leftItem = TModule.optional(TModule.any),
	centerItem = TModule.optional(TModule.any),
	rightItems = TModule.optional(TModule.array(TModule.any)),
	isSecondary = TModule.optional(TModule.boolean),
	useParentSizeForCenterItem = TModule.optional(TModule.boolean),
	setDefaultRefOverride = TModule.optional(TModule.callback),
	gridConfig = TModule.optional(TModule.table),
	focusController = if FFlagEnableAppNavGamepadRemoval then nil else TModule.optional(TModule.table),
	totalBannerHeight = TModule.optional(TModule.number),
	bannerContainer = TModule.optional(TModule.table),
	isSpatial = TModule.optional(TModule.boolean),
	screenSize = TModule.Vector2,
	formFactor = TModule.string,
	currentRoute = TModule.table,
	showSearchBar = TModule.boolean,
	statusBarHeight = TModule.number,
	opaquePage = TModule.optional(TModule.string),
	confirmSearch = TModule.callback,
	setTopBarHeight = TModule.callback,
	analytics = TModule.table,
	sessionService = TModule.optional(TModule.union(TModule.Instance, TModule.table)),
	eventIngest = TModule.table,
	enableNotifications = TModule.boolean,
	enableSearch = TModule.boolean,
	enableSearchAutoComplete = TModule.boolean,
	shouldShowSearchLandingPage = if FFlagSearchOmniAutocompletePageIXP then TModule.optional(TModule.boolean) else nil,
	navigation = TModule.table,
	avatarRoute = TModule.optional(TModule.table),
	forwardRef = TModule.optional(TModule.table),
	shouldNavigateToSearchLandingPage = TModule.optional(TModule.boolean),
	sideMarginOverride = TModule.optional(TModule.number),
	tag = TModule.optional(TModule.string),
	tokens = TModule.table
})
TopBarContainer.defaultProps = {
	enableSearch = false,
	ZIndex = 2,
	onConfirmSearchCallback = nil,
	hideSiteMessageBanner = false,
	forceCompactMode = false,
	transparentBackground = false,
	searchType = SearchTypes.Games,
	rightItems = {}
}

local function _(p1, p2)
	return p1 * p2.Config.UI.Scale
end

local _ = function(p1)
	-- upvalues: NAVBARSIZE (copy)
	return NAVBARSIZE * p1.Config.UI.Scale
end

local _ = function(p1, _): number
	-- upvalues: NAVBARSIZE (copy), LayoutConfig (copy)
	return p1.statusBarHeight + NAVBARSIZE * p1.tokens.Config.UI.Scale + math.round(p1.totalBannerHeight) + 2 * p1.gridConfig[LayoutConfig.Keys.PaddingVertical]
end

local _ = function(Auto): boolean
	-- upvalues: SearchTypes (copy), GetFFlagAvatarAutocompleteEnabledForAllModule (copy)
	return Auto == SearchTypes.Games or (Auto == SearchTypes.Auto or (Auto == SearchTypes.TopResults or GetFFlagAvatarAutocompleteEnabledForAllModule() and Auto == SearchTypes.Catalog))
end

function TopBarContainer.shouldUpdate(p1, Props, State): boolean
	-- upvalues: DashModule (copy)
	if State ~= p1.state then
		return true
	end
	if Props == p1.props then
		return false
	end
	for i, prop in pairs(Props) do
		if i ~= "rightItems" and p1.props[i] ~= prop then
			return true
		end
	end
	for i1, prop1 in pairs(p1.props) do
		if i1 ~= "rightItems" and Props[i1] ~= prop1 then
			return true
		end
	end
	return not DashModule.shallowEqual(p1.props.rightItems, Props.rightItems)
end

function TopBarContainer.getPageOwner(p2)
	return p2.props.navigation.state.routeName
end

local function isTopPage(Props): boolean
	-- upvalues: FFlagAppIaHomeSubTab (copy), NavigationRoduxModule (copy), CryoModule (copy), AppNavBarModule (copy)
	local CurrentRoute = Props.currentRoute
	local Name = CurrentRoute[#CurrentRoute].name
	local Name1 = if Props.avatarRoute then Props.avatarRoute.opaque.name else Props.opaquePage
	local RouteName = Props.navigation.state.routeName
	
	return if FFlagAppIaHomeSubTab and RouteName == NavigationRoduxModule.Constants.HomeContainerName then CryoModule.List.find(AppNavBarModule.Constants.HOME_CONTAINER_SUB_TAB_PAGES, Name) ~= nil else RouteName == Name or RouteName == Name1
end

function TopBarContainer.updateTopBarHeight(p2, p3, p4)
	-- upvalues: NAVBARSIZE (copy), LayoutConfig (copy), isTopPage (copy), DisplayModule (copy), FFlagAppIaScrollAway (copy), AppNavBarModule (copy), VisibilityControl (copy)
	local Props = p2.props
	local _ = p2.state
	local NewStatusBarHeight = Props.statusBarHeight + NAVBARSIZE * Props.tokens.Config.UI.Scale + math.round(Props.totalBannerHeight) + 2 * Props.gridConfig[LayoutConfig.Keys.PaddingVertical]
	local IsTopPage = isTopPage(p2.props)
	
	if p3 and p4 and p3.navigation == p2.props.navigation then
		local NewStatusBarHeight1 = p3.statusBarHeight + NAVBARSIZE * p3.tokens.Config.UI.Scale + math.round(p3.totalBannerHeight) + 2 * p3.gridConfig[LayoutConfig.Keys.PaddingVertical]
		local IsTopPage1 = isTopPage(p3)
		
		if NewStatusBarHeight1 == NewStatusBarHeight and IsTopPage == IsTopPage1 then return end
	end
	if IsTopPage then
		DisplayModule.GetDisplayStore().setTopBarHeight(NewStatusBarHeight)
		p2.props.setTopBarHeight(NewStatusBarHeight)
		
		if FFlagAppIaScrollAway and AppNavBarModule.getScrollAwayEnabled() then
			VisibilityControl.setScrollDistance(NewStatusBarHeight)
		end
	end
end

function TopBarContainer.init(p2)
	-- upvalues: RoactModule (copy), FFlagEnableAppNavGamepadRemoval (copy), RoactGamepadModule (copy), UserInputService (copy)
	p2.searchBarRef = RoactModule.createRef()
	p2.isMounted = false
	p2.rightItemRefs = if FFlagEnableAppNavGamepadRemoval then nil else RoactGamepadModule.createRefCache()
	p2.itemDefaultChildRefs = if FFlagEnableAppNavGamepadRemoval then nil else RoactGamepadModule.createRefCache()
	p2.leftItemRef = if FFlagEnableAppNavGamepadRemoval then nil else RoactModule.createRef()
	p2.centerItemRef = if FFlagEnableAppNavGamepadRemoval then nil else RoactModule.createRef()
	p2.buttonVisibilityCallbacks = {}
	p2.state = {
		isSearching = false,
		absolutePosition = Vector2.new(0, 0),
		lastInputType = if FFlagEnableAppNavGamepadRemoval then nil else UserInputService:GetLastInputType(),
		hiddenItems = {}
	}
	p2:bindFunctions()
	p2:updateTopBarHeight()
end

function TopBarContainer.bindFunctions(p2)
	-- upvalues: AvatarScreen (copy), SearchTypes (copy), SearchModule (copy), SessionType (copy), GetFFlagAvatarAutocompleteEnabledForAllModule (copy), DiscoveryUtilsModule (copy), FFlagEnableAppNavGamepadRemoval (copy), FFlagLuaAppMoveProfileIntoTopBar (copy), FFlagEnableFlyoutSidePanelModule (copy), FFlagEnableHomeRobloxLogo (copy)
	local CurrentRoute = p2.props.currentRoute
	local Name = CurrentRoute[#CurrentRoute].name
	
	function p2.onSearchButtonActivated()
		-- upvalues: p2 (copy), Name (copy), AvatarScreen (upval)
		if not p2.isMounted then return end
		p2:setIsSearching(true)
		p2.props.analytics.reportSearchButtonClick(Name)
		
		if p2.props.shouldNavigateToSearchLandingPage then
			p2:setIsSearching(false)
			p2.props.navigation.navigate(AvatarScreen.CatalogSearchLanding)
		end
	end
	
	function p2.onExitSearch()
		-- upvalues: p2 (copy)
		if p2.isMounted then
			p2:setIsSearching(false)
			
			return
		end
	end
	
	function p2.cancelSearchCallback()
		-- upvalues: p2 (copy), SearchTypes (upval), SearchModule (upval), Name (copy)
		if not p2.isMounted then return end
		local SearchType = p2.props.searchType
		local IsSearchTypeMatch = SearchType == SearchTypes.Auto
		
		if SearchType == SearchTypes.Games or IsSearchTypeMatch then
			SearchModule(p2.props.eventIngest, "games", "cancel", nil, IsSearchTypeMatch, Name)
		elseif SearchType == SearchTypes.TopResults then
			SearchModule(p2.props.eventIngest, SearchTypes.TopResults, "cancel", nil, nil, Name)
		elseif SearchType == SearchTypes.Players then
			SearchModule(p2.props.eventIngest, "players", "cancel", nil, nil, Name)
		elseif SearchType == SearchTypes.Catalog then
			p2.props.analytics.reportSearchCanceled("catalog")
		end
		p2.onExitSearch()
	end
	
	function p2.cancelSearchAndEndSession()
		-- upvalues: p2 (copy), SessionType (upval)
		p2.cancelSearchCallback()
		
		if p2.props.sessionService:SessionExists(SessionType.StructuralIdentifier.GameSearchAutocomplete) then
			p2.props.sessionService:RemoveSession(SessionType.StructuralIdentifier.GameSearchAutocomplete)
		end
	end
	
	function p2.onSearchBarFocused()
		-- upvalues: p2 (copy), SearchTypes (upval), SessionType (upval), SearchModule (upval), Name (copy)
		if not p2.isMounted then return end
		local SearchType = p2.props.searchType
		local IsSearchTypeMatch = SearchType == SearchTypes.Auto
		
		if SearchType == SearchTypes.Games or IsSearchTypeMatch or SearchType == SearchTypes.TopResults then
			if p2.props.enableSearchAutoComplete then
				p2.props.sessionService:SetSession(SessionType.StructuralIdentifier.Level1, SessionType.StructuralIdentifier.GameSearchAutocomplete, SessionType.StructuralIdentifier.GameSearchAutocomplete)
			end
			SearchModule(p2.props.eventIngest, if SearchType == SearchTypes.TopResults then SearchTypes.TopResults else "games", "open", nil, IsSearchTypeMatch, Name)
		elseif SearchType == SearchTypes.Players then
			SearchModule(p2.props.eventIngest, "players", "open", nil, nil, Name)
		elseif SearchType == SearchTypes.Catalog then
			p2.props.analytics.reportSearchFocused("catalog")
		end
		p2:setIsSearching(true)
	end
	
	function p2.onTextCleared()
		-- upvalues: p2 (copy)
		if p2.isMounted then return end
	end
	
	function p2.confirmSearchCallback(p3, IsAutocompleteSuggestion, AllAutocompleteSuggestions)
		-- upvalues: p2 (copy), GetFFlagAvatarAutocompleteEnabledForAllModule (upval), DiscoveryUtilsModule (upval), SearchTypes (upval)
		if not p2.isMounted then return end
		local SearchType = p2.props.searchType
		p2.props.confirmSearch(p3, {
			isAutocompleteSuggestion = IsAutocompleteSuggestion,
			allAutocompleteSuggestions = AllAutocompleteSuggestions,
			searchType = SearchType,
			isAvatarAutocompleteEnabled = GetFFlagAvatarAutocompleteEnabledForAllModule(),
			navigation = p2.props.navigation,
			pageOwner = p2:getPageOwner(),
			sessionService = p2.props.sessionService,
			eventIngest = p2.props.eventIngest,
			topBarAnalytics = p2.props.analytics
		})
		
		if DiscoveryUtilsModule.isSearchTypeInOmniSearch(SearchType) or SearchType == SearchTypes.Catalog then
			p2.onExitSearch()
		end
		if GetFFlagAvatarAutocompleteEnabledForAllModule() and p2.props.onConfirmSearchCallback then
			p2.props.onConfirmSearchCallback()
		end
	end
	
	function p2.absolutePositionChangedCallback(Frame)
		-- upvalues: p2 (copy)
		p2:setState({ absolutePosition = Frame.AbsolutePosition })
	end
	
	function p2.searchSignalCallback(PageOwner)
		-- upvalues: p2 (copy)
		if p2:getPageOwner() == PageOwner then
			p2.onSearchButtonActivated()
		end
	end
	
	function p2.renderNavigation(p3)
		-- upvalues: FFlagEnableAppNavGamepadRemoval (upval), p2 (copy), FFlagLuaAppMoveProfileIntoTopBar (upval), FFlagEnableFlyoutSidePanelModule (upval), FFlagEnableHomeRobloxLogo (upval)
		return p2:renderTopBarItem(p2.props.leftItem, nil, if FFlagEnableAppNavGamepadRemoval then nil else p2:shouldShowCenterItem() and p2.centerItemRef or (p2:getFirstRightItemRef() or p2.props.NextSelectionRight), nil, nil, if FFlagLuaAppMoveProfileIntoTopBar or FFlagEnableFlyoutSidePanelModule or FFlagEnableHomeRobloxLogo then p3 else nil, if FFlagEnableFlyoutSidePanelModule or FFlagEnableHomeRobloxLogo then p2.props.navigation.state.routeName else nil)
	end
	
	function p2.renderCenter()
		-- upvalues: p2 (copy), FFlagEnableAppNavGamepadRemoval (upval)
		local ShouldShowLeftItem = p2:shouldShowLeftItem()
		local CenterItem = p2.props.centerItem
		local LeftItemRef = if FFlagEnableAppNavGamepadRemoval then nil else ShouldShowLeftItem and p2.leftItemRef or nil
		local FirstRightItemRef = if FFlagEnableAppNavGamepadRemoval then nil else p2:getFirstRightItemRef() or p2.props.NextSelectionRight
		
		return if p2.props.useParentSizeForCenterItem then p2:renderTopBarItem(CenterItem, LeftItemRef, FirstRightItemRef, nil, true) else p2:renderTopBarItem(CenterItem, LeftItemRef, FirstRightItemRef)
	end
end

function TopBarContainer.isSearchPageOverlayEnabled(p2)
	-- upvalues: LuaAppEnableSlpForVr (copy), FFlagSearchOmniAutocompletePage (copy), FFlagSearchOmniAutocompletePageIXP (copy)
	return if LuaAppEnableSlpForVr then FFlagSearchOmniAutocompletePage else not p2.props.isSpatial and (FFlagSearchOmniAutocompletePage and (not FFlagSearchOmniAutocompletePageIXP or p2.props.shouldShowSearchLandingPage))
end

function TopBarContainer.setIsSearching(p2, IsSearching)
	p2:setState({ isSearching = IsSearching })
	
	if p2.props.setDefaultRefOverride then
		p2.props.setDefaultRefOverride(if IsSearching then p2.searchBarRef else nil)
	end
end

function TopBarContainer.didMount(p2)
	p2.isMounted = true
end

function TopBarContainer.willUnmount(p2)
	p2.isMounted = false
end

function TopBarContainer.isCompactViewMode(p2)
	-- upvalues: FormFactor (copy)
	local FormFactor1 = p2.props.formFactor
	
	return p2.props.forceCompactMode or FormFactor1 == FormFactor.COMPACT
end

function TopBarContainer.getPageNameLocalizationKey(p2)
	-- upvalues: AppPageLocalizationKeysModule (copy)
	local Name = p2.props.currentRoute[1].name
	
	return AppPageLocalizationKeysModule[p2.props.navigation.state.routeName] or AppPageLocalizationKeysModule[Name]
end

function TopBarContainer.maybeRenderRightItems(p2, p3, IsSearching, ShouldShowLeftItem)
	-- upvalues: FFlagEnableAppNavGamepadRemoval (copy)
	if IsSearching then
		return {}
	end
	if not FFlagEnableAppNavGamepadRemoval then
		return p2:renderRightItems(p3, if p2:shouldShowCenterItem() then p2.centerItemRef elseif ShouldShowLeftItem then p2.leftItemRef else nil)
	end
	local RenderTopBarItemResults = {}
	
	for i, rightItem in ipairs(p2.props.rightItems) do
		RenderTopBarItemResults["topBarItem_" .. tostring(i)] = p2:renderTopBarItem(rightItem, nil, nil, i)
	end
	return RenderTopBarItemResults
end

if not FFlagEnableAppNavGamepadRemoval then
	function TopBarContainer.renderRightItems(p4, _, CenterItemRef)
		local RightItems = {}
		RightItems = p4.props.rightItems
		local RenderTopBarItemResults = {}
		
		local function nextRef(LayoutOrder: number)
			-- upvalues: RightItems (ref), p4 (copy)
			local RightItem = nil
			while LayoutOrder < #RightItems do
				LayoutOrder += 1
				RightItem = RightItems[LayoutOrder]
				
				if not p4.state.hiddenItems[RightItem] then
					return p4.rightItemRefs[RightItem]
				end
			end
			return nil
		end
		
		local function prevRef(LayoutOrder: number)
			-- upvalues: RightItems (ref), p4 (copy)
			local RightItem = nil
			while LayoutOrder > 1 do
				LayoutOrder -= 1
				RightItem = RightItems[LayoutOrder]
				
				if not p4.state.hiddenItems[RightItem] then
					return p4.rightItemRefs[RightItem]
				end
			end
			return nil
		end
		
		for i, rightItem in ipairs(RightItems) do
			RenderTopBarItemResults["topBarItem_" .. tostring(i)] = p4:renderTopBarItem(rightItem, prevRef(i) or CenterItemRef, nextRef(i), i)
		end
		return RenderTopBarItemResults
	end
end
function TopBarContainer.renderTopBarItem(p5, CenterItem, LeftItemRef, FirstRightItemRef, LayoutOrder, p6, p7, RouteName)
	-- upvalues: FFlagEnableAppNavGamepadRemoval (copy), RoactModule (copy), Focusable (copy), GetFFlagLuaAppFixAppNavHeaderIconsAlignmentFunction (copy), FFlagLuaAppMoveProfileIntoTopBar (copy), FFlagEnableFlyoutSidePanelModule (copy), FFlagEnableHomeRobloxLogo (copy)
	local ItemRef = if FFlagEnableAppNavGamepadRemoval then nil else p5:getItemRef(CenterItem)
	local ItemDefaultChildRef = if FFlagEnableAppNavGamepadRemoval then nil else p5:getItemDefaultChildRef(CenterItem)
	
	return RoactModule.createElement(if FFlagEnableAppNavGamepadRemoval then "Frame" else Focusable.Frame, {
		AutomaticSize = if p6 then nil elseif GetFFlagLuaAppFixAppNavHeaderIconsAlignmentFunction() then Enum.AutomaticSize.XY else Enum.AutomaticSize.X,
		Size = if p6 then UDim2.fromScale(1, 1) elseif GetFFlagLuaAppFixAppNavHeaderIconsAlignmentFunction() then UDim2.fromScale(0, 0) else UDim2.fromScale(0, 1),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = LayoutOrder,
		NextSelectionLeft = if FFlagEnableAppNavGamepadRemoval then nil else LeftItemRef,
		NextSelectionRight = if FFlagEnableAppNavGamepadRemoval then nil else FirstRightItemRef,
		[RoactModule.Ref] = if FFlagEnableAppNavGamepadRemoval then nil else ItemRef,
		defaultChild = ItemDefaultChildRef,
		Visible = not p5.state.hiddenItems[CenterItem]
	}, {
		Button = RoactModule.createElement(CenterItem, {
			formFactor = p5.props.formFactor,
			isCompactView = p5:isCompactViewMode(),
			isSearching = p5.state.isSearching,
			isSecondary = p5.props.isSecondary,
			cancelSearch = p5.cancelSearchAndEndSession,
			activateSearch = p5.onSearchButtonActivated,
			setVisible = p5:getButtonVisibilityCallback(CenterItem),
			buttonRef = ItemDefaultChildRef,
			titleText = if FFlagLuaAppMoveProfileIntoTopBar or FFlagEnableFlyoutSidePanelModule or FFlagEnableHomeRobloxLogo then p7 else nil,
			routeName = if FFlagEnableFlyoutSidePanelModule or FFlagEnableHomeRobloxLogo then RouteName else nil
		})
	})
end

function TopBarContainer.shouldShowLeftItem(p5): boolean
	local LeftItem = p5.props.leftItem
	
	return LeftItem and not p5.state.hiddenItems[LeftItem] and not p5.state.isSearching or false
end

function TopBarContainer.shouldShowCenterItem(p5): boolean
	local CenterItem = p5.props.centerItem
	
	return CenterItem and not p5.state.hiddenItems[CenterItem] or false
end

if not FFlagEnableAppNavGamepadRemoval then
	function TopBarContainer.getItemRef(p5, CenterItem)
		return if CenterItem == nil then nil elseif CenterItem == p5.props.leftItem then p5.leftItemRef elseif CenterItem == p5.props.centerItem then p5.centerItemRef else p5.rightItemRefs[CenterItem]
	end
	
	function TopBarContainer.getItemDefaultChildRef(p5, p6)
		return if p6 == nil then nil else p5.itemDefaultChildRefs[p6]
	end
end
function TopBarContainer.hasSearchButton(p5): boolean
	-- upvalues: SearchButtonModule (copy)
	for _, rightItem in ipairs(p5.props.rightItems) do
		if rightItem == SearchButtonModule then
			return true
		end
	end
	return false
end

if not FFlagEnableAppNavGamepadRemoval then
	function TopBarContainer.getFirstRightItemRef(p6)
		for _, rightItem in ipairs(p6.props.rightItems) do
			if not p6.state.hiddenItems[rightItem] then
				return p6.rightItemRefs[rightItem]
			end
		end
		return nil
	end
end
function TopBarContainer.getButtonVisibilityCallback(p6, p7)
	-- upvalues: CryoModule (copy)
	local ButtonVisibilityCallback: (any) -> () = p6.buttonVisibilityCallbacks[p7]
	
	if not ButtonVisibilityCallback then
		ButtonVisibilityCallback = function(p8)
			-- upvalues: p6 (copy), CryoModule (upval), p7 (copy)
			p6:setState(function(p9)
				-- upvalues: CryoModule (upval), p7 (upval), p8 (copy)
				return {
					hiddenItems = CryoModule.Dictionary.join(p9.hiddenItems, { [p7] = not p8 or CryoModule.None })
				}
			end)
		end
		
		p6.buttonVisibilityCallbacks[p7] = ButtonVisibilityCallback
	end
	return ButtonVisibilityCallback
end

function TopBarContainer.getRenderSearchBar(p6, IsSearching, IsCompactView, PlaceholderText, SearchType, EnableSearchAutoComplete, Animated, ShouldShowLeftItem, _)
	-- upvalues: RoactModule (copy), SearchBarModule (copy), SearchTypes (copy), GetFFlagAvatarAutocompleteEnabledForAllModule (copy), FFlagEnableAppNavGamepadRemoval (copy), DiscoveryUtilsModule (copy), FFlagSearchOmniAutocompletePage (copy)
	return if IsSearching then function()
		-- upvalues: RoactModule (upval), SearchBarModule (upval), p6 (copy), IsCompactView (copy), PlaceholderText (copy), SearchType (copy), EnableSearchAutoComplete (copy), SearchTypes (upval), GetFFlagAvatarAutocompleteEnabledForAllModule (upval), FFlagEnableAppNavGamepadRemoval (upval), Animated (copy), ShouldShowLeftItem (copy), DiscoveryUtilsModule (upval), FFlagSearchOmniAutocompletePage (upval)
		return RoactModule.createElement(SearchBarModule, {
			cancelSearch = p6.cancelSearchCallback,
			confirmSearch = p6.confirmSearchCallback,
			onFocused = p6.onSearchBarFocused,
			onTextCleared = p6.onTextCleared,
			isCompactView = IsCompactView,
			placeholderText = PlaceholderText,
			searchType = SearchType,
			autocomplete = EnableSearchAutoComplete and (SearchType == SearchTypes.Games or (SearchType == SearchTypes.Auto or (SearchType == SearchTypes.TopResults or GetFFlagAvatarAutocompleteEnabledForAllModule() and SearchType == SearchTypes.Catalog))),
			[RoactModule.Ref] = p6.searchBarRef,
			focusController = if FFlagEnableAppNavGamepadRemoval then nil else p6.props.focusController,
			isSearching = p6.state.isSearching,
			animated = Animated,
			initialSearchText = p6.props.searchParameters and p6.props.searchParameters.searchKeyword or "",
			searchBarPadding = if ShouldShowLeftItem then 0 else nil,
			searchPageOverlayEnabled = if p6:isSearchPageOverlayEnabled() then DiscoveryUtilsModule.isSearchTypeInOmniSearch(SearchType) else nil,
			disableListPicker = if p6:isSearchPageOverlayEnabled() then DiscoveryUtilsModule.isSearchTypeInOmniSearch(SearchType) else nil,
			onExitSearch = if FFlagSearchOmniAutocompletePage then p6.onExitSearch else nil
		})
	end else nil
end

function TopBarContainer.getRenderRootSearchBar(p6, IsSearching, EnableSearch, IsCompactView, PlaceholderText, SearchType, EnableSearchAutoComplete, _)
	-- upvalues: RoactModule (copy), SearchBarModule (copy), NONCOMPACTSEARCHBARSIZE (copy), SearchTypes (copy), GetFFlagAvatarAutocompleteEnabledForAllModule (copy), DiscoveryUtilsModule (copy)
	return if IsSearching or not EnableSearch or IsCompactView then nil else function()
		-- upvalues: RoactModule (upval), SearchBarModule (upval), NONCOMPACTSEARCHBARSIZE (upval), p6 (copy), PlaceholderText (copy), IsCompactView (copy), SearchType (copy), EnableSearchAutoComplete (copy), SearchTypes (upval), GetFFlagAvatarAutocompleteEnabledForAllModule (upval), DiscoveryUtilsModule (upval)
		return RoactModule.createElement(SearchBarModule, {
			Size = UDim2.new(0, NONCOMPACTSEARCHBARSIZE, 1, 0),
			cancelSearch = p6.cancelSearchCallback,
			confirmSearch = p6.confirmSearchCallback,
			onFocused = p6.onSearchBarFocused,
			onTextCleared = p6.onTextCleared,
			placeholderText = PlaceholderText,
			isCompactView = IsCompactView,
			modernUI = true,
			searchType = SearchType,
			autocomplete = EnableSearchAutoComplete and (SearchType == SearchTypes.Games or (SearchType == SearchTypes.Auto or (SearchType == SearchTypes.TopResults or GetFFlagAvatarAutocompleteEnabledForAllModule() and SearchType == SearchTypes.Catalog))),
			isSearching = p6.state.isSearching,
			initialSearchText = p6.props.searchParameters and p6.props.searchParameters.searchKeyword or "",
			[RoactModule.Ref] = p6.searchBarRef,
			searchPageOverlayEnabled = if p6:isSearchPageOverlayEnabled() then DiscoveryUtilsModule.isSearchTypeInOmniSearch(SearchType) else nil,
			disableListPicker = if p6:isSearchPageOverlayEnabled() then DiscoveryUtilsModule.isSearchTypeInOmniSearch(SearchType) else nil
		})
	end
end

function TopBarContainer.renderAppHeaderBar(p6, p7, p8, RenderSearchBar, RenderRootSearchBar, TitleText, MaybeRenderRightItemsResult, ShouldShowLeftItem)
	-- upvalues: NAVBARSIZE (copy), FFlagLuaAppMoveProfileIntoTopBar (copy), FFlagEnableFlyoutSidePanelModule (copy), FFlagEnableHomeRobloxLogo (copy), FFlagLuaAppMoveProfileIntoTopBarIXP (copy), VerticalEfficiencyExperimentation (copy), ShouldShowProfileInHeaderBarModule (copy), ShouldShowLeftHeader (ref), RoactModule (copy), LayoutConfig (copy), FFlagEnableHeaderBarButtonsUpdate (copy), FFlagLuaAppCompositionTopBarFullBleed (copy), AppHeaderBar (copy)
	local Tokens = p8.Tokens
	local RenderNavigation = if FFlagLuaAppMoveProfileIntoTopBar or FFlagEnableFlyoutSidePanelModule or FFlagEnableHomeRobloxLogo then function()
		-- upvalues: p6 (copy), TitleText (copy), p7 (copy)
		return p6.renderNavigation(TitleText or p7.pageTitle)
	end else p6.renderNavigation
	local CenterItem = p6.props.centerItem
	local config = {
		barHeight = NAVBARSIZE * p6.props.tokens.Config.UI.Scale,
		renderNavigation = if ShouldShowLeftItem then RenderNavigation else nil,
		title = TitleText or p7.pageTitle,
		isTitleCentered = ShouldShowLeftItem and not p6.props.isSecondary or false,
		titleFontStyle = if ShouldShowLeftItem or p6.props.isSecondary then Tokens.Typography.HeadingSmall else Tokens.Typography.HeadingLarge
	}
	
	if CenterItem then
		config.title = ""
	elseif p6.state.isSearching then
		config.title = ""
	elseif FFlagLuaAppMoveProfileIntoTopBar and (not FFlagLuaAppMoveProfileIntoTopBarIXP or VerticalEfficiencyExperimentation.getIsProfileMovedToTopBar()) and (ShouldShowLeftItem and ShouldShowProfileInHeaderBarModule(p6.props.currentRoute[1].name, p6.props.currentRoute[#p6.props.currentRoute].name, p6.props.formFactor, p6.state.isSearching)) then
		config.title = ""
	elseif (FFlagEnableFlyoutSidePanelModule or FFlagEnableHomeRobloxLogo) and (ShouldShowLeftItem and ShouldShowLeftHeader(p6.props.navigation.state.routeName, p6.props.currentRoute[#p6.props.currentRoute].name, p6.state.isSearching)) then
		config.title = ""
	end
	config.shouldRenderTitle = true
	config.shouldRenderCenter = true
	
	if RenderSearchBar or RenderRootSearchBar then
		config.renderCenter = RenderSearchBar or RenderRootSearchBar
	elseif CenterItem then
		config.renderCenter = p6.renderCenter
	end
	config.renderUtilities = if RenderSearchBar then nil else function()
		-- upvalues: RoactModule (upval), MaybeRenderRightItemsResult (copy)
		return RoactModule.createFragment(MaybeRenderRightItemsResult)
	end
	local GridConfig = p6.props.gridConfig
	local _UDim = UDim.new(0, p6.props.sideMarginOverride or GridConfig[LayoutConfig.Keys.PaddingHorizontal])
	local _UDim1 = UDim.new(0, GridConfig[LayoutConfig.Keys.PaddingRightItems])
	config.utilitiesGap = if FFlagEnableHeaderBarButtonsUpdate then UDim.new(0, p6.props.tokens.Size.Size_100) else _UDim1
	config.paddingLeft = _UDim
	config.paddingRight = if FFlagEnableHeaderBarButtonsUpdate then _UDim - UDim.new(0, p6.props.tokens.Size.Size_100) else _UDim
	config.paddingTop = UDim.new(0, 0)
	config.paddingBottom = UDim.new(0, 0)
	config.backgroundStyle = if p6.props.transparentBackground then { Transparency = 1, Color3 = Color3.new(0, 0, 0) } else nil
	config.onMedia = false
	config.tag = if FFlagLuaAppCompositionTopBarFullBleed then p6.props.tag else nil
	
	return RoactModule.createElement(AppHeaderBar, config)
end

function TopBarContainer.renderWithProviders(p6, Signal, p7, p8)
	-- upvalues: LayoutConfig (copy), NAVBARSIZE (copy), SearchTypes (copy), FFlagEnableAppNavGamepadRemoval (copy), FFlagAppIaScrollAway (copy), AppNavBarModule (copy), VisibilityControl (copy), FFlagAppIaStatusBar (copy), FFlagAppIaHomeSubTab (copy), FlyoutSidePanelIXP (copy), RoactModule (copy), ReactModule (copy), FFlagLuaAppCompositionTopBarFullBleed (copy), Focusable (copy), ExternalEventConnection (copy), UserInputService (copy), SignalConnectionModule (copy)
	local ShouldShowLeftItem = p6:shouldShowLeftItem()
	local SearchType = p6.props.searchType
	local EnableSearchAutoComplete = p6.props.enableSearchAutoComplete
	local StatusBarHeight = p6.props.statusBarHeight
	local NewStatusBarHeight = StatusBarHeight + NAVBARSIZE * p6.props.tokens.Config.UI.Scale + p6.props.gridConfig[LayoutConfig.Keys.PaddingVertical]
	local NewNewStatusBarHeight = NewStatusBarHeight + p6.props.totalBannerHeight
	local IsCompactViewMode = p6:isCompactViewMode()
	local SearchPlaceholderSearchMarketplace = if SearchType == SearchTypes.Catalog then p8.searchPlaceholderSearchMarketplace else p8.searchPlaceholderSearchGames
	local IsSearching = IsCompactViewMode and (p6.state.isSearching or p6.props.showSearchBar)
	local RenderRootSearchBar = p6:getRenderRootSearchBar(IsSearching, p6:hasSearchButton() and p6.props.enableSearch, IsCompactViewMode, SearchPlaceholderSearchMarketplace, SearchType, EnableSearchAutoComplete)
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 1, 0),
		ZIndex = p6.props.ZIndex,
		[ReactModule.Tag] = if FFlagLuaAppCompositionTopBarFullBleed then nil else p6.props.tag,
		[RoactModule.Change.AbsolutePosition] = p6.absolutePositionChangedCallback
	}, {
		TopBarContents = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, NewNewStatusBarHeight),
			Position = if FFlagAppIaScrollAway and AppNavBarModule.getScrollAwayEnabled() then VisibilityControl.getHeaderBinding():map(function(p9: number): UDim2
				-- upvalues: FFlagAppIaStatusBar (upval), FFlagAppIaHomeSubTab (upval), FlyoutSidePanelIXP (upval), NewNewStatusBarHeight (copy), StatusBarHeight (copy)
				return UDim2.new(0, 0, 0, if FFlagAppIaStatusBar and FFlagAppIaHomeSubTab and FlyoutSidePanelIXP.isHomeSubTabEnabled() then (p9 - 1) * (NewNewStatusBarHeight - StatusBarHeight) else (p9 - 1) * NewNewStatusBarHeight)
			end) else nil
		}, {
			TopBar = RoactModule.createElement("Frame", {
				Active = true,
				BorderSizePixel = 0,
				ZIndex = 2,
				BackgroundColor3 = p7.Theme.BackgroundDefault.Color,
				BackgroundTransparency = if p6.props.transparentBackground then 1 else p7.Theme.BackgroundDefault.Transparency,
				Position = UDim2.new(0, 0, 0, 0),
				Size = UDim2.new(1, 0, 0, NewStatusBarHeight)
			}, {
				NavBar = RoactModule.createElement(if FFlagEnableAppNavGamepadRemoval then "Frame" else Focusable.Frame, {
					AnchorPoint = Vector2.new(0, 1),
					BackgroundColor3 = p7.Theme.BackgroundDefault.Color,
					BackgroundTransparency = if p6.props.transparentBackground then 1 else p7.Theme.BackgroundDefault.Transparency,
					BorderSizePixel = 0,
					Position = UDim2.new(0, 0, 1, 0),
					Size = UDim2.new(1, 0, 0, NAVBARSIZE * p6.props.tokens.Config.UI.Scale),
					[RoactModule.Ref] = p6.props.forwardRef,
					NextSelectionRight = if FFlagEnableAppNavGamepadRemoval then nil elseif IsCompactViewMode and p6.state.isSearching then nil else p6.props.NextSelectionRight or nil,
					NextSelectionDown = if FFlagEnableAppNavGamepadRemoval then nil elseif IsCompactViewMode and p6.state.isSearching then nil else p6.props.NextSelectionDown or nil,
					defaultChild = if FFlagEnableAppNavGamepadRemoval then nil elseif RenderRootSearchBar or IsCompactViewMode and p6.state.isSearching then p6.searchBarRef elseif p6:shouldShowLeftItem() then p6.leftItemRef elseif p6:shouldShowCenterItem() then p6.centerItemRef else p6:getFirstRightItemRef()
				}, {
					AppHeaderBar = p6:renderAppHeaderBar(p8, p7, p6:getRenderSearchBar(IsSearching, IsCompactViewMode, SearchPlaceholderSearchMarketplace, SearchType, EnableSearchAutoComplete, not p6.props.showSearchBar, ShouldShowLeftItem), RenderRootSearchBar, p6.props.titleText, p6:maybeRenderRightItems(p7, IsSearching, ShouldShowLeftItem), ShouldShowLeftItem)
				})
			}),
			BannerContainer = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 1),
				Position = UDim2.new(0, 0, 0, NewStatusBarHeight)
			}, p6.props.bannerContainer)
		}),
		DarkOverlay = RoactModule.createElement("TextButton", {
			Size = UDim2.new(0, p6.props.screenSize.X, 0, p6.props.screenSize.Y),
			Position = UDim2.new(0, -p6.state.absolutePosition.X, 0, -p6.state.absolutePosition.Y),
			AutoButtonColor = false,
			BackgroundColor3 = p7.Theme.Overlay.Color,
			BackgroundTransparency = 1,
			Text = "",
			Visible = p6.state.isSearching,
			[RoactModule.Event.Activated] = p6.cancelSearchAndEndSession,
			ZIndex = 1
		}),
		LastInputChangedListener = if FFlagEnableAppNavGamepadRemoval then nil else RoactModule.createElement(ExternalEventConnection, {
			event = UserInputService.LastInputTypeChanged,
			callback = function(LastInputType)
				-- upvalues: p6 (copy)
				p6:setState({ lastInputType = LastInputType })
			end
		}),
		SignalConnection = RoactModule.createElement(SignalConnectionModule, { signal = Signal, callback = p6.searchSignalCallback }),
		HiddenItems = p6:renderHiddenItems()
	})
end

function TopBarContainer.renderHiddenItems(p6)
	-- upvalues: RoactModule (copy)
	return RoactModule.createElement("Frame", { Visible = false }, {
		leftItem = p6.props.leftItem and (not p6:shouldShowLeftItem() and p6:renderTopBarItem(p6.props.leftItem)),
		centerItem = p6.props.centerItem and (not p6:shouldShowCenterItem() and p6:renderTopBarItem(p6.props.centerItem))
	})
end

function TopBarContainer.render(p6)
	-- upvalues: WithTopBarSearchSignalModule (copy), WithStyleFunction (copy), WithLocalizationFunction (copy)
	return WithTopBarSearchSignalModule(function(Signal)
		-- upvalues: WithStyleFunction (upval), p6 (copy), WithLocalizationFunction (upval)
		return WithStyleFunction(function(p7)
			-- upvalues: p6 (upval), WithLocalizationFunction (upval), Signal (copy)
			return WithLocalizationFunction({
				searchPlaceholderSearchGames = "Search.GlobalSearch.Example.SearchGames",
				searchPlaceholderSearchMarketplace = "Search.GlobalSearch.Example.SearchMarketplace",
				pageTitle = p6:getPageNameLocalizationKey()
			})(function(p8)
				-- upvalues: p6 (upval), Signal (upval), p7 (copy)
				return p6:renderWithProviders(Signal, p7, p8)
			end)
		end)
	end)
end

function TopBarContainer.didUpdate(p6, p7, p8)
	-- upvalues: FFlagEnableAppNavGamepadRemoval (copy), Config (copy)
	p6:updateTopBarHeight(p7, p8)
	
	if not FFlagEnableAppNavGamepadRemoval then
		local Entry = Config[p6.state.lastInputType]
		local FocusController = p6.props.focusController
		
		if p6.state.isSearching and not p8.isSearching and Entry and FocusController then
			FocusController.moveFocusTo(p6.searchBarRef)
		elseif not p6.state.isSearching and p8.isSearching and Entry and FocusController then
			FocusController.moveFocusTo(p6.searchButtonRef)
		end
	end
	p6:closeSearchBarIfLeavingPage(p7)
end

function TopBarContainer.closeSearchBarIfLeavingPage(p6, p7)
	local CurrentRoute = p6.props.currentRoute
	local CurrentRoute1 = p7.currentRoute
	
	if CurrentRoute[#CurrentRoute].name ~= CurrentRoute1[#CurrentRoute1].name and p6.state.isSearching == true then
		p6.onExitSearch()
	end
	if p6.props.avatarRoute and p7.avatarRoute and p6.props.avatarRoute.opaque.key ~= p7.avatarRoute.opaque.key and p6.state.isSearching == true then
		p6.onExitSearch()
	end
end

local _ = function(p6): boolean
	-- upvalues: UseGameDetailsPeekViewModule (copy), AppPageModule (copy)
	local Name = p6[#p6].name
	
	return if UseGameDetailsPeekViewModule() and Name == AppPageModule.GameDetail then #p6 > 1 and p6[#p6 - 1].name == AppPageModule.SearchPage else Name == AppPageModule.ProfilePlatform and (#p6 > 1 and p6[#p6 - 1].name == AppPageModule.SearchPage)
end

local _ = function(p6): boolean
	-- upvalues: AppPageModule (copy), UseGameDetailsPeekViewModule (copy)
	if p6[#p6].name == AppPageModule.SearchPage then
		return true
	else
		local Name = p6[#p6].name
		local IsNameMatch: boolean = if UseGameDetailsPeekViewModule() and Name == AppPageModule.GameDetail then #p6 > 1 and p6[#p6 - 1].name == AppPageModule.SearchPage else Name == AppPageModule.ProfilePlatform and (#p6 > 1 and p6[#p6 - 1].name == AppPageModule.SearchPage)
		
		return if IsNameMatch then true else false
	end
end

local function getCurrentOpaquePage(CurrentRoute)
	-- upvalues: AppPagePropertiesModule (copy)
	local Name = nil
	for i = #CurrentRoute, 1, -1 do
		Name = CurrentRoute[i].name
		local AppPagePropertiesModuleEntry = AppPagePropertiesModule[Name]
		
		if AppPagePropertiesModuleEntry == nil or not AppPagePropertiesModuleEntry.renderUnderlyingPage then
			return Name
		end
	end
	return nil
end

local v1: (any) -> any = RoactRoduxModule.connect(function(p6, _)
	-- upvalues: FFlagSignalsNavP3bTopBar (copy), FFlagUseNavigationSelectors (copy), Selectors (copy), AppPageModule (copy), UseGameDetailsPeekViewModule (copy), getCurrentOpaquePage (copy)
	local SelectCurrentLegacyRouteResult = if FFlagSignalsNavP3bTopBar then nil elseif FFlagUseNavigationSelectors then Selectors.selectCurrentLegacyRoute(p6) else p6.Navigation.history[#p6.Navigation.history]
	local config = {
		screenSize = p6.ScreenSize,
		formFactor = p6.FormFactor,
		currentRoute = SelectCurrentLegacyRouteResult
	}
	local ShowSearchBar = nil
	
	if FFlagSignalsNavP3bTopBar then
		ShowSearchBar = nil
	elseif SelectCurrentLegacyRouteResult[#SelectCurrentLegacyRouteResult].name == AppPageModule.SearchPage then
		ShowSearchBar = true
	else
		local Name = SelectCurrentLegacyRouteResult[#SelectCurrentLegacyRouteResult].name
		local IsNameMatch: boolean = if UseGameDetailsPeekViewModule() and Name == AppPageModule.GameDetail then #SelectCurrentLegacyRouteResult > 1 and SelectCurrentLegacyRouteResult[#SelectCurrentLegacyRouteResult - 1].name == AppPageModule.SearchPage else Name == AppPageModule.ProfilePlatform and (#SelectCurrentLegacyRouteResult > 1 and SelectCurrentLegacyRouteResult[#SelectCurrentLegacyRouteResult - 1].name == AppPageModule.SearchPage)
		ShowSearchBar = if IsNameMatch then true else false
	end
	config.showSearchBar = ShowSearchBar
	config.statusBarHeight = p6.TopBar.statusBarHeight
	config.opaquePage = if FFlagSignalsNavP3bTopBar then nil else getCurrentOpaquePage(SelectCurrentLegacyRouteResult)
	
	return config
end, function(Callback)
	-- upvalues: ConfirmSearchModule (copy), SetTopBarHeightModule (copy)
	return {
		confirmSearch = function(p6, p7)
			-- upvalues: Callback (copy), ConfirmSearchModule (upval)
			return Callback(ConfirmSearchModule(p6, p7))
		end,
		setTopBarHeight = function(p6)
			-- upvalues: Callback (copy), SetTopBarHeightModule (upval)
			return Callback(SetTopBarHeightModule(p6))
		end
	}
end)((WrapComponentModule(function(p6, p7)
	-- upvalues: GetPageMarginFunction (copy), WithGridConfigDEPRECATEDFunction (copy), LayoutConfig (copy), RoactModule (copy), CryoModule (copy)
	return WithGridConfigDEPRECATEDFunction({
		[LayoutConfig.Keys.PaddingRightItems] = 0,
		[LayoutConfig.Keys.PaddingHorizontal] = p7.sideMarginOverride or GetPageMarginFunction(p7.screenSize.X),
		[LayoutConfig.Keys.PaddingVertical] = 0
	}, LayoutConfig.Kind)(function(GridConfig)
		-- upvalues: RoactModule (upval), p6 (copy), CryoModule (upval), p7 (copy)
		return RoactModule.createElement(p6, CryoModule.Dictionary.join(p7, { gridConfig = GridConfig }))
	end)
end)(TopBarContainer)))

if FFlagSignalsNavP3bTopBar then
	local v2 = v1
	
	v1 = function(p6)
		-- upvalues: GetLegacyNavigationStore (copy), UseSignalStateFunction (copy), ReactModule (copy), v2 (copy), CryoModule (copy), AppPageModule (copy), UseGameDetailsPeekViewModule (copy), getCurrentOpaquePage (copy)
		local UseSignalStateResult = UseSignalStateFunction(GetLegacyNavigationStore(false).getCurrentLegacyRoute)
		local CreateElementFunction = ReactModule.createElement
		local UnionFunction = CryoModule.Dictionary.union
		local config = { currentRoute = UseSignalStateResult }
		local ShowSearchBar = nil
		
		if UseSignalStateResult[#UseSignalStateResult].name == AppPageModule.SearchPage then
			ShowSearchBar = true
		else
			local Name = UseSignalStateResult[#UseSignalStateResult].name
			local IsNameMatch: boolean = if UseGameDetailsPeekViewModule() and Name == AppPageModule.GameDetail then #UseSignalStateResult > 1 and UseSignalStateResult[#UseSignalStateResult - 1].name == AppPageModule.SearchPage else Name == AppPageModule.ProfilePlatform and (#UseSignalStateResult > 1 and UseSignalStateResult[#UseSignalStateResult - 1].name == AppPageModule.SearchPage)
			ShowSearchBar = if IsNameMatch then true else false
		end
		config.showSearchBar = ShowSearchBar
		config.opaquePage = getCurrentOpaquePage(UseSignalStateResult)
		
		return CreateElementFunction(v2, UnionFunction(p6, config))
	end
end
local WithAvatarRouteModuleResult = WithAvatarRouteModule(RoactNavigationModule.withNavigation((RoactAppPolicy.connect(function(p6, _)
	return {
		enableNotifications = p6.getNotifications(),
		enableSearch = p6.getSearchBar(),
		enableSearchAutoComplete = p6.getSearchAutoComplete()
	}
end)((RoactServices.connect({
	analytics = RoactAnalyticsTopBarModule,
	sessionService = AppSessionService,
	eventIngest = AppEventIngestServiceModule
})(v1))))), { required = false })

if not LuaAppEnableSlpForVr and FFlagSearchOmniAutocompletePageIXP then
	WithAvatarRouteModuleResult = RoactAppExperimentModule.connectUserLayer({ LuaAppSlpIxpLayer }, function(p6, _)
		-- upvalues: LuaAppSlpIxpLayer (copy)
		return {
			shouldShowSearchLandingPage = (p6[LuaAppSlpIxpLayer] or {}).shouldShowSearchLandingPage
		}
	end, false)(WithAvatarRouteModuleResult)
end
local WithAvatarRouteModuleResult1 = WithAvatarRouteModuleResult

local function v85(p6)
	-- upvalues: UseBannerContainerModule (copy), UseIsSpatialFunction (copy), UseTokensFunction (copy), FFlagEnableAppNavGamepadRemoval (copy), RoactModule (copy), WithAvatarRouteModuleResult1 (copy), CryoModule (copy), RoactGamepadModule (copy)
	local UseBannerContainerModuleResult, UseBannerContainerModuleResult2 = UseBannerContainerModule(p6.hideSiteMessageBanner)
	local UseIsSpatialResult = UseIsSpatialFunction()
	local UseTokensResult = UseTokensFunction()
	
	return if FFlagEnableAppNavGamepadRemoval then RoactModule.createElement(WithAvatarRouteModuleResult1, CryoModule.Dictionary.join(p6, {
		bannerContainer = UseBannerContainerModuleResult,
		totalBannerHeight = UseBannerContainerModuleResult2,
		isSpatial = UseIsSpatialResult,
		tokens = UseTokensResult
	})) else RoactGamepadModule.withFocusController(function(FocusController)
		-- upvalues: RoactModule (upval), WithAvatarRouteModuleResult1 (upval), CryoModule (upval), p6 (copy), UseBannerContainerModuleResult (copy), UseBannerContainerModuleResult2 (copy), UseIsSpatialResult (copy), UseTokensResult (copy)
		return RoactModule.createElement(WithAvatarRouteModuleResult1, CryoModule.Dictionary.join(p6, {
			focusController = FocusController,
			bannerContainer = UseBannerContainerModuleResult,
			totalBannerHeight = UseBannerContainerModuleResult2,
			isSpatial = UseIsSpatialResult,
			tokens = UseTokensResult
		}))
	end)
end

return RoactModule.forwardRef(function(p6, ForwardRef)
	-- upvalues: RoactModule (copy), v85 (ref), CryoModule (copy)
	return RoactModule.createElement(v85, CryoModule.Dictionary.join(p6, { forwardRef = ForwardRef }))
end)