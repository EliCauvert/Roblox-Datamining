local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local playersService = game:GetService("Players")
local reactModule = require(parent_1.React)
local signalsModule = require(parent_1.Signals)
local signalsReactModule = require(parent_1.SignalsReact)
local foundationModule = require(parent_1.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local scrollView = foundationModule.ScrollView
local useTokens = foundationModule.Hooks.useTokens
local constantsModule = require(parent.Common.Constants)
local useGamepadStickScrollModule = require(parent.Hooks.useGamepadStickScroll)
local useReportPanelContentHeightModule = require(parent.Hooks.useReportPanelContentHeight)
local usePlatformLeaderboardModule = require(parent.Hooks.usePlatformLeaderboard)
local platformEntryViewModule = require(parent.Components.Presentation.PlatformEntryView)
local emptyAndErrorStatesModule = require(parent.Components.Presentation.EmptyAndErrorStates)
local resolveDisplayNameModule = require(parent.Common.resolveDisplayName)
local getPeopleHeaderLabelModule = require(parent.Common.getPeopleHeaderLabel)
local fFlagPlayerListLocalizeGameTextModule = require(parent.Flags.FFlagPlayerListLocalizeGameText)
local useLocalization = require(parent_1.Localization).Hooks.useLocalization
local loadingState = emptyAndErrorStatesModule.LoadingState
local emptyFriendsState = emptyAndErrorStatesModule.EmptyFriendsState
local serviceUnavailableState = emptyAndErrorStatesModule.ServiceUnavailableState
local var14 = signalsModule.createSignal(nil)
local var15 = signalsModule.createSignal(nil)
local var16 = require(parent_1.CoreScriptsRoactCommon).Utilities.createSignalMap()

local function _(p0, p1)
	return if p0 == nil then "Unable to load" else `Last updated {math.max(0, math.floor((p1 - p0) / 60))} min ago`
end

return reactModule.memo(function(p2)
	-- upvalues: usePlatformLeaderboardModule (ref), useTokens (ref), constantsModule (ref), useReportPanelContentHeightModule (ref), reactModule (ref), useGamepadStickScrollModule (ref), var16 (ref), var14 (ref), var15 (ref), signalsReactModule (ref), signalsModule (ref), fFlagPlayerListLocalizeGameTextModule (ref), useLocalization (ref), playersService (ref), resolveDisplayNameModule (ref), getPeopleHeaderLabelModule (ref), serviceUnavailableState (ref), loadingState (ref), emptyFriendsState (ref), platformEntryViewModule (ref), scrollView (ref), view (ref), text (ref)
	local tab = p2.tab
	local isFriends = tab == "Friends"
	local var18 = p2.legacyPanelBackgroundColor ~= nil
	local var19 = usePlatformLeaderboardModule()
	local scale = useTokens().Config.UI.Scale
	local var20 = constantsModule.PLATFORM_ROW_HEIGHT * scale
	local var21 = constantsModule.PLATFORM_HEADER_HEIGHT * scale
	local var22 = 26 * scale
	local var23 = constantsModule.PLATFORM_RANK_WIDTH * scale
	local var24 = constantsModule.PLATFORM_SCORE_WIDTH * scale
	local var25 = useReportPanelContentHeightModule(var21 + var20 + var22)
	local var26 = reactModule.useRef(nil)
	local var27 = reactModule.useCallback(function(p3)
		-- upvalues: var26 (ref), var25 (ref)
		var26.current = p3
		var25(p3)
	end, { var25 })
	useGamepadStickScrollModule({ scrollingFrameRef = var26, enabled = not var18 })
	local var28 = if var19 then if isFriends then var19.friendsEntries else var19.globalEntries else var16
	local var29 = if var19 then if isFriends then var19.getFriendsLastRefreshedAt else var19.getGlobalLastRefreshedAt else var14
	local var30 = if var19 then if isFriends then var19.getUserFriendScore else var19.getUserScore else var14
	local var31 = if var19 then if isFriends then var19.getUserFriendRank else var19.getUserRank else var14
	local var32 = if var19 then var19.getUnit else var15
	local loading, loading_1 = reactModule.useState("loading")
	local var35, var36 = reactModule.useState(0)
	local var37 = reactModule.useRef(false)
	local var38 = signalsReactModule.useSignalState(var28.getAllData)
	local var39 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var29 (ref)
		return signalsModule.createComputed(function(p4)
			-- upvalues: var29 (copy)
			return var29(p4) ~= nil
		end)
	end, { var29 }))
	local var40 = 0
	
	for i in pairs(var38) do
		var40 += 1
	end
	local var44
	local rankHeader = nil
	local _ = nil
	
	if fFlagPlayerListLocalizeGameTextModule then
		local var41 = signalsReactModule.useSignalState(var29)
		local _, var42 = reactModule.useState(0)
		reactModule.useEffect(function()
			-- upvalues: var42 (ref)
			local delayedThread = nil
			
			local function schedule()
				-- upvalues: delayedThread (write), var42 (copy), schedule (ref)
				delayedThread = task.delay(300, function()
					-- upvalues: var42 (copy), schedule (copy)
					var42(function(p5)
						return p5 + 1
					end)
					schedule()
				end)
			end
			
			delayedThread = task.delay(300, function()
				-- upvalues: var42 (copy), schedule (ref)
				var42(function(p6)
					return p6 + 1
				end)
				schedule()
			end)
			
			return function()
				-- upvalues: delayedThread (write)
				if delayedThread then
					task.cancel(delayedThread)
					delayedThread = nil
				end
			end
		end, {})
		local var43 = useLocalization({
			rankHeader = "InGame.PlayerList.RankHeader",
			footerUnableToLoad = "InGame.PlayerList.FooterUnableToLoad",
			footerLastUpdated = {
				"InGame.PlayerList.FooterLastUpdated",
				minutes = if var41 == nil then 0 else math.max(0, math.floor((os.time() - var41) / 60))
			}
		})
		rankHeader = var43.rankHeader
		var44 = if var41 == nil then var43.footerUnableToLoad else var43.footerLastUpdated
	else
		local var45 = signalsReactModule.useSignalBinding(var29)
		local var46, var47 = reactModule.useBinding(os.time())
		reactModule.useEffect(function()
			-- upvalues: var47 (ref)
			local delayedThread = nil
			
			local function schedule()
				-- upvalues: delayedThread (write), var47 (copy), schedule (ref)
				delayedThread = task.delay(300, function()
					-- upvalues: var47 (copy), schedule (copy)
					var47(os.time())
					schedule()
				end)
			end
			
			delayedThread = task.delay(300, function()
				-- upvalues: var47 (copy), schedule (ref)
				var47(os.time())
				schedule()
			end)
			
			return function()
				-- upvalues: delayedThread (write)
				if delayedThread then
					task.cancel(delayedThread)
					delayedThread = nil
				end
			end
		end, {})
		var44 = reactModule.useMemo(function()
			-- upvalues: reactModule (copy), var45 (ref), var46 (ref)
			return reactModule.joinBindings({ lastRefreshedAt = var45, tick = var46 }):map(function(p7)
				local lastRefreshedAt = p7.lastRefreshedAt
				
				return if lastRefreshedAt == nil then "Unable to load" else `Last updated {math.max(0, math.floor((os.time() - lastRefreshedAt) / 60))} min ago`
			end)
		end, { var45, var46 })
	end
	reactModule.useEffect(function()
		-- upvalues: var19 (ref), tab (ref)
		if var19 then
			var19:fireTabOpened(tab)
		end
		return function()
			-- upvalues: var19 (copy), tab (copy)
			if var19 then
				var19:fireTabClosed(tab)
			end
		end
	end, { var19, tab })
	reactModule.useEffect(function()
		-- upvalues: var37 (ref), loading_1 (ref), var39 (ref)
		var37.current = false
		loading_1("loading")
		
		if var39 then
			return function()
				-- upvalues: var37 (copy)
				var37.current = true
			end
		end
		local delayedThread = task.delay(30, function()
			-- upvalues: var37 (copy), loading_1 (copy)
			if not var37.current then
				loading_1("error")
			end
		end)
		
		return function()
			-- upvalues: var37 (copy), delayedThread (ref)
			var37.current = true
			task.cancel(delayedThread)
		end
	end, { var19, tab, var39, var35 })
	local localPlayer = playersService.LocalPlayer
	local var48 = reactModule.useMemo(function()
		-- upvalues: localPlayer (ref), resolveDisplayNameModule (copy)
		return if localPlayer then resolveDisplayNameModule(localPlayer) else nil
	end, { localPlayer })
	local var49 = signalsReactModule.useSignalState(var32)
	local var50 = getPeopleHeaderLabelModule()
	local var51 = reactModule.useCallback(function()
		-- upvalues: var19 (ref), tab (ref), loading_1 (ref), var36 (ref)
		if var19 then
			var19:fireTabClosed(tab)
			var19:fireTabOpened(tab)
		end
		loading_1("loading")
		var36(function(p8)
			return p8 + 1
		end)
	end, { var19, tab })
	
	if var19 == nil or not var39 then
		return if loading == "error" then reactModule.createElement(serviceUnavailableState, {
			onRetry = var51,
			layoutOrder = p2.layoutOrder,
			useLegacyPanelStyling = var18
		}) else reactModule.createElement(loadingState, {
			layoutOrder = p2.layoutOrder,
			useLegacyPanelStyling = var18
		})
	elseif isFriends and var40 == 0 then
		return reactModule.createElement(emptyFriendsState, {
			layoutOrder = p2.layoutOrder,
			useLegacyPanelStyling = var18
		})
	end
	local t = {}
	
	for i_1, v in pairs(var38) do
		t[`Row_{i_1}`] = reactModule.createElement(platformEntryViewModule, {
			isViewer = false,
			showDivider = true,
			scoreGetter = v.getScore,
			rankGetter = v.getRank,
			displayName = v.displayName,
			rowHeight = var20,
			rankWidth = var23,
			scoreWidth = var24
		})
	end
	return reactModule.createElement(view, {
		tag = "col fill size-full-0",
		LayoutOrder = p2.layoutOrder
	}, {
		ColumnHeader = if var18 then reactModule.createElement("Frame", {
			Name = "LegacyPlatformColumnHeader",
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, var21)
		}, {
			Header = reactModule.createElement(platformEntryViewModule, {
				isHeader = true,
				scoreLabel = var49,
				peopleHeaderText = var50,
				rankHeaderText = rankHeader,
				rowHeight = var21,
				rankWidth = var23,
				scoreWidth = var24
			})
		}) else reactModule.createElement(view, {
			tag = "size-full-0 bg-surface-100",
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, var21)
		}, {
			Header = reactModule.createElement(platformEntryViewModule, {
				isHeader = true,
				scoreLabel = var49,
				peopleHeaderText = var50,
				rankHeaderText = rankHeader,
				rowHeight = var21,
				rankWidth = var23,
				scoreWidth = var24
			})
		}),
		PinnedViewer = reactModule.createElement(platformEntryViewModule, {
			isViewer = true,
			layoutOrder = 3,
			scoreGetter = var30,
			rankGetter = var31,
			displayName = var48,
			highlightViewerRow = not var18,
			rowHeight = var20,
			rankWidth = var23,
			scoreWidth = var24
		}),
		RowList = reactModule.createElement(view, { tag = "col fill size-full-0", LayoutOrder = 5 }, {
			Rows = reactModule.createElement(scrollView, {
				tag = "fill size-full-0",
				layout = {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					SortOrder = Enum.SortOrder.LayoutOrder
				},
				scroll = {
					AutomaticCanvasSize = if not var18 then nil else Enum.AutomaticSize.Y,
					ScrollingDirection = Enum.ScrollingDirection.Y
				},
				scrollingFrameRef = if not var18 then var27 else nil,
				selection = constantsModule.NOT_SELECTABLE
			}, t)
		}),
		Footer = if var18 then reactModule.createElement("Frame", {
			Name = "LegacyPlatformFooter",
			LayoutOrder = 6,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, var22)
		}, {
			FooterInner = reactModule.createElement(view, {
				tag = "row align-x-right align-y-center size-full padding-x-medium padding-y-xsmall",
				Size = UDim2.fromScale(1, 1)
			}, {
				FooterText = reactModule.createElement(text, {
					tag = "auto-xy text-caption-small text-align-x-right content-muted",
					Text = var44
				})
			})
		}) else reactModule.createElement(view, {
			tag = "row align-x-right align-y-center size-full-0 padding-x-medium padding-y-xsmall stroke-standard stroke-default bg-surface-100",
			LayoutOrder = 6,
			Size = UDim2.new(1, 0, 0, var22)
		}, {
			FooterText = reactModule.createElement(text, {
				tag = "auto-xy text-caption-small text-align-x-right content-muted",
				Text = var44
			})
		})
	})
end)