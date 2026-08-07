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
local panelHeaderModule = require(parent.Components.Presentation.PanelHeader)
local columnHeaderRowModule = require(parent.Components.Presentation.ColumnHeaderRow)
local teamListViewModule = require(parent.Components.Presentation.TeamListView)
local fFlagPlayerListReskinStickySelfRowModule = require(parent.Flags.FFlagPlayerListReskinStickySelfRow)
local var16 = if fFlagPlayerListReskinStickySelfRowModule then require(parent.Components.Presentation.EntryView) else nil
local tabbedLeaderboardBodyModule = require(parent.Components.Presentation.TabbedLeaderboardBody)
local fFlagPlayerListTwoTabsModule = require(parent.Flags.FFlagPlayerListTwoTabs)
local fallbackSignalsModule = require(parent.Common.FallbackSignals)
local var20 = createSignalMap()
local var21 = createSignalMap()

local function PlayerListPanelContent(p0) --[[ line: 66 ]]
	-- upvalues: useLeaderboardStoreModule (ref), var20 (ref), var21 (ref), signalsReactModule (ref), fFlagPlayerListTwoTabsModule (ref), usePlatformLeaderboardModule (ref), fallbackSignalsModule (ref), usePanelLayoutModule (ref), playerListVisibilityStoreModule (ref), reactModule (ref), playerContextualMenuStoreModule (ref), fFlagPlayerListReskinStickySelfRowModule (ref), computeStatColumnsModule (ref), teamListViewModule (ref), openContextMenu (ref), var16 (ref), columnHeaderRowModule (ref), scrollView (ref), fFlagPlayerListReskinOptimizationModule (ref), panelHeaderModule (ref), foundationModule (ref), view (ref), fFlagPlayerListReskinPreferredTransparencyModule (ref), var5 (ref), tabbedLeaderboardBodyModule (ref)
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
	local var33 = signalsReactModule.useSignalBinding(playerListVisibilityStoreModule.getEffectiveVisible)
	local var34 = reactModule.useCallback(function() --[[ line: 103 ]]
		-- upvalues: playerContextualMenuStoreModule (copy), playerListVisibilityStoreModule (copy)
		playerContextualMenuStoreModule.closeContextMenu()
		playerListVisibilityStoreModule.setVisible(false)
	end, {})
	local var35 = false
	
	if fFlagPlayerListReskinStickySelfRowModule and var23 and (localPlayerOverride ~= nil and var24 ~= nil) then
		var35 = if var26.getCount(false) <= 0 then count > 0 else true
	end
	local maxStatColumns = var32.maxStatColumns
	local var36 = reactModule.useMemo(function() --[[ line: 124 ]]
		-- upvalues: computeStatColumnsModule (copy), var27 (ref), maxStatColumns (ref)
		return computeStatColumnsModule(var27, maxStatColumns)
	end, { var29, var27, maxStatColumns })
	local t = {}
	
	if var24 then
		local var38 = false
		
		for i, v in pairs(var28) do
			if v and i ~= "Neutral" then
				var38 = true
				break
			end
		end
		for i_1, v in pairs(var28) do
			if v then
				t[`Team_{tostring(i_1)}`] = reactModule.createElement(teamListViewModule, {
					teamEntry = v,
					isNeutral = i_1 == "Neutral",
					hasNonNeutralTeams = var38,
					leaderboardStore = var24,
					statColumns = var36,
					statWidth = var32.statWidth,
					rowHeight = var32.rowHeight,
					columnHeaderHeight = var32.columnHeaderHeight,
					onActivated = openContextMenu,
					localPlayer = localPlayerOverride
				})
			end
		end
	end
	local t_1 = {
		StickySelfRow = if var35 then reactModule.createElement(var16, {
			isCurrentUser = true,
			layoutOrder = 0,
			player = localPlayerOverride,
			leaderboardStore = var24,
			statColumns = var36,
			statWidth = var32.statWidth,
			rowHeight = var32.rowHeight,
			onActivated = openContextMenu
		}) else nil,
		ColumnHeaders = reactModule.createElement(columnHeaderRowModule, {
			layoutOrder = 1,
			statColumns = var36,
			statWidth = var32.statWidth,
			headerHeight = var32.columnHeaderHeight
		}),
		PlayerRows = reactModule.createElement(scrollView, {
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
		}, t)
	}
	local var40 = if fFlagPlayerListReskinOptimizationModule then reactModule.useMemo(function() --[[ line: 206 ]]
		-- upvalues: var32 (ref), var33 (ref)
		return {
			tag = "col radius-medium bg-over-media-200",
			Size = UDim2.fromOffset(var32.panelWidth, var32.panelHeight),
			Visible = var33
		}
	end, { var32.panelWidth, var32.panelHeight, var33 }) else {
		tag = "col radius-medium bg-over-media-200",
		Size = UDim2.fromOffset(var32.panelWidth, var32.panelHeight),
		Visible = var33
	}
	local var41 = reactModule.createElement(panelHeaderModule, {
		layoutOrder = 1,
		onClose = var34,
		height = var32.headerHeight,
		title = title
	})
	local var42 = reactModule.createElement(foundationModule.Divider, { LayoutOrder = 2 })
	
	if fFlagPlayerListTwoTabsModule then
		local var43 = reactModule.createElement(view, { LayoutOrder = 4, tag = "col fill size-full-0" }, t_1)
		
		return if fFlagPlayerListReskinPreferredTransparencyModule then reactModule.createElement(var5, {
			size = UDim2.fromOffset(var32.panelWidth, var32.panelHeight),
			visible = var33
		}, {
			TabbedBody = reactModule.createElement(tabbedLeaderboardBodyModule, {
				serverBody = var43,
				panelHeader = var41,
				panelDivider = var42,
				panelProps = var40
			})
		}) else reactModule.createElement(tabbedLeaderboardBodyModule, {
			serverBody = var43,
			panelHeader = var41,
			panelDivider = var42,
			panelProps = var40
		})
	end
	return if fFlagPlayerListReskinPreferredTransparencyModule then reactModule.createElement(var5, {
		size = UDim2.fromOffset(var32.panelWidth, var32.panelHeight),
		visible = var33
	}, {
		Header = var41,
		HeaderDivider = var42,
		LeaderboardBody = reactModule.createElement(view, { LayoutOrder = 3, tag = "col fill size-full-0" }, t_1)
	}) else reactModule.createElement(view, var40, {
		Header = var41,
		HeaderDivider = var42,
		LeaderboardBody = reactModule.createElement(view, { LayoutOrder = 3, tag = "col fill size-full-0" }, t_1)
	})
end

return reactModule.memo(if fFlagPlayerListReskinOptimizationModule then function(p1) --[[ line: 282 | named "PlayerListPanelUnmountable" ]]
	-- upvalues: signalsReactModule (ref), playerListVisibilityStoreModule (ref), reactModule (ref), PlayerListPanelContent (ref)
	return if signalsReactModule.useSignalState(playerListVisibilityStoreModule.getEffectiveVisible) then reactModule.createElement(PlayerListPanelContent, p1) else nil
end else PlayerListPanelContent)