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
local constantsModule = require(parent.Common.Constants)
local panelHeaderModule = require(parent.Components.Presentation.PanelHeader)
local columnHeaderRowModule = require(parent.Components.Presentation.ColumnHeaderRow)
local teamListViewModule = require(parent.Components.Presentation.TeamListView)
local consoleFocusScrollViewModule = require(parent.Components.Presentation.ConsoleFocusScrollView)
local entryViewModule = require(parent.Components.Presentation.EntryView)
local tabbedLeaderboardBodyModule = require(parent.Components.Presentation.TabbedLeaderboardBody)
local fFlagPlayerListTwoTabsModule = require(parent.Flags.FFlagPlayerListTwoTabs)
local fallbackSignalsModule = require(parent.Common.FallbackSignals)
local var24 = createSignalMap()
local var25 = createSignalMap()

local function wrapWithSlide(p0, p1, p2, p3)
	-- upvalues: reactModule (ref), view (ref)
	return if p1 == nil then p0 else reactModule.createElement(view, { Size = UDim2.fromOffset(p2, p3) }, {
		SlideOffset = reactModule.createElement(view, { tag = "size-full", Position = p1 }, { PanelContent = p0 })
	})
end

local function createZoomDecorations(p4, p5, p6)
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

local function renderWithSlideAndZoomDecorations(p7, p8, p9, p10, p11, p12, p13)
	-- upvalues: cryoModule (ref), wrapWithSlide (ref), reactModule (ref)
	return wrapWithSlide(reactModule.createElement(p7, p8, if p13 ~= nil then p9 else cryoModule.Dictionary.join(p9, p13)), p10, p11, p12)
end

