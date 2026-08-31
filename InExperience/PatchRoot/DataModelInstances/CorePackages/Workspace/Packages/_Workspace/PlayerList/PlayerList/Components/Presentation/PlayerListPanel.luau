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
local toggleContextMenu = playerContextualMenuStoreModule.toggleContextMenu
local constantsModule = require(parent.Common.Constants)
local panelHeaderModule = require(parent.Components.Presentation.PanelHeader)
local columnHeaderRowModule = require(parent.Components.Presentation.ColumnHeaderRow)
local teamListViewModule = require(parent.Components.Presentation.TeamListView)
local consoleFocusScrollViewModule = require(parent.Components.Presentation.ConsoleFocusScrollView)
local entryViewModule = require(parent.Components.Presentation.EntryView)
local tabbedLeaderboardBodyModule = require(parent.Components.Presentation.TabbedLeaderboardBody)
local fFlagPlayerListTwoTabsModule = require(parent.Flags.FFlagPlayerListTwoTabs)
local fallbackSignalsModule = require(parent.Common.FallbackSignals)
local var1 = createSignalMap()
local var2 = createSignalMap()

local function wrapWithSlide(p1, p2, p3, p4)
	-- upvalues: reactModule (ref), view (ref)
	return if p2 == nil then p1 else reactModule.createElement(view, { Size = UDim2.fromOffset(p3, p4) }, {
		SlideOffset = reactModule.createElement(view, { tag = "size-full", Position = p2 }, { PanelContent = p1 })
	})
end

local function createZoomDecorations(p1, p2, p3)
	-- upvalues: reactModule (ref)
	if p1 == nil then
		return nil
	end
	local t = {
		UIScale = reactModule.createElement("UIScale", { Scale = p1 })
	}
	
	if p2 ~= nil then
		t.UIStroke = reactModule.createElement("UIStroke", {
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			Color = p3.Color.Stroke.Default.Color3,
			Transparency = p2,
			Thickness = p3.Stroke.Standard
		})
	end
	return t
end

