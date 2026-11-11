local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local Players = game:GetService("Players")
local ReactModule = require(Parent1.React)
local SignalsModule = require(Parent1.Signals)
local SignalsReactModule = require(Parent1.SignalsReact)
local FoundationModule = require(Parent1.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local ScrollView = FoundationModule.ScrollView
local UseTokensFunction = FoundationModule.Hooks.useTokens
local ConstantsModule = require(Parent.Common.Constants)
local UsePlatformLeaderboardModule = require(Parent.Hooks.usePlatformLeaderboard)
local PlatformEntryViewModule = require(Parent.Components.Presentation.PlatformEntryView)
local EmptyAndErrorStatesModule = require(Parent.Components.Presentation.EmptyAndErrorStates)
local ResolveDisplayNameModule = require(Parent.Common.resolveDisplayName)
local GetPeopleHeaderLabelModule = require(Parent.Common.getPeopleHeaderLabel)
local LoadingState = EmptyAndErrorStatesModule.LoadingState
local EmptyFriendsState = EmptyAndErrorStatesModule.EmptyFriendsState
local ServiceUnavailableState = EmptyAndErrorStatesModule.ServiceUnavailableState
local Signal = SignalsModule.createSignal(nil)
local Signal1 = SignalsModule.createSignal(nil)
local SignalMap = require(Parent1.CoreScriptsRoactCommon).Utilities.createSignalMap()

local function _(p1, p2): string
	return if p1 == nil then "Unable to load" else `Last updated {math.max(0, (math.floor((p2 - p1) / 60)))} min ago`
end

return ReactModule.memo(function(p1)
	-- upvalues: UsePlatformLeaderboardModule (copy), UseTokensFunction (copy), ConstantsModule (copy), SignalMap (copy), Signal (copy), Signal1 (copy), ReactModule (copy), SignalsReactModule (copy), SignalsModule (copy), Players (copy), ResolveDisplayNameModule (copy), GetPeopleHeaderLabelModule (copy), ServiceUnavailableState (copy), LoadingState (copy), EmptyFriendsState (copy), PlatformEntryViewModule (copy), ScrollView (copy), View (copy), Text (copy)
	local Tab = p1.tab
	local IsFriends = Tab == "Friends"
	local UsePlatformLeaderboardModuleResult = UsePlatformLeaderboardModule()
	local Scale: number = UseTokensFunction().Config.UI.Scale
	local ScaledPLATFORMROWHEIGHT = ConstantsModule.PLATFORM_ROW_HEIGHT * Scale
	local ScaledPLATFORMHEADERHEIGHT = ConstantsModule.PLATFORM_HEADER_HEIGHT * Scale
	local YOffset = 26 * Scale
	local ScaledPLATFORMRANKWIDTH = ConstantsModule.PLATFORM_RANK_WIDTH * Scale
	local ScaledPLATFORMSCOREWIDTH = ConstantsModule.PLATFORM_SCORE_WIDTH * Scale
	local FriendsEntries = if UsePlatformLeaderboardModuleResult then if IsFriends then UsePlatformLeaderboardModuleResult.friendsEntries else UsePlatformLeaderboardModuleResult.globalEntries else SignalMap
	local GetFriendsLastRefreshedAt = if UsePlatformLeaderboardModuleResult then if IsFriends then UsePlatformLeaderboardModuleResult.getFriendsLastRefreshedAt else UsePlatformLeaderboardModuleResult.getGlobalLastRefreshedAt else Signal
	local GetUserScore = if UsePlatformLeaderboardModuleResult then UsePlatformLeaderboardModuleResult.getUserScore else Signal
	local GetUserRank = if UsePlatformLeaderboardModuleResult then UsePlatformLeaderboardModuleResult.getUserRank else Signal
	local GetUnit = if UsePlatformLeaderboardModuleResult then UsePlatformLeaderboardModuleResult.getUnit else Signal1
	local Loading, Loading2 = ReactModule.useState("loading")
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local UseRefResult = ReactModule.useRef(false)
	local UseSignalStateResult = SignalsReactModule.useSignalState(FriendsEntries.getAllData)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), GetFriendsLastRefreshedAt (copy)
		return SignalsModule.createComputed(function(p2): boolean
			-- upvalues: GetFriendsLastRefreshedAt (upval)
			return GetFriendsLastRefreshedAt(p2) ~= nil
		end)
	end, { GetFriendsLastRefreshedAt })))
	local Count = 0
	
	for _ in pairs(UseSignalStateResult) do
		Count += 1
	end
	local UseSignalBindingResult = SignalsReactModule.useSignalBinding(GetFriendsLastRefreshedAt)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(os.time())
	ReactModule.useEffect(function()
		-- upvalues: UseBindingResult2 (copy)
		local DelayedThread = nil
		
		local function schedule()
			-- upvalues: DelayedThread (ref), UseBindingResult2 (upval), schedule (copy)
			DelayedThread = task.delay(300, function()
				-- upvalues: UseBindingResult2 (upval), schedule (upval)
				UseBindingResult2(os.time())
				schedule()
			end)
		end
		
		DelayedThread = task.delay(300, function()
			-- upvalues: UseBindingResult2 (upval), schedule (copy)
			UseBindingResult2(os.time())
			schedule()
		end)
		
		return function()
			-- upvalues: DelayedThread (ref)
			if DelayedThread then
				task.cancel(DelayedThread)
				DelayedThread = nil
			end
		end
	end, {})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: ReactModule (upval), UseSignalBindingResult (copy), UseBindingResult (copy)
		return ReactModule.joinBindings({
			lastRefreshedAt = UseSignalBindingResult,
			tick = UseBindingResult
		}):map(function(p2): string
			local LastRefreshedAt: number = p2.lastRefreshedAt
			local Timestamp = os.time()
			
			return if LastRefreshedAt == nil then "Unable to load" else `Last updated {math.max(0, (math.floor((Timestamp - LastRefreshedAt) / 60)))} min ago`
		end)
	end, { UseSignalBindingResult, UseBindingResult })
	ReactModule.useEffect(function()
		-- upvalues: UsePlatformLeaderboardModuleResult (copy), Tab (copy)
		if UsePlatformLeaderboardModuleResult then
			UsePlatformLeaderboardModuleResult:fireTabOpened(Tab)
		end
		return function()
			-- upvalues: UsePlatformLeaderboardModuleResult (upval), Tab (upval)
			if UsePlatformLeaderboardModuleResult then
				UsePlatformLeaderboardModuleResult:fireTabClosed(Tab)
			end
		end
	end, { UsePlatformLeaderboardModuleResult, Tab })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), Loading2 (copy), UseSignalStateResult1 (copy)
		UseRefResult.current = false
		Loading2("loading")
		
		if UseSignalStateResult1 then
			return function()
				-- upvalues: UseRefResult (upval)
				UseRefResult.current = true
			end
		else
			local DelayedThread = task.delay(30, function()
				-- upvalues: UseRefResult (upval), Loading2 (upval)
				if not UseRefResult.current then
					Loading2("error")
				end
			end)
			
			return function()
				-- upvalues: UseRefResult (upval), DelayedThread (copy)
				UseRefResult.current = true
				task.cancel(DelayedThread)
			end
		end
	end, {
		UsePlatformLeaderboardModuleResult,
		Tab,
		UseSignalStateResult1,
		UseStateResult
	})
	local LocalPlayer = Players.LocalPlayer
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: LocalPlayer (copy), ResolveDisplayNameModule (upval)
		return if LocalPlayer then ResolveDisplayNameModule(LocalPlayer) else nil
	end, { LocalPlayer })
	local UseSignalStateResult2 = SignalsReactModule.useSignalState(GetUnit)
	local PeopleHeaderLabelModule = GetPeopleHeaderLabelModule()
	
	if UsePlatformLeaderboardModuleResult == nil or not UseSignalStateResult1 then
		return if Loading == "error" then ReactModule.createElement(ServiceUnavailableState, {
			onRetry = function()
				-- upvalues: UsePlatformLeaderboardModuleResult (copy), Tab (copy), Loading2 (copy), UseStateResult2 (copy)
				if UsePlatformLeaderboardModuleResult then
					UsePlatformLeaderboardModuleResult:fireTabClosed(Tab)
					UsePlatformLeaderboardModuleResult:fireTabOpened(Tab)
				end
				Loading2("loading")
				UseStateResult2(function(p2: number): number
					return p2 + 1
				end)
			end,
			layoutOrder = p1.layoutOrder
		}) else ReactModule.createElement(LoadingState, { layoutOrder = p1.layoutOrder })
	end
	if IsFriends and Count == 0 then
		return ReactModule.createElement(EmptyFriendsState, { layoutOrder = p1.layoutOrder })
	end
	local Elements = {}
	
	for i, value in pairs(UseSignalStateResult) do
		Elements[`Row_{i}`] = ReactModule.createElement(PlatformEntryViewModule, {
			isViewer = false,
			showDivider = true,
			scoreGetter = value.getScore,
			rankGetter = value.getRank,
			displayName = value.displayName,
			rowHeight = ScaledPLATFORMROWHEIGHT,
			rankWidth = ScaledPLATFORMRANKWIDTH,
			scoreWidth = ScaledPLATFORMSCOREWIDTH
		})
	end
	return ReactModule.createElement(View, {
		tag = "col fill size-full-0",
		LayoutOrder = p1.layoutOrder
	}, {
		ColumnHeader = ReactModule.createElement(PlatformEntryViewModule, {
			isHeader = true,
			layoutOrder = 1,
			scoreLabel = UseSignalStateResult2,
			peopleHeaderText = PeopleHeaderLabelModule,
			rowHeight = ScaledPLATFORMHEADERHEIGHT,
			rankWidth = ScaledPLATFORMRANKWIDTH,
			scoreWidth = ScaledPLATFORMSCOREWIDTH
		}),
		PinnedViewer = ReactModule.createElement(PlatformEntryViewModule, {
			isViewer = true,
			layoutOrder = 3,
			scoreGetter = GetUserScore,
			rankGetter = GetUserRank,
			displayName = UseMemoResult1,
			rowHeight = ScaledPLATFORMROWHEIGHT,
			rankWidth = ScaledPLATFORMRANKWIDTH,
			scoreWidth = ScaledPLATFORMSCOREWIDTH
		}),
		RowList = ReactModule.createElement(View, { tag = "col fill size-full-0", LayoutOrder = 5 }, {
			Rows = ReactModule.createElement(ScrollView, {
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
			}, Elements)
		}),
		Footer = ReactModule.createElement(View, {
			tag = "row align-x-right align-y-center size-full-0 padding-x-medium padding-y-xsmall stroke-standard stroke-default bg-surface-100",
			LayoutOrder = 6,
			Size = UDim2.new(1, 0, 0, YOffset)
		}, {
			FooterText = ReactModule.createElement(Text, {
				tag = "auto-xy text-caption-small text-align-x-right content-muted",
				Text = UseMemoResult
			})
		})
	})
end)