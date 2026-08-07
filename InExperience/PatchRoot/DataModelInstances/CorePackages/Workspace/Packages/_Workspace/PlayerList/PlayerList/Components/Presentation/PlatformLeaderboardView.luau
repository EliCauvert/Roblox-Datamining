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

return reactModule.memo(function(p2) --[[ line: 59 | named "PlatformLeaderboardViewImpl" ]]
	-- upvalues: usePlatformLeaderboardModule (ref), useTokens (ref), constantsModule (ref), var14 (ref), var12 (ref), var13 (ref), reactModule (ref), signalsReactModule (ref), signalsModule (ref), playersService (ref), resolveDisplayNameModule (ref), getPeopleHeaderLabelModule (ref), fFlagPlayerListReskinOptimizationModule (ref), serviceUnavailableState (ref), loadingState (ref), emptyFriendsState (ref), platformEntryViewModule (ref), scrollView (ref), view (ref), text (ref)
	local tab = p2.tab
	local isFriends = tab == "Friends"
	local var16 = usePlatformLeaderboardModule()
	local scale = useTokens().Config.UI.Scale
	local var17 = constantsModule.PLATFORM_ROW_HEIGHT * scale
	local var18 = constantsModule.PLATFORM_HEADER_HEIGHT * scale
	local var19 = 26 * scale
	local var20 = constantsModule.PLATFORM_RANK_WIDTH * scale
	local var21 = constantsModule.PLATFORM_SCORE_WIDTH * scale
	local var22 = if var16 then if isFriends then var16.friendsEntries else var16.globalEntries else var14
	local var23 = if var16 then if isFriends then var16.getFriendsLastRefreshedAt else var16.getGlobalLastRefreshedAt else var12
	local var24 = if var16 then if isFriends then var16.getUserFriendScore else var16.getUserScore else var12
	local var25 = if var16 then if isFriends then var16.getUserFriendRank else var16.getUserRank else var12
	local var26 = if var16 then var16.getUnit else var13
	local loading, loading_1 = reactModule.useState("loading")
	local var29, var30 = reactModule.useState(0)
	local var31 = reactModule.useRef(false)
	local var32 = signalsReactModule.useSignalState(var22.getAllData)
	local var33 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 94 ]]
		-- upvalues: signalsModule (copy), var23 (ref)
		return signalsModule.createComputed(function(p3) --[[ line: 95 ]]
			-- upvalues: var23 (copy)
			return var23(p3) ~= nil
		end)
	end, { var23 }))
	local var34 = 0
	
	for i in pairs(var32) do
		var34 += 1
	end
	local var35 = signalsReactModule.useSignalBinding(var23)
	local var36, var37 = reactModule.useBinding(os.time())
	reactModule.useEffect(function() --[[ line: 109 ]]
		-- upvalues: var37 (ref)
		local delayedThread = nil
		
		local function schedule() --[[ line: 111 ]]
			-- upvalues: delayedThread (write), var37 (copy), schedule (ref)
			delayedThread = task.delay(300, function() --[[ line: 112 ]]
				-- upvalues: var37 (copy), schedule (copy)
				var37(os.time())
				schedule()
			end)
		end
		
		delayedThread = task.delay(300, function() --[[ line: 112 ]]
			-- upvalues: var37 (copy), schedule (ref)
			var37(os.time())
			schedule()
		end)
		
		return function() --[[ line: 118 ]]
			-- upvalues: delayedThread (write)
			if delayedThread then
				task.cancel(delayedThread)
				delayedThread = nil
			end
		end
	end, {})
	local var38 = reactModule.useMemo(function() --[[ line: 125 ]]
		-- upvalues: reactModule (copy), var35 (ref), var36 (ref)
		return reactModule.joinBindings({ lastRefreshedAt = var35, tick = var36 }):map(function(p4) --[[ line: 129 ]]
			local lastRefreshedAt = p4.lastRefreshedAt
			
			return if lastRefreshedAt == nil then "Unable to load" else `Last updated {math.max(0, math.floor((os.time() - lastRefreshedAt) / 60))} min ago`
		end)
	end, { var35, var36 })
	reactModule.useEffect(function() --[[ line: 134 ]]
		-- upvalues: var16 (ref), tab (ref)
		if var16 then
			var16:fireTabOpened(tab)
		end
		return function() --[[ line: 138 ]]
			-- upvalues: var16 (copy), tab (copy)
			if var16 then
				var16:fireTabClosed(tab)
			end
		end
	end, { var16, tab })
	reactModule.useEffect(function() --[[ line: 145 ]]
		-- upvalues: var31 (ref), loading_1 (ref), var33 (ref)
		var31.current = false
		loading_1("loading")
		
		if var33 then
			return function() --[[ line: 149 ]]
				-- upvalues: var31 (copy)
				var31.current = true
			end
		end
		local delayedThread = task.delay(30, function() --[[ line: 153 ]]
			-- upvalues: var31 (copy), loading_1 (copy)
			if not var31.current then
				loading_1("error")
			end
		end)
		
		return function() --[[ line: 158 ]]
			-- upvalues: var31 (copy), delayedThread (ref)
			var31.current = true
			task.cancel(delayedThread)
		end
	end, { var16, tab, var33, var29 })
	local localPlayer = playersService.LocalPlayer
	local var39 = reactModule.useMemo(function() --[[ line: 165 ]]
		-- upvalues: localPlayer (ref), resolveDisplayNameModule (copy)
		return if localPlayer then resolveDisplayNameModule(localPlayer) else nil
	end, { localPlayer })
	local var40 = signalsReactModule.useSignalState(var26)
	local var41 = getPeopleHeaderLabelModule()
	local var42 = if fFlagPlayerListReskinOptimizationModule then reactModule.useCallback(function() --[[ line: 175 ]]
		-- upvalues: var16 (ref), tab (ref), loading_1 (ref), var30 (ref)
		if var16 then
			var16:fireTabClosed(tab)
			var16:fireTabOpened(tab)
		end
		loading_1("loading")
		var30(function(p5) --[[ line: 181 ]]
			return p5 + 1
		end)
	end, { var16, tab }) else nil
	
	if var16 == nil or not var33 then
		return if loading == "error" then reactModule.createElement(serviceUnavailableState, {
			onRetry = if fFlagPlayerListReskinOptimizationModule then var42 else function() --[[ line: 193 ]]
				-- upvalues: var16 (ref), tab (ref), loading_1 (ref), var30 (ref)
				if var16 then
					var16:fireTabClosed(tab)
					var16:fireTabOpened(tab)
				end
				loading_1("loading")
				var30(function(p6) --[[ line: 199 ]]
					return p6 + 1
				end)
			end,
			layoutOrder = p2.layoutOrder
		}) else reactModule.createElement(loadingState, { layoutOrder = p2.layoutOrder })
	elseif isFriends and var34 == 0 then
		return reactModule.createElement(emptyFriendsState, { layoutOrder = p2.layoutOrder })
	end
	local t = {}
	
	for i_1, v in pairs(var32) do
		t[`Row_{i_1}`] = reactModule.createElement(platformEntryViewModule, {
			isViewer = false,
			showDivider = true,
			scoreGetter = v.getScore,
			rankGetter = v.getRank,
			displayName = v.displayName,
			rowHeight = var17,
			rankWidth = var20,
			scoreWidth = var21
		})
	end
	return reactModule.createElement(view, {
		tag = "col fill size-full-0",
		LayoutOrder = p2.layoutOrder
	}, {
		ColumnHeader = reactModule.createElement(platformEntryViewModule, {
			isHeader = true,
			layoutOrder = 1,
			scoreLabel = var40,
			peopleHeaderText = var41,
			rowHeight = var18,
			rankWidth = var20,
			scoreWidth = var21
		}),
		PinnedViewer = reactModule.createElement(platformEntryViewModule, {
			isViewer = true,
			layoutOrder = 3,
			scoreGetter = var24,
			rankGetter = var25,
			displayName = var39,
			rowHeight = var17,
			rankWidth = var20,
			scoreWidth = var21
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
		Footer = reactModule.createElement(view, {
			tag = "row align-x-right align-y-center size-full-0 padding-x-medium padding-y-xsmall stroke-standard stroke-default bg-surface-100",
			LayoutOrder = 6,
			Size = UDim2.new(1, 0, 0, var19)
		}, {
			FooterText = reactModule.createElement(text, {
				tag = "auto-xy text-caption-small text-align-x-right content-muted",
				Text = var38
			})
		})
	})
end)