local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local signalsReactModule = require(parent_1.SignalsReact)
local foundationModule = require(parent_1.Foundation)
local createSignalMap = require(parent_1.CoreScriptsRoactCommon).Utilities.createSignalMap
local _ = require(parent_1.LeaderboardStore)
local view = foundationModule.View
local scrollView = foundationModule.ScrollView
local useTokens = foundationModule.Hooks.useTokens
local panelContentHeightStoreModule = require(parent.Common.PanelContentHeightStore)
local useReportPanelContentHeightModule = require(parent.Hooks.useReportPanelContentHeight)
local usePreferredBackgroundStyleModule = require(parent.Hooks.usePreferredBackgroundStyle)
local useLeaderboardStoreModule = require(parent.Hooks.useLeaderboardStore)
local usePanelLayoutModule = require(parent.Hooks.usePanelLayout)
local usePlatformLeaderboardModule = require(parent.Hooks.usePlatformLeaderboard)
local computeStatColumnsModule = require(parent.Common.computeStatColumns)
local playerListVisibilityStoreModule = require(parent.Common.PlayerListVisibilityStore)
local playerContextualMenuStoreModule = require(parent.Common.PlayerContextualMenuStore)
local openContextMenu = playerContextualMenuStoreModule.openContextMenu
local panelHeaderModule = require(parent.Components.Presentation.PanelHeader)
local columnHeaderRowModule = require(parent.Components.Presentation.ColumnHeaderRow)
local teamListViewModule = require(parent.Components.Presentation.TeamListView)
local consoleFocusScrollViewModule = require(parent.Components.Presentation.ConsoleFocusScrollView)
local entryViewModule = require(parent.Components.Presentation.EntryView)
local tabbedLeaderboardBodyModule = require(parent.Components.Presentation.TabbedLeaderboardBody)
local fFlagPlayerListTwoTabsModule = require(parent.Flags.FFlagPlayerListTwoTabs)
local fallbackSignalsModule = require(parent.Common.FallbackSignals)
local var20 = createSignalMap()
local var21 = createSignalMap()

