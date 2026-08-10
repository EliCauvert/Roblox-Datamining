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
local var6 = if fFlagPlayerListReskinPreferredTransparencyModule then require(parent.Components.Presentation.PreferredTransparencyView) else nil
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
local var17 = if fFlagPlayerListReskinConsoleFocusNavModule then require(parent.Components.Presentation.ConsoleFocusScrollView) else nil
local fFlagPlayerListReskinStickySelfRowModule = require(parent.Flags.FFlagPlayerListReskinStickySelfRow)
local var19 = if fFlagPlayerListReskinStickySelfRowModule then require(parent.Components.Presentation.EntryView) else nil
local tabbedLeaderboardBodyModule = require(parent.Components.Presentation.TabbedLeaderboardBody)
local fFlagPlayerListTwoTabsModule = require(parent.Flags.FFlagPlayerListTwoTabs)
local fallbackSignalsModule = require(parent.Common.FallbackSignals)
local var23 = createSignalMap()
local var24 = createSignalMap()

local function PlayerListPanelContent(p0) --[[ line: 72 ]]
	-- upvalues: useLeaderboardStoreModule (ref), var23 (ref), var24 (ref), signalsReactModule (ref), fFlagPlayerListTwoTabsModule (ref), usePlatformLeaderboardModule (ref), fallbackSignalsModule (ref), usePanelLayoutModule (ref), playerListVisibilityStoreModule (ref), reactModule (ref), playerContextualMenuStoreModule (ref), fFlagPlayerListReskinStickySelfRowModule (ref), computeStatColumnsModule (ref), fFlagPlayerListReskinConsoleFocusNavModule (ref), var17 (ref), teamListViewModule (ref), openContextMenu (ref), scrollView (ref), var19 (ref), columnHeaderRowModule (ref), fFlagPlayerListReskinPanelStrokeModule (ref), fFlagPlayerListReskinPreferredTransparencyModule (ref), fFlagPlayerListReskinOptimizationModule (ref), panelHeaderModule (ref), foundationModule (ref), view (ref), var6 (ref), tabbedLeaderboardBodyModule (ref)
	local var26 = p0.isSmallTouchDevice == true
	local title = p0.title
	local platformLeaderboardOverride = p0.platformLeaderboardOverride
	local var27 = useLeaderboardStoreModule()
	local localPlayerOverride = p0.localPlayerOverride or game:GetService("Players").LocalPlayer
	local var29 = if var27 then var27.getTeamList() else var23
	local var30 = if var27 then var27.getGameStatsList() else var24
	local var31 = signalsReactModule.useSignalState(var29.getAllData)
	local var32 = signalsReactModule.useSignalState(var30.getAllData)
	local count = var30.getCount(false)
	local var34 = if fFlagPlayerListTwoTabsModule then platformLeaderboardOverride or usePlatformLeaderboardModule() else nil
	local var35 = usePanelLayoutModule(var26, count, if fFlagPlayerListTwoTabsModule then signalsReactModule.useSignalState(if var34 then var34.getHasActiveLeaderboard else fallbackSignalsModule.getHasActiveLeaderboard) else false)
	local var36 = signalsReactModule.useSignalBinding(playerListVisibilityStoreModule.getEffectiveVisible)
	local var37 = reactModule.useCallback(function() --[[ line: 109 ]]
		-- upvalues: playerContextualMenuStoreModule (copy), playerListVisibilityStoreModule (copy)
		playerContextualMenuStoreModule.closeContextMenu()
		playerListVisibilityStoreModule.setVisible(false)
	end, {})
	local var38 = false
	
	if fFlagPlayerListReskinStickySelfRowModule and var26 and (localPlayerOverride ~= nil and var27 ~= nil) then
		var38 = if var29.getCount(false) <= 0 then count > 0 else true
	end
	local v
	local maxStatColumns = var35.maxStatColumns
	local var39 = reactModule.useMemo(function() --[[ line: 129 ]]
		-- upvalues: computeStatColumnsModule (copy), var30 (ref), maxStatColumns (ref)
		return computeStatColumnsModule(var30, maxStatColumns)
	end, { var32, var30, maxStatColumns })
	local var40 = false
	
	if var27 then
		for i, v in pairs(var31) do
			if v and i ~= "Neutral" then
				var40 = true
				break
			end
		end
	end
	local var43
	local t = {
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
	}
	local _ = nil
	
	if fFlagPlayerListReskinConsoleFocusNavModule and var27 then
		var43 = reactModule.createElement(var17, {
			allTeams = var31,
			hasNonNeutralTeams = var40,
			leaderboardStore = var27,
			statColumns = var39,
			statWidth = var35.statWidth,
			rowHeight = var35.rowHeight,
			columnHeaderHeight = var35.columnHeaderHeight,
			localPlayer = localPlayerOverride,
			scrollViewProps = t
		})
	else
		local t_1 = {}
		
		if var27 then
			for i, v_1 in pairs(var31) do
				if v_1 then
					t_1[`Team_{tostring(i)}`] = reactModule.createElement(teamListViewModule, {
						teamEntry = v_1,
						isNeutral = i == "Neutral",
						hasNonNeutralTeams = var40,
						leaderboardStore = var27,
						statColumns = var39,
						statWidth = var35.statWidth,
						rowHeight = var35.rowHeight,
						columnHeaderHeight = var35.columnHeaderHeight,
						onActivated = openContextMenu,
						localPlayer = localPlayerOverride
					})
				end
			end
		end
		var43 = reactModule.createElement(scrollView, t, t_1)
	end
	local t_1 = {
		StickySelfRow = if var38 then reactModule.createElement(var19, {
			isCurrentUser = true,
			layoutOrder = 0,
			player = localPlayerOverride,
			leaderboardStore = var27,
			statColumns = var39,
			statWidth = var35.statWidth,
			rowHeight = var35.rowHeight,
			onActivated = openContextMenu
		}) else nil,
		ColumnHeaders = reactModule.createElement(columnHeaderRowModule, {
			layoutOrder = 1,
			statColumns = var39,
			statWidth = var35.statWidth,
			headerHeight = var35.columnHeaderHeight
		}),
		PlayerRows = var43
	}
	local var45 = fFlagPlayerListReskinPanelStrokeModule and not fFlagPlayerListReskinPreferredTransparencyModule
	v = if fFlagPlayerListReskinOptimizationModule then reactModule.useMemo(function() --[[ line: 235 ]]
		-- upvalues: var35 (ref), var45 (ref), var36 (ref)
		return {
			Size = UDim2.fromOffset(var35.panelWidth, var35.panelHeight),
			tag = {
				["col radius-medium bg-over-media-200"] = true,
				["stroke-standard stroke-default"] = var45
			},
			Visible = var36
		}
	end, { var35.panelWidth, var35.panelHeight, var36, var45 }) else {
		Size = UDim2.fromOffset(var35.panelWidth, var35.panelHeight),
		tag = {
			["col radius-medium bg-over-media-200"] = true,
			["stroke-standard stroke-default"] = var45
		},
		Visible = var36
	}
	local var46 = reactModule.createElement(panelHeaderModule, {
		layoutOrder = 1,
		onClose = var37,
		height = var35.headerHeight,
		title = title
	})
	local var47 = reactModule.createElement(foundationModule.Divider, { LayoutOrder = 2 })
	
	if fFlagPlayerListTwoTabsModule then
		local var48 = reactModule.createElement(view, { LayoutOrder = 4, tag = "col fill size-full-0" }, t_1)
		
		return if fFlagPlayerListReskinPreferredTransparencyModule then reactModule.createElement(var6, {
			size = UDim2.fromOffset(var35.panelWidth, var35.panelHeight),
			visible = var36
		}, {
			TabbedBody = reactModule.createElement(tabbedLeaderboardBodyModule, {
				serverBody = var48,
				panelHeader = var46,
				panelDivider = var47,
				panelProps = v
			})
		}) else reactModule.createElement(tabbedLeaderboardBodyModule, {
			serverBody = var48,
			panelHeader = var46,
			panelDivider = var47,
			panelProps = v
		})
	end
	return if fFlagPlayerListReskinPreferredTransparencyModule then reactModule.createElement(var6, {
		size = UDim2.fromOffset(var35.panelWidth, var35.panelHeight),
		visible = var36
	}, {
		Header = var46,
		HeaderDivider = var47,
		LeaderboardBody = reactModule.createElement(view, { LayoutOrder = 3, tag = "col fill size-full-0" }, t_1)
	}) else reactModule.createElement(view, v, {
		Header = var46,
		HeaderDivider = var47,
		LeaderboardBody = reactModule.createElement(view, { LayoutOrder = 3, tag = "col fill size-full-0" }, t_1)
	})
end

return reactModule.memo(if fFlagPlayerListReskinOptimizationModule then function(p1) --[[ line: 317 | named "PlayerListPanelUnmountable" ]]
	-- upvalues: signalsReactModule (ref), playerListVisibilityStoreModule (ref), reactModule (ref), PlayerListPanelContent (ref)
	return if signalsReactModule.useSignalState(playerListVisibilityStoreModule.getEffectiveVisible) then reactModule.createElement(PlayerListPanelContent, p1) else nil
end else PlayerListPanelContent)