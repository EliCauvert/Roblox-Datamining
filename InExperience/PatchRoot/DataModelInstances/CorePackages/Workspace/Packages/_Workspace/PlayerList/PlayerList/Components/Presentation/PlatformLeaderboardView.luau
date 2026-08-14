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
local fFlagPlayerListReskinOptimizationModule = require(parent.Flags.FFlagPlayerListReskinOptimization)
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

local function _(p0, p1) --[[ line: 47 | named "formatRelativeTimeLegacy" ]]
	return if p0 == nil then "Unable to load" else `Last updated {math.max(0, math.floor((p1 - p0) / 60))} min ago`
end

return reactModule.memo(function(p2) --[[ line: 64 | named "PlatformLeaderboardViewImpl" ]]
	-- upvalues: usePlatformLeaderboardModule (ref), useTokens (ref), constantsModule (ref), var15 (ref), var13 (ref), var14 (ref), reactModule (ref), signalsReactModule (ref), signalsModule (ref), fFlagPlayerListLocalizeGameTextModule (ref), useLocalization (ref), playersService (ref), resolveDisplayNameModule (ref), getPeopleHeaderLabelModule (ref), fFlagPlayerListReskinOptimizationModule (ref), serviceUnavailableState (ref), loadingState (ref), emptyFriendsState (ref), platformEntryViewModule (ref), scrollView (ref), view (ref), text (ref)
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
	local var24 = if var18 then if isFriends then var18.friendsEntries else var18.globalEntries else var15
	local var25 = if var18 then if isFriends then var18.getFriendsLastRefreshedAt else var18.getGlobalLastRefreshedAt else var13
	local var26 = if var18 then if isFriends then var18.getUserFriendScore else var18.getUserScore else var13
	local var27 = if var18 then if isFriends then var18.getUserFriendRank else var18.getUserRank else var13
	local var28 = if var18 then var18.getUnit else var14
	local loading, loading_1 = reactModule.useState("loading")
	local var31, var32 = reactModule.useState(0)
	local var33 = reactModule.useRef(false)
	local var34 = signalsReactModule.useSignalState(var24.getAllData)
	local var35 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 100 ]]
		-- upvalues: signalsModule (copy), var25 (ref)
		return signalsModule.createComputed(function(p3) --[[ line: 101 ]]
			-- upvalues: var25 (copy)
			return var25(p3) ~= nil
		end)
	end, { var25 }))
	local var36 = 0
	
	for i in pairs(var34) do
		var36 += 1
	end
	local var40
	local rankHeader = nil
	local _ = nil
	
	if fFlagPlayerListLocalizeGameTextModule then
		local var37 = signalsReactModule.useSignalState(var25)
		local _, var38 = reactModule.useState(0)
		reactModule.useEffect(function() --[[ line: 118 ]]
			-- upvalues: var38 (ref)
			local delayedThread = nil
			
			local function schedule() --[[ line: 120 ]]
				-- upvalues: delayedThread (write), var38 (copy), schedule (ref)
				delayedThread = task.delay(300, function() --[[ line: 121 ]]
					-- upvalues: var38 (copy), schedule (copy)
					var38(function(p4) --[[ line: 122 ]]
						return p4 + 1
					end)
					schedule()
				end)
			end
			
			delayedThread = task.delay(300, function() --[[ line: 121 ]]
				-- upvalues: var38 (copy), schedule (ref)
				var38(function(p5) --[[ line: 122 ]]
					return p5 + 1
				end)
				schedule()
			end)
			
			return function() --[[ line: 129 ]]
				-- upvalues: delayedThread (write)
				if delayedThread then
					task.cancel(delayedThread)
					delayedThread = nil
				end
			end
		end, {})
		local var39 = useLocalization({
			rankHeader = "InGame.PlayerList.RankHeader",
			footerUnableToLoad = "InGame.PlayerList.FooterUnableToLoad",
			footerLastUpdated = {
				"InGame.PlayerList.FooterLastUpdated",
				minutes = if var37 == nil then 0 else math.max(0, math.floor((os.time() - var37) / 60))
			}
		})
		rankHeader = var39.rankHeader
		var40 = if var37 == nil then var39.footerUnableToLoad else var39.footerLastUpdated
	else
		local var41 = signalsReactModule.useSignalBinding(var25)
		local var42, var43 = reactModule.useBinding(os.time())
		reactModule.useEffect(function() --[[ line: 151 ]]
			-- upvalues: var43 (ref)
			local delayedThread = nil
			
			local function schedule() --[[ line: 153 ]]
				-- upvalues: delayedThread (write), var43 (copy), schedule (ref)
				delayedThread = task.delay(300, function() --[[ line: 154 ]]
					-- upvalues: var43 (copy), schedule (copy)
					var43(os.time())
					schedule()
				end)
			end
			
			delayedThread = task.delay(300, function() --[[ line: 154 ]]
				-- upvalues: var43 (copy), schedule (ref)
				var43(os.time())
				schedule()
			end)
			
			return function() --[[ line: 160 ]]
				-- upvalues: delayedThread (write)
				if delayedThread then
					task.cancel(delayedThread)
					delayedThread = nil
				end
			end
		end, {})
		var40 = reactModule.useMemo(function() --[[ line: 167 ]]
			-- upvalues: reactModule (copy), var41 (ref), var42 (ref)
			return reactModule.joinBindings({ lastRefreshedAt = var41, tick = var42 }):map(function(p6) --[[ line: 171 ]]
				local lastRefreshedAt = p6.lastRefreshedAt
				
				return if lastRefreshedAt == nil then "Unable to load" else `Last updated {math.max(0, math.floor((os.time() - lastRefreshedAt) / 60))} min ago`
			end)
		end, { var41, var42 })
	end
	reactModule.useEffect(function() --[[ line: 177 ]]
		-- upvalues: var18 (ref), tab (ref)
		if var18 then
			var18:fireTabOpened(tab)
		end
		return function() --[[ line: 181 ]]
			-- upvalues: var18 (copy), tab (copy)
			if var18 then
				var18:fireTabClosed(tab)
			end
		end
	end, { var18, tab })
	reactModule.useEffect(function() --[[ line: 188 ]]
		-- upvalues: var33 (ref), loading_1 (ref), var35 (ref)
		var33.current = false
		loading_1("loading")
		
		if var35 then
			return function() --[[ line: 192 ]]
				-- upvalues: var33 (copy)
				var33.current = true
			end
		end
		local delayedThread = task.delay(30, function() --[[ line: 196 ]]
			-- upvalues: var33 (copy), loading_1 (copy)
			if not var33.current then
				loading_1("error")
			end
		end)
		
		return function() --[[ line: 201 ]]
			-- upvalues: var33 (copy), delayedThread (ref)
			var33.current = true
			task.cancel(delayedThread)
		end
	end, { var18, tab, var35, var31 })
	local localPlayer = playersService.LocalPlayer
	local var44 = reactModule.useMemo(function() --[[ line: 208 ]]
		-- upvalues: localPlayer (ref), resolveDisplayNameModule (copy)
		return if localPlayer then resolveDisplayNameModule(localPlayer) else nil
	end, { localPlayer })
	local var45 = signalsReactModule.useSignalState(var28)
	local var46 = getPeopleHeaderLabelModule()
	local var47 = if fFlagPlayerListReskinOptimizationModule then reactModule.useCallback(function() --[[ line: 218 ]]
		-- upvalues: var18 (ref), tab (ref), loading_1 (ref), var32 (ref)
		if var18 then
			var18:fireTabClosed(tab)
			var18:fireTabOpened(tab)
		end
		loading_1("loading")
		var32(function(p7) --[[ line: 224 ]]
			return p7 + 1
		end)
	end, { var18, tab }) else nil
	
	if var18 == nil or not var35 then
		return if loading == "error" then reactModule.createElement(serviceUnavailableState, {
			onRetry = if fFlagPlayerListReskinOptimizationModule then var47 else function() --[[ line: 236 ]]
				-- upvalues: var18 (ref), tab (ref), loading_1 (ref), var32 (ref)
				if var18 then
					var18:fireTabClosed(tab)
					var18:fireTabOpened(tab)
				end
				loading_1("loading")
				var32(function(p8) --[[ line: 242 ]]
					return p8 + 1
				end)
			end,
			layoutOrder = p2.layoutOrder,
			useLegacyPanelStyling = var17
		}) else reactModule.createElement(loadingState, {
			layoutOrder = p2.layoutOrder,
			useLegacyPanelStyling = var17
		})
	elseif isFriends and var36 == 0 then
		return reactModule.createElement(emptyFriendsState, {
			layoutOrder = p2.layoutOrder,
			useLegacyPanelStyling = var17
		})
	end
	local t = {}
	
	for i_1, v in pairs(var34) do
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
				scoreLabel = var45,
				peopleHeaderText = var46,
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
				scoreLabel = var45,
				peopleHeaderText = var46,
				rankHeaderText = rankHeader,
				rowHeight = var20,
				rankWidth = var22,
				scoreWidth = var23
			})
		}),
		PinnedViewer = reactModule.createElement(platformEntryViewModule, {
			isViewer = true,
			layoutOrder = 3,
			scoreGetter = var26,
			rankGetter = var27,
			displayName = var44,
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
					AutomaticCanvasSize = Enum.AutomaticSize.Y,
					ScrollingDirection = Enum.ScrollingDirection.Y
				}
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
					Text = var40
				})
			})
		}) else reactModule.createElement(view, {
			tag = "row align-x-right align-y-center size-full-0 padding-x-medium padding-y-xsmall stroke-standard stroke-default bg-surface-100",
			LayoutOrder = 6,
			Size = UDim2.new(1, 0, 0, var21)
		}, {
			FooterText = reactModule.createElement(text, {
				tag = "auto-xy text-caption-small text-align-x-right content-muted",
				Text = var40
			})
		})
	})
end)