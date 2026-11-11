local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local ReactModule = require(CorePackages.Packages.React)
local CryoModule = require(CorePackages.Packages.Cryo)
local SignalsReactModule = require(CorePackages.Packages.SignalsReact)
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage
local PeekViewState = require(CorePackages.Workspace.Packages.PeekView).PeekViewState
local PeekViewWithTopBar = require(CorePackages.Workspace.Packages.PeekView).PeekViewWithTopBar
local SessionType = require(CorePackages.Workspace.Packages.RobloxAppSessionization).SessionType
local GetSafeAreaSizeFunction = require(CorePackages.Workspace.Packages.InputUi).getSafeAreaSize
local RoactAppExperimentModule = require(CorePackages.Packages.RoactAppExperiment)
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local RoactNavigationModule = require(CorePackages.Packages.RoactNavigation)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local AppEventIngestService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppEventIngestService
local AppSessionService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppSessionService
local PeekViewDismissedEvent = require(CorePackages.Workspace.Packages.PeekView).analytics.peekViewDismissedEvent
local DiscoveryTypesModule = require(CorePackages.Workspace.Packages.DiscoveryTypes)
local EnumGameDetailErrorTypes = DiscoveryTypesModule.EnumGameDetailErrorTypes
local Selectors = require(CorePackages.Workspace.Packages.NavigationRodux).Selectors
local SetTabBarVisibleFunction = require(CorePackages.Workspace.Packages.AppTabBarRodux).Actions.SetTabBarVisible
local GameDetailsPeekViewEventsFunction = require(CorePackages.Workspace.Packages.DiscoveryAnalytics).Events.gameDetailsPeekViewEvents
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ConstantsModule = require(Modules.LuaApp.Constants)
local SetGameDetailsPeekViewStateModule = require(Modules.LuaApp.Actions.Games.SetGameDetailsPeekViewState)
local GameDetailsTopBarModule = require(Modules.LuaApp.Components.GameDetails.GameDetailsTopBar)
local ActionBarModule = require(Modules.LuaApp.Components.GameDetails.ActionBar)
local GameDetailsCardModule = require(Modules.LuaApp.Components.GameDetails.GameDetailsCard)
local ExperienceDetailsExperimentationModule = require(Modules.LuaApp.Components.ExperienceDetails.ExperienceDetailsExperimentation)
local UseEdpPerUniverseVisibilityVariablesForUniverseModule = require(Modules.LuaApp.Components.ExperienceDetails.Hooks.useEdpPerUniverseVisibilityVariablesForUniverse)
local AgeCheckUpsellRenderedData = require(CorePackages.Workspace.Packages.GameDetail).AgeCheckUpsellRenderedData
local GetFFlagIsSquadEnabledFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagIsSquadEnabled
local EnableGameDetailsFullViewIXP = game:DefineFastFlag("EnableGameDetailsFullViewIXP", false)
local ForceEnableGameDetailsFullView = game:DefineFastFlag("ForceEnableGameDetailsFullView", false)
local FFlagLuaAppEdpBackendV2HydrateLegacyIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp
local SduiSocialProofRaisePeekViewBriefHeightIxp = game:DefineFastFlag("SduiSocialProofRaisePeekViewBriefHeightIxp", false)
local SduiSocialProofRaisePeekViewBriefHeightDefault = game:DefineFastFlag("SduiSocialProofRaisePeekViewBriefHeightDefault", false)
local FFlagSduiAgeCheckUpsellRaisePeekViewBriefHeight = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSduiAgeCheckUpsellRaisePeekViewBriefHeight
local FFlagLuaAppExpandableTextImpressionsEnabled = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppExpandableTextImpressionsEnabled
local FFlagUseNavigationSelectors = require(CorePackages.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors
local FFlagSignalsNavP3fGameDetails = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3fGameDetails
local FFlagUseSignalsForSearchBar = require(CorePackages.Workspace.Packages.SharedFlags).FFlagUseSignalsForSearchBar
local UseSignalState = require(CorePackages.Packages.SignalsReact).useSignalState
local GetLegacyNavigationStore = if FFlagSignalsNavP3fGameDetails then require(CorePackages.Workspace.Packages.NavigationRodux).GetLegacyNavigationStore else nil
local GetSearchBarStore = require(CorePackages.Workspace.Packages.SearchBarStore).GetSearchBarStore
local FFlagEnablePlayWithRewardComponent = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnablePlayWithRewardComponent
local FFlagLuaAppEdpPeekViewReserveBottomDockHeight = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpPeekViewReserveBottomDockHeight
local FFlagLuaAppEdpHideSystemBarOnPeekViewMount = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpHideSystemBarOnPeekViewMount
local FFlagLuaAppExtendPlayWithRewardPeekView = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppExtendPlayWithRewardPeekView
local GAMEDETAILSACTIONBARHEIGHT: number = DiscoveryTypesModule.Constants.GAME_DETAILS_ACTION_BAR_HEIGHT
local SduiAgeCheckUpsellRowHeight = game:DefineFastInt("SduiAgeCheckUpsellRowHeight", 70)
local NewGAMEDETAILSACTIONBARHEIGHT = if FFlagLuaAppEdpPeekViewReserveBottomDockHeight then GAMEDETAILSACTIONBARHEIGHT + 40 + 10 else nil

local function _(p1: number): number
	return if p1 < 600 then 20 else 40
end

local GameDetailsPeekView = RoactModule.PureComponent:extend("GameDetailsPeekView")

function GameDetailsPeekView.init(p1)
	-- upvalues: RoactModule (copy), PeekViewDismissedEvent (copy), AppPage (copy), SessionType (copy), PeekViewState (copy), GameDetailsPeekViewEventsFunction (copy)
	p1.state = { topBarOpacity = 0 }
	p1.actionBarRef = RoactModule.createRef()
	p1.transitionPercent, p1.setTransitionPercent = RoactModule.createBinding(0)
	
	function p1.briefToFullTransitionPercent(TopBarOpacity)
		-- upvalues: p1 (copy)
		p1:setState({ topBarOpacity = TopBarOpacity })
	end
	
	function p1.getPeekViewEventMeta()
		-- upvalues: p1 (copy)
		return {
			universeId = p1.props.universeId,
			source = p1.props.source or "None",
			index = p1.props.index or -1
		}
	end
	
	function p1.eventTopBarClosePeekView()
		-- upvalues: p1 (copy), PeekViewDismissedEvent (upval)
		local PeekViewEventMeta = p1.getPeekViewEventMeta()
		PeekViewDismissedEvent.logEvent(p1.props.eventIngest, "ProfilePeekView", {
			dismissMethod = PeekViewDismissedEvent.dismissMethodEnum.topBarTap,
			page = p1.props.navigation.state.routeName,
			locale = PeekViewEventMeta.RobloxLocaleId,
			universeId = PeekViewEventMeta.universeId,
			source = PeekViewEventMeta.source or "None",
			index = PeekViewEventMeta.index or -1
		})
	end
	
	function p1.closeGameDetailsPeekViewInNavigation(p2)
		-- upvalues: p1 (copy), AppPage (upval), SessionType (upval)
		p1.props.navigation.clearAppScreens({ AppPage.GameDetail })
		
		if p1.props.onClose ~= nil then
			p1.props.onClose()
		end
		if p1.props.onPeekViewClosed and (not p2 or not p2.backButtonNavigation) then
			p1.props.onPeekViewClosed()
		end
		p1.props.sessionService:RemoveSession(SessionType.StructuralIdentifier.GameDetailSource)
	end
	
	function p1.viewStateChanged(Brief, Brief1)
		-- upvalues: PeekViewState (upval), p1 (copy)
		if Brief == PeekViewState.Brief then
			local GameDetailsPeekViewState = p1.props.gameDetailsPeekViewState
			
			if GameDetailsPeekViewState == PeekViewState.Brief then
				p1.eventSwitchGame()
			elseif GameDetailsPeekViewState == PeekViewState.Closed then
				p1.eventOpenPeekView()
			end
		end
		p1.props.setGameDetailsPeekViewState(Brief)
		
		if Brief == PeekViewState.Closed then
			p1.closeGameDetailsPeekViewInNavigation()
			
			return
		end
		if Brief1 == PeekViewState.Brief and Brief == PeekViewState.Full then
			p1.eventGoToFullView()
		end
	end
	
	function p1.eventOpenPeekView()
		-- upvalues: p1 (copy), GameDetailsPeekViewEventsFunction (upval)
		GameDetailsPeekViewEventsFunction(p1.props.eventIngest, "OpenPeekView", p1.props.universeId, p1.props.source or "None", p1.props.index or -1)
	end
	
	function p1.eventSwitchGame()
		-- upvalues: p1 (copy), GameDetailsPeekViewEventsFunction (upval)
		GameDetailsPeekViewEventsFunction(p1.props.eventIngest, "SwitchGame", p1.props.universeId, p1.props.source or "None", p1.props.index or -1)
	end
	
	function p1.eventGoToFullView()
		-- upvalues: p1 (copy), GameDetailsPeekViewEventsFunction (upval)
		GameDetailsPeekViewEventsFunction(p1.props.eventIngest, "GoToFullView", p1.props.universeId, p1.props.source or "None", p1.props.index or -1)
	end
end

if FFlagLuaAppEdpHideSystemBarOnPeekViewMount then
	function GameDetailsPeekView.didMount(p1)
		p1.props.setTabBarVisible(false)
	end
end
function GameDetailsPeekView.willUnmount(p1)
	-- upvalues: AppPage (copy), PeekViewState (copy)
	if (function(_): boolean
		-- upvalues: p1 (copy), AppPage (upval)
		local History = p1.props.history
		local HistoryEntry = History[#History]
		local Count = 0
		
		for i = 1, #HistoryEntry do
			if HistoryEntry[i].name == AppPage.GameDetail then
				Count += 1
				
				if Count > 1 then
					return false
				end
			end
		end
		return true
	end)(p1.props.universeId) then
		p1.props.setGameDetailsPeekViewState(PeekViewState.Closed)
	end
	if p1.props.onClose ~= nil then
		p1.props.onClose()
	end
end

function GameDetailsPeekView.render(p2)
	-- upvalues: ConstantsModule (copy), GetSafeAreaSizeFunction (copy), EnableGameDetailsFullViewIXP (copy), ForceEnableGameDetailsFullView (copy), PeekViewState (copy), FFlagLuaAppEdpPeekViewReserveBottomDockHeight (copy), NewGAMEDETAILSACTIONBARHEIGHT (ref), GAMEDETAILSACTIONBARHEIGHT (copy), SduiSocialProofRaisePeekViewBriefHeightIxp (copy), ExperienceDetailsExperimentationModule (copy), SduiSocialProofRaisePeekViewBriefHeightDefault (copy), FFlagSduiAgeCheckUpsellRaisePeekViewBriefHeight (copy), SduiAgeCheckUpsellRowHeight (copy), FFlagLuaAppExtendPlayWithRewardPeekView (copy), RoactModule (copy), PeekViewWithTopBar (copy), ActionBarModule (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy), GameDetailsCardModule (copy), FFlagEnablePlayWithRewardComponent (copy), FFlagLuaAppExpandableTextImpressionsEnabled (copy), GameDetailsTopBarModule (copy)
	local UniverseId = p2.props.universeId
	local ExperienceJoinData = p2.props.experienceJoinData
	local NewStatusBarHeight = p2.props.statusBarHeight + ConstantsModule.NAV_BAR_SIZE
	local GameDetailsPeekViewState = p2.props.gameDetailsPeekViewState
	local SafeAreaSize = GetSafeAreaSizeFunction(p2.props.screenSize, p2.props.globalGuiInset)
	local Smallest = math.min(SafeAreaSize.X.Offset, 640)
	local LeftPadding: number = if Smallest < 600 then 20 else 40
	local MountAsFullView = p2.props.mountAsFullView
	local IsExperienceUnavailable = p2.props.isExperienceUnavailable
	
	if MountAsFullView == nil then
		MountAsFullView = if EnableGameDetailsFullViewIXP and p2.props.defaultMountAsFullView then true elseif ForceEnableGameDetailsFullView then true else GameDetailsPeekViewState == PeekViewState.Full or GameDetailsPeekViewState == PeekViewState.Extended
	end
	local MountAnimation = p2.props.mountAnimation
	
	if MountAnimation == nil then
		MountAnimation = GameDetailsPeekViewState == PeekViewState.Closed
	end
	local Y = p2.actionBarRef.current and p2.actionBarRef.current.AbsoluteSize.Y or (if FFlagLuaAppEdpPeekViewReserveBottomDockHeight then NewGAMEDETAILSACTIONBARHEIGHT else GAMEDETAILSACTIONBARHEIGHT)
	local NewLeftPadding: number = if SduiSocialProofRaisePeekViewBriefHeightIxp and ExperienceDetailsExperimentationModule.getShouldRaisePeekViewBriefHeight() then 24 + LeftPadding elseif SduiSocialProofRaisePeekViewBriefHeightDefault then 24 + LeftPadding else 0
	local NewSduiAgeCheckUpsellRowHeight: number = if FFlagSduiAgeCheckUpsellRaisePeekViewBriefHeight and p2.props.isAgeCheckUpsellRendered then SduiAgeCheckUpsellRowHeight + LeftPadding else 0
	local NewPlayWithRewardPeekViewOffset = if FFlagLuaAppExtendPlayWithRewardPeekView then if p2.props.playWithRewardPeekViewOffset and p2.props.playWithRewardPeekViewOffset > 0 then p2.props.playWithRewardPeekViewOffset + LeftPadding else 0 else nil
	local Smallest1 = if FFlagLuaAppExtendPlayWithRewardPeekView then math.min(Smallest + GAMEDETAILSACTIONBARHEIGHT + NewLeftPadding + NewSduiAgeCheckUpsellRowHeight + NewPlayWithRewardPeekViewOffset, (math.floor((SafeAreaSize.Y.Offset - NewStatusBarHeight) * 0.9))) else nil
	
	return RoactModule.createElement(PeekViewWithTopBar, {
		topBarHeight = NewStatusBarHeight,
		bottomDockedContainerHeight = Y,
		fullViewContentHeight = UDim.new(1, -NewStatusBarHeight),
		briefViewContentHeight = UDim.new(0, if FFlagLuaAppExtendPlayWithRewardPeekView then Smallest1 else Smallest + GAMEDETAILSACTIONBARHEIGHT + NewLeftPadding + NewSduiAgeCheckUpsellRowHeight),
		onViewStateChanged = p2.viewStateChanged,
		viewChangedEventMeta = p2.getPeekViewEventMeta(),
		mountAsFullView = MountAsFullView,
		mountAnimation = MountAnimation,
		transitionPercentCallback = p2.setTransitionPercent,
		bottomBarSlot = if IsExperienceUnavailable then nil else RoactModule.createElement(ActionBarModule, {
			bottomPadding = 10,
			leftPadding = LeftPadding,
			rightPadding = LeftPadding,
			universeId = UniverseId,
			referralSource = p2.props.referralSource,
			experienceJoinData = ExperienceJoinData,
			placeIdOverride = p2.props.placeIdOverride,
			shouldHydrateLegacyIxp = if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then ExperienceDetailsExperimentationModule.getShouldHydrateLegacy() else nil,
			containerRef = p2.actionBarRef
		}),
		contentSlot = RoactModule.createElement(GameDetailsCardModule, {
			universeId = UniverseId,
			source = p2.props.source,
			index = p2.props.index,
			placeIdOverride = if FFlagEnablePlayWithRewardComponent then p2.props.placeIdOverride else nil,
			experienceJoinData = if FFlagEnablePlayWithRewardComponent then ExperienceJoinData else nil,
			viewportBoundsOffset = if FFlagLuaAppExpandableTextImpressionsEnabled then { min = Vector2.zero, max = Vector2.new(0, -Y) } else nil,
			onPeekViewClosed = p2.props.onPeekViewClosed
		}),
		topBarSlot = RoactModule.createElement(GameDetailsTopBarModule, {
			universeId = UniverseId,
			showCloseIcon = if p2.props.showBackButton == nil then nil else not p2.props.showBackButton,
			onCloseButtonActivated = function(p3)
				-- upvalues: p2 (copy)
				p2.eventTopBarClosePeekView()
				p2.closeGameDetailsPeekViewInNavigation(p3)
			end,
			transitionPercentBinding = p2.transitionPercent
		})
	})
end

function GameDetailsPeekView.didUpdate(p2, p3)
	if p2.props.searchBarFocused ~= p3.searchBarFocused and p2.props.searchBarFocused then
		p2.closeGameDetailsPeekViewInNavigation()
	end
end

local v1 = if FFlagSignalsNavP3fGameDetails or FFlagUseSignalsForSearchBar then function(p2)
	-- upvalues: FFlagSignalsNavP3fGameDetails (copy), UseSignalState (copy), GetLegacyNavigationStore (copy), FFlagUseSignalsForSearchBar (copy), GetSearchBarStore (copy), RoactModule (copy), v1 (copy), CryoModule (copy)
	return RoactModule.createElement(v1, CryoModule.Dictionary.union(p2, {
		history = if FFlagSignalsNavP3fGameDetails then UseSignalState(GetLegacyNavigationStore(false).getHistory) else nil,
		searchBarFocused = if FFlagUseSignalsForSearchBar then UseSignalState(GetSearchBarStore(false).getFocused) else nil
	}))
end else RoactRoduxModule.connect(function(p2, p3)
	-- upvalues: EnumGameDetailErrorTypes (copy), GetFFlagIsSquadEnabledFunction (copy), FFlagSignalsNavP3fGameDetails (copy), FFlagUseNavigationSelectors (copy), Selectors (copy), FFlagUseSignalsForSearchBar (copy)
	return {
		currentSquad = if GetFFlagIsSquadEnabledFunction() then p2.Squad and (p2.Squad.Squad and p2.Squad.Squad.currentSquad) else nil,
		history = if FFlagSignalsNavP3fGameDetails then nil elseif FFlagUseNavigationSelectors then Selectors.selectLegacyHistory(p2) else p2.Navigation.history,
		gameDetailsPeekViewState = p2.GameDetailsPeekView.viewState,
		statusBarHeight = p2.TopBar.statusBarHeight,
		screenSize = p2.ScreenSize,
		globalGuiInset = p2.GlobalGuiInset,
		searchBarFocused = if FFlagUseSignalsForSearchBar then nil else p2.SearchBar.focused,
		isExperienceUnavailable = p2.GameDetailErrors[p3.universeId] and p2.GameDetailErrors[p3.universeId].errorType == EnumGameDetailErrorTypes.ExperienceUnavailable
	}
end, function(Callback)
	-- upvalues: SetGameDetailsPeekViewStateModule (copy), FFlagLuaAppEdpHideSystemBarOnPeekViewMount (copy), SetTabBarVisibleFunction (copy)
	return {
		setGameDetailsPeekViewState = function(p2)
			-- upvalues: Callback (copy), SetGameDetailsPeekViewStateModule (upval)
			return Callback(SetGameDetailsPeekViewStateModule(p2))
		end,
		setTabBarVisible = if FFlagLuaAppEdpHideSystemBarOnPeekViewMount then function(p2)
			-- upvalues: Callback (copy), SetTabBarVisibleFunction (upval)
			return Callback(SetTabBarVisibleFunction(p2))
		end else nil
	}
end)(GameDetailsPeekView)

if EnableGameDetailsFullViewIXP then
	v1 = RoactAppExperimentModule.connectUserLayer({ AppUserLayers.ExperienceDetailsPageExposureLayer }, function(p2, _)
		-- upvalues: AppUserLayers (copy)
		return {
			defaultMountAsFullView = (p2[AppUserLayers.ExperienceDetailsPageExposureLayer] or {}).DefaultMountAsFullView
		}
	end)(v1)
end
local v2 = if FFlagSduiAgeCheckUpsellRaisePeekViewBriefHeight or FFlagLuaAppExtendPlayWithRewardPeekView then function(p2)
	-- upvalues: FFlagSduiAgeCheckUpsellRaisePeekViewBriefHeight (copy), ReactModule (copy), AgeCheckUpsellRenderedData (copy), SignalsReactModule (copy), FFlagLuaAppExtendPlayWithRewardPeekView (copy), UseEdpPerUniverseVisibilityVariablesForUniverseModule (copy), RoactModule (copy), v2 (copy), CryoModule (copy)
	local Text = if p2.universeId then tostring(p2.universeId) else nil
	local UseSignalStateResult = if FFlagSduiAgeCheckUpsellRaisePeekViewBriefHeight then SignalsReactModule.useSignalState((ReactModule.useCallback(function(p3)
		-- upvalues: AgeCheckUpsellRenderedData (upval), Text (copy)
		return AgeCheckUpsellRenderedData.getIsAgeCheckUpsellRendered(p3, Text)
	end, { Text }))) else nil
	local ExtendPlayWithRewardPeekViewOffset = nil
	
	if FFlagLuaAppExtendPlayWithRewardPeekView then
		local UseEdpPerUniverseVisibilityVariablesForUniverseModuleResult = UseEdpPerUniverseVisibilityVariablesForUniverseModule(Text or "")
		ExtendPlayWithRewardPeekViewOffset = UseEdpPerUniverseVisibilityVariablesForUniverseModuleResult and UseEdpPerUniverseVisibilityVariablesForUniverseModuleResult.extendPlayWithRewardPeekViewOffset or nil
	end
	return RoactModule.createElement(v2, CryoModule.Dictionary.join(p2, {
		isAgeCheckUpsellRendered = if FFlagSduiAgeCheckUpsellRaisePeekViewBriefHeight then UseSignalStateResult else nil,
		playWithRewardPeekViewOffset = if FFlagLuaAppExtendPlayWithRewardPeekView then ExtendPlayWithRewardPeekViewOffset else nil
	}))
end else RoactServices.connect({
	eventIngest = AppEventIngestService,
	sessionService = AppSessionService
})(v1)

return (RoactNavigationModule.withNavigation(v2))