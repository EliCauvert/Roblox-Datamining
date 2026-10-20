local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local CryoModule = require(Parent1.Cryo)
local SignalsReactModule = require(Parent1.SignalsReact)
local FoundationModule = require(Parent1.Foundation)
local ReactOtterModule = require(Parent1.ReactOtter)
local CreateSignalMapFunction = require(Parent1.CoreScriptsRoactCommon).Utilities.createSignalMap
local _ = require(Parent1.LeaderboardStore)
local View = FoundationModule.View
local ScrollView = FoundationModule.ScrollView
local UseTokensFunction = FoundationModule.Hooks.useTokens
local PanelContentHeightStoreModule = require(Parent.Common.PanelContentHeightStore)
local UseReportPanelContentHeightModule = require(Parent.Hooks.useReportPanelContentHeight)
local UsePreferredBackgroundStyleModule = require(Parent.Hooks.usePreferredBackgroundStyle)
local UseLeaderboardStoreModule = require(Parent.Hooks.useLeaderboardStore)
local UsePanelLayoutModule = require(Parent.Hooks.usePanelLayout)
local UsePlatformLeaderboardModule = require(Parent.Hooks.usePlatformLeaderboard)
local UseSlideOpenCloseAnimationModule = require(Parent.Hooks.useSlideOpenCloseAnimation)
local UseSlideOpenCloseAnimationFunction = UseSlideOpenCloseAnimationModule.useSlideOpenCloseAnimation
local PANELSLIDECONFIG = UseSlideOpenCloseAnimationModule.PANEL_SLIDE_CONFIG
local PANELZOOMCONFIG = UseSlideOpenCloseAnimationModule.PANEL_ZOOM_CONFIG
local MOBILEZOOMSPRING = UseSlideOpenCloseAnimationModule.MOBILE_ZOOM_SPRING
local MENUZOOMCLOSEDSCALE = UseSlideOpenCloseAnimationModule.MENU_ZOOM_CLOSED_SCALE
local PANELRECESSSCALE = UseSlideOpenCloseAnimationModule.PANEL_RECESS_SCALE
local PANELRECESSTRANSPARENCY = UseSlideOpenCloseAnimationModule.PANEL_RECESS_TRANSPARENCY
local ComputeStatColumnsModule = require(Parent.Common.computeStatColumns)
local PlayerListVisibilityStoreModule = require(Parent.Common.PlayerListVisibilityStore)
local PlayerContextualMenuStoreModule = require(Parent.Common.PlayerContextualMenuStore)
local ToggleContextMenu = PlayerContextualMenuStoreModule.toggleContextMenu
local ConstantsModule = require(Parent.Common.Constants)
local PanelHeaderModule = require(Parent.Components.Presentation.PanelHeader)
local ColumnHeaderRowModule = require(Parent.Components.Presentation.ColumnHeaderRow)
local TeamListViewModule = require(Parent.Components.Presentation.TeamListView)
local ConsoleFocusScrollViewModule = require(Parent.Components.Presentation.ConsoleFocusScrollView)
local EntryViewModule = require(Parent.Components.Presentation.EntryView)
local TabbedLeaderboardBodyModule = require(Parent.Components.Presentation.TabbedLeaderboardBody)
local FFlagPlayerListReskinModule = require(Parent.Flags.FFlagPlayerListReskin)
local FallbackSignalsModule = require(Parent.Common.FallbackSignals)
local SignalMap = CreateSignalMapFunction()
local SignalMap1 = CreateSignalMapFunction()

local function wrapWithSlide(PanelContent, Position, XOffset, YOffset)
	-- upvalues: ReactModule (copy), View (copy)
	return if Position == nil then PanelContent else ReactModule.createElement(View, { Size = UDim2.fromOffset(XOffset, YOffset) }, {
		SlideOffset = ReactModule.createElement(View, { tag = "size-full", Position = Position }, { PanelContent = PanelContent })
	})
end

