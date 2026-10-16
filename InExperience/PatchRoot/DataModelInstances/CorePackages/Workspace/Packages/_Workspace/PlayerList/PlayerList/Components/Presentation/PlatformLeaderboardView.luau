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
local UseGamepadStickScrollModule = require(Parent.Hooks.useGamepadStickScroll)
local UseReportPanelContentHeightModule = require(Parent.Hooks.useReportPanelContentHeight)
local UsePlatformLeaderboardModule = require(Parent.Hooks.usePlatformLeaderboard)
local PlatformEntryViewModule = require(Parent.Components.Presentation.PlatformEntryView)
local EmptyAndErrorStatesModule = require(Parent.Components.Presentation.EmptyAndErrorStates)
local ResolveDisplayNameModule = require(Parent.Common.resolveDisplayName)
local GetPeopleHeaderLabelModule = require(Parent.Common.getPeopleHeaderLabel)
local FFlagPlayerListLocalizeGameTextModule = require(Parent.Flags.FFlagPlayerListLocalizeGameText)
local FFlagPlayerListReskinModule = require(Parent.Flags.FFlagPlayerListReskin)
local UseLocalizationFunction = require(Parent1.Localization).Hooks.useLocalization
local LoadingState = EmptyAndErrorStatesModule.LoadingState
local EmptyFriendsState = EmptyAndErrorStatesModule.EmptyFriendsState
local ServiceUnavailableState = EmptyAndErrorStatesModule.ServiceUnavailableState
local LeaderboardViewChangeTelemetryModule = nil

local function _() --[[ Line: 34 | Named "getLeaderboardViewChangeTelemetry" ]]
	-- upvalues: LeaderboardViewChangeTelemetryModule (ref), Parent (copy)
	if LeaderboardViewChangeTelemetryModule == nil then
		LeaderboardViewChangeTelemetryModule = require(Parent.Common.LeaderboardViewChangeTelemetry)
	end
	return LeaderboardViewChangeTelemetryModule
end

local Signal = SignalsModule.createSignal(nil)
local Signal1 = SignalsModule.createSignal(nil)
local SignalMap = require(Parent1.CoreScriptsRoactCommon).Utilities.createSignalMap()

local _ = function(p1, p2): string --[[ Line: 56 | Named "formatRelativeTimeLegacy" ]]
	return if p1 == nil then "Unable to load" else `Last updated {math.max(0, (math.floor((p2 - p1) / 60)))} min ago`
end

return ReactModule.memo(function(p1) --[[ Line: 73 | Named "PlatformLeaderboardViewImpl" ]]
	-- upvalues: UsePlatformLeaderboardModule (copy), UseTokensFunction (copy), ConstantsModule (copy), UseReportPanelContentHeightModule (copy), ReactModule (copy), UseGamepadStickScrollModule (copy), SignalMap (copy), Signal (copy), Signal1 (copy), SignalsReactModule (copy), SignalsModule (copy), FFlagPlayerListLocalizeGameTextModule (copy), UseLocalizationFunction (copy), FFlagPlayerListReskinModule (copy), LeaderboardViewChangeTelemetryModule (ref), Parent (copy), Players (copy), ResolveDisplayNameModule (copy), GetPeopleHeaderLabelModule (copy), ServiceUnavailableState (copy), LoadingState (copy), EmptyFriendsState (copy), PlatformEntryViewModule (copy), ScrollView (copy), View (copy), Text (copy)
	local Tab = p1.tab
	local IsFriends = Tab == "Friends"
	local HasLegacyPanelBackgroundColor = p1.legacyPanelBackgroundColor ~= nil
	local UsePlatformLeaderboardModuleResult = UsePlatformLeaderboardModule()
	local Scale = UseTokensFunction().Config.UI.Scale
	local ScaledPLATFORMROWHEIGHT = ConstantsModule.PLATFORM_ROW_HEIGHT * Scale
	local ScaledPLATFORMHEADERHEIGHT = ConstantsModule.PLATFORM_HEADER_HEIGHT * Scale
	local ScaledPLATFORMFOOTERHEIGHT = ConstantsModule.PLATFORM_FOOTER_HEIGHT * Scale
	local ScaledPLATFORMRANKWIDTH = ConstantsModule.PLATFORM_RANK_WIDTH * Scale
	local ScaledPLATFORMSCOREWIDTH = ConstantsModule.PLATFORM_SCORE_WIDTH * Scale
	local UseReportPanelContentHeightModuleResult = UseReportPanelContentHeightModule(ScaledPLATFORMHEADERHEIGHT + ScaledPLATFORMROWHEIGHT + ScaledPLATFORMFOOTERHEIGHT)
	local UseRefResult = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function(Current) --[[ Line: 94 ]]
		-- upvalues: UseRefResult (copy), UseReportPanelContentHeightModuleResult (copy)
		UseRefResult.current = Current
		UseReportPanelContentHeightModuleResult(Current)
	end, { UseReportPanelContentHeightModuleResult })
	UseGamepadStickScrollModule({
		scrollingFrameRef = UseRefResult,
		enabled = not HasLegacyPanelBackgroundColor
	})
	local FriendsEntries = if UsePlatformLeaderboardModuleResult then if IsFriends then UsePlatformLeaderboardModuleResult.friendsEntries else UsePlatformLeaderboardModuleResult.globalEntries else SignalMap
	local GetFriendsLastRefreshedAt = if UsePlatformLeaderboardModuleResult then if IsFriends then UsePlatformLeaderboardModuleResult.getFriendsLastRefreshedAt else UsePlatformLeaderboardModuleResult.getGlobalLastRefreshedAt else Signal
	local GetUserFriendScore = if UsePlatformLeaderboardModuleResult then if IsFriends then UsePlatformLeaderboardModuleResult.getUserFriendScore else UsePlatformLeaderboardModuleResult.getUserScore else Signal
	local GetUserFriendRank = if UsePlatformLeaderboardModuleResult then if IsFriends then UsePlatformLeaderboardModuleResult.getUserFriendRank else UsePlatformLeaderboardModuleResult.getUserRank else Signal
	local GetUnit = if UsePlatformLeaderboardModuleResult then UsePlatformLeaderboardModuleResult.getUnit else Signal1
	local Loading, Loading2 = ReactModule.useState("loading")
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local UseRefResult1 = ReactModule.useRef(false)
	local UseSignalStateResult = SignalsReactModule.useSignalState(FriendsEntries.getAllData)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState((ReactModule.useMemo(function() --[[ Line: 126 ]]
		-- upvalues: SignalsModule (upval), GetFriendsLastRefreshedAt (copy)
		return SignalsModule.createComputed(function(p2): boolean --[[ Line: 127 ]]
			-- upvalues: GetFriendsLastRefreshedAt (upval)
			return GetFriendsLastRefreshedAt(p2) ~= nil
		end)
	end, { GetFriendsLastRefreshedAt })))
	local Count = 0
	
	for _ in pairs(UseSignalStateResult) do
		Count += 1
	end
	local RankHeaderText = nil
	local FooterUnableToLoad = nil
	
	if FFlagPlayerListLocalizeGameTextModule then
		local UseSignalStateResult2 = SignalsReactModule.useSignalState(GetFriendsLastRefreshedAt)
		local _, UseStateResult2_1 = ReactModule.useState(0)
		ReactModule.useEffect(function() --[[ Line: 144 ]]
			-- upvalues: UseStateResult2_1 (copy)
			local DelayedThread = nil
			
			local function schedule() --[[ Line: 146 ]]
				-- upvalues: DelayedThread (ref), UseStateResult2_1 (upval), schedule (copy)
				DelayedThread = task.delay(300, function() --[[ Line: 147 ]]
					-- upvalues: UseStateResult2_1 (upval), schedule (upval)
					UseStateResult2_1(function(p2: number): number --[[ Line: 148 ]]
						return p2 + 1
					end)
					schedule()
				end)
			end
			
			DelayedThread = task.delay(300, function() --[[ Line: 147 ]]
				-- upvalues: UseStateResult2_1 (upval), schedule (copy)
				UseStateResult2_1(function(p2: number): number --[[ Line: 148 ]]
					return p2 + 1
				end)
				schedule()
			end)
			
			return function() --[[ Line: 155 ]]
				-- upvalues: DelayedThread (ref)
				if DelayedThread then
					task.cancel(DelayedThread)
					DelayedThread = nil
				end
			end
		end, {})
		local UseLocalizationResult = UseLocalizationFunction({
			rankHeader = "InGame.PlayerList.RankHeader",
			footerUnableToLoad = "InGame.PlayerList.FooterUnableToLoad",
			footerLastUpdated = {
				"InGame.PlayerList.FooterLastUpdated",
				minutes = if UseSignalStateResult2 == nil then 0 else math.max(0, (math.floor((os.time() - UseSignalStateResult2) / 60)))
			}
		})
		RankHeaderText = UseLocalizationResult.rankHeader
		FooterUnableToLoad = if UseSignalStateResult2 == nil then UseLocalizationResult.footerUnableToLoad else UseLocalizationResult.footerLastUpdated
	else
		local UseSignalBindingResult = SignalsReactModule.useSignalBinding(GetFriendsLastRefreshedAt)
		local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(os.time())
		ReactModule.useEffect(function() --[[ Line: 177 ]]
			-- upvalues: UseBindingResult2 (copy)
			local DelayedThread = nil
			
			local function schedule() --[[ Line: 179 ]]
				-- upvalues: DelayedThread (ref), UseBindingResult2 (upval), schedule (copy)
				DelayedThread = task.delay(300, function() --[[ Line: 180 ]]
					-- upvalues: UseBindingResult2 (upval), schedule (upval)
					UseBindingResult2(os.time())
					schedule()
				end)
			end
			
			DelayedThread = task.delay(300, function() --[[ Line: 180 ]]
				-- upvalues: UseBindingResult2 (upval), schedule (copy)
				UseBindingResult2(os.time())
				schedule()
			end)
			
			return function() --[[ Line: 186 ]]
				-- upvalues: DelayedThread (ref)
				if DelayedThread then
					task.cancel(DelayedThread)
					DelayedThread = nil
				end
			end
		end, {})
		FooterUnableToLoad = ReactModule.useMemo(function() --[[ Line: 193 ]]
			-- upvalues: ReactModule (upval), UseSignalBindingResult (copy), UseBindingResult (copy)
			return ReactModule.joinBindings({
				lastRefreshedAt = UseSignalBindingResult,
				tick = UseBindingResult
			}):map(function(p2): string --[[ Line: 197 ]]
				local LastRefreshedAt: number = p2.lastRefreshedAt
				local Timestamp = os.time()
				
				return if LastRefreshedAt == nil then "Unable to load" else `Last updated {math.max(0, (math.floor((Timestamp - LastRefreshedAt) / 60)))} min ago`
			end)
		end, { UseSignalBindingResult, UseBindingResult })
	end
	ReactModule.useEffect(function() --[[ Line: 203 ]]
		-- upvalues: UsePlatformLeaderboardModuleResult (copy), Tab (copy)
		if UsePlatformLeaderboardModuleResult then
			UsePlatformLeaderboardModuleResult:fireTabOpened(Tab)
		end
		return function() --[[ Line: 207 ]]
			-- upvalues: UsePlatformLeaderboardModuleResult (upval), Tab (upval)
			if UsePlatformLeaderboardModuleResult then
				UsePlatformLeaderboardModuleResult:fireTabClosed(Tab)
			end
		end
	end, { UsePlatformLeaderboardModuleResult, Tab })
	ReactModule.useEffect(function() --[[ Line: 214 ]]
		-- upvalues: UseRefResult1 (copy), Loading2 (copy), UseSignalStateResult1 (copy)
		UseRefResult1.current = false
		Loading2("loading")
		
		if UseSignalStateResult1 then
			return function() --[[ Line: 218 ]]
				-- upvalues: UseRefResult1 (upval)
				UseRefResult1.current = true
			end
		else
			local DelayedThread = task.delay(30, function() --[[ Line: 222 ]]
				-- upvalues: UseRefResult1 (upval), Loading2 (upval)
				if not UseRefResult1.current then
					Loading2("error")
				end
			end)
			
			return function() --[[ Line: 227 ]]
				-- upvalues: UseRefResult1 (upval), DelayedThread (copy)
				UseRefResult1.current = true
				task.cancel(DelayedThread)
			end
		end
	end, {
		UsePlatformLeaderboardModuleResult,
		Tab,
		UseSignalStateResult1,
		UseStateResult
	})
	
	if FFlagPlayerListReskinModule then
		ReactModule.useEffect(function() --[[ Line: 237 ]]
			-- upvalues: HasLegacyPanelBackgroundColor (copy), Loading (copy), LeaderboardViewChangeTelemetryModule (upval), Parent (upval), Tab (copy)
			if HasLegacyPanelBackgroundColor or Loading ~= "error" then return end
			if LeaderboardViewChangeTelemetryModule == nil then
				LeaderboardViewChangeTelemetryModule = require(Parent.Common.LeaderboardViewChangeTelemetry)
			end
			LeaderboardViewChangeTelemetryModule.logLoadError(string.lower(Tab))
		end, { Loading, HasLegacyPanelBackgroundColor })
	end
	local LocalPlayer = Players.LocalPlayer
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 246 ]]
		-- upvalues: LocalPlayer (copy), ResolveDisplayNameModule (upval)
		return if LocalPlayer then ResolveDisplayNameModule(LocalPlayer) else nil
	end, { LocalPlayer })
	local UseSignalStateResult3 = SignalsReactModule.useSignalState(GetUnit)
	local PeopleHeaderLabelModule = GetPeopleHeaderLabelModule()
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 254 ]]
		-- upvalues: FFlagPlayerListReskinModule (upval), HasLegacyPanelBackgroundColor (copy), LeaderboardViewChangeTelemetryModule (upval), Parent (upval), Tab (copy), UsePlatformLeaderboardModuleResult (copy), Loading2 (copy), UseStateResult2 (copy)
		if FFlagPlayerListReskinModule and not HasLegacyPanelBackgroundColor then
			if LeaderboardViewChangeTelemetryModule == nil then
				LeaderboardViewChangeTelemetryModule = require(Parent.Common.LeaderboardViewChangeTelemetry)
			end
			LeaderboardViewChangeTelemetryModule.logRetryError(string.lower(Tab))
		end
		if UsePlatformLeaderboardModuleResult then
			UsePlatformLeaderboardModuleResult:fireTabClosed(Tab)
			UsePlatformLeaderboardModuleResult:fireTabOpened(Tab)
		end
		Loading2("loading")
		UseStateResult2(function(p2: number): number --[[ Line: 263 ]]
			return p2 + 1
		end)
	end, {
		UsePlatformLeaderboardModuleResult,
		Tab,
		HasLegacyPanelBackgroundColor
	})
	
	if UsePlatformLeaderboardModuleResult == nil or not UseSignalStateResult1 then
		return if Loading == "error" then ReactModule.createElement(ServiceUnavailableState, {
			onRetry = UseResult1,
			layoutOrder = p1.layoutOrder,
			useLegacyPanelStyling = HasLegacyPanelBackgroundColor
		}) else ReactModule.createElement(LoadingState, {
			layoutOrder = p1.layoutOrder,
			useLegacyPanelStyling = HasLegacyPanelBackgroundColor
		})
	end
	if IsFriends and Count == 0 then
		return ReactModule.createElement(EmptyFriendsState, {
			layoutOrder = p1.layoutOrder,
			useLegacyPanelStyling = HasLegacyPanelBackgroundColor
		})
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
		ColumnHeader = if HasLegacyPanelBackgroundColor then ReactModule.createElement("Frame", {
			Name = "LegacyPlatformColumnHeader",
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, ScaledPLATFORMHEADERHEIGHT)
		}, {
			Header = ReactModule.createElement(PlatformEntryViewModule, {
				isHeader = true,
				scoreLabel = UseSignalStateResult3,
				peopleHeaderText = PeopleHeaderLabelModule,
				rankHeaderText = RankHeaderText,
				rowHeight = ScaledPLATFORMHEADERHEIGHT,
				rankWidth = ScaledPLATFORMRANKWIDTH,
				scoreWidth = ScaledPLATFORMSCOREWIDTH
			})
		}) else ReactModule.createElement(View, {
			tag = "size-full-0 bg-surface-100",
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, ScaledPLATFORMHEADERHEIGHT)
		}, {
			Header = ReactModule.createElement(PlatformEntryViewModule, {
				isHeader = true,
				scoreLabel = UseSignalStateResult3,
				peopleHeaderText = PeopleHeaderLabelModule,
				rankHeaderText = RankHeaderText,
				rowHeight = ScaledPLATFORMHEADERHEIGHT,
				rankWidth = ScaledPLATFORMRANKWIDTH,
				scoreWidth = ScaledPLATFORMSCOREWIDTH
			})
		}),
		PinnedViewer = ReactModule.createElement(PlatformEntryViewModule, {
			isViewer = true,
			layoutOrder = 3,
			scoreGetter = GetUserFriendScore,
			rankGetter = GetUserFriendRank,
			displayName = UseMemoResult,
			highlightViewerRow = not HasLegacyPanelBackgroundColor,
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
					AutomaticCanvasSize = if HasLegacyPanelBackgroundColor then Enum.AutomaticSize.Y else nil,
					ScrollingDirection = Enum.ScrollingDirection.Y
				},
				scrollingFrameRef = if HasLegacyPanelBackgroundColor then nil else UseResult,
				selection = ConstantsModule.NOT_SELECTABLE
			}, Elements)
		}),
		Footer = if HasLegacyPanelBackgroundColor then ReactModule.createElement("Frame", {
			Name = "LegacyPlatformFooter",
			LayoutOrder = 6,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, ScaledPLATFORMFOOTERHEIGHT)
		}, {
			FooterInner = ReactModule.createElement(View, {
				tag = "row align-x-right align-y-center size-full padding-x-medium padding-y-xsmall",
				Size = UDim2.fromScale(1, 1)
			}, {
				FooterText = ReactModule.createElement(Text, {
					tag = "auto-xy text-caption-small text-align-x-right content-muted",
					Text = FooterUnableToLoad
				})
			})
		}) else ReactModule.createElement(View, {
			tag = "row align-x-right align-y-center size-full-0 padding-x-medium padding-y-xsmall stroke-standard stroke-default bg-surface-100",
			LayoutOrder = 6,
			Size = UDim2.new(1, 0, 0, ScaledPLATFORMFOOTERHEIGHT)
		}, {
			FooterText = ReactModule.createElement(Text, {
				tag = "auto-xy text-caption-small text-align-x-right content-muted",
				Text = FooterUnableToLoad
			})
		})
	})
end)