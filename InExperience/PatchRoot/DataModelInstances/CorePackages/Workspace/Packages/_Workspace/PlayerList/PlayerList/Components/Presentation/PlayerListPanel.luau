local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local cryoModule = require(parent_1.Cryo)
local signalsReactModule = require(parent_1.SignalsReact)
local foundationModule = require(parent_1.Foundation)
local reactOtterModule = require(parent_1.ReactOtter)
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
local useSlideOpenCloseAnimationModule = require(parent.Hooks.useSlideOpenCloseAnimation)
local useSlideOpenCloseAnimation = useSlideOpenCloseAnimationModule.useSlideOpenCloseAnimation
local PANEL_SLIDE_CONFIG = useSlideOpenCloseAnimationModule.PANEL_SLIDE_CONFIG
local PANEL_ZOOM_CONFIG = useSlideOpenCloseAnimationModule.PANEL_ZOOM_CONFIG
local MOBILE_ZOOM_SPRING = useSlideOpenCloseAnimationModule.MOBILE_ZOOM_SPRING
local MENU_ZOOM_CLOSED_SCALE = useSlideOpenCloseAnimationModule.MENU_ZOOM_CLOSED_SCALE
local PANEL_RECESS_SCALE = useSlideOpenCloseAnimationModule.PANEL_RECESS_SCALE
local PANEL_RECESS_TRANSPARENCY = useSlideOpenCloseAnimationModule.PANEL_RECESS_TRANSPARENCY
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
local var23 = createSignalMap()
local var24 = createSignalMap()

local function wrapWithSlide(p0, p1, p2, p3) --[[ line: 62 ]]
	-- upvalues: reactModule (ref), view (ref)
	return if p1 == nil then p0 else reactModule.createElement(view, { Size = UDim2.fromOffset(p2, p3) }, {
		SlideOffset = reactModule.createElement(view, { tag = "size-full", Position = p1 }, { PanelContent = p0 })
	})
end

local function createZoomDecorations(p4, p5, p6) --[[ line: 84 ]]
	-- upvalues: reactModule (ref)
	if p4 == nil then
		return nil
	end
	local t = {
		UIScale = reactModule.createElement("UIScale", { Scale = p4 })
	}
	
	if p5 ~= nil then
		t.UIStroke = reactModule.createElement("UIStroke", {
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			Color = p6.Color.Stroke.Default.Color3,
			Transparency = p5,
			Thickness = p6.Stroke.Standard
		})
	end
	return t
end

local function renderWithSlideAndZoomDecorations(p7, p8, p9, p10, p11, p12, p13) --[[ line: 108 ]]
	-- upvalues: cryoModule (ref), wrapWithSlide (ref), reactModule (ref)
	return wrapWithSlide(reactModule.createElement(p7, p8, if p13 ~= nil then p9 else cryoModule.Dictionary.join(p9, p13)), p10, p11, p12)
end

