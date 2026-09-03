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
local var1 = signalsModule.createSignal(nil)
local var2 = signalsModule.createSignal(nil)
local var3 = require(parent_1.CoreScriptsRoactCommon).Utilities.createSignalMap()

local function _(p1, p2)
	return if p1 == nil then "Unable to load" else `Last updated {math.max(0, math.floor((p2 - p1) / 60))} min ago`
end

return reactModule.memo(function(p1)
	-- upvalues: usePlatformLeaderboardModule (ref), useTokens (ref), constantsModule (ref), useReportPanelContentHeightModule (ref), reactModule (ref), useGamepadStickScrollModule (ref), var3 (ref), var1 (ref), var2 (ref), signalsReactModule (ref), signalsModule (ref), fFlagPlayerListLocalizeGameTextModule (ref), useLocalization (ref), playersService (ref), resolveDisplayNameModule (ref), getPeopleHeaderLabelModule (ref), serviceUnavailableState (ref), loadingState (ref), emptyFriendsState (ref), platformEntryViewModule (ref), scrollView (ref), view (ref), text (ref)
	local tab = p1.tab
	local isFriends = tab == "Friends"
	local var4 = p1.legacyPanelBackgroundColor ~= nil
	local var5 = usePlatformLeaderboardModule()
	local scale = useTokens().Config.UI.Scale
	local var6 = constantsModule.PLATFORM_ROW_HEIGHT * scale
	local var7 = constantsModule.PLATFORM_HEADER_HEIGHT * scale
	local var8 = constantsModule.PLATFORM_FOOTER_HEIGHT * scale
	local var9 = constantsModule.PLATFORM_RANK_WIDTH * scale
	local var10 = constantsModule.PLATFORM_SCORE_WIDTH * scale
	local var11 = useReportPanelContentHeightModule(var7 + var6 + var8)
	local var12 = reactModule.useRef(nil)
	local var13 = reactModule.useCallback(function(p2)
		-- upvalues: var12 (ref), var11 (ref)
		var12.current = p2
		var11(p2)
	end, { var11 })
	useGamepadStickScrollModule({ scrollingFrameRef = var12, enabled = not var4 })
	local var14 = if var5 then if isFriends then var5.friendsEntries else var5.globalEntries else var3
	local var15 = if var5 then if isFriends then var5.getFriendsLastRefreshedAt else var5.getGlobalLastRefreshedAt else var1
	local var16 = if var5 then if isFriends then var5.getUserFriendScore else var5.getUserScore else var1
	local var17 = if var5 then if isFriends then var5.getUserFriendRank else var5.getUserRank else var1
	local var18 = if var5 then var5.getUnit else var2
	local loading, loading_1 = reactModule.useState("loading")
	local var19, var20 = reactModule.useState(0)
	local var21 = reactModule.useRef(false)
	local var22 = signalsReactModule.useSignalState(var14.getAllData)
	local var23 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var15 (ref)
		return signalsModule.createComputed(function(p2)
			-- upvalues: var15 (copy)
			return var15(p2) ~= nil
		end)
	end, { var15 }))
	local var24 = 0
	
	for i in pairs(var22) do
		var24 += 1
	end
	local var25
	local rankHeader = nil
	local _ = nil
	
	if fFlagPlayerListLocalizeGameTextModule then
		local var26 = signalsReactModule.useSignalState(var15)
		local _, var27 = reactModule.useState(0)
		reactModule.useEffect(function()
			-- upvalues: var27 (ref)
			local delayedThread = nil
			
			local function schedule()
				-- upvalues: delayedThread (write), var27 (copy), schedule (ref)
				delayedThread = task.delay(300, function()
					-- upvalues: var27 (copy), schedule (copy)
					var27(function(p2)
						return p2 + 1
					end)
					schedule()
				end)
			end
			
			delayedThread = task.delay(300, function()
				-- upvalues: var27 (copy), schedule (ref)
				var27(function(p2)
					return p2 + 1
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
		local var28 = useLocalization({
			rankHeader = "InGame.PlayerList.RankHeader",
			footerUnableToLoad = "InGame.PlayerList.FooterUnableToLoad",
			footerLastUpdated = {
				"InGame.PlayerList.FooterLastUpdated",
				minutes = if var26 == nil then 0 else math.max(0, math.floor((os.time() - var26) / 60))
			}
		})
		rankHeader = var28.rankHeader
		var25 = if var26 == nil then var28.footerUnableToLoad else var28.footerLastUpdated
	else
		local var29 = signalsReactModule.useSignalBinding(var15)
		local var30, var31 = reactModule.useBinding(os.time())
		reactModule.useEffect(function()
			-- upvalues: var31 (ref)
			local delayedThread = nil
			
			local function schedule()
				-- upvalues: delayedThread (write), var31 (copy), schedule (ref)
				delayedThread = task.delay(300, function()
					-- upvalues: var31 (copy), schedule (copy)
					var31(os.time())
					schedule()
				end)
			end
			
			delayedThread = task.delay(300, function()
				-- upvalues: var31 (copy), schedule (ref)
				var31(os.time())
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
		var25 = reactModule.useMemo(function()
			-- upvalues: reactModule (copy), var29 (ref), var30 (ref)
			return reactModule.joinBindings({ lastRefreshedAt = var29, tick = var30 }):map(function(p2)
				local lastRefreshedAt = p2.lastRefreshedAt
				
				return if lastRefreshedAt == nil then "Unable to load" else `Last updated {math.max(0, math.floor((os.time() - lastRefreshedAt) / 60))} min ago`
			end)
		end, { var29, var30 })
	end
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), tab (ref)
		if var5 then
			var5:fireTabOpened(tab)
		end
		return function()
			-- upvalues: var5 (copy), tab (copy)
			if var5 then
				var5:fireTabClosed(tab)
			end
		end
	end, { var5, tab })
	reactModule.useEffect(function()
		-- upvalues: var21 (ref), loading_1 (ref), var23 (ref)
		var21.current = false
		loading_1("loading")
		
		if var23 then
			return function()
				-- upvalues: var21 (copy)
				var21.current = true
			end
		end
		local delayedThread = task.delay(30, function()
			-- upvalues: var21 (copy), loading_1 (copy)
			if not var21.current then
				loading_1("error")
			end
		end)
		
		return function()
			-- upvalues: var21 (copy), delayedThread (ref)
			var21.current = true
			task.cancel(delayedThread)
		end
	end, { var5, tab, var23, var19 })
	local localPlayer = playersService.LocalPlayer
	local var32 = reactModule.useMemo(function()
		-- upvalues: localPlayer (ref), resolveDisplayNameModule (copy)
		return if localPlayer then resolveDisplayNameModule(localPlayer) else nil
	end, { localPlayer })
	local var33 = signalsReactModule.useSignalState(var18)
	local var34 = getPeopleHeaderLabelModule()
	local var35 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), tab (ref), loading_1 (ref), var20 (ref)
		if var5 then
			var5:fireTabClosed(tab)
			var5:fireTabOpened(tab)
		end
		loading_1("loading")
		var20(function(p2)
			return p2 + 1
		end)
	end, { var5, tab })
	
	if var5 == nil or not var23 then
		return if loading == "error" then reactModule.createElement(serviceUnavailableState, {
			onRetry = var35,
			layoutOrder = p1.layoutOrder,
			useLegacyPanelStyling = var4
		}) else reactModule.createElement(loadingState, {
			layoutOrder = p1.layoutOrder,
			useLegacyPanelStyling = var4
		})
	elseif isFriends and var24 == 0 then
		return reactModule.createElement(emptyFriendsState, {
			layoutOrder = p1.layoutOrder,
			useLegacyPanelStyling = var4
		})
	end
	local t = {}
	
	for i_1, v in pairs(var22) do
		t[`Row_{i_1}`] = reactModule.createElement(platformEntryViewModule, {
			isViewer = false,
			showDivider = true,
			scoreGetter = v.getScore,
			rankGetter = v.getRank,
			displayName = v.displayName,
			rowHeight = var6,
			rankWidth = var9,
			scoreWidth = var10
		})
	end
	return reactModule.createElement(view, {
		tag = "col fill size-full-0",
		LayoutOrder = p1.layoutOrder
	}, {
		ColumnHeader = if var4 then reactModule.createElement("Frame", {
			Name = "LegacyPlatformColumnHeader",
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, var7)
		}, {
			Header = reactModule.createElement(platformEntryViewModule, {
				isHeader = true,
				scoreLabel = var33,
				peopleHeaderText = var34,
				rankHeaderText = rankHeader,
				rowHeight = var7,
				rankWidth = var9,
				scoreWidth = var10
			})
		}) else reactModule.createElement(view, {
			tag = "size-full-0 bg-surface-100",
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, var7)
		}, {
			Header = reactModule.createElement(platformEntryViewModule, {
				isHeader = true,
				scoreLabel = var33,
				peopleHeaderText = var34,
				rankHeaderText = rankHeader,
				rowHeight = var7,
				rankWidth = var9,
				scoreWidth = var10
			})
		}),
		PinnedViewer = reactModule.createElement(platformEntryViewModule, {
			isViewer = true,
			layoutOrder = 3,
			scoreGetter = var16,
			rankGetter = var17,
			displayName = var32,
			highlightViewerRow = not var4,
			rowHeight = var6,
			rankWidth = var9,
			scoreWidth = var10
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
					AutomaticCanvasSize = if not var4 then nil else Enum.AutomaticSize.Y,
					ScrollingDirection = Enum.ScrollingDirection.Y
				},
				scrollingFrameRef = if not var4 then var13 else nil,
				selection = constantsModule.NOT_SELECTABLE
			}, t)
		}),
		Footer = if var4 then reactModule.createElement("Frame", {
			Name = "LegacyPlatformFooter",
			LayoutOrder = 6,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, var8)
		}, {
			FooterInner = reactModule.createElement(view, {
				tag = "row align-x-right align-y-center size-full padding-x-medium padding-y-xsmall",
				Size = UDim2.fromScale(1, 1)
			}, {
				FooterText = reactModule.createElement(text, {
					tag = "auto-xy text-caption-small text-align-x-right content-muted",
					Text = var25
				})
			})
		}) else reactModule.createElement(view, {
			tag = "row align-x-right align-y-center size-full-0 padding-x-medium padding-y-xsmall stroke-standard stroke-default bg-surface-100",
			LayoutOrder = 6,
			Size = UDim2.new(1, 0, 0, var8)
		}, {
			FooterText = reactModule.createElement(text, {
				tag = "auto-xy text-caption-small text-align-x-right content-muted",
				Text = var25
			})
		})
	})
end)