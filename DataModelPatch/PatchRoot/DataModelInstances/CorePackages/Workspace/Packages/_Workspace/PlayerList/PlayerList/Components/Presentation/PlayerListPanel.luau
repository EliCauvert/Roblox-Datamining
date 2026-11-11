local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local SignalsReactModule = require(Parent1.SignalsReact)
local FoundationModule = require(Parent1.Foundation)
local CreateSignalMapFunction = require(Parent1.CoreScriptsRoactCommon).Utilities.createSignalMap
local _ = require(Parent1.LeaderboardStore)
local View = FoundationModule.View
local ScrollView = FoundationModule.ScrollView
local UseLeaderboardStoreModule = require(Parent.Hooks.useLeaderboardStore)
local UsePanelLayoutModule = require(Parent.Hooks.usePanelLayout)
local UsePlatformLeaderboardModule = require(Parent.Hooks.usePlatformLeaderboard)
local ComputeStatColumnsModule = require(Parent.Common.computeStatColumns)
local PlayerListVisibilityStoreModule = require(Parent.Common.PlayerListVisibilityStore)
local PlayerContextualMenuStoreModule = require(Parent.Common.PlayerContextualMenuStore)
local OpenContextMenu = PlayerContextualMenuStoreModule.openContextMenu
local PanelHeaderModule = require(Parent.Components.Presentation.PanelHeader)
local ColumnHeaderRowModule = require(Parent.Components.Presentation.ColumnHeaderRow)
local TeamListViewModule = require(Parent.Components.Presentation.TeamListView)
local TabbedLeaderboardBodyModule = require(Parent.Components.Presentation.TabbedLeaderboardBody)
local FFlagPlayerListTwoTabsModule = require(Parent.Flags.FFlagPlayerListTwoTabs)
local FallbackSignalsModule = require(Parent.Common.FallbackSignals)
local SignalMap = CreateSignalMapFunction()
local SignalMap1 = CreateSignalMapFunction()

