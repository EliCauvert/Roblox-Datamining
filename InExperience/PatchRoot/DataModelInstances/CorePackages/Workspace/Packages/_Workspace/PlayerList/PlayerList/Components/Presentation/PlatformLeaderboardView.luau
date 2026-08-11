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
local loadingState = emptyAndErrorStatesModule.LoadingState
local emptyFriendsState = emptyAndErrorStatesModule.EmptyFriendsState
local serviceUnavailableState = emptyAndErrorStatesModule.ServiceUnavailableState
local var12 = signalsModule.createSignal(nil)
local var13 = signalsModule.createSignal(nil)
local var14 = require(parent_1.CoreScriptsRoactCommon).Utilities.createSignalMap()

local function _(p0, p1) --[[ line: 45 | named "formatRelativeTime" ]]
	return if p0 == nil then "Unable to load" else `Last updated {math.max(0, math.floor((p1 - p0) / 60))} min ago`
end

return reactModule.memo(function(p2) --[[ line: 62 | named "PlatformLeaderboardViewImpl" ]]
	-- upvalues: usePlatformLeaderboardModule (ref), useTokens (ref), constantsModule (ref), var14 (ref), var12 (ref), var13 (ref), reactModule (ref), signalsReactModule (ref), signalsModule (ref), playersService (ref), resolveDisplayNameModule (ref), getPeopleHeaderLabelModule (ref), fFlagPlayerListReskinOptimizationModule (ref), serviceUnavailableState (ref), loadingState (ref), emptyFriendsState (ref), platformEntryViewModule (ref), scrollView (ref), view (ref), text (ref)
	local tab = p2.tab
	local isFriends = tab == "Friends"
	local var16 = p2.legacyPanelBackgroundColor ~= nil
	local var17 = usePlatformLeaderboardModule()
	local scale = useTokens().Config.UI.Scale
	local var18 = constantsModule.PLATFORM_ROW_HEIGHT * scale
	local var19 = constantsModule.PLATFORM_HEADER_HEIGHT * scale
	local var20 = 26 * scale
	local var21 = constantsModule.PLATFORM_RANK_WIDTH * scale
	local var22 = constantsModule.PLATFORM_SCORE_WIDTH * scale
	local var23 = if var17 then if isFriends then var17.friendsEntries else var17.globalEntries else var14
	local var24 = if var17 then if isFriends then var17.getFriendsLastRefreshedAt else var17.getGlobalLastRefreshedAt else var12
	local var25 = if var17 then if isFriends then var17.getUserFriendScore else var17.getUserScore else var12
	local var26 = if var17 then if isFriends then var17.getUserFriendRank else var17.getUserRank else var12
	local var27 = if var17 then var17.getUnit else var13
	local loading, loading_1 = reactModule.useState("loading")
	local var30, var31 = reactModule.useState(0)
	local var32 = reactModule.useRef(false)
	local var33 = signalsReactModule.useSignalState(var23.getAllData)
	local var34 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 98 ]]
		-- upvalues: signalsModule (copy), var24 (ref)
		return signalsModule.createComputed(function(p3) --[[ line: 99 ]]
			-- upvalues: var24 (copy)
			return var24(p3) ~= nil
		end)
	end, { var24 }))
	local var35 = 0
	
	for i in pairs(var33) do
		var35 += 1
	end
	local var36 = signalsReactModule.useSignalBinding(var24)
	local var37, var38 = reactModule.useBinding(os.time())
	reactModule.useEffect(function() --[[ line: 113 ]]
		-- upvalues: var38 (ref)
		local delayedThread = nil
		
		local function schedule() --[[ line: 115 ]]
			-- upvalues: delayedThread (write), var38 (copy), schedule (ref)
			delayedThread = task.delay(300, function() --[[ line: 116 ]]
				-- upvalues: var38 (copy), schedule (copy)
				var38(os.time())
				schedule()
			end)
		end
		
		delayedThread = task.delay(300, function() --[[ line: 116 ]]
			-- upvalues: var38 (copy), schedule (ref)
			var38(os.time())
			schedule()
		end)
		
		return function() --[[ line: 122 ]]
			-- upvalues: delayedThread (write)
			if delayedThread then
				task.cancel(delayedThread)
				delayedThread = nil
			end
		end
	end, {})
	local var39 = reactModule.useMemo(function() --[[ line: 129 ]]
		-- upvalues: reactModule (copy), var36 (ref), var37 (ref)
		return reactModule.joinBindings({ lastRefreshedAt = var36, tick = var37 }):map(function(p4) --[[ line: 133 ]]
			local lastRefreshedAt = p4.lastRefreshedAt
			
			return if lastRefreshedAt == nil then "Unable to load" else `Last updated {math.max(0, math.floor((os.time() - lastRefreshedAt) / 60))} min ago`
		end)
	end, { var36, var37 })
	reactModule.useEffect(function() --[[ line: 138 ]]
		-- upvalues: var17 (ref), tab (ref)
		if var17 then
			var17:fireTabOpened(tab)
		end
		return function() --[[ line: 142 ]]
			-- upvalues: var17 (copy), tab (copy)
			if var17 then
				var17:fireTabClosed(tab)
			end
		end
	end, { var17, tab })
	reactModule.useEffect(function() --[[ line: 149 ]]
		-- upvalues: var32 (ref), loading_1 (ref), var34 (ref)
		var32.current = false
		loading_1("loading")
		
		if var34 then
			return function() --[[ line: 153 ]]
				-- upvalues: var32 (copy)
				var32.current = true
			end
		end
		local delayedThread = task.delay(30, function() --[[ line: 157 ]]
			-- upvalues: var32 (copy), loading_1 (copy)
			if not var32.current then
				loading_1("error")
			end
		end)
		
		return function() --[[ line: 162 ]]
			-- upvalues: var32 (copy), delayedThread (ref)
			var32.current = true
			task.cancel(delayedThread)
		end
	end, { var17, tab, var34, var30 })
	local localPlayer = playersService.LocalPlayer
	local var40 = reactModule.useMemo(function() --[[ line: 169 ]]
		-- upvalues: localPlayer (ref), resolveDisplayNameModule (copy)
		return if localPlayer then resolveDisplayNameModule(localPlayer) else nil
	end, { localPlayer })
	local var41 = signalsReactModule.useSignalState(var27)
	local var42 = getPeopleHeaderLabelModule()
	local var43 = if fFlagPlayerListReskinOptimizationModule then reactModule.useCallback(function() --[[ line: 179 ]]
		-- upvalues: var17 (ref), tab (ref), loading_1 (ref), var31 (ref)
		if var17 then
			var17:fireTabClosed(tab)
			var17:fireTabOpened(tab)
		end
		loading_1("loading")
		var31(function(p5) --[[ line: 185 ]]
			return p5 + 1
		end)
	end, { var17, tab }) else nil
	
	if var17 == nil or not var34 then
		return if loading == "error" then reactModule.createElement(serviceUnavailableState, {
			onRetry = if fFlagPlayerListReskinOptimizationModule then var43 else function() --[[ line: 197 ]]
				-- upvalues: var17 (ref), tab (ref), loading_1 (ref), var31 (ref)
				if var17 then
					var17:fireTabClosed(tab)
					var17:fireTabOpened(tab)
				end
				loading_1("loading")
				var31(function(p6) --[[ line: 203 ]]
					return p6 + 1
				end)
			end,
			layoutOrder = p2.layoutOrder,
			useLegacyPanelStyling = var16
		}) else reactModule.createElement(loadingState, {
			layoutOrder = p2.layoutOrder,
			useLegacyPanelStyling = var16
		})
	elseif isFriends and var35 == 0 then
		return reactModule.createElement(emptyFriendsState, {
			layoutOrder = p2.layoutOrder,
			useLegacyPanelStyling = var16
		})
	end
	local t = {}
	
	for i_1, v in pairs(var33) do
		t[`Row_{i_1}`] = reactModule.createElement(platformEntryViewModule, {
			isViewer = false,
			showDivider = true,
			scoreGetter = v.getScore,
			rankGetter = v.getRank,
			displayName = v.displayName,
			rowHeight = var18,
			rankWidth = var21,
			scoreWidth = var22
		})
	end
	return reactModule.createElement(view, {
		tag = "col fill size-full-0",
		LayoutOrder = p2.layoutOrder
	}, {
		ColumnHeader = if var16 then reactModule.createElement("Frame", {
			Name = "LegacyPlatformColumnHeader",
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, var19)
		}, {
			Header = reactModule.createElement(platformEntryViewModule, {
				isHeader = true,
				scoreLabel = var41,
				peopleHeaderText = var42,
				rowHeight = var19,
				rankWidth = var21,
				scoreWidth = var22
			})
		}) else reactModule.createElement(view, {
			tag = "size-full-0 bg-surface-100",
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, var19)
		}, {
			Header = reactModule.createElement(platformEntryViewModule, {
				isHeader = true,
				scoreLabel = var41,
				peopleHeaderText = var42,
				rowHeight = var19,
				rankWidth = var21,
				scoreWidth = var22
			})
		}),
		PinnedViewer = reactModule.createElement(platformEntryViewModule, {
			isViewer = true,
			layoutOrder = 3,
			scoreGetter = var25,
			rankGetter = var26,
			displayName = var40,
			highlightViewerRow = not var16,
			rowHeight = var18,
			rankWidth = var21,
			scoreWidth = var22
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
		Footer = if var16 then reactModule.createElement("Frame", {
			Name = "LegacyPlatformFooter",
			LayoutOrder = 6,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, var20)
		}, {
			FooterInner = reactModule.createElement(view, {
				tag = "row align-x-right align-y-center size-full padding-x-medium padding-y-xsmall",
				Size = UDim2.fromScale(1, 1)
			}, {
				FooterText = reactModule.createElement(text, {
					tag = "auto-xy text-caption-small text-align-x-right content-muted",
					Text = var39
				})
			})
		}) else reactModule.createElement(view, {
			tag = "row align-x-right align-y-center size-full-0 padding-x-medium padding-y-xsmall stroke-standard stroke-default bg-surface-100",
			LayoutOrder = 6,
			Size = UDim2.new(1, 0, 0, var20)
		}, {
			FooterText = reactModule.createElement(text, {
				tag = "auto-xy text-caption-small text-align-x-right content-muted",
				Text = var39
			})
		})
	})
end)