local function createZoomDecorations(Scale, Transparency, p1)
	-- upvalues: ReactModule (copy)
	if Scale == nil then
		return nil
	end
	local config = {
		UIScale = ReactModule.createElement("UIScale", { Scale = Scale })
	}
	
	if Transparency ~= nil then
		config.UIStroke = ReactModule.createElement("UIStroke", {
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			Color = p1.Color.Stroke.Default.Color3,
			Transparency = Transparency,
			Thickness = p1.Stroke.Standard
		})
	end
	return config
end

local function renderWithSlideAndZoomDecorations(TabbedLeaderboardBodyModule, UseMemoResult, p1, SlidePosition, PanelWidth, PanelHeight, p2)
	-- upvalues: CryoModule (copy), wrapWithSlide (copy), ReactModule (copy)
	return wrapWithSlide(ReactModule.createElement(TabbedLeaderboardBodyModule, UseMemoResult, if p2 == nil then p1 else CryoModule.Dictionary.join(p1, p2)), SlidePosition, PanelWidth, PanelHeight)
end

local function PlayerListPanelContent(p1)
	-- upvalues: UseLeaderboardStoreModule (copy), SignalMap (copy), SignalMap1 (copy), SignalsReactModule (copy), FFlagPlayerListReskinModule (copy), UsePlatformLeaderboardModule (copy), FallbackSignalsModule (copy), UsePanelLayoutModule (copy), UseTokensFunction (copy), UsePreferredBackgroundStyleModule (copy), PlayerListVisibilityStoreModule (copy), ReactModule (copy), PlayerContextualMenuStoreModule (copy), ToggleContextMenu (copy), ReactOtterModule (copy), MOBILEZOOMSPRING (copy), MENUZOOMCLOSEDSCALE (copy), PANELRECESSSCALE (copy), PANELRECESSTRANSPARENCY (copy), createZoomDecorations (copy), UseReportPanelContentHeightModule (copy), PanelContentHeightStoreModule (copy), ComputeStatColumnsModule (copy), ConstantsModule (copy), ConsoleFocusScrollViewModule (copy), TeamListViewModule (copy), ScrollView (copy), EntryViewModule (copy), ColumnHeaderRowModule (copy), PanelHeaderModule (copy), FoundationModule (copy), View (copy), renderWithSlideAndZoomDecorations (copy), TabbedLeaderboardBodyModule (copy)
	local IsIsSmallTouchDevice = p1.isSmallTouchDevice == true
	local Title = p1.title
	local PlatformLeaderboardOverride = p1.platformLeaderboardOverride
	local UseLeaderboardStoreModuleResult = UseLeaderboardStoreModule()
	local LocalPlayerOverride = p1.localPlayerOverride or game:GetService("Players").LocalPlayer
	local TeamList = if UseLeaderboardStoreModuleResult then UseLeaderboardStoreModuleResult.getTeamList() else SignalMap
	local GameStatsList = if UseLeaderboardStoreModuleResult then UseLeaderboardStoreModuleResult.getGameStatsList() else SignalMap1
	local UseSignalStateResult = SignalsReactModule.useSignalState(TeamList.getAllData)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(GameStatsList.getAllData)
	local Count: number = GameStatsList.getCount(false)
	local PlatformLeaderboardOverride1 = if FFlagPlayerListReskinModule then PlatformLeaderboardOverride or UsePlatformLeaderboardModule() else nil
	local GetHasActiveLeaderboard = if PlatformLeaderboardOverride1 then PlatformLeaderboardOverride1.getHasActiveLeaderboard else FallbackSignalsModule.getHasActiveLeaderboard
	local UsePanelLayoutModuleResult = UsePanelLayoutModule(IsIsSmallTouchDevice, Count, if FFlagPlayerListReskinModule then SignalsReactModule.useSignalState(GetHasActiveLeaderboard) else false)
	local UseTokensResult = UseTokensFunction()
	local UsePreferredBackgroundStyleModuleResult = UsePreferredBackgroundStyleModule(UseTokensResult.Color.OverMedia.OverMedia_200)
	local UseSignalStateResult2 = SignalsReactModule.useSignalState(PlayerListVisibilityStoreModule.getEffectiveVisible)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: PlayerListVisibilityStoreModule (upval), PlayerContextualMenuStoreModule (upval)
		if PlayerListVisibilityStoreModule.getEffectiveVisible(false) then
			PlayerContextualMenuStoreModule.closeContextMenu()
			PlayerListVisibilityStoreModule.setVisible(false)
			
			return
		end
	end, {})
	local ToggleContextMenu1 = if UseSignalStateResult2 then ToggleContextMenu else nil
	local HasUseSignalStateResult = SignalsReactModule.useSignalState(PlayerContextualMenuStoreModule.getMenuData) ~= nil
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(0)
	ReactModule.useEffect(function()
		-- upvalues: IsIsSmallTouchDevice (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), HasUseSignalStateResult (copy), MOBILEZOOMSPRING (upval)
		if IsIsSmallTouchDevice then
			UseAnimatedBindingResult2(ReactOtterModule.spring(if HasUseSignalStateResult then 1 else 0, MOBILEZOOMSPRING))
			
			return
		end
	end, { HasUseSignalStateResult, IsIsSmallTouchDevice })
	local OpenCloseOffset = p1.openCloseOffset
	local HasOpenCloseOffset: boolean = IsIsSmallTouchDevice and OpenCloseOffset ~= nil
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: HasOpenCloseOffset (copy), OpenCloseOffset (copy), ReactModule (upval), UseAnimatedBindingResult (copy), PANELRECESSTRANSPARENCY (upval)
		return if HasOpenCloseOffset and OpenCloseOffset ~= nil then ReactModule.joinBindings({ OpenCloseOffset, UseAnimatedBindingResult }):map(function(Entry): number
			-- upvalues: PANELRECESSTRANSPARENCY (upval)
			return 1 - (1 - Entry[1]) * (1 - PANELRECESSTRANSPARENCY * Entry[2])
		end) else nil
	end, {
		HasOpenCloseOffset,
		OpenCloseOffset,
		UseAnimatedBindingResult
	})
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: UseMemoResult (copy), UseTokensResult (copy)
		if UseMemoResult == nil then
			return nil
		else
			local Transparency = UseTokensResult.Color.Stroke.Default.Transparency
			
			return UseMemoResult:map(function(p2): number
				-- upvalues: Transparency (copy)
				return Transparency + (1 - Transparency) * p2
			end)
		end
	end, {
		UseMemoResult,
		UseTokensResult.Color.Stroke.Default.Transparency
	})
	local ZoomDecorations = createZoomDecorations(ReactModule.useMemo(function()
		-- upvalues: HasOpenCloseOffset (copy), OpenCloseOffset (copy), ReactModule (upval), UseAnimatedBindingResult (copy), MENUZOOMCLOSEDSCALE (upval), PANELRECESSSCALE (upval)
		return if HasOpenCloseOffset and OpenCloseOffset ~= nil then ReactModule.joinBindings({ OpenCloseOffset, UseAnimatedBindingResult }):map(function(Entry): number
			-- upvalues: MENUZOOMCLOSEDSCALE (upval), PANELRECESSSCALE (upval)
			return (1 + (MENUZOOMCLOSEDSCALE - 1) * Entry[1]) * (1 - (1 - PANELRECESSSCALE) * Entry[2])
		end) else nil
	end, {
		HasOpenCloseOffset,
		OpenCloseOffset,
		UseAnimatedBindingResult
	}), UseMemoResult1, UseTokensResult)
	local UseReportPanelContentHeightModuleResult = UseReportPanelContentHeightModule(UsePanelLayoutModuleResult.columnHeaderHeight)
	ReactModule.useEffect(function()
		-- upvalues: PanelContentHeightStoreModule (upval)
		return function()
			-- upvalues: PanelContentHeightStoreModule (upval)
			PanelContentHeightStoreModule.reset()
		end
	end, {})
	local IsCountAbove: boolean = if IsIsSmallTouchDevice and LocalPlayerOverride ~= nil and UseLeaderboardStoreModuleResult ~= nil then TeamList.getCount(false) > 0 or Count > 0 else false
	local MaxStatColumns = UsePanelLayoutModuleResult.maxStatColumns
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: ComputeStatColumnsModule (upval), GameStatsList (copy), MaxStatColumns (copy)
		return ComputeStatColumnsModule(GameStatsList, MaxStatColumns)
	end, { UseSignalStateResult1, GameStatsList, MaxStatColumns })
	local HasNonNeutralTeams = false
	
	if UseLeaderboardStoreModuleResult then
		for i, value in pairs(UseSignalStateResult) do
			if value and i ~= "Neutral" then
				HasNonNeutralTeams = true
				break
			end
		end
	end
	local ScrollViewProps = {
		LayoutOrder = 2,
		tag = "fill size-full-0",
		layout = {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left
		},
		scroll = {
			AutomaticCanvasSize = nil,
			ScrollingDirection = Enum.ScrollingDirection.Y
		},
		scrollingFrameRef = UseReportPanelContentHeightModuleResult,
		selectionGroup = ConstantsModule.CONSOLE_FOCUS_SCROLL_ESCAPE_UP,
		selection = ConstantsModule.NOT_SELECTABLE
	}
	local Element = nil
	
	if UseLeaderboardStoreModuleResult then
		Element = ReactModule.createElement(ConsoleFocusScrollViewModule, {
			allTeams = UseSignalStateResult,
			hasNonNeutralTeams = HasNonNeutralTeams,
			leaderboardStore = UseLeaderboardStoreModuleResult,
			statColumns = UseMemoResult2,
			statWidth = UsePanelLayoutModuleResult.statWidth,
			rowHeight = UsePanelLayoutModuleResult.rowHeight,
			columnHeaderHeight = UsePanelLayoutModuleResult.columnHeaderHeight,
			localPlayer = LocalPlayerOverride,
			scrollViewProps = ScrollViewProps,
			onActivated = ToggleContextMenu1
		})
	else
		local Elements = {}
		
		if UseLeaderboardStoreModuleResult then
			for i1, TeamEntry in pairs(UseSignalStateResult) do
				if TeamEntry then
					Elements[`Team_{tostring(i1)}`] = ReactModule.createElement(TeamListViewModule, {
						teamEntry = TeamEntry,
						isNeutral = i1 == "Neutral",
						hasNonNeutralTeams = HasNonNeutralTeams,
						leaderboardStore = UseLeaderboardStoreModuleResult,
						statColumns = UseMemoResult2,
						statWidth = UsePanelLayoutModuleResult.statWidth,
						rowHeight = UsePanelLayoutModuleResult.rowHeight,
						columnHeaderHeight = UsePanelLayoutModuleResult.columnHeaderHeight,
						onActivated = ToggleContextMenu1,
						localPlayer = LocalPlayerOverride
					})
				end
			end
		end
		Element = ReactModule.createElement(ScrollView, ScrollViewProps, Elements)
	end
	local config = {
		StickySelfRow = if IsCountAbove then ReactModule.createElement(EntryViewModule, {
			isCurrentUser = true,
			layoutOrder = 0,
			player = LocalPlayerOverride,
			leaderboardStore = UseLeaderboardStoreModuleResult,
			statColumns = UseMemoResult2,
			statWidth = UsePanelLayoutModuleResult.statWidth,
			rowHeight = UsePanelLayoutModuleResult.rowHeight,
			onActivated = ToggleContextMenu1
		}) else nil,
		ColumnHeaders = ReactModule.createElement(ColumnHeaderRowModule, {
			layoutOrder = 1,
			statColumns = UseMemoResult2,
			statWidth = UsePanelLayoutModuleResult.statWidth,
			headerHeight = UsePanelLayoutModuleResult.columnHeaderHeight
		}),
		PlayerRows = Element
	}
	local NoUseMemoResult = UseMemoResult1 == nil
	local UseMemoResult3 = ReactModule.useMemo(function()
		-- upvalues: UsePanelLayoutModuleResult (copy), NoUseMemoResult (copy), UsePreferredBackgroundStyleModuleResult (copy), UseMemoResult (copy), ConstantsModule (upval)
		return {
			Visible = true,
			Size = UDim2.fromOffset(UsePanelLayoutModuleResult.panelWidth, UsePanelLayoutModuleResult.panelHeight),
			tag = {
				["col radius-medium"] = true,
				["stroke-standard stroke-default"] = NoUseMemoResult
			},
			backgroundStyle = UsePreferredBackgroundStyleModuleResult,
			GroupTransparency = UseMemoResult,
			selectionGroup = ConstantsModule.CONSOLE_FOCUS_ISOLATE,
			selection = ConstantsModule.NOT_SELECTABLE
		}
	end, {
		UsePanelLayoutModuleResult.panelWidth,
		UsePanelLayoutModuleResult.panelHeight,
		NoUseMemoResult,
		UsePreferredBackgroundStyleModuleResult,
		UseMemoResult
	})
	local Element1 = ReactModule.createElement(PanelHeaderModule, {
		layoutOrder = 1,
		onClose = UseResult,
		isDisabled = not UseSignalStateResult2,
		height = UsePanelLayoutModuleResult.headerHeight,
		title = Title
	})
	local Element11 = ReactModule.createElement(FoundationModule.Divider, { LayoutOrder = 2 })
	
	return if FFlagPlayerListReskinModule then renderWithSlideAndZoomDecorations(TabbedLeaderboardBodyModule, {
		serverBody = ReactModule.createElement(View, { LayoutOrder = 4, tag = "col fill size-full-0" }, config),
		panelHeader = Element1,
		panelDivider = Element11,
		panelProps = UseMemoResult3
	}, {}, p1.slidePosition, UsePanelLayoutModuleResult.panelWidth, UsePanelLayoutModuleResult.panelHeight, ZoomDecorations) else renderWithSlideAndZoomDecorations(View, UseMemoResult3, {
		Header = Element1,
		HeaderDivider = Element11,
		LeaderboardBody = ReactModule.createElement(View, { LayoutOrder = 3, tag = "col fill size-full-0" }, config)
	}, p1.slidePosition, UsePanelLayoutModuleResult.panelWidth, UsePanelLayoutModuleResult.panelHeight, ZoomDecorations)