return ReactModule.memo(function(p1)
	-- upvalues: UseLeaderboardStoreModule (copy), SignalMap (copy), SignalMap1 (copy), SignalsReactModule (copy), FFlagPlayerListTwoTabsModule (copy), UsePlatformLeaderboardModule (copy), FallbackSignalsModule (copy), UsePanelLayoutModule (copy), PlayerListVisibilityStoreModule (copy), ReactModule (copy), PlayerContextualMenuStoreModule (copy), ComputeStatColumnsModule (copy), TeamListViewModule (copy), OpenContextMenu (copy), ColumnHeaderRowModule (copy), ScrollView (copy), PanelHeaderModule (copy), FoundationModule (copy), View (copy), TabbedLeaderboardBodyModule (copy)
	local IsIsSmallTouchDevice = p1.isSmallTouchDevice == true
	local Title = p1.title
	local PlatformLeaderboardOverride = p1.platformLeaderboardOverride
	local UseLeaderboardStoreModuleResult = UseLeaderboardStoreModule()
	local LocalPlayer = game:GetService("Players").LocalPlayer
	local GameStatsList = if UseLeaderboardStoreModuleResult then UseLeaderboardStoreModuleResult.getGameStatsList() else SignalMap1
	local UseSignalStateResult = SignalsReactModule.useSignalState((if UseLeaderboardStoreModuleResult then UseLeaderboardStoreModuleResult.getTeamList() else SignalMap).getAllData)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(GameStatsList.getAllData)
	local PlatformLeaderboardOverride1 = if FFlagPlayerListTwoTabsModule then PlatformLeaderboardOverride or UsePlatformLeaderboardModule() else nil
	local GetHasActiveLeaderboard = if PlatformLeaderboardOverride1 then PlatformLeaderboardOverride1.getHasActiveLeaderboard else FallbackSignalsModule.getHasActiveLeaderboard
	local UsePanelLayoutModuleResult = UsePanelLayoutModule(IsIsSmallTouchDevice, GameStatsList.getCount(false), if FFlagPlayerListTwoTabsModule then SignalsReactModule.useSignalState(GetHasActiveLeaderboard) else false)
	local UseSignalBindingResult = SignalsReactModule.useSignalBinding(PlayerListVisibilityStoreModule.getEffectiveVisible)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: PlayerContextualMenuStoreModule (upval), PlayerListVisibilityStoreModule (upval)
		PlayerContextualMenuStoreModule.closeContextMenu()
		PlayerListVisibilityStoreModule.setVisible(false)
	end, {})
	local MaxStatColumns = UsePanelLayoutModuleResult.maxStatColumns
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: ComputeStatColumnsModule (upval), GameStatsList (copy), MaxStatColumns (copy)
		return ComputeStatColumnsModule(GameStatsList, MaxStatColumns)
	end, { UseSignalStateResult1, GameStatsList, MaxStatColumns })
	local Elements = {}
	
	if UseLeaderboardStoreModuleResult then
		local HasNonNeutralTeams = false
		
		for i, value in pairs(UseSignalStateResult) do
			if value and i ~= "Neutral" then
				HasNonNeutralTeams = true
				break
			end
		end
		for i1, TeamEntry in pairs(UseSignalStateResult) do
			if TeamEntry then
				Elements[`Team_{tostring(i1)}`] = ReactModule.createElement(TeamListViewModule, {
					teamEntry = TeamEntry,
					isNeutral = i1 == "Neutral",
					hasNonNeutralTeams = HasNonNeutralTeams,
					leaderboardStore = UseLeaderboardStoreModuleResult,
					statColumns = UseMemoResult,
					statWidth = UsePanelLayoutModuleResult.statWidth,
					rowHeight = UsePanelLayoutModuleResult.rowHeight,
					columnHeaderHeight = UsePanelLayoutModuleResult.columnHeaderHeight,
					onActivated = OpenContextMenu,
					localPlayer = LocalPlayer
				})
			end
		end
	end
	local config = {
		ColumnHeaders = ReactModule.createElement(ColumnHeaderRowModule, {
			layoutOrder = 1,
			statColumns = UseMemoResult,
			statWidth = UsePanelLayoutModuleResult.statWidth,
			headerHeight = UsePanelLayoutModuleResult.columnHeaderHeight
		}),
		PlayerRows = ReactModule.createElement(ScrollView, {
			LayoutOrder = 2,
			tag = "fill size-full-0",
			layout = {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Left
			},
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				ScrollingDirection = Enum.ScrollingDirection.Y
			},
			selectionGroup = {
				SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
				SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
				SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
				SelectionBehaviorRight = Enum.SelectionBehavior.Stop
			}
		}, Elements)
	}
	local PanelProps = {
		tag = "col radius-medium bg-over-media-200",
		Size = UDim2.fromOffset(UsePanelLayoutModuleResult.panelWidth, UsePanelLayoutModuleResult.panelHeight),
		Visible = UseSignalBindingResult
	}
	local Element = ReactModule.createElement(PanelHeaderModule, {
		layoutOrder = 1,
		onClose = UseResult,
		height = UsePanelLayoutModuleResult.headerHeight,
		title = Title
	})
	local Element1 = ReactModule.createElement(FoundationModule.Divider, { LayoutOrder = 2 })
	
	return if FFlagPlayerListTwoTabsModule then ReactModule.createElement(TabbedLeaderboardBodyModule, {
		serverBody = ReactModule.createElement(View, { LayoutOrder = 4, tag = "col fill size-full-0" }, config),
		panelHeader = Element,
		panelDivider = Element1,
		panelProps = PanelProps
	}) else ReactModule.createElement(View, PanelProps, {
		Header = Element,
		HeaderDivider = Element1,
		LeaderboardBody = ReactModule.createElement(View, { LayoutOrder = 3, tag = "col fill size-full-0" }, config)
	})
end)