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
local var13 = signalsModule.createSignal(nil)
local var14 = signalsModule.createSignal(nil)
local var15 = require(parent_1.CoreScriptsRoactCommon).Utilities.createSignalMap()

local function _(p0, p1)
	return if p0 == nil then "Unable to load" else `Last updated {math.max(0, math.floor((p1 - p0) / 60))} min ago`
end

return reactModule.memo(function(p2)
	-- upvalues: usePlatformLeaderboardModule (ref), useTokens (ref), constantsModule (ref), useReportPanelContentHeightModule (ref), var15 (ref), var13 (ref), var14 (ref), reactModule (ref), signalsReactModule (ref), signalsModule (ref), fFlagPlayerListLocalizeGameTextModule (ref), useLocalization (ref), playersService (ref), resolveDisplayNameModule (ref), getPeopleHeaderLabelModule (ref), serviceUnavailableState (ref), loadingState (ref), emptyFriendsState (ref), platformEntryViewModule (ref), scrollView (ref), view (ref), text (ref)
	local tab = p2.tab
	local isFriends = tab == "Friends"
	local var17 = p2.legacyPanelBackgroundColor ~= nil
	local var18 = usePlatformLeaderboardModule()
	local scale = useTokens().Config.UI.Scale
	local var19 = constantsModule.PLATFORM_ROW_HEIGHT * scale
	local var20 = constantsModule.PLATFORM_HEADER_HEIGHT * scale
	local var21 = 26 * scale
	local var22 = constantsModule.PLATFORM_RANK_WIDTH * scale
	local var23 = constantsModule.PLATFORM_SCORE_WIDTH * scale
	local var24 = useReportPanelContentHeightModule(var20 + var19 + var21)
	local var25 = if var18 then if isFriends then var18.friendsEntries else var18.globalEntries else var15
	local var26 = if var18 then if isFriends then var18.getFriendsLastRefreshedAt else var18.getGlobalLastRefreshedAt else var13
	local var27 = if var18 then if isFriends then var18.getUserFriendScore else var18.getUserScore else var13
	local var28 = if var18 then if isFriends then var18.getUserFriendRank else var18.getUserRank else var13
	local var29 = if var18 then var18.getUnit else var14
	local loading, loading_1 = reactModule.useState("loading")
	local var32, var33 = reactModule.useState(0)
	local var34 = reactModule.useRef(false)
	local var35 = signalsReactModule.useSignalState(var25.getAllData)
	local var36 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var26 (ref)
		return signalsModule.createComputed(function(p3)
			-- upvalues: var26 (copy)
			return var26(p3) ~= nil
		end)
	end, { var26 }))
	local var37 = 0
	
	for i in pairs(var35) do
		var37 += 1
	end
	local var41
	local rankHeader = nil
	local _ = nil
	
	if fFlagPlayerListLocalizeGameTextModule then
		local var38 = signalsReactModule.useSignalState(var26)
		local _, var39 = reactModule.useState(0)
		reactModule.useEffect(function()
			-- upvalues: var39 (ref)
			local delayedThread = nil
			
			local function schedule()
				-- upvalues: delayedThread (write), var39 (copy), schedule (ref)
				delayedThread = task.delay(300, function()
					-- upvalues: var39 (copy), schedule (copy)
					var39(function(p4)
						return p4 + 1
					end)
					schedule()
				end)
			end
			
			delayedThread = task.delay(300, function()
				-- upvalues: var39 (copy), schedule (ref)
				var39(function(p5)
					return p5 + 1
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
		local var40 = useLocalization({
			rankHeader = "InGame.PlayerList.RankHeader",
			footerUnableToLoad = "InGame.PlayerList.FooterUnableToLoad",
			footerLastUpdated = {
				"InGame.PlayerList.FooterLastUpdated",
				minutes = if var38 == nil then 0 else math.max(0, math.floor((os.time() - var38) / 60))
			}
		})
		rankHeader = var40.rankHeader
		var41 = if var38 == nil then var40.footerUnableToLoad else var40.footerLastUpdated
	else
		local var42 = signalsReactModule.useSignalBinding(var26)
		local var43, var44 = reactModule.useBinding(os.time())
		reactModule.useEffect(function()
			-- upvalues: var44 (ref)
			local delayedThread = nil
			
			local function schedule()
				-- upvalues: delayedThread (write), var44 (copy), schedule (ref)
				delayedThread = task.delay(300, function()
					-- upvalues: var44 (copy), schedule (copy)
					var44(os.time())
					schedule()
				end)
			end
			
			delayedThread = task.delay(300, function()
				-- upvalues: var44 (copy), schedule (ref)
				var44(os.time())
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
		var41 = reactModule.useMemo(function()
			-- upvalues: reactModule (copy), var42 (ref), var43 (ref)
			return reactModule.joinBindings({ lastRefreshedAt = var42, tick = var43 }):map(function(p6)
				local lastRefreshedAt = p6.lastRefreshedAt
				
				return if lastRefreshedAt == nil then "Unable to load" else `Last updated {math.max(0, math.floor((os.time() - lastRefreshedAt) / 60))} min ago`
			end)
		end, { var42, var43 })
	end
	reactModule.useEffect(function()
		-- upvalues: var18 (ref), tab (ref)
		if var18 then
			var18:fireTabOpened(tab)
		end
		return function()
			-- upvalues: var18 (copy), tab (copy)
			if var18 then
				var18:fireTabClosed(tab)
			end
		end
	end, { var18, tab })
	reactModule.useEffect(function()
		-- upvalues: var34 (ref), loading_1 (ref), var36 (ref)
		var34.current = false
		loading_1("loading")
		
		if var36 then
			return function()
				-- upvalues: var34 (copy)
				var34.current = true
			end
		end
		local delayedThread = task.delay(30, function()
			-- upvalues: var34 (copy), loading_1 (copy)
			if not var34.current then
				loading_1("error")
			end
		end)
		
		return function()
			-- upvalues: var34 (copy), delayedThread (ref)
			var34.current = true
			task.cancel(delayedThread)
		end
	end, { var18, tab, var36, var32 })
	local localPlayer = playersService.LocalPlayer
	local var45 = reactModule.useMemo(function()
		-- upvalues: localPlayer (ref), resolveDisplayNameModule (copy)
		return if localPlayer then resolveDisplayNameModule(localPlayer) else nil
	end, { localPlayer })
	local var46 = signalsReactModule.useSignalState(var29)
	local var47 = getPeopleHeaderLabelModule()
	local var48 = reactModule.useCallback(function()
		-- upvalues: var18 (ref), tab (ref), loading_1 (ref), var33 (ref)
		if var18 then
			var18:fireTabClosed(tab)
			var18:fireTabOpened(tab)
		end
		loading_1("loading")
		var33(function(p7)
			return p7 + 1
		end)
	end, { var18, tab })
	
	if var18 == nil or not var36 then
		return if loading == "error" then reactModule.createElement(serviceUnavailableState, {
			onRetry = var48,
			layoutOrder = p2.layoutOrder,
			useLegacyPanelStyling = var17
		}) else reactModule.createElement(loadingState, {
			layoutOrder = p2.layoutOrder,
			useLegacyPanelStyling = var17
		})
	elseif isFriends and var37 == 0 then
		return reactModule.createElement(emptyFriendsState, {
			layoutOrder = p2.layoutOrder,
			useLegacyPanelStyling = var17
		})
	end
	local t = {}
	
	for i_1, v in pairs(var35) do
		t[`Row_{i_1}`] = reactModule.createElement(platformEntryViewModule, {
			isViewer = false,
			showDivider = true,
			scoreGetter = v.getScore,
			rankGetter = v.getRank,
			displayName = v.displayName,
			rowHeight = var19,
			rankWidth = var22,
			scoreWidth = var23
		})
	end
	return reactModule.createElement(view, {
		tag = "col fill size-full-0",
		LayoutOrder = p2.layoutOrder
	}, {
		ColumnHeader = if var17 then reactModule.createElement("Frame", {
			Name = "LegacyPlatformColumnHeader",
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, var20)
		}, {
			Header = reactModule.createElement(platformEntryViewModule, {
				isHeader = true,
				scoreLabel = var46,
				peopleHeaderText = var47,
				rankHeaderText = rankHeader,
				rowHeight = var20,
				rankWidth = var22,
				scoreWidth = var23
			})
		}) else reactModule.createElement(view, {
			tag = "size-full-0 bg-surface-100",
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, var20)
		}, {
			Header = reactModule.createElement(platformEntryViewModule, {
				isHeader = true,
				scoreLabel = var46,
				peopleHeaderText = var47,
				rankHeaderText = rankHeader,
				rowHeight = var20,
				rankWidth = var22,
				scoreWidth = var23
			})
		}),
		PinnedViewer = reactModule.createElement(platformEntryViewModule, {
			isViewer = true,
			layoutOrder = 3,
			scoreGetter = var27,
			rankGetter = var28,
			displayName = var45,
			highlightViewerRow = not var17,
			rowHeight = var19,
			rankWidth = var22,
			scoreWidth = var23
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
					AutomaticCanvasSize = if not var17 then nil else Enum.AutomaticSize.Y,
					ScrollingDirection = Enum.ScrollingDirection.Y
				},
				scrollingFrameRef = if not var17 then var24 else nil
			}, t)
		}),
		Footer = if var17 then reactModule.createElement("Frame", {
			Name = "LegacyPlatformFooter",
			LayoutOrder = 6,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, var21)
		}, {
			FooterInner = reactModule.createElement(view, {
				tag = "row align-x-right align-y-center size-full padding-x-medium padding-y-xsmall",
				Size = UDim2.fromScale(1, 1)
			}, {
				FooterText = reactModule.createElement(text, {
					tag = "auto-xy text-caption-small text-align-x-right content-muted",
					Text = var41
				})
			})
		}) else reactModule.createElement(view, {
			tag = "row align-x-right align-y-center size-full-0 padding-x-medium padding-y-xsmall stroke-standard stroke-default bg-surface-100",
			LayoutOrder = 6,
			Size = UDim2.new(1, 0, 0, var21)
		}, {
			FooterText = reactModule.createElement(text, {
				tag = "auto-xy text-caption-small text-align-x-right content-muted",
				Text = var41
			})
		})
	})
end)