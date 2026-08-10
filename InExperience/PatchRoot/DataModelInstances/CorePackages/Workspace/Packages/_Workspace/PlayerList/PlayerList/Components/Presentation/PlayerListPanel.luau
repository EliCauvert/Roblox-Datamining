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
local var5 = if fFlagPlayerListReskinPreferredTransparencyModule then require(parent.Components.Presentation.PreferredTransparencyView) else nil
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
local var16 = if fFlagPlayerListReskinConsoleFocusNavModule then require(parent.Components.Presentation.ConsoleFocusScrollView) else nil
local fFlagPlayerListReskinStickySelfRowModule = require(parent.Flags.FFlagPlayerListReskinStickySelfRow)
local var18 = if fFlagPlayerListReskinStickySelfRowModule then require(parent.Components.Presentation.EntryView) else nil
local tabbedLeaderboardBodyModule = require(parent.Components.Presentation.TabbedLeaderboardBody)
local fFlagPlayerListTwoTabsModule = require(parent.Flags.FFlagPlayerListTwoTabs)
local fallbackSignalsModule = require(parent.Common.FallbackSignals)
local var22 = createSignalMap()
local var23 = createSignalMap()

local function PlayerListPanelContent(p0) --[[ line: 71 ]]
	-- upvalues: useLeaderboardStoreModule (ref), var22 (ref), var23 (ref), signalsReactModule (ref), fFlagPlayerListTwoTabsModule (ref), usePlatformLeaderboardModule (ref), fallbackSignalsModule (ref), usePanelLayoutModule (ref), playerListVisibilityStoreModule (ref), reactModule (ref), playerContextualMenuStoreModule (ref), fFlagPlayerListReskinStickySelfRowModule (ref), computeStatColumnsModule (ref), fFlagPlayerListReskinConsoleFocusNavModule (ref), var16 (ref), teamListViewModule (ref), openContextMenu (ref), scrollView (ref), var18 (ref), columnHeaderRowModule (ref), fFlagPlayerListReskinOptimizationModule (ref), panelHeaderModule (ref), foundationModule (ref), view (ref), fFlagPlayerListReskinPreferredTransparencyModule (ref), var5 (ref), tabbedLeaderboardBodyModule (ref)
	local var25 = p0.isSmallTouchDevice == true
	local title = p0.title
	local platformLeaderboardOverride = p0.platformLeaderboardOverride
	local var26 = useLeaderboardStoreModule()
	local localPlayerOverride = p0.localPlayerOverride or game:GetService("Players").LocalPlayer
	local var28 = if var26 then var26.getTeamList() else var22
	local var29 = if var26 then var26.getGameStatsList() else var23
	local var30 = signalsReactModule.useSignalState(var28.getAllData)
	local var31 = signalsReactModule.useSignalState(var29.getAllData)
	local count = var29.getCount(false)
	local var33 = if fFlagPlayerListTwoTabsModule then platformLeaderboardOverride or usePlatformLeaderboardModule() else nil
	local var34 = usePanelLayoutModule(var25, count, if fFlagPlayerListTwoTabsModule then signalsReactModule.useSignalState(if var33 then var33.getHasActiveLeaderboard else fallbackSignalsModule.getHasActiveLeaderboard) else false)
	local var35 = signalsReactModule.useSignalBinding(playerListVisibilityStoreModule.getEffectiveVisible)
	local var36 = reactModule.useCallback(function() --[[ line: 108 ]]
		-- upvalues: playerContextualMenuStoreModule (copy), playerListVisibilityStoreModule (copy)
		playerContextualMenuStoreModule.closeContextMenu()
		playerListVisibilityStoreModule.setVisible(false)
	end, {})
	local var37 = false
	
	if fFlagPlayerListReskinStickySelfRowModule and var25 and (localPlayerOverride ~= nil and var26 ~= nil) then
		var37 = if var28.getCount(false) <= 0 then count > 0 else true
	end
	local v
	local maxStatColumns = var34.maxStatColumns
	local var38 = reactModule.useMemo(function() --[[ line: 128 ]]
		-- upvalues: computeStatColumnsModule (copy), var29 (ref), maxStatColumns (ref)
		return computeStatColumnsModule(var29, maxStatColumns)
	end, { var31, var29, maxStatColumns })
	local var39 = false
	
	if var26 then
		for i, v in pairs(var30) do
			if v and i ~= "Neutral" then
				var39 = true
				break
			end
		end
	end
	local var42
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
	
	if fFlagPlayerListReskinConsoleFocusNavModule and var26 then
		var42 = reactModule.createElement(var16, {
			allTeams = var30,
			hasNonNeutralTeams = var39,
			leaderboardStore = var26,
			statColumns = var38,
			statWidth = var34.statWidth,
			rowHeight = var34.rowHeight,
			columnHeaderHeight = var34.columnHeaderHeight,
			localPlayer = localPlayerOverride,
			scrollViewProps = t
		})
	else
		local t_1 = {}
		
		if var26 then
			for i, v_1 in pairs(var30) do
				if v_1 then
					t_1[`Team_{tostring(i)}`] = reactModule.createElement(teamListViewModule, {
						teamEntry = v_1,
						isNeutral = i == "Neutral",
						hasNonNeutralTeams = var39,
						leaderboardStore = var26,
						statColumns = var38,
						statWidth = var34.statWidth,
						rowHeight = var34.rowHeight,
						columnHeaderHeight = var34.columnHeaderHeight,
						onActivated = openContextMenu,
						localPlayer = localPlayerOverride
					})
				end
			end
		end
		var42 = reactModule.createElement(scrollView, t, t_1)
	end
	local t_1 = {
		StickySelfRow = if var37 then reactModule.createElement(var18, {
			isCurrentUser = true,
			layoutOrder = 0,
			player = localPlayerOverride,
			leaderboardStore = var26,
			statColumns = var38,
			statWidth = var34.statWidth,
			rowHeight = var34.rowHeight,
			onActivated = openContextMenu
		}) else nil,
		ColumnHeaders = reactModule.createElement(columnHeaderRowModule, {
			layoutOrder = 1,
			statColumns = var38,
			statWidth = var34.statWidth,
			headerHeight = var34.columnHeaderHeight
		}),
		PlayerRows = var42
	}
	local var44 = if fFlagPlayerListReskinOptimizationModule then reactModule.useMemo(function() --[[ line: 227 ]]
		-- upvalues: var34 (ref), var35 (ref)
		return {
			tag = "col radius-medium bg-over-media-200",
			Size = UDim2.fromOffset(var34.panelWidth, var34.panelHeight),
			Visible = var35
		}
	end, { var34.panelWidth, var34.panelHeight, var35 }) else {
		tag = "col radius-medium bg-over-media-200",
		Size = UDim2.fromOffset(var34.panelWidth, var34.panelHeight),
		Visible = var35
	}
	v = reactModule.createElement(panelHeaderModule, {
		layoutOrder = 1,
		onClose = var36,
		height = var34.headerHeight,
		title = title
	})
	local var45 = reactModule.createElement(foundationModule.Divider, { LayoutOrder = 2 })
	
	if fFlagPlayerListTwoTabsModule then
		local var46 = reactModule.createElement(view, { LayoutOrder = 4, tag = "col fill size-full-0" }, t_1)
		
		return if fFlagPlayerListReskinPreferredTransparencyModule then reactModule.createElement(var5, {
			size = UDim2.fromOffset(var34.panelWidth, var34.panelHeight),
			visible = var35
		}, {
			TabbedBody = reactModule.createElement(tabbedLeaderboardBodyModule, {
				serverBody = var46,
				panelHeader = v,
				panelDivider = var45,
				panelProps = var44
			})
		}) else reactModule.createElement(tabbedLeaderboardBodyModule, {
			serverBody = var46,
			panelHeader = v,
			panelDivider = var45,
			panelProps = var44
		})
	end
	return if fFlagPlayerListReskinPreferredTransparencyModule then reactModule.createElement(var5, {
		size = UDim2.fromOffset(var34.panelWidth, var34.panelHeight),
		visible = var35
	}, {
		Header = v,
		HeaderDivider = var45,
		LeaderboardBody = reactModule.createElement(view, { LayoutOrder = 3, tag = "col fill size-full-0" }, t_1)
	}) else reactModule.createElement(view, var44, {
		Header = v,
		HeaderDivider = var45,
		LeaderboardBody = reactModule.createElement(view, { LayoutOrder = 3, tag = "col fill size-full-0" }, t_1)
	})
end

return reactModule.memo(if fFlagPlayerListReskinOptimizationModule then function(p1) --[[ line: 303 | named "PlayerListPanelUnmountable" ]]
	-- upvalues: signalsReactModule (ref), playerListVisibilityStoreModule (ref), reactModule (ref), PlayerListPanelContent (ref)
	return if signalsReactModule.useSignalState(playerListVisibilityStoreModule.getEffectiveVisible) then reactModule.createElement(PlayerListPanelContent, p1) else nil
end else PlayerListPanelContent)