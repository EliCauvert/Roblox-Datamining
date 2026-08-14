local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local signalsReactModule = require(parent_1.SignalsReact)
local foundationModule = require(parent_1.Foundation)
local createSignalMap = require(parent_1.CoreScriptsRoactCommon).Utilities.createSignalMap
local _ = require(parent_1.LeaderboardStore)
local view = foundationModule.View
local scrollView = foundationModule.ScrollView
local fFlagPlayerListReskinPreferredTransparencyModule = require(parent.Flags.FFlagPlayerListReskinPreferredTransparency)
local fFlagPlayerListReskinOptimizationModule = require(parent.Flags.FFlagPlayerListReskinOptimization)
local fFlagPlayerListReskinPanelStrokeModule = require(parent.Flags.FFlagPlayerListReskinPanelStroke)
local fFlagPlayerListReskinHeightResponsivenessModule = require(parent.Flags.FFlagPlayerListReskinHeightResponsiveness)
local panelContentHeightStoreModule = require(parent.Common.PanelContentHeightStore)
local useReportPanelContentHeightModule = require(parent.Hooks.useReportPanelContentHeight)
local var9 = if fFlagPlayerListReskinPreferredTransparencyModule then require(parent.Components.Presentation.PreferredTransparencyView) else nil
local useLeaderboardStoreModule = require(parent.Hooks.useLeaderboardStore)
local usePanelLayoutModule = require(parent.Hooks.usePanelLayout)
local usePlatformLeaderboardModule = require(parent.Hooks.usePlatformLeaderboard)
local computeStatColumnsModule = require(parent.Common.computeStatColumns)
local playerListVisibilityStoreModule = require(parent.Common.PlayerListVisibilityStore)
local playerContextualMenuStoreModule = require(parent.Common.PlayerContextualMenuStore)
local openContextMenu = playerContextualMenuStoreModule.openContextMenu
local fFlagPlayerListReskinConsoleFocusNavModule = require(parent.Flags.FFlagPlayerListReskinConsoleFocusNav)
local panelHeaderModule = require(parent.Components.Presentation.PanelHeader)
local columnHeaderRowModule = require(parent.Components.Presentation.ColumnHeaderRow)
local teamListViewModule = require(parent.Components.Presentation.TeamListView)
local var20 = if fFlagPlayerListReskinConsoleFocusNavModule then require(parent.Components.Presentation.ConsoleFocusScrollView) else nil
local fFlagPlayerListReskinStickySelfRowModule = require(parent.Flags.FFlagPlayerListReskinStickySelfRow)
local var22 = if fFlagPlayerListReskinStickySelfRowModule then require(parent.Components.Presentation.EntryView) else nil
local tabbedLeaderboardBodyModule = require(parent.Components.Presentation.TabbedLeaderboardBody)
local fFlagPlayerListTwoTabsModule = require(parent.Flags.FFlagPlayerListTwoTabs)
local fallbackSignalsModule = require(parent.Common.FallbackSignals)
local var26 = createSignalMap()
local var27 = createSignalMap()