end

return ReactModule.memo(function(p2)
	-- upvalues: SignalsReactModule (copy), PlayerListVisibilityStoreModule (copy), UseSlideOpenCloseAnimationFunction (copy), PANELZOOMCONFIG (copy), PANELSLIDECONFIG (copy), ReactModule (copy), PlayerListPanelContent (copy)
	local IsIsSmallTouchDevice = p2.isSmallTouchDevice == true
	local UseSlideOpenCloseAnimationResult = UseSlideOpenCloseAnimationFunction(SignalsReactModule.useSignalState(PlayerListVisibilityStoreModule.getEffectiveVisible), if IsIsSmallTouchDevice then PANELZOOMCONFIG else PANELSLIDECONFIG)
	
	return if UseSlideOpenCloseAnimationResult.shouldMount then ReactModule.createElement(PlayerListPanelContent, {
		isSmallTouchDevice = p2.isSmallTouchDevice,
		title = p2.title,
		localPlayerOverride = p2.localPlayerOverride,
		platformLeaderboardOverride = p2.platformLeaderboardOverride,
		slidePosition = if IsIsSmallTouchDevice then nil else UseSlideOpenCloseAnimationResult.position,
		openCloseOffset = if IsIsSmallTouchDevice then UseSlideOpenCloseAnimationResult.offset else nil
	}) else nil
end)