local function PlayerListPanelContent(p0)
	-- upvalues: useLeaderboardStoreModule (ref), var20 (ref), var21 (ref), signalsReactModule (ref), fFlagPlayerListTwoTabsModule (ref), usePlatformLeaderboardModule (ref), fallbackSignalsModule (ref), usePanelLayoutModule (ref), useTokens (ref), usePreferredBackgroundStyleModule (ref), playerListVisibilityStoreModule (ref), reactModule (ref), playerContextualMenuStoreModule (ref), useReportPanelContentHeightModule (ref), panelContentHeightStoreModule (ref), computeStatColumnsModule (ref), consoleFocusScrollViewModule (ref), teamListViewModule (ref), openContextMenu (ref), scrollView (ref), entryViewModule (ref), columnHeaderRowModule (ref), panelHeaderModule (ref), foundationModule (ref), view (ref), tabbedLeaderboardBodyModule (ref)
	local var23 = p0.isSmallTouchDevice == true
	local title = p0.title
	local platformLeaderboardOverride = p0.platformLeaderboardOverride
	local var24 = useLeaderboardStoreModule()
	local localPlayerOverride = p0.localPlayerOverride or game:GetService("Players").LocalPlayer
	local var26 = if var24 then var24.getTeamList() else var20
	local var27 = if var24 then var24.getGameStatsList() else var21
	local var28 = signalsReactModule.useSignalState(var26.getAllData)
	local var29 = signalsReactModule.useSignalState(var27.getAllData)
	local count = var27.getCount(false)
	local var31 = if fFlagPlayerListTwoTabsModule then platformLeaderboardOverride or usePlatformLeaderboardModule() else nil
	local var32 = usePanelLayoutModule(var23, count, if fFlagPlayerListTwoTabsModule then signalsReactModule.useSignalState(if var31 then var31.getHasActiveLeaderboard else fallbackSignalsModule.getHasActiveLeaderboard) else false)
	local var33 = usePreferredBackgroundStyleModule(useTokens().Color.OverMedia.OverMedia_200)
	local var34 = signalsReactModule.useSignalBinding(playerListVisibilityStoreModule.getEffectiveVisible)
	local var35 = reactModule.useCallback(function()
		-- upvalues: playerContextualMenuStoreModule (copy), playerListVisibilityStoreModule (copy)
		playerContextualMenuStoreModule.closeContextMenu()
		playerListVisibilityStoreModule.setVisible(false)
	end, {})
	local var36 = useReportPanelContentHeightModule(var32.columnHeaderHeight)
	reactModule.useEffect(function()
		-- upvalues: panelContentHeightStoreModule (copy)
		return function()
			-- upvalues: panelContentHeightStoreModule (copy)
			panelContentHeightStoreModule.reset()
		end
	end, {})
	local var37 = false
	
	if var23 and localPlayerOverride ~= nil and var24 ~= nil then
		var37 = if var26.getCount(false) <= 0 then count > 0 else true
	end
	local v
	local maxStatColumns = var32.maxStatColumns
	local var38 = reactModule.useMemo(function()
		-- upvalues: computeStatColumnsModule (copy), var27 (ref), maxStatColumns (ref)
		return computeStatColumnsModule(var27, maxStatColumns)
	end, { var29, var27, maxStatColumns })
	local var39 = false
	
	if var24 then
		for i, v in pairs(var28) do
			if v and i ~= "Neutral" then
				var39 = true
				break
			end
		end
	end
	local var41
	local t = {
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
		scrollingFrameRef = var36,
		selectionGroup = {
			SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
			SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
			SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
			SelectionBehaviorRight = Enum.SelectionBehavior.Stop
		}
	}
	local _ = nil
	
	if var24 then
		var41 = reactModule.createElement(consoleFocusScrollViewModule, {
			allTeams = var28,
			hasNonNeutralTeams = var39,
			leaderboardStore = var24,
			statColumns = var38,
			statWidth = var32.statWidth,
			rowHeight = var32.rowHeight,
			columnHeaderHeight = var32.columnHeaderHeight,
			localPlayer = localPlayerOverride,
			scrollViewProps = t
		})
	else
		local t_1 = {}
		
		if var24 then
			for i, v in pairs(var28) do
				if v then
					t_1[`Team_{tostring(i)}`] = reactModule.createElement(teamListViewModule, {
						teamEntry = v,
						isNeutral = i == "Neutral",
						hasNonNeutralTeams = var39,
						leaderboardStore = var24,
						statColumns = var38,
						statWidth = var32.statWidth,
						rowHeight = var32.rowHeight,
						columnHeaderHeight = var32.columnHeaderHeight,
						onActivated = openContextMenu,
						localPlayer = localPlayerOverride
					})
				end
			end
		end
		var41 = reactModule.createElement(scrollView, t, t_1)
	end
	local t_1 = {
		StickySelfRow = if var37 then reactModule.createElement(entryViewModule, {
			isCurrentUser = true,
			layoutOrder = 0,
			player = localPlayerOverride,
			leaderboardStore = var24,
			statColumns = var38,
			statWidth = var32.statWidth,
			rowHeight = var32.rowHeight,
			onActivated = openContextMenu
		}) else nil,
		ColumnHeaders = reactModule.createElement(columnHeaderRowModule, {
			layoutOrder = 1,
			statColumns = var38,
			statWidth = var32.statWidth,
			headerHeight = var32.columnHeaderHeight
		}),
		PlayerRows = var41
	}
	local var44 = reactModule.useMemo(function()
		-- upvalues: var32 (ref), var33 (ref), var34 (ref)
		return {
			tag = "col stroke-standard stroke-default radius-medium",
			Size = UDim2.fromOffset(var32.panelWidth, var32.panelHeight),
			backgroundStyle = var33,
			Visible = var34
		}
	end, { var32.panelWidth, var32.panelHeight, var34, var33 })
	v = reactModule.createElement(panelHeaderModule, {
		layoutOrder = 1,
		onClose = var35,
		height = var32.headerHeight,
		title = title
	})
	local var45 = reactModule.createElement(foundationModule.Divider, { LayoutOrder = 2 })
	
	return if fFlagPlayerListTwoTabsModule then reactModule.createElement(tabbedLeaderboardBodyModule, {
		serverBody = reactModule.createElement(view, { LayoutOrder = 4, tag = "col fill size-full-0" }, t_1),
		panelHeader = v,
		panelDivider = var45,
		panelProps = var44
	}) else reactModule.createElement(view, var44, {
		Header = v,
		HeaderDivider = var45,
		LeaderboardBody = reactModule.createElement(view, { LayoutOrder = 3, tag = "col fill size-full-0" }, t_1)
	})
end

return reactModule.memo(function(p1)
	-- upvalues: signalsReactModule (ref), playerListVisibilityStoreModule (ref), reactModule (ref), PlayerListPanelContent (ref)
	return if signalsReactModule.useSignalState(playerListVisibilityStoreModule.getEffectiveVisible) then reactModule.createElement(PlayerListPanelContent, p1) else nil
end)