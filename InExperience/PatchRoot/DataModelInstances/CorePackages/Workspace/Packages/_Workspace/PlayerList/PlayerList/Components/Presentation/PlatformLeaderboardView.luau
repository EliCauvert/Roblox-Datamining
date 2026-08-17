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
local fFlagPlayerListReskinOptimizationModule = require(parent.Flags.FFlagPlayerListReskinOptimization)
local fFlagPlayerListReskinHeightResponsivenessModule = require(parent.Flags.FFlagPlayerListReskinHeightResponsiveness)
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
local var15 = signalsModule.createSignal(nil)
local var16 = signalsModule.createSignal(nil)
local var17 = require(parent_1.CoreScriptsRoactCommon).Utilities.createSignalMap()

local function _(p0, p1) --[[ line: 49 | named "formatRelativeTimeLegacy" ]]
	return if p0 == nil then "Unable to load" else `Last updated {math.max(0, math.floor((p1 - p0) / 60))} min ago`
end

return reactModule.memo(function(p2) --[[ line: 66 | named "PlatformLeaderboardViewImpl" ]]
	-- upvalues: usePlatformLeaderboardModule (ref), useTokens (ref), constantsModule (ref), fFlagPlayerListReskinHeightResponsivenessModule (ref), useReportPanelContentHeightModule (ref), var17 (ref), var15 (ref), var16 (ref), reactModule (ref), signalsReactModule (ref), signalsModule (ref), fFlagPlayerListLocalizeGameTextModule (ref), useLocalization (ref), playersService (ref), resolveDisplayNameModule (ref), getPeopleHeaderLabelModule (ref), fFlagPlayerListReskinOptimizationModule (ref), serviceUnavailableState (ref), loadingState (ref), emptyFriendsState (ref), platformEntryViewModule (ref), scrollView (ref), view (ref), text (ref)
	local tab = p2.tab
	local isFriends = tab == "Friends"
	local var19 = p2.legacyPanelBackgroundColor ~= nil
	local var20 = usePlatformLeaderboardModule()
	local scale = useTokens().Config.UI.Scale
	local var21 = constantsModule.PLATFORM_ROW_HEIGHT * scale
	local var22 = constantsModule.PLATFORM_HEADER_HEIGHT * scale
	local var23 = 26 * scale
	local var24 = constantsModule.PLATFORM_RANK_WIDTH * scale
	local var25 = constantsModule.PLATFORM_SCORE_WIDTH * scale
	local var26 = if fFlagPlayerListReskinHeightResponsivenessModule then useReportPanelContentHeightModule(var22 + var21 + var23) else nil
	local var27 = if var20 then if isFriends then var20.friendsEntries else var20.globalEntries else var17
	local var28 = if var20 then if isFriends then var20.getFriendsLastRefreshedAt else var20.getGlobalLastRefreshedAt else var15
	local var29 = if var20 then if isFriends then var20.getUserFriendScore else var20.getUserScore else var15
	local var30 = if var20 then if isFriends then var20.getUserFriendRank else var20.getUserRank else var15
	local var31 = if var20 then var20.getUnit else var16
	local loading, loading_1 = reactModule.useState("loading")
	local var34, var35 = reactModule.useState(0)
	local var36 = reactModule.useRef(false)
	local var37 = signalsReactModule.useSignalState(var27.getAllData)
	local var38 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 112 ]]
		-- upvalues: signalsModule (copy), var28 (ref)
		return signalsModule.createComputed(function(p3) --[[ line: 113 ]]
			-- upvalues: var28 (copy)
			return var28(p3) ~= nil
		end)
	end, { var28 }))
	local var39 = 0
	
	for i in pairs(var37) do
		var39 += 1
	end
	local var43
	local rankHeader = nil
	local _ = nil
	
	if fFlagPlayerListLocalizeGameTextModule then
		local var40 = signalsReactModule.useSignalState(var28)
		local _, var41 = reactModule.useState(0)
		reactModule.useEffect(function() --[[ line: 130 ]]
			-- upvalues: var41 (ref)
			local delayedThread = nil
			
			local function schedule() --[[ line: 132 ]]
				-- upvalues: delayedThread (write), var41 (copy), schedule (ref)
				delayedThread = task.delay(300, function() --[[ line: 133 ]]
					-- upvalues: var41 (copy), schedule (copy)
					var41(function(p4) --[[ line: 134 ]]
						return p4 + 1
					end)
					schedule()
				end)
			end
			
			delayedThread = task.delay(300, function() --[[ line: 133 ]]
				-- upvalues: var41 (copy), schedule (ref)
				var41(function(p5) --[[ line: 134 ]]
					return p5 + 1
				end)
				schedule()
			end)
			
			return function() --[[ line: 141 ]]
				-- upvalues: delayedThread (write)
				if delayedThread then
					task.cancel(delayedThread)
					delayedThread = nil
				end
			end
		end, {})
		local var42 = useLocalization({
			rankHeader = "InGame.PlayerList.RankHeader",
			footerUnableToLoad = "InGame.PlayerList.FooterUnableToLoad",
			footerLastUpdated = {
				"InGame.PlayerList.FooterLastUpdated",
				minutes = if var40 == nil then 0 else math.max(0, math.floor((os.time() - var40) / 60))
			}
		})
		rankHeader = var42.rankHeader
		var43 = if var40 == nil then var42.footerUnableToLoad else var42.footerLastUpdated
	else
		local var44 = signalsReactModule.useSignalBinding(var28)
		local var45, var46 = reactModule.useBinding(os.time())
		reactModule.useEffect(function() --[[ line: 163 ]]
			-- upvalues: var46 (ref)
			local delayedThread = nil
			
			local function schedule() --[[ line: 165 ]]
				-- upvalues: delayedThread (write), var46 (copy), schedule (ref)
				delayedThread = task.delay(300, function() --[[ line: 166 ]]
					-- upvalues: var46 (copy), schedule (copy)
					var46(os.time())
					schedule()
				end)
			end
			
			delayedThread = task.delay(300, function() --[[ line: 166 ]]
				-- upvalues: var46 (copy), schedule (ref)
				var46(os.time())
				schedule()
			end)
			
			return function() --[[ line: 172 ]]
				-- upvalues: delayedThread (write)
				if delayedThread then
					task.cancel(delayedThread)
					delayedThread = nil
				end
			end
		end, {})
		var43 = reactModule.useMemo(function() --[[ line: 179 ]]
			-- upvalues: reactModule (copy), var44 (ref), var45 (ref)
			return reactModule.joinBindings({ lastRefreshedAt = var44, tick = var45 }):map(function(p6) --[[ line: 183 ]]
				local lastRefreshedAt = p6.lastRefreshedAt
				
				return if lastRefreshedAt == nil then "Unable to load" else `Last updated {math.max(0, math.floor((os.time() - lastRefreshedAt) / 60))} min ago`
			end)
		end, { var44, var45 })
	end
	reactModule.useEffect(function() --[[ line: 189 ]]
		-- upvalues: var20 (ref), tab (ref)
		if var20 then
			var20:fireTabOpened(tab)
		end
		return function() --[[ line: 193 ]]
			-- upvalues: var20 (copy), tab (copy)
			if var20 then
				var20:fireTabClosed(tab)
			end
		end
	end, { var20, tab })
	reactModule.useEffect(function() --[[ line: 200 ]]
		-- upvalues: var36 (ref), loading_1 (ref), var38 (ref)
		var36.current = false
		loading_1("loading")
		
		if var38 then
			return function() --[[ line: 204 ]]
				-- upvalues: var36 (copy)
				var36.current = true
			end
		end
		local delayedThread = task.delay(30, function() --[[ line: 208 ]]
			-- upvalues: var36 (copy), loading_1 (copy)
			if not var36.current then
				loading_1("error")
			end
		end)
		
		return function() --[[ line: 213 ]]
			-- upvalues: var36 (copy), delayedThread (ref)
			var36.current = true
			task.cancel(delayedThread)
		end
	end, { var20, tab, var38, var34 })
	local localPlayer = playersService.LocalPlayer
	local var47 = reactModule.useMemo(function() --[[ line: 220 ]]
		-- upvalues: localPlayer (ref), resolveDisplayNameModule (copy)
		return if localPlayer then resolveDisplayNameModule(localPlayer) else nil
	end, { localPlayer })
	local var48 = signalsReactModule.useSignalState(var31)
	local var49 = getPeopleHeaderLabelModule()
	local var50 = if fFlagPlayerListReskinOptimizationModule then reactModule.useCallback(function() --[[ line: 230 ]]
		-- upvalues: var20 (ref), tab (ref), loading_1 (ref), var35 (ref)
		if var20 then
			var20:fireTabClosed(tab)
			var20:fireTabOpened(tab)
		end
		loading_1("loading")
		var35(function(p7) --[[ line: 236 ]]
			return p7 + 1
		end)
	end, { var20, tab }) else nil
	
	if var20 == nil or not var38 then
		return if loading == "error" then reactModule.createElement(serviceUnavailableState, {
			onRetry = if fFlagPlayerListReskinOptimizationModule then var50 else function() --[[ line: 248 ]]
				-- upvalues: var20 (ref), tab (ref), loading_1 (ref), var35 (ref)
				if var20 then
					var20:fireTabClosed(tab)
					var20:fireTabOpened(tab)
				end
				loading_1("loading")
				var35(function(p8) --[[ line: 254 ]]
					return p8 + 1
				end)
			end,
			layoutOrder = p2.layoutOrder,
			useLegacyPanelStyling = var19
		}) else reactModule.createElement(loadingState, {
			layoutOrder = p2.layoutOrder,
			useLegacyPanelStyling = var19
		})
	elseif isFriends and var39 == 0 then
		return reactModule.createElement(emptyFriendsState, {
			layoutOrder = p2.layoutOrder,
			useLegacyPanelStyling = var19
		})
	end
	local t = {}
	
	for i_1, v in pairs(var37) do
		t[`Row_{i_1}`] = reactModule.createElement(platformEntryViewModule, {
			isViewer = false,
			showDivider = true,
			scoreGetter = v.getScore,
			rankGetter = v.getRank,
			displayName = v.displayName,
			rowHeight = var21,
			rankWidth = var24,
			scoreWidth = var25
		})
	end
	return reactModule.createElement(view, {
		tag = "col fill size-full-0",
		LayoutOrder = p2.layoutOrder
	}, {
		ColumnHeader = if var19 then reactModule.createElement("Frame", {
			Name = "LegacyPlatformColumnHeader",
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, var22)
		}, {
			Header = reactModule.createElement(platformEntryViewModule, {
				isHeader = true,
				scoreLabel = var48,
				peopleHeaderText = var49,
				rankHeaderText = rankHeader,
				rowHeight = var22,
				rankWidth = var24,
				scoreWidth = var25
			})
		}) else reactModule.createElement(view, {
			tag = "size-full-0 bg-surface-100",
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, var22)
		}, {
			Header = reactModule.createElement(platformEntryViewModule, {
				isHeader = true,
				scoreLabel = var48,
				peopleHeaderText = var49,
				rankHeaderText = rankHeader,
				rowHeight = var22,
				rankWidth = var24,
				scoreWidth = var25
			})
		}),
		PinnedViewer = reactModule.createElement(platformEntryViewModule, {
			isViewer = true,
			layoutOrder = 3,
			scoreGetter = var29,
			rankGetter = var30,
			displayName = var47,
			highlightViewerRow = not var19,
			rowHeight = var21,
			rankWidth = var24,
			scoreWidth = var25
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
					AutomaticCanvasSize = if fFlagPlayerListReskinHeightResponsivenessModule and not var19 then nil else Enum.AutomaticSize.Y,
					ScrollingDirection = Enum.ScrollingDirection.Y
				},
				scrollingFrameRef = if fFlagPlayerListReskinHeightResponsivenessModule and not var19 then var26 else nil
			}, t)
		}),
		Footer = if var19 then reactModule.createElement("Frame", {
			Name = "LegacyPlatformFooter",
			LayoutOrder = 6,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, var23)
		}, {
			FooterInner = reactModule.createElement(view, {
				tag = "row align-x-right align-y-center size-full padding-x-medium padding-y-xsmall",
				Size = UDim2.fromScale(1, 1)
			}, {
				FooterText = reactModule.createElement(text, {
					tag = "auto-xy text-caption-small text-align-x-right content-muted",
					Text = var43
				})
			})
		}) else reactModule.createElement(view, {
			tag = "row align-x-right align-y-center size-full-0 padding-x-medium padding-y-xsmall stroke-standard stroke-default bg-surface-100",
			LayoutOrder = 6,
			Size = UDim2.new(1, 0, 0, var23)
		}, {
			FooterText = reactModule.createElement(text, {
				tag = "auto-xy text-caption-small text-align-x-right content-muted",
				Text = var43
			})
		})
	})
end)