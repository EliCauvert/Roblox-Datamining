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
local fFlagPlayerListReskinModule = require(parent.Flags.FFlagPlayerListReskin)
local useLocalization = require(parent_1.Localization).Hooks.useLocalization
local loadingState = emptyAndErrorStatesModule.LoadingState
local emptyFriendsState = emptyAndErrorStatesModule.EmptyFriendsState
local serviceUnavailableState = emptyAndErrorStatesModule.ServiceUnavailableState
local var1 = nil

local function _()
	-- upvalues: var1 (write), parent (ref)
	if var1 == nil then
		var1 = require(parent.Common.LeaderboardViewChangeTelemetry)
	end
	return var1
end

local var2 = signalsModule.createSignal(nil)
local var3 = signalsModule.createSignal(nil)
local var4 = require(parent_1.CoreScriptsRoactCommon).Utilities.createSignalMap()

local _ = function(p1, p2)
	return if p1 == nil then "Unable to load" else `Last updated {math.max(0, math.floor((p2 - p1) / 60))} min ago`
end

return reactModule.memo(function(p1)
	-- upvalues: usePlatformLeaderboardModule (ref), useTokens (ref), constantsModule (ref), useReportPanelContentHeightModule (ref), reactModule (ref), useGamepadStickScrollModule (ref), var4 (ref), var2 (ref), var3 (ref), signalsReactModule (ref), signalsModule (ref), fFlagPlayerListLocalizeGameTextModule (ref), useLocalization (ref), fFlagPlayerListReskinModule (ref), var1 (write), parent (ref), playersService (ref), resolveDisplayNameModule (ref), getPeopleHeaderLabelModule (ref), serviceUnavailableState (ref), loadingState (ref), emptyFriendsState (ref), platformEntryViewModule (ref), scrollView (ref), view (ref), text (ref)
	local tab = p1.tab
	local isFriends = tab == "Friends"
	local var5 = p1.legacyPanelBackgroundColor ~= nil
	local var6 = usePlatformLeaderboardModule()
	local scale = useTokens().Config.UI.Scale
	local var7 = constantsModule.PLATFORM_ROW_HEIGHT * scale
	local var8 = constantsModule.PLATFORM_HEADER_HEIGHT * scale
	local var9 = constantsModule.PLATFORM_FOOTER_HEIGHT * scale
	local var10 = constantsModule.PLATFORM_RANK_WIDTH * scale
	local var11 = constantsModule.PLATFORM_SCORE_WIDTH * scale
	local var12 = useReportPanelContentHeightModule(var8 + var7 + var9)
	local var13 = reactModule.useRef(nil)
	local var14 = reactModule.useCallback(function(p2)
		-- upvalues: var13 (ref), var12 (ref)
		var13.current = p2
		var12(p2)
	end, { var12 })
	useGamepadStickScrollModule({ scrollingFrameRef = var13, enabled = not var5 })
	local var15 = if var6 then if isFriends then var6.friendsEntries else var6.globalEntries else var4
	local var16 = if var6 then if isFriends then var6.getFriendsLastRefreshedAt else var6.getGlobalLastRefreshedAt else var2
	local var17 = if var6 then if isFriends then var6.getUserFriendScore else var6.getUserScore else var2
	local var18 = if var6 then if isFriends then var6.getUserFriendRank else var6.getUserRank else var2
	local var19 = if var6 then var6.getUnit else var3
	local loading, loading_1 = reactModule.useState("loading")
	local var20, var21 = reactModule.useState(0)
	local var22 = reactModule.useRef(false)
	local var23 = signalsReactModule.useSignalState(var15.getAllData)
	local var24 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var16 (ref)
		return signalsModule.createComputed(function(p2)
			-- upvalues: var16 (copy)
			return var16(p2) ~= nil
		end)
	end, { var16 }))
	local var25 = 0
	
	for i in pairs(var23) do
		var25 += 1
	end
	local var26
	local rankHeader = nil
	local _ = nil
	
	if fFlagPlayerListLocalizeGameTextModule then
		local var27 = signalsReactModule.useSignalState(var16)
		local _, var28 = reactModule.useState(0)
		reactModule.useEffect(function()
			-- upvalues: var28 (ref)
			local delayedThread = nil
			
			local function schedule()
				-- upvalues: delayedThread (write), var28 (copy), schedule (ref)
				delayedThread = task.delay(300, function()
					-- upvalues: var28 (copy), schedule (copy)
					var28(function(p2)
						return p2 + 1
					end)
					schedule()
				end)
			end
			
			delayedThread = task.delay(300, function()
				-- upvalues: var28 (copy), schedule (ref)
				var28(function(p2)
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
		local var29 = useLocalization({
			rankHeader = "InGame.PlayerList.RankHeader",
			footerUnableToLoad = "InGame.PlayerList.FooterUnableToLoad",
			footerLastUpdated = {
				"InGame.PlayerList.FooterLastUpdated",
				minutes = if var27 == nil then 0 else math.max(0, math.floor((os.time() - var27) / 60))
			}
		})
		rankHeader = var29.rankHeader
		var26 = if var27 == nil then var29.footerUnableToLoad else var29.footerLastUpdated
	else
		local var30 = signalsReactModule.useSignalBinding(var16)
		local var31, var32 = reactModule.useBinding(os.time())
		reactModule.useEffect(function()
			-- upvalues: var32 (ref)
			local delayedThread = nil
			
			local function schedule()
				-- upvalues: delayedThread (write), var32 (copy), schedule (ref)
				delayedThread = task.delay(300, function()
					-- upvalues: var32 (copy), schedule (copy)
					var32(os.time())
					schedule()
				end)
			end
			
			delayedThread = task.delay(300, function()
				-- upvalues: var32 (copy), schedule (ref)
				var32(os.time())
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
		var26 = reactModule.useMemo(function()
			-- upvalues: reactModule (copy), var30 (ref), var31 (ref)
			return reactModule.joinBindings({ lastRefreshedAt = var30, tick = var31 }):map(function(p2)
				local lastRefreshedAt = p2.lastRefreshedAt
				
				return if lastRefreshedAt == nil then "Unable to load" else `Last updated {math.max(0, math.floor((os.time() - lastRefreshedAt) / 60))} min ago`
			end)
		end, { var30, var31 })
	end
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), tab (ref)
		if var6 then
			var6:fireTabOpened(tab)
		end
		return function()
			-- upvalues: var6 (copy), tab (copy)
			if var6 then
				var6:fireTabClosed(tab)
			end
		end
	end, { var6, tab })
	reactModule.useEffect(function()
		-- upvalues: var22 (ref), loading_1 (ref), var24 (ref)
		var22.current = false
		loading_1("loading")
		
		if var24 then
			return function()
				-- upvalues: var22 (copy)
				var22.current = true
			end
		end
		local delayedThread = task.delay(30, function()
			-- upvalues: var22 (copy), loading_1 (copy)
			if not var22.current then
				loading_1("error")
			end
		end)
		
		return function()
			-- upvalues: var22 (copy), delayedThread (ref)
			var22.current = true
			task.cancel(delayedThread)
		end
	end, { var6, tab, var24, var20 })
	
	if fFlagPlayerListReskinModule then
		reactModule.useEffect(function()
			-- upvalues: var5 (ref), loading (ref), var1 (copy), parent (copy), tab (ref)
			if var5 or loading ~= "error" then return end
			if var1 == nil then
				var1 = require(parent.Common.LeaderboardViewChangeTelemetry)
			end
			var1.logLoadError(string.lower(tab))
		end, { loading, var5 })
	end
	local localPlayer = playersService.LocalPlayer
	local var33 = reactModule.useMemo(function()
		-- upvalues: localPlayer (ref), resolveDisplayNameModule (copy)
		return if localPlayer then resolveDisplayNameModule(localPlayer) else nil
	end, { localPlayer })
	local var34 = signalsReactModule.useSignalState(var19)
	local var35 = getPeopleHeaderLabelModule()
	local var36 = reactModule.useCallback(function()
		-- upvalues: fFlagPlayerListReskinModule (copy), var5 (ref), var1 (copy), parent (copy), tab (ref), var6 (ref), loading_1 (ref), var21 (ref)
		if fFlagPlayerListReskinModule and not var5 then
			if var1 == nil then
				var1 = require(parent.Common.LeaderboardViewChangeTelemetry)
			end
			var1.logRetryError(string.lower(tab))
		end
		if var6 then
			var6:fireTabClosed(tab)
			var6:fireTabOpened(tab)
		end
		loading_1("loading")
		var21(function(p2)
			return p2 + 1
		end)
	end, { var6, tab, var5 })
	
	if var6 == nil or not var24 then
		return if loading == "error" then reactModule.createElement(serviceUnavailableState, {
			onRetry = var36,
			layoutOrder = p1.layoutOrder,
			useLegacyPanelStyling = var5
		}) else reactModule.createElement(loadingState, {
			layoutOrder = p1.layoutOrder,
			useLegacyPanelStyling = var5
		})
	elseif isFriends and var25 == 0 then
		return reactModule.createElement(emptyFriendsState, {
			layoutOrder = p1.layoutOrder,
			useLegacyPanelStyling = var5
		})
	end
	local t = {}
	
	for i_1, v in pairs(var23) do
		t[`Row_{i_1}`] = reactModule.createElement(platformEntryViewModule, {
			isViewer = false,
			showDivider = true,
			scoreGetter = v.getScore,
			rankGetter = v.getRank,
			displayName = v.displayName,
			rowHeight = var7,
			rankWidth = var10,
			scoreWidth = var11
		})
	end
	return reactModule.createElement(view, {
		tag = "col fill size-full-0",
		LayoutOrder = p1.layoutOrder
	}, {
		ColumnHeader = if var5 then reactModule.createElement("Frame", {
			Name = "LegacyPlatformColumnHeader",
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, var8)
		}, {
			Header = reactModule.createElement(platformEntryViewModule, {
				isHeader = true,
				scoreLabel = var34,
				peopleHeaderText = var35,
				rankHeaderText = rankHeader,
				rowHeight = var8,
				rankWidth = var10,
				scoreWidth = var11
			})
		}) else reactModule.createElement(view, {
			tag = "size-full-0 bg-surface-100",
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, var8)
		}, {
			Header = reactModule.createElement(platformEntryViewModule, {
				isHeader = true,
				scoreLabel = var34,
				peopleHeaderText = var35,
				rankHeaderText = rankHeader,
				rowHeight = var8,
				rankWidth = var10,
				scoreWidth = var11
			})
		}),
		PinnedViewer = reactModule.createElement(platformEntryViewModule, {
			isViewer = true,
			layoutOrder = 3,
			scoreGetter = var17,
			rankGetter = var18,
			displayName = var33,
			highlightViewerRow = not var5,
			rowHeight = var7,
			rankWidth = var10,
			scoreWidth = var11
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
					AutomaticCanvasSize = if not var5 then nil else Enum.AutomaticSize.Y,
					ScrollingDirection = Enum.ScrollingDirection.Y
				},
				scrollingFrameRef = if not var5 then var14 else nil,
				selection = constantsModule.NOT_SELECTABLE
			}, t)
		}),
		Footer = if var5 then reactModule.createElement("Frame", {
			Name = "LegacyPlatformFooter",
			LayoutOrder = 6,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, var9)
		}, {
			FooterInner = reactModule.createElement(view, {
				tag = "row align-x-right align-y-center size-full padding-x-medium padding-y-xsmall",
				Size = UDim2.fromScale(1, 1)
			}, {
				FooterText = reactModule.createElement(text, {
					tag = "auto-xy text-caption-small text-align-x-right content-muted",
					Text = var26
				})
			})
		}) else reactModule.createElement(view, {
			tag = "row align-x-right align-y-center size-full-0 padding-x-medium padding-y-xsmall stroke-standard stroke-default bg-surface-100",
			LayoutOrder = 6,
			Size = UDim2.new(1, 0, 0, var9)
		}, {
			FooterText = reactModule.createElement(text, {
				tag = "auto-xy text-caption-small text-align-x-right content-muted",
				Text = var26
			})
		})
	})
end)