local function renderWithSlideAndZoomDecorations(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: cryoModule (ref), wrapWithSlide (ref), reactModule (ref)
	return wrapWithSlide(reactModule.createElement(p1, p2, if p7 ~= nil then p3 else cryoModule.Dictionary.join(p3, p7)), p4, p5, p6)
end

local function PlayerListPanelContent(p1)
	-- upvalues: useLeaderboardStoreModule (ref), var1 (ref), var2 (ref), signalsReactModule (ref), fFlagPlayerListTwoTabsModule (ref), usePlatformLeaderboardModule (ref), fallbackSignalsModule (ref), usePanelLayoutModule (ref), useTokens (ref), usePreferredBackgroundStyleModule (ref), playerListVisibilityStoreModule (ref), reactModule (ref), playerContextualMenuStoreModule (ref), toggleContextMenu (ref), reactOtterModule (ref), MOBILE_ZOOM_SPRING (ref), MENU_ZOOM_CLOSED_SCALE (ref), PANEL_RECESS_SCALE (ref), PANEL_RECESS_TRANSPARENCY (ref), createZoomDecorations (ref), useReportPanelContentHeightModule (ref), panelContentHeightStoreModule (ref), computeStatColumnsModule (ref), constantsModule (ref), consoleFocusScrollViewModule (ref), teamListViewModule (ref), scrollView (ref), entryViewModule (ref), columnHeaderRowModule (ref), panelHeaderModule (ref), foundationModule (ref), view (ref), renderWithSlideAndZoomDecorations (ref), tabbedLeaderboardBodyModule (ref)
	local var3 = p1.isSmallTouchDevice == true
	local title = p1.title
	local platformLeaderboardOverride = p1.platformLeaderboardOverride
	local var4 = useLeaderboardStoreModule()
	local localPlayerOverride = p1.localPlayerOverride or game:GetService("Players").LocalPlayer
	local var5 = if var4 then var4.getTeamList() else var1
	local var6 = if var4 then var4.getGameStatsList() else var2
	local var7 = signalsReactModule.useSignalState(var5.getAllData)
	local var8 = signalsReactModule.useSignalState(var6.getAllData)
	local count = var6.getCount(false)
	local var9 = if fFlagPlayerListTwoTabsModule then platformLeaderboardOverride or usePlatformLeaderboardModule() else nil
	local var10 = usePanelLayoutModule(var3, count, if fFlagPlayerListTwoTabsModule then signalsReactModule.useSignalState(if var9 then var9.getHasActiveLeaderboard else fallbackSignalsModule.getHasActiveLeaderboard) else false)
	local var11 = useTokens()
	local var12 = usePreferredBackgroundStyleModule(var11.Color.OverMedia.OverMedia_200)
	local var13 = signalsReactModule.useSignalState(playerListVisibilityStoreModule.getEffectiveVisible)
	local var14 = reactModule.useCallback(function()
		-- upvalues: playerListVisibilityStoreModule (copy), playerContextualMenuStoreModule (copy)
		if playerListVisibilityStoreModule.getEffectiveVisible(false) then
			playerContextualMenuStoreModule.closeContextMenu()
			playerListVisibilityStoreModule.setVisible(false)
			
			return
		end
	end, {})
	local var15 = if var13 then toggleContextMenu else nil
	local var16 = signalsReactModule.useSignalState(playerContextualMenuStoreModule.getMenuData) ~= nil
	local var17, var18 = reactOtterModule.useAnimatedBinding(0)
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), var18 (ref), reactOtterModule (copy), var16 (ref), MOBILE_ZOOM_SPRING (copy)
		if var3 then
			var18(reactOtterModule.spring(if var16 then 1 else 0, MOBILE_ZOOM_SPRING))
			
			return
		end
	end, { var16, var3 })
	local openCloseOffset = p1.openCloseOffset
	local var19 = var3 and openCloseOffset ~= nil
	local var20 = reactModule.useMemo(function()
		-- upvalues: var19 (ref), openCloseOffset (ref), reactModule (copy), var17 (ref), MENU_ZOOM_CLOSED_SCALE (copy), PANEL_RECESS_SCALE (copy)
		return if var19 and openCloseOffset ~= nil then reactModule.joinBindings({ openCloseOffset, var17 }):map(function(p2)
			-- upvalues: MENU_ZOOM_CLOSED_SCALE (copy), PANEL_RECESS_SCALE (copy)
			return (1 + (MENU_ZOOM_CLOSED_SCALE - 1) * p2[1]) * (1 - (1 - PANEL_RECESS_SCALE) * p2[2])
		end) else nil
	end, { var19, openCloseOffset, var17 })
	local var21 = reactModule.useMemo(function()
		-- upvalues: var19 (ref), openCloseOffset (ref), reactModule (copy), var17 (ref), PANEL_RECESS_TRANSPARENCY (copy)
		return if var19 and openCloseOffset ~= nil then reactModule.joinBindings({ openCloseOffset, var17 }):map(function(p2)
			-- upvalues: PANEL_RECESS_TRANSPARENCY (copy)
			return 1 - (1 - p2[1]) * (1 - PANEL_RECESS_TRANSPARENCY * p2[2])
		end) else nil
	end, { var19, openCloseOffset, var17 })
	local var22 = reactModule.useMemo(function()
		-- upvalues: var21 (ref), var11 (ref)
		if var21 == nil then
			return nil
		end
		local transparency = var11.Color.Stroke.Default.Transparency
		
		return var21:map(function(p2)
			-- upvalues: transparency (ref)
			return transparency + (1 - transparency) * p2
		end)
	end, { var21, var11.Color.Stroke.Default.Transparency })
	local var23 = createZoomDecorations(var20, var22, var11)
	local var24 = useReportPanelContentHeightModule(var10.columnHeaderHeight)
	reactModule.useEffect(function()
		-- upvalues: panelContentHeightStoreModule (copy)
		return function()
			-- upvalues: panelContentHeightStoreModule (copy)
			panelContentHeightStoreModule.reset()
		end
	end, {})
	local var25 = false
	
	if var3 and localPlayerOverride ~= nil and var4 ~= nil then
		var25 = if var5.getCount(false) <= 0 then count > 0 else true
	end
	local v
	local maxStatColumns = var10.maxStatColumns
	local var26 = reactModule.useMemo(function()
		-- upvalues: computeStatColumnsModule (copy), var6 (ref), maxStatColumns (ref)
		return computeStatColumnsModule(var6, maxStatColumns)
	end, { var8, var6, maxStatColumns })
	local var27 = false
	
	if var4 then
		for i, v in pairs(var7) do
			if v and i ~= "Neutral" then
				var27 = true
				break
			end
		end
	end
	local var28
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
		scrollingFrameRef = var24,
		selectionGroup = constantsModule.CONSOLE_FOCUS_SCROLL_ESCAPE_UP,
		selection = constantsModule.NOT_SELECTABLE
	}
	local _ = nil
	
	if var4 then
		var28 = reactModule.createElement(consoleFocusScrollViewModule, {
			allTeams = var7,
			hasNonNeutralTeams = var27,
			leaderboardStore = var4,
			statColumns = var26,
			statWidth = var10.statWidth,
			rowHeight = var10.rowHeight,
			columnHeaderHeight = var10.columnHeaderHeight,
			localPlayer = localPlayerOverride,
			scrollViewProps = t,
			onActivated = var15
		})
	else
		local t_1 = {}
		
		if var4 then
			for i, v in pairs(var7) do
				if v then
					t_1[`Team_{tostring(i)}`] = reactModule.createElement(teamListViewModule, {
						teamEntry = v,
						isNeutral = i == "Neutral",
						hasNonNeutralTeams = var27,
						leaderboardStore = var4,
						statColumns = var26,
						statWidth = var10.statWidth,
						rowHeight = var10.rowHeight,
						columnHeaderHeight = var10.columnHeaderHeight,
						onActivated = var15,
						localPlayer = localPlayerOverride
					})
				end
			end
		end
		var28 = reactModule.createElement(scrollView, t, t_1)
	end
	local t_1 = {
		StickySelfRow = if var25 then reactModule.createElement(entryViewModule, {
			isCurrentUser = true,
			layoutOrder = 0,
			player = localPlayerOverride,
			leaderboardStore = var4,
			statColumns = var26,
			statWidth = var10.statWidth,
			rowHeight = var10.rowHeight,
			onActivated = var15
		}) else nil,
		ColumnHeaders = reactModule.createElement(columnHeaderRowModule, {
			layoutOrder = 1,
			statColumns = var26,
			statWidth = var10.statWidth,
			headerHeight = var10.columnHeaderHeight
		}),
		PlayerRows = var28
	}
	local var29 = var22 == nil
	v = reactModule.useMemo(function()
		-- upvalues: var10 (ref), var29 (ref), var12 (ref), var21 (ref), constantsModule (copy)
		return {
			Visible = true,
			Size = UDim2.fromOffset(var10.panelWidth, var10.panelHeight),
			tag = {
				["col radius-medium"] = true,
				["stroke-standard stroke-default"] = var29
			},
			backgroundStyle = var12,
			GroupTransparency = var21,
			selectionGroup = constantsModule.CONSOLE_FOCUS_ISOLATE,
			selection = constantsModule.NOT_SELECTABLE
		}
	end, {
		var10.panelWidth,
		var10.panelHeight,
		var29,
		var12,
		var21
	})
	local var30 = reactModule.createElement(panelHeaderModule, {
		layoutOrder = 1,
		onClose = var14,
		isDisabled = not var13,
		height = var10.headerHeight,
		title = title
	})
	local var31 = reactModule.createElement(foundationModule.Divider, { LayoutOrder = 2 })
	
	return if fFlagPlayerListTwoTabsModule then renderWithSlideAndZoomDecorations(tabbedLeaderboardBodyModule, {
		serverBody = reactModule.createElement(view, { LayoutOrder = 4, tag = "col fill size-full-0" }, t_1),
		panelHeader = var30,
		panelDivider = var31,
		panelProps = v
	}, {}, p1.slidePosition, var10.panelWidth, var10.panelHeight, var23) else renderWithSlideAndZoomDecorations(view, v, {
		Header = var30,
		HeaderDivider = var31,
		LeaderboardBody = reactModule.createElement(view, { LayoutOrder = 3, tag = "col fill size-full-0" }, t_1)
	}, p1.slidePosition, var10.panelWidth, var10.panelHeight, var23)
end

return reactModule.memo(function(p2)
	-- upvalues: signalsReactModule (ref), playerListVisibilityStoreModule (ref), useSlideOpenCloseAnimation (ref), PANEL_ZOOM_CONFIG (ref), PANEL_SLIDE_CONFIG (ref), reactModule (ref), PlayerListPanelContent (ref)
	local var32 = p2.isSmallTouchDevice == true
	local var33 = useSlideOpenCloseAnimation(signalsReactModule.useSignalState(playerListVisibilityStoreModule.getEffectiveVisible), if var32 then PANEL_ZOOM_CONFIG else PANEL_SLIDE_CONFIG)
	
	return if var33.shouldMount then reactModule.createElement(PlayerListPanelContent, {
		isSmallTouchDevice = p2.isSmallTouchDevice,
		title = p2.title,
		localPlayerOverride = p2.localPlayerOverride,
		platformLeaderboardOverride = p2.platformLeaderboardOverride,
		slidePosition = if var32 then nil else var33.position,
		openCloseOffset = if var32 then var33.offset else nil
	}) else nil
end)