local function PlayerListPanelContent(p14) --[[ line: 140 ]]
	-- upvalues: useLeaderboardStoreModule (ref), var23 (ref), var24 (ref), signalsReactModule (ref), fFlagPlayerListTwoTabsModule (ref), usePlatformLeaderboardModule (ref), fallbackSignalsModule (ref), usePanelLayoutModule (ref), useTokens (ref), usePreferredBackgroundStyleModule (ref), playerListVisibilityStoreModule (ref), reactModule (ref), playerContextualMenuStoreModule (ref), openContextMenu (ref), reactOtterModule (ref), MOBILE_ZOOM_SPRING (ref), MENU_ZOOM_CLOSED_SCALE (ref), PANEL_RECESS_SCALE (ref), PANEL_RECESS_TRANSPARENCY (ref), createZoomDecorations (ref), useReportPanelContentHeightModule (ref), panelContentHeightStoreModule (ref), computeStatColumnsModule (ref), consoleFocusScrollViewModule (ref), teamListViewModule (ref), scrollView (ref), entryViewModule (ref), columnHeaderRowModule (ref), panelHeaderModule (ref), foundationModule (ref), view (ref), renderWithSlideAndZoomDecorations (ref), tabbedLeaderboardBodyModule (ref)
	local var30 = p14.isSmallTouchDevice == true
	local title = p14.title
	local platformLeaderboardOverride = p14.platformLeaderboardOverride
	local var31 = useLeaderboardStoreModule()
	local localPlayerOverride = p14.localPlayerOverride or game:GetService("Players").LocalPlayer
	local var33 = if var31 then var31.getTeamList() else var23
	local var34 = if var31 then var31.getGameStatsList() else var24
	local var35 = signalsReactModule.useSignalState(var33.getAllData)
	local var36 = signalsReactModule.useSignalState(var34.getAllData)
	local count = var34.getCount(false)
	local var38 = if fFlagPlayerListTwoTabsModule then platformLeaderboardOverride or usePlatformLeaderboardModule() else nil
	local var39 = usePanelLayoutModule(var30, count, if fFlagPlayerListTwoTabsModule then signalsReactModule.useSignalState(if var38 then var38.getHasActiveLeaderboard else fallbackSignalsModule.getHasActiveLeaderboard) else false)
	local var40 = useTokens()
	local var41 = usePreferredBackgroundStyleModule(var40.Color.OverMedia.OverMedia_200)
	local var42 = signalsReactModule.useSignalState(playerListVisibilityStoreModule.getEffectiveVisible)
	local var43 = reactModule.useCallback(function() --[[ line: 185 ]]
		-- upvalues: playerListVisibilityStoreModule (copy), playerContextualMenuStoreModule (copy)
		if playerListVisibilityStoreModule.getEffectiveVisible(false) then
			playerContextualMenuStoreModule.closeContextMenu()
			playerListVisibilityStoreModule.setVisible(false)
			
			return
		end
	end, {})
	local var44 = if var42 then openContextMenu else nil
	local var45 = signalsReactModule.useSignalState(playerContextualMenuStoreModule.getMenuData) ~= nil
	local var46, var47 = reactOtterModule.useAnimatedBinding(0)
	reactModule.useEffect(function() --[[ line: 202 ]]
		-- upvalues: var30 (ref), var47 (ref), reactOtterModule (copy), var45 (ref), MOBILE_ZOOM_SPRING (copy)
		if var30 then
			var47(reactOtterModule.spring(if var45 then 1 else 0, MOBILE_ZOOM_SPRING))
			
			return
		end
	end, { var45, var30 })
	local openCloseOffset = p14.openCloseOffset
	local var48 = var30 and openCloseOffset ~= nil
	local var49 = reactModule.useMemo(function() --[[ line: 210 ]]
		-- upvalues: var48 (ref), openCloseOffset (ref), reactModule (copy), var46 (ref), MENU_ZOOM_CLOSED_SCALE (copy), PANEL_RECESS_SCALE (copy)
		return if var48 and openCloseOffset ~= nil then reactModule.joinBindings({ openCloseOffset, var46 }):map(function(p15) --[[ line: 214 ]]
			-- upvalues: MENU_ZOOM_CLOSED_SCALE (copy), PANEL_RECESS_SCALE (copy)
			return (1 + (MENU_ZOOM_CLOSED_SCALE - 1) * p15[1]) * (1 - (1 - PANEL_RECESS_SCALE) * p15[2])
		end) else nil
	end, { var48, openCloseOffset, var46 })
	local var50 = reactModule.useMemo(function() --[[ line: 222 ]]
		-- upvalues: var48 (ref), openCloseOffset (ref), reactModule (copy), var46 (ref), PANEL_RECESS_TRANSPARENCY (copy)
		return if var48 and openCloseOffset ~= nil then reactModule.joinBindings({ openCloseOffset, var46 }):map(function(p16) --[[ line: 226 ]]
			-- upvalues: PANEL_RECESS_TRANSPARENCY (copy)
			return 1 - (1 - p16[1]) * (1 - PANEL_RECESS_TRANSPARENCY * p16[2])
		end) else nil
	end, { var48, openCloseOffset, var46 })
	local var51 = reactModule.useMemo(function() --[[ line: 233 ]]
		-- upvalues: var50 (ref), var40 (ref)
		if var50 == nil then
			return nil
		end
		local transparency = var40.Color.Stroke.Default.Transparency
		
		return var50:map(function(p17) --[[ line: 238 ]]
			-- upvalues: transparency (ref)
			return transparency + (1 - transparency) * p17
		end)
	end, { var50, var40.Color.Stroke.Default.Transparency })
	local var52 = createZoomDecorations(var49, var51, var40)
	local var53 = useReportPanelContentHeightModule(var39.columnHeaderHeight)
	reactModule.useEffect(function() --[[ line: 251 ]]
		-- upvalues: panelContentHeightStoreModule (copy)
		return function() --[[ line: 252 ]]
			-- upvalues: panelContentHeightStoreModule (copy)
			panelContentHeightStoreModule.reset()
		end
	end, {})
	local var54 = false
	
	if var30 and localPlayerOverride ~= nil and var31 ~= nil then
		var54 = if var33.getCount(false) <= 0 then count > 0 else true
	end
	local v
	local maxStatColumns = var39.maxStatColumns
	local var55 = reactModule.useMemo(function() --[[ line: 269 ]]
		-- upvalues: computeStatColumnsModule (copy), var34 (ref), maxStatColumns (ref)
		return computeStatColumnsModule(var34, maxStatColumns)
	end, { var36, var34, maxStatColumns })
	local var56 = false
	
	if var31 then
		for i, v in pairs(var35) do
			if v and i ~= "Neutral" then
				var56 = true
				break
			end
		end
	end
	local var58
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
		scrollingFrameRef = var53,
		selectionGroup = {
			SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
			SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
			SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
			SelectionBehaviorRight = Enum.SelectionBehavior.Stop
		}
	}
	local _ = nil
	
	if var31 then
		var58 = reactModule.createElement(consoleFocusScrollViewModule, {
			allTeams = var35,
			hasNonNeutralTeams = var56,
			leaderboardStore = var31,
			statColumns = var55,
			statWidth = var39.statWidth,
			rowHeight = var39.rowHeight,
			columnHeaderHeight = var39.columnHeaderHeight,
			localPlayer = localPlayerOverride,
			scrollViewProps = t,
			onActivated = var44
		})
	else
		local t_1 = {}
		
		if var31 then
			for i, v in pairs(var35) do
				if v then
					t_1[`Team_{tostring(i)}`] = reactModule.createElement(teamListViewModule, {
						teamEntry = v,
						isNeutral = i == "Neutral",
						hasNonNeutralTeams = var56,
						leaderboardStore = var31,
						statColumns = var55,
						statWidth = var39.statWidth,
						rowHeight = var39.rowHeight,
						columnHeaderHeight = var39.columnHeaderHeight,
						onActivated = var44,
						localPlayer = localPlayerOverride
					})
				end
			end
		end
		var58 = reactModule.createElement(scrollView, t, t_1)
	end
	local t_1 = {
		StickySelfRow = if var54 then reactModule.createElement(entryViewModule, {
			isCurrentUser = true,
			layoutOrder = 0,
			player = localPlayerOverride,
			leaderboardStore = var31,
			statColumns = var55,
			statWidth = var39.statWidth,
			rowHeight = var39.rowHeight,
			onActivated = var44
		}) else nil,
		ColumnHeaders = reactModule.createElement(columnHeaderRowModule, {
			layoutOrder = 1,
			statColumns = var55,
			statWidth = var39.statWidth,
			headerHeight = var39.columnHeaderHeight
		}),
		PlayerRows = var58
	}
	local var61 = var51 == nil
	v = reactModule.useMemo(function() --[[ line: 374 ]]
		-- upvalues: var39 (ref), var61 (ref), var41 (ref), var50 (ref)
		return {
			Visible = true,
			Size = UDim2.fromOffset(var39.panelWidth, var39.panelHeight),
			tag = {
				["col radius-medium"] = true,
				["stroke-standard stroke-default"] = var61
			},
			backgroundStyle = var41,
			GroupTransparency = var50
		}
	end, {
		var39.panelWidth,
		var39.panelHeight,
		var61,
		var41,
		var50
	})
	local var62 = reactModule.createElement(panelHeaderModule, {
		layoutOrder = 1,
		onClose = var43,
		isDisabled = not var42,
		height = var39.headerHeight,
		title = title
	})
	local var63 = reactModule.createElement(foundationModule.Divider, { LayoutOrder = 2 })
	
	return if fFlagPlayerListTwoTabsModule then renderWithSlideAndZoomDecorations(tabbedLeaderboardBodyModule, {
		serverBody = reactModule.createElement(view, { LayoutOrder = 4, tag = "col fill size-full-0" }, t_1),
		panelHeader = var62,
		panelDivider = var63,
		panelProps = v
	}, {}, p14.slidePosition, var39.panelWidth, var39.panelHeight, var52) else renderWithSlideAndZoomDecorations(view, v, {
		Header = var62,
		HeaderDivider = var63,
		LeaderboardBody = reactModule.createElement(view, { LayoutOrder = 3, tag = "col fill size-full-0" }, t_1)
	}, p14.slidePosition, var39.panelWidth, var39.panelHeight, var52)
end

return reactModule.memo(function(p18) --[[ line: 430 | named "PlayerListPanel" ]]
	-- upvalues: signalsReactModule (ref), playerListVisibilityStoreModule (ref), useSlideOpenCloseAnimation (ref), PANEL_ZOOM_CONFIG (ref), PANEL_SLIDE_CONFIG (ref), reactModule (ref), PlayerListPanelContent (ref)
	local var64 = p18.isSmallTouchDevice == true
	local var65 = useSlideOpenCloseAnimation(signalsReactModule.useSignalState(playerListVisibilityStoreModule.getEffectiveVisible), if var64 then PANEL_ZOOM_CONFIG else PANEL_SLIDE_CONFIG)
	
	return if var65.shouldMount then reactModule.createElement(PlayerListPanelContent, {
		isSmallTouchDevice = p18.isSmallTouchDevice,
		title = p18.title,
		localPlayerOverride = p18.localPlayerOverride,
		platformLeaderboardOverride = p18.platformLeaderboardOverride,
		slidePosition = if var64 then nil else var65.position,
		openCloseOffset = if var64 then var65.offset else nil
	}) else nil
end)