local function PlayerListPanelContent(p0) --[[ line: 76 ]]
	-- upvalues: useLeaderboardStoreModule (ref), var26 (ref), var27 (ref), signalsReactModule (ref), fFlagPlayerListTwoTabsModule (ref), usePlatformLeaderboardModule (ref), fallbackSignalsModule (ref), usePanelLayoutModule (ref), playerListVisibilityStoreModule (ref), reactModule (ref), playerContextualMenuStoreModule (ref), fFlagPlayerListReskinHeightResponsivenessModule (ref), useReportPanelContentHeightModule (ref), panelContentHeightStoreModule (ref), fFlagPlayerListReskinStickySelfRowModule (ref), computeStatColumnsModule (ref), fFlagPlayerListReskinConsoleFocusNavModule (ref), var20 (ref), teamListViewModule (ref), openContextMenu (ref), scrollView (ref), var22 (ref), columnHeaderRowModule (ref), fFlagPlayerListReskinPanelStrokeModule (ref), fFlagPlayerListReskinPreferredTransparencyModule (ref), fFlagPlayerListReskinOptimizationModule (ref), panelHeaderModule (ref), foundationModule (ref), view (ref), var9 (ref), tabbedLeaderboardBodyModule (ref)
	local var29 = p0.isSmallTouchDevice == true
	local title = p0.title
	local platformLeaderboardOverride = p0.platformLeaderboardOverride
	local var30 = useLeaderboardStoreModule()
	local localPlayerOverride = p0.localPlayerOverride or game:GetService("Players").LocalPlayer
	local var32 = if var30 then var30.getTeamList() else var26
	local var33 = if var30 then var30.getGameStatsList() else var27
	local var34 = signalsReactModule.useSignalState(var32.getAllData)
	local var35 = signalsReactModule.useSignalState(var33.getAllData)
	local count = var33.getCount(false)
	local var37 = if fFlagPlayerListTwoTabsModule then platformLeaderboardOverride or usePlatformLeaderboardModule() else nil
	local var38 = usePanelLayoutModule(var29, count, if fFlagPlayerListTwoTabsModule then signalsReactModule.useSignalState(if var37 then var37.getHasActiveLeaderboard else fallbackSignalsModule.getHasActiveLeaderboard) else false)
	local var39 = signalsReactModule.useSignalBinding(playerListVisibilityStoreModule.getEffectiveVisible)
	local var40 = reactModule.useCallback(function() --[[ line: 113 ]]
		-- upvalues: playerContextualMenuStoreModule (copy), playerListVisibilityStoreModule (copy)
		playerContextualMenuStoreModule.closeContextMenu()
		playerListVisibilityStoreModule.setVisible(false)
	end, {})
	local var41 = if fFlagPlayerListReskinHeightResponsivenessModule then useReportPanelContentHeightModule(var38.columnHeaderHeight) else nil
	
	if fFlagPlayerListReskinHeightResponsivenessModule then
		reactModule.useEffect(function() --[[ line: 135 ]]
			-- upvalues: panelContentHeightStoreModule (copy)
			return function() --[[ line: 136 ]]
				-- upvalues: panelContentHeightStoreModule (copy)
				panelContentHeightStoreModule.reset()
			end
		end, {})
	end
	local var42 = false
	
	if fFlagPlayerListReskinStickySelfRowModule and var29 and (localPlayerOverride ~= nil and var30 ~= nil) then
		var42 = if var32.getCount(false) <= 0 then count > 0 else true
	end
	local v
	local maxStatColumns = var38.maxStatColumns
	local var43 = reactModule.useMemo(function() --[[ line: 155 ]]
		-- upvalues: computeStatColumnsModule (copy), var33 (ref), maxStatColumns (ref)
		return computeStatColumnsModule(var33, maxStatColumns)
	end, { var35, var33, maxStatColumns })
	local var44 = false
	
	if var30 then
		for i, v in pairs(var34) do
			if v and i ~= "Neutral" then
				var44 = true
				break
			end
		end
	end
	local var47
	local t = {
		LayoutOrder = 2,
		tag = "fill size-full-0",
		layout = {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left
		},
		scroll = {
			AutomaticCanvasSize = if fFlagPlayerListReskinHeightResponsivenessModule then nil else Enum.AutomaticSize.Y,
			ScrollingDirection = Enum.ScrollingDirection.Y
		},
		scrollingFrameRef = var41,
		selectionGroup = {
			SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
			SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
			SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
			SelectionBehaviorRight = Enum.SelectionBehavior.Stop
		}
	}
	local _ = nil
	
	if fFlagPlayerListReskinConsoleFocusNavModule and var30 then
		var47 = reactModule.createElement(var20, {
			allTeams = var34,
			hasNonNeutralTeams = var44,
			leaderboardStore = var30,
			statColumns = var43,
			statWidth = var38.statWidth,
			rowHeight = var38.rowHeight,
			columnHeaderHeight = var38.columnHeaderHeight,
			localPlayer = localPlayerOverride,
			scrollViewProps = t
		})
	else
		local t_1 = {}
		
		if var30 then
			for i, v_1 in pairs(var34) do
				if v_1 then
					t_1[`Team_{tostring(i)}`] = reactModule.createElement(teamListViewModule, {
						teamEntry = v_1,
						isNeutral = i == "Neutral",
						hasNonNeutralTeams = var44,
						leaderboardStore = var30,
						statColumns = var43,
						statWidth = var38.statWidth,
						rowHeight = var38.rowHeight,
						columnHeaderHeight = var38.columnHeaderHeight,
						onActivated = openContextMenu,
						localPlayer = localPlayerOverride
					})
				end
			end
		end
		var47 = reactModule.createElement(scrollView, t, t_1)
	end
	local t_1 = {
		StickySelfRow = if var42 then reactModule.createElement(var22, {
			isCurrentUser = true,
			layoutOrder = 0,
			player = localPlayerOverride,
			leaderboardStore = var30,
			statColumns = var43,
			statWidth = var38.statWidth,
			rowHeight = var38.rowHeight,
			onActivated = openContextMenu
		}) else nil,
		ColumnHeaders = reactModule.createElement(columnHeaderRowModule, {
			layoutOrder = 1,
			statColumns = var43,
			statWidth = var38.statWidth,
			headerHeight = var38.columnHeaderHeight
		}),
		PlayerRows = var47
	}
	local var49 = fFlagPlayerListReskinPanelStrokeModule and not fFlagPlayerListReskinPreferredTransparencyModule
	v = if fFlagPlayerListReskinOptimizationModule then reactModule.useMemo(function() --[[ line: 264 ]]
		-- upvalues: var38 (ref), var49 (ref), var39 (ref)
		return {
			Size = UDim2.fromOffset(var38.panelWidth, var38.panelHeight),
			tag = {
				["col radius-medium bg-over-media-200"] = true,
				["stroke-standard stroke-default"] = var49
			},
			Visible = var39
		}
	end, { var38.panelWidth, var38.panelHeight, var39, var49 }) else {
		Size = UDim2.fromOffset(var38.panelWidth, var38.panelHeight),
		tag = {
			["col radius-medium bg-over-media-200"] = true,
			["stroke-standard stroke-default"] = var49
		},
		Visible = var39
	}
	local var50 = reactModule.createElement(panelHeaderModule, {
		layoutOrder = 1,
		onClose = var40,
		height = var38.headerHeight,
		title = title
	})
	local var51 = reactModule.createElement(foundationModule.Divider, { LayoutOrder = 2 })
	
	if fFlagPlayerListTwoTabsModule then
		local var52 = reactModule.createElement(view, { LayoutOrder = 4, tag = "col fill size-full-0" }, t_1)
		
		return if fFlagPlayerListReskinPreferredTransparencyModule then reactModule.createElement(var9, {
			size = UDim2.fromOffset(var38.panelWidth, var38.panelHeight),
			visible = var39
		}, {
			TabbedBody = reactModule.createElement(tabbedLeaderboardBodyModule, {
				serverBody = var52,
				panelHeader = var50,
				panelDivider = var51,
				panelProps = v
			})
		}) else reactModule.createElement(tabbedLeaderboardBodyModule, {
			serverBody = var52,
			panelHeader = var50,
			panelDivider = var51,
			panelProps = v
		})
	end
	return if fFlagPlayerListReskinPreferredTransparencyModule then reactModule.createElement(var9, {
		size = UDim2.fromOffset(var38.panelWidth, var38.panelHeight),
		visible = var39
	}, {
		Header = var50,
		HeaderDivider = var51,
		LeaderboardBody = reactModule.createElement(view, { LayoutOrder = 3, tag = "col fill size-full-0" }, t_1)
	}) else reactModule.createElement(view, v, {
		Header = var50,
		HeaderDivider = var51,
		LeaderboardBody = reactModule.createElement(view, { LayoutOrder = 3, tag = "col fill size-full-0" }, t_1)
	})
end

return reactModule.memo(if fFlagPlayerListReskinOptimizationModule then function(p1) --[[ line: 346 | named "PlayerListPanelUnmountable" ]]
	-- upvalues: signalsReactModule (ref), playerListVisibilityStoreModule (ref), reactModule (ref), PlayerListPanelContent (ref)
	return if signalsReactModule.useSignalState(playerListVisibilityStoreModule.getEffectiveVisible) then reactModule.createElement(PlayerListPanelContent, p1) else nil
end else PlayerListPanelContent)