local function PlayerListPanelContent(p14)
	-- upvalues: useLeaderboardStoreModule (ref), var24 (ref), var25 (ref), signalsReactModule (ref), fFlagPlayerListTwoTabsModule (ref), usePlatformLeaderboardModule (ref), fallbackSignalsModule (ref), usePanelLayoutModule (ref), useTokens (ref), usePreferredBackgroundStyleModule (ref), playerListVisibilityStoreModule (ref), reactModule (ref), playerContextualMenuStoreModule (ref), openContextMenu (ref), reactOtterModule (ref), MOBILE_ZOOM_SPRING (ref), MENU_ZOOM_CLOSED_SCALE (ref), PANEL_RECESS_SCALE (ref), PANEL_RECESS_TRANSPARENCY (ref), createZoomDecorations (ref), useReportPanelContentHeightModule (ref), panelContentHeightStoreModule (ref), computeStatColumnsModule (ref), constantsModule (ref), consoleFocusScrollViewModule (ref), teamListViewModule (ref), scrollView (ref), entryViewModule (ref), columnHeaderRowModule (ref), panelHeaderModule (ref), foundationModule (ref), view (ref), renderWithSlideAndZoomDecorations (ref), tabbedLeaderboardBodyModule (ref)
	local var31 = p14.isSmallTouchDevice == true
	local title = p14.title
	local platformLeaderboardOverride = p14.platformLeaderboardOverride
	local var32 = useLeaderboardStoreModule()
	local localPlayerOverride = p14.localPlayerOverride or game:GetService("Players").LocalPlayer
	local var34 = if var32 then var32.getTeamList() else var24
	local var35 = if var32 then var32.getGameStatsList() else var25
	local var36 = signalsReactModule.useSignalState(var34.getAllData)
	local var37 = signalsReactModule.useSignalState(var35.getAllData)
	local count = var35.getCount(false)
	local var39 = if fFlagPlayerListTwoTabsModule then platformLeaderboardOverride or usePlatformLeaderboardModule() else nil
	local var40 = usePanelLayoutModule(var31, count, if fFlagPlayerListTwoTabsModule then signalsReactModule.useSignalState(if var39 then var39.getHasActiveLeaderboard else fallbackSignalsModule.getHasActiveLeaderboard) else false)
	local var41 = useTokens()
	local var42 = usePreferredBackgroundStyleModule(var41.Color.OverMedia.OverMedia_200)
	local var43 = signalsReactModule.useSignalState(playerListVisibilityStoreModule.getEffectiveVisible)
	local var44 = reactModule.useCallback(function()
		-- upvalues: playerListVisibilityStoreModule (copy), playerContextualMenuStoreModule (copy)
		if playerListVisibilityStoreModule.getEffectiveVisible(false) then
			playerContextualMenuStoreModule.closeContextMenu()
			playerListVisibilityStoreModule.setVisible(false)
			
			return
		end
	end, {})
	local var45 = if var43 then openContextMenu else nil
	local var46 = signalsReactModule.useSignalState(playerContextualMenuStoreModule.getMenuData) ~= nil
	local var47, var48 = reactOtterModule.useAnimatedBinding(0)
	reactModule.useEffect(function()
		-- upvalues: var31 (ref), var48 (ref), reactOtterModule (copy), var46 (ref), MOBILE_ZOOM_SPRING (copy)
		if var31 then
			var48(reactOtterModule.spring(if var46 then 1 else 0, MOBILE_ZOOM_SPRING))
			
			return
		end
	end, { var46, var31 })
	local openCloseOffset = p14.openCloseOffset
	local var49 = var31 and openCloseOffset ~= nil
	local var50 = reactModule.useMemo(function()
		-- upvalues: var49 (ref), openCloseOffset (ref), reactModule (copy), var47 (ref), MENU_ZOOM_CLOSED_SCALE (copy), PANEL_RECESS_SCALE (copy)
		return if var49 and openCloseOffset ~= nil then reactModule.joinBindings({ openCloseOffset, var47 }):map(function(p15)
			-- upvalues: MENU_ZOOM_CLOSED_SCALE (copy), PANEL_RECESS_SCALE (copy)
			return (1 + (MENU_ZOOM_CLOSED_SCALE - 1) * p15[1]) * (1 - (1 - PANEL_RECESS_SCALE) * p15[2])
		end) else nil
	end, { var49, openCloseOffset, var47 })
	local var51 = reactModule.useMemo(function()
		-- upvalues: var49 (ref), openCloseOffset (ref), reactModule (copy), var47 (ref), PANEL_RECESS_TRANSPARENCY (copy)
		return if var49 and openCloseOffset ~= nil then reactModule.joinBindings({ openCloseOffset, var47 }):map(function(p16)
			-- upvalues: PANEL_RECESS_TRANSPARENCY (copy)
			return 1 - (1 - p16[1]) * (1 - PANEL_RECESS_TRANSPARENCY * p16[2])
		end) else nil
	end, { var49, openCloseOffset, var47 })
	local var52 = reactModule.useMemo(function()
		-- upvalues: var51 (ref), var41 (ref)
		if var51 == nil then
			return nil
		end
		local transparency = var41.Color.Stroke.Default.Transparency
		
		return var51:map(function(p17)
			-- upvalues: transparency (ref)
			return transparency + (1 - transparency) * p17
		end)
	end, { var51, var41.Color.Stroke.Default.Transparency })
	local var53 = createZoomDecorations(var50, var52, var41)
	local var54 = useReportPanelContentHeightModule(var40.columnHeaderHeight)
	reactModule.useEffect(function()
		-- upvalues: panelContentHeightStoreModule (copy)
		return function()
			-- upvalues: panelContentHeightStoreModule (copy)
			panelContentHeightStoreModule.reset()
		end
	end, {})
	local var55 = false
	
	if var31 and localPlayerOverride ~= nil and var32 ~= nil then
		var55 = if var34.getCount(false) <= 0 then count > 0 else true
	end
	local v
	local maxStatColumns = var40.maxStatColumns
	local var56 = reactModule.useMemo(function()
		-- upvalues: computeStatColumnsModule (copy), var35 (ref), maxStatColumns (ref)
		return computeStatColumnsModule(var35, maxStatColumns)
	end, { var37, var35, maxStatColumns })
	local var57 = false
	
	if var32 then
		for i, v in pairs(var36) do
			if v and i ~= "Neutral" then
				var57 = true
				break
			end
		end
	end
	local var59
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
		scrollingFrameRef = var54,
		selectionGroup = constantsModule.CONSOLE_FOCUS_SCROLL_ESCAPE_UP,
		selection = constantsModule.NOT_SELECTABLE
	}
	local _ = nil
	
	if var32 then
		var59 = reactModule.createElement(consoleFocusScrollViewModule, {
			allTeams = var36,
			hasNonNeutralTeams = var57,
			leaderboardStore = var32,
			statColumns = var56,
			statWidth = var40.statWidth,
			rowHeight = var40.rowHeight,
			columnHeaderHeight = var40.columnHeaderHeight,
			localPlayer = localPlayerOverride,
			scrollViewProps = t,
			onActivated = var45
		})
	else
		local t_1 = {}
		
		if var32 then
			for i, v in pairs(var36) do
				if v then
					t_1[`Team_{tostring(i)}`] = reactModule.createElement(teamListViewModule, {
						teamEntry = v,
						isNeutral = i == "Neutral",
						hasNonNeutralTeams = var57,
						leaderboardStore = var32,
						statColumns = var56,
						statWidth = var40.statWidth,
						rowHeight = var40.rowHeight,
						columnHeaderHeight = var40.columnHeaderHeight,
						onActivated = var45,
						localPlayer = localPlayerOverride
					})
				end
			end
		end
		var59 = reactModule.createElement(scrollView, t, t_1)
	end
	local t_1 = {
		StickySelfRow = if var55 then reactModule.createElement(entryViewModule, {
			isCurrentUser = true,
			layoutOrder = 0,
			player = localPlayerOverride,
			leaderboardStore = var32,
			statColumns = var56,
			statWidth = var40.statWidth,
			rowHeight = var40.rowHeight,
			onActivated = var45
		}) else nil,
		ColumnHeaders = reactModule.createElement(columnHeaderRowModule, {
			layoutOrder = 1,
			statColumns = var56,
			statWidth = var40.statWidth,
			headerHeight = var40.columnHeaderHeight
		}),
		PlayerRows = var59
	}
	local var62 = var52 == nil
	v = reactModule.useMemo(function()
		-- upvalues: var40 (ref), var62 (ref), var42 (ref), var51 (ref), constantsModule (copy)
		return {
			Visible = true,
			Size = UDim2.fromOffset(var40.panelWidth, var40.panelHeight),
			tag = {
				["col radius-medium"] = true,
				["stroke-standard stroke-default"] = var62
			},
			backgroundStyle = var42,
			GroupTransparency = var51,
			selectionGroup = constantsModule.CONSOLE_FOCUS_ISOLATE,
			selection = constantsModule.NOT_SELECTABLE
		}
	end, {
		var40.panelWidth,
		var40.panelHeight,
		var62,
		var42,
		var51
	})
	local var63 = reactModule.createElement(panelHeaderModule, {
		layoutOrder = 1,
		onClose = var44,
		isDisabled = not var43,
		height = var40.headerHeight,
		title = title
	})
	local var64 = reactModule.createElement(foundationModule.Divider, { LayoutOrder = 2 })
	
	return if fFlagPlayerListTwoTabsModule then renderWithSlideAndZoomDecorations(tabbedLeaderboardBodyModule, {
		serverBody = reactModule.createElement(view, { LayoutOrder = 4, tag = "col fill size-full-0" }, t_1),
		panelHeader = var63,
		panelDivider = var64,
		panelProps = v
	}, {}, p14.slidePosition, var40.panelWidth, var40.panelHeight, var53) else renderWithSlideAndZoomDecorations(view, v, {
		Header = var63,
		HeaderDivider = var64,
		LeaderboardBody = reactModule.createElement(view, { LayoutOrder = 3, tag = "col fill size-full-0" }, t_1)
	}, p14.slidePosition, var40.panelWidth, var40.panelHeight, var53)
end

return reactModule.memo(function(p18)
	-- upvalues: signalsReactModule (ref), playerListVisibilityStoreModule (ref), useSlideOpenCloseAnimation (ref), PANEL_ZOOM_CONFIG (ref), PANEL_SLIDE_CONFIG (ref), reactModule (ref), PlayerListPanelContent (ref)
	local var65 = p18.isSmallTouchDevice == true
	local var66 = useSlideOpenCloseAnimation(signalsReactModule.useSignalState(playerListVisibilityStoreModule.getEffectiveVisible), if var65 then PANEL_ZOOM_CONFIG else PANEL_SLIDE_CONFIG)
	
	return if var66.shouldMount then reactModule.createElement(PlayerListPanelContent, {
		isSmallTouchDevice = p18.isSmallTouchDevice,
		title = p18.title,
		localPlayerOverride = p18.localPlayerOverride,
		platformLeaderboardOverride = p18.platformLeaderboardOverride,
		slidePosition = if var65 then nil else var66.position,
		openCloseOffset = if var65 then var66.offset else nil
	}) else nil
end)