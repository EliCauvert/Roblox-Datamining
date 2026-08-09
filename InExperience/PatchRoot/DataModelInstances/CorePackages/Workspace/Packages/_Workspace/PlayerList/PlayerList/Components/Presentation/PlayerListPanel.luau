local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local signalsReactModule = require(parent_1.SignalsReact)
local foundationModule = require(parent_1.Foundation)
local createSignalMap = require(parent_1.CoreScriptsRoactCommon).Utilities.createSignalMap
local _ = require(parent_1.LeaderboardStore)
local view = foundationModule.View
local scrollView = foundationModule.ScrollView
local useLeaderboardStoreModule = require(parent.Hooks.useLeaderboardStore)
local usePanelLayoutModule = require(parent.Hooks.usePanelLayout)
local computeStatColumnsModule = require(parent.Common.computeStatColumns)
local playerListVisibilityStoreModule = require(parent.Common.PlayerListVisibilityStore)
local playerContextualMenuStoreModule = require(parent.Common.PlayerContextualMenuStore)
local openContextMenu = playerContextualMenuStoreModule.openContextMenu
local panelHeaderModule = require(parent.Components.Presentation.PanelHeader)
local columnHeaderRowModule = require(parent.Components.Presentation.ColumnHeaderRow)
local teamListViewModule = require(parent.Components.Presentation.TeamListView)
local var11 = createSignalMap()
local var12 = createSignalMap()

return reactModule.memo(function(p0) --[[ line: 38 | named "PlayerListPanel" ]]
	-- upvalues: useLeaderboardStoreModule (ref), var11 (ref), var12 (ref), signalsReactModule (ref), usePanelLayoutModule (ref), playerListVisibilityStoreModule (ref), reactModule (ref), playerContextualMenuStoreModule (ref), computeStatColumnsModule (ref), teamListViewModule (ref), openContextMenu (ref), view (ref), panelHeaderModule (ref), foundationModule (ref), columnHeaderRowModule (ref), scrollView (ref)
	local var13 = p0.isSmallTouchDevice == true
	local title = p0.title
	local var14 = useLeaderboardStoreModule()
	local localPlayer = game:GetService("Players").LocalPlayer
	local var15 = if var14 then var14.getGameStatsList() else var12
	local var16 = signalsReactModule.useSignalState((if var14 then var14.getTeamList() else var11).getAllData)
	local var17 = signalsReactModule.useSignalState(var15.getAllData)
	local var18 = usePanelLayoutModule(var13, var15.getCount(false))
	local var19 = signalsReactModule.useSignalBinding(playerListVisibilityStoreModule.getEffectiveVisible)
	local var20 = reactModule.useCallback(function() --[[ line: 63 ]]
		-- upvalues: playerContextualMenuStoreModule (copy), playerListVisibilityStoreModule (copy)
		playerContextualMenuStoreModule.closeContextMenu()
		playerListVisibilityStoreModule.setVisible(false)
	end, {})
	local maxStatColumns = var18.maxStatColumns
	local var21 = reactModule.useMemo(function() --[[ line: 75 ]]
		-- upvalues: computeStatColumnsModule (copy), var15 (ref), maxStatColumns (ref)
		return computeStatColumnsModule(var15, maxStatColumns)
	end, { var17, var15, maxStatColumns })
	local t = {}
	
	if var14 then
		local var23 = false
		
		for i, v in pairs(var16) do
			if v and i ~= "Neutral" then
				var23 = true
				break
			end
		end
		for i_1, v in pairs(var16) do
			if v then
				t[`Team_{tostring(i_1)}`] = reactModule.createElement(teamListViewModule, {
					teamEntry = v,
					isNeutral = i_1 == "Neutral",
					hasNonNeutralTeams = var23,
					leaderboardStore = var14,
					statColumns = var21,
					statWidth = var18.statWidth,
					rowHeight = var18.rowHeight,
					columnHeaderHeight = var18.columnHeaderHeight,
					onActivated = openContextMenu,
					localPlayer = localPlayer
				})
			end
		end
	end
	return reactModule.createElement(view, {
		tag = "col radius-medium bg-over-media-200",
		Size = UDim2.fromOffset(var18.panelWidth, var18.panelHeight),
		Visible = var19
	}, {
		Header = reactModule.createElement(panelHeaderModule, {
			layoutOrder = 1,
			onClose = var20,
			height = var18.headerHeight,
			title = title
		}),
		HeaderDivider = reactModule.createElement(foundationModule.Divider, { LayoutOrder = 2 }),
		LeaderboardBody = reactModule.createElement(view, { LayoutOrder = 3, tag = "col fill size-full-0" }, {
			ColumnHeaders = reactModule.createElement(columnHeaderRowModule, {
				layoutOrder = 1,
				statColumns = var21,
				statWidth = var18.statWidth,
				headerHeight = var18.columnHeaderHeight
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
		})
	})
end)