local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local LocalizationService = game:GetService("LocalizationService")
local FoundationModule = require(Parent.Foundation)
local LocalizationModule = require(Parent.Localization)
local ReactModule = require(Parent.React)
local MomentsCommonModule = require(Parent.MomentsCommon)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local InputHandlersModule = require(Parent.InputHandlers)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(script.Parent.MomentSearchProvider)
local _ = require(script.Parent.MomentSearchView)
local _ = require(script.Parent.MomentSearchTileView)
local _ = require(Moments.Components.Feed.FeedTypes)
local CreateSnapshotFeedSourceModule = require(Moments.Components.Feed.Sources.createSnapshotFeedSource)
local ToMediaItemModule = require(Moments.Components.Feed.Media.toMediaItem)
local UseSignalStateFunction = SignalsReactModule.useSignalState
local GetMomentsCapabilitiesFunction = MomentsCommonModule.Stores.GetMomentsCapabilities
local config = {
	search = "Feature.Moments.Label.Search",
	empty = "CommonUI.Controls.NoResultsFound",
	error = "Feature.Moments.Label.FeedFailedToLoad",
	retry = "Feature.Moments.Action.TryAgain",
	more = "Feature.Moments.Action.LoadMore",
	recommended = "Feature.Moments.Label.FeedRecommended"
}

local function initialState()
	return { query = "", cursor = nil, status = "idle", ids = {} }
end

return function(p1)
	-- upvalues: FoundationModule (copy), LocalizationModule (copy), config (copy), ReactModule (copy), MomentsCommonModule (copy), GetMomentsCapabilitiesFunction (copy), UseSignalStateFunction (copy), initialState (copy), ToMediaItemModule (copy), LocalizationService (copy), CreateSnapshotFeedSourceModule (copy), FocusNavigationUtilsModule (copy), InputHandlersModule (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseLocalizationResult = LocalizationModule.Hooks.useLocalization(config)
	local UseContextResult = ReactModule.useContext(LocalizationModule.LocalizationRoactContext)
	local Recommended = UseLocalizationResult.recommended
	
	if UseContextResult ~= nil then
		local Success, Result = pcall(function()
			-- upvalues: UseContextResult (copy)
			return UseContextResult:Format("Feature.Moments.Label.RecommendedMoments")
		end)
		
		if Success and typeof(Result) == "string" and Result ~= "" and Result ~= "Feature.Moments.Label.RecommendedMoments" then
			Recommended = Result
		end
	end
	local UseDeviceInsetsResult = MomentsCommonModule.Hooks.useDeviceInsets()
	local UseStatusBarHeightResult = MomentsCommonModule.Hooks.useStatusBarHeight()
	local MomentsCapabilities = GetMomentsCapabilitiesFunction(false)
	local UseSignalStateResult = UseSignalStateFunction(MomentsCapabilities.getIsInfiniteScrollEnabled)
	local UseSignalStateResult1 = UseSignalStateFunction(MomentsCapabilities.getMaxMomentsBeforeEndState)
	local UseSignalStateResult2 = UseSignalStateFunction(MomentsCapabilities.getIsEngagementMetricsEnabled)
	local UseStateResult, UseStateResult2 = ReactModule.useState(initialState)
	local UseRefResult = ReactModule.useRef(UseStateResult)
	local UseRefResult1 = ReactModule.useRef(0)
	local UseRefResult2 = ReactModule.useRef(true)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState("")
	local UseRefResult3 = ReactModule.useRef("")
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(0)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(nil)
	local UseRefResult4 = ReactModule.useRef(nil)
	local UseRefResult5 = ReactModule.useRef(nil)
	
	local function _(Current)
		-- upvalues: UseRefResult (copy), UseStateResult2 (copy)
		UseRefResult.current = Current
		UseStateResult2(Current)
	end
	
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult2 (copy), p1 (copy), UseRefResult4 (copy), UseRefResult1 (copy)
		UseRefResult2.current = true
		
		if p1.autoFocus ~= false and UseRefResult4.current then
			UseRefResult4.current.focus()
		end
		return function()
			-- upvalues: UseRefResult2 (upval), UseRefResult1 (upval), UseRefResult4 (upval)
			UseRefResult2.current = false
			UseRefResult1.current += 1
			
			if UseRefResult4.current then
				UseRefResult4.current.releaseFocus()
			end
		end
	end, { p1.autoFocus })
	
	local function request(Query, Cursor)
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy), UseStateResult2 (copy), p1 (copy), UseRefResult2 (copy)
		if UseRefResult.current.status ~= "loading" then
			local Current = UseRefResult.current
			local Current1 = UseRefResult1.current
			local Current2 = {
				status = "loading",
				query = Query,
				ids = Current.ids,
				cursor = Cursor
			}
			UseRefResult.current = Current2
			UseStateResult2(Current2)
			task.spawn(function()
				-- upvalues: p1 (upval), Query (copy), Cursor (copy), UseRefResult2 (upval), UseRefResult1 (upval), Current1 (copy), Current (copy), UseRefResult (upval), UseStateResult2 (upval)
				local Success, Result = pcall(p1.provider.searchAsync, Query, Cursor)
				
				if not UseRefResult2.current or UseRefResult1.current ~= Current1 then return end
				if not Success or typeof(Result) ~= "table" or typeof(Result.momentIds) ~= "table" then
					local Current2 = {
						status = "error",
						query = Query,
						ids = Current.ids,
						cursor = Cursor
					}
					UseRefResult.current = Current2
					UseStateResult2(Current2)
					
					return
				end
				local Copy = table.clone(Current.ids)
				local t = {}
				
				for _, value in Copy do
					t[value] = true
				end
				for _, momentId in Result.momentIds do
					if not t[momentId] then
						t[momentId] = true
						table.insert(Copy, momentId)
					end
				end
				local Current3 = {
					status = "ready",
					query = Query,
					ids = Copy,
					cursor = Result.nextCursor
				}
				UseRefResult.current = Current3
				UseStateResult2(Current3)
			end)
			
			return
		end
	end
	
	local function submit(Current)
		-- upvalues: UseRefResult1 (copy), UseRefResult3 (copy), UseStateResult2_1 (copy), UseRefResult (copy), UseStateResult2 (copy), UseRefResult4 (copy), UseRefResult5 (copy), request (copy)
		UseRefResult1.current += 1
		UseRefResult3.current = Current
		UseStateResult2_1(Current)
		local Current1 = { query = "", cursor = nil, status = "idle", ids = {} }
		UseRefResult.current = Current1
		UseStateResult2(Current1)
		
		if UseRefResult4.current then
			UseRefResult4.current.releaseFocus()
		end
		if UseRefResult5.current then
			UseRefResult5.current.CanvasPosition = Vector2.zero
		end
		local SS = Current:match("^%s*(.-)%s*$") or ""
		
		if SS ~= "" then
			request(SS, nil)
		end
	end
	
	local function onChanged(Current)
		-- upvalues: UseRefResult3 (copy), UseRefResult1 (copy), UseStateResult2_1 (copy), UseRefResult (copy), UseStateResult2 (copy)
		if Current ~= UseRefResult3.current then
			UseRefResult1.current += 1
			UseRefResult3.current = Current
			UseStateResult2_1(Current)
			local Current1 = { query = "", cursor = nil, status = "idle", ids = {} }
			UseRefResult.current = Current1
			UseStateResult2(Current1)
			
			return
		end
	end
	
	local function onMore()
		-- upvalues: UseRefResult (copy), request (copy)
		local Current = UseRefResult.current
		
		if Current.status == "ready" and Current.cursor ~= nil then
			request(Current.query, Current.cursor)
		end
	end
	
	local _ = function(ScrollFrame): boolean
		return ScrollFrame.AbsoluteCanvasSize.Y - 200 <= ScrollFrame.CanvasPosition.Y + ScrollFrame.AbsoluteWindowSize.Y
	end
	
	local function onLayoutOrScrollChanged(ScrollFrame)
		-- upvalues: UseSignalStateResult (copy), UseRefResult (copy), request (copy)
		if UseSignalStateResult and ScrollFrame.CanvasPosition.Y + ScrollFrame.AbsoluteWindowSize.Y >= ScrollFrame.AbsoluteCanvasSize.Y - 200 then
			local Current = UseRefResult.current
			
			if Current.status == "ready" and Current.cursor ~= nil then
				request(Current.query, Current.cursor)
			end
		end
	end
	
	local function makeTiles(Tbl, p2)
		-- upvalues: p1 (copy), ToMediaItemModule (upval), LocalizationModule (upval), LocalizationService (upval), UseRefResult4 (copy), UseStateResult2_3 (copy)
		local List = {}
		
		for _, Id in Tbl do
			local Moment = p1.provider.getMoment(Id)
			local NoMoment = Moment == nil
			local MediaItemModule = nil
			
			if not NoMoment then
				MediaItemModule = ToMediaItemModule({ kind = "moment", moment = Moment })
				NoMoment = MediaItemModule == nil
			end
			if not NoMoment then
				local ReactionCount = if p2 then p1.provider.getReactionCount(Id) else nil
				table.insert(List, {
					id = Id,
					mediaItem = MediaItemModule,
					title = Moment.metadata.description or "",
					reactionText = if ReactionCount == nil then nil else LocalizationModule.abbreviateCount(ReactionCount, LocalizationService.RobloxLocaleId),
					onActivated = function()
						-- upvalues: UseRefResult4 (upval), p1 (upval), Id (copy), UseStateResult2_3 (upval), Tbl (copy)
						if UseRefResult4.current then
							UseRefResult4.current.releaseFocus()
						end
						if p1.provider.getMoment(Id) ~= nil then
							UseStateResult2_3({ ids = table.clone(Tbl), id = Id })
							
							return
						end
					end
				})
			end
		end
		return List
	end
	
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseStateResult4 (copy), p1 (copy), UseSignalStateResult (copy), UseSignalStateResult1 (copy), CreateSnapshotFeedSourceModule (upval), MomentsCommonModule (upval)
		if UseStateResult4 == nil then
			return nil
		end
		local List = {}
		local Count: number? = nil
		
		for _, id in UseStateResult4.ids do
			local Moment = p1.provider.getMoment(id)
			
			if Moment then
				table.insert(List, { kind = "moment", moment = Moment })
				
				if id == UseStateResult4.id then
					Count = #List
				end
			end
		end
		if Count == nil then
			return nil
		end
		if not UseSignalStateResult then
			local Largest = math.max(1, UseSignalStateResult1)
			local ClampedValue = math.clamp(Count - math.floor((Largest - 1) / 2), 1, (math.max(1, #List - Largest + 1)))
			local List1 = {}
			
			for i = ClampedValue, math.min(#List, ClampedValue + Largest - 1) do
				table.insert(List1, List[i])
			end
			List = List1
			Count -= ClampedValue - 1
		end
		return {
			source = CreateSnapshotFeedSourceModule(List, {
				id = "search",
				recommendationSource = MomentsCommonModule.Analytics.RecommendationSource.Search
			}),
			index = Count
		}
	end, {
		UseStateResult4,
		p1.provider,
		UseSignalStateResult,
		UseSignalStateResult1
	})
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult4 (copy), UseMemoResult (copy), UseStateResult2_3 (copy)
		if UseStateResult4 ~= nil and UseMemoResult == nil then
			UseStateResult2_3(nil)
		end
	end, { UseStateResult4, UseMemoResult })
	
	local function clearToLanding()
		-- upvalues: UseRefResult1 (copy), UseRefResult3 (copy), UseStateResult2_1 (copy), UseStateResult2_3 (copy), UseRefResult (copy), UseStateResult2 (copy), UseRefResult4 (copy), UseRefResult5 (copy)
		UseRefResult1.current += 1
		UseRefResult3.current = ""
		UseStateResult2_1("")
		UseStateResult2_3(nil)
		local Current = { query = "", cursor = nil, status = "idle", ids = {} }
		UseRefResult.current = Current
		UseStateResult2(Current)
		
		if UseRefResult4.current then
			UseRefResult4.current.releaseFocus()
		end
		if UseRefResult5.current then
			UseRefResult5.current.CanvasPosition = Vector2.zero
		end
	end
	
	local function onNavigateBack()
		-- upvalues: UseStateResult4 (copy), UseStateResult2_3 (copy), UseRefResult (copy), UseRefResult3 (copy), clearToLanding (copy), p1 (copy)
		if UseStateResult4 ~= nil then
			UseStateResult2_3(nil)
			
			return
		end
		if UseRefResult.current.status == "idle" and UseRefResult3.current:match("^%s*$") ~= nil then
			p1.onBack()
			
			return
		else
			clearToLanding()
		end
	end
	
	local Topics = {}
	
	for _, suggestedQuery in p1.provider.suggestedQueries do
		table.insert(Topics, {
			text = suggestedQuery,
			onActivated = function()
				-- upvalues: submit (copy), suggestedQuery (copy)
				submit(suggestedQuery)
			end
		})
	end
	local ClampedValue = math.clamp(math.floor(UseStateResult3 / 140), 3, 6)
	local Largest = math.max(0, (UseStateResult3 - (ClampedValue - 1) * 2) / ClampedValue)
	
	return {
		text = UseStateResult1,
		onChanged = onChanged,
		onSubmit = function()
			-- upvalues: submit (copy), UseRefResult3 (copy)
			submit(UseRefResult3.current)
		end,
		onBack = onNavigateBack,
		inputRef = UseRefResult4,
		scrollRef = UseRefResult5,
		status = UseStateResult.status,
		showLanding = UseStateResult.status == "idle" and UseStateResult1:match("^%s*$") ~= nil,
		topics = Topics,
		recommendations = makeTiles(p1.provider.recommendedMomentIds, false),
		results = makeTiles(UseStateResult.ids, UseSignalStateResult2),
		hasMore = UseStateResult.cursor ~= nil,
		onMore = onMore,
		onRetry = function()
			-- upvalues: UseRefResult (copy), request (copy)
			local Current = UseRefResult.current
			
			if Current.status == "error" then
				request(Current.query, Current.cursor)
			end
		end,
		cellSize = UDim2.fromOffset(Largest, Largest * 1.5),
		columns = ClampedValue,
		onSizeChanged = function(Frame)
			-- upvalues: UseStateResult2_2 (copy)
			UseStateResult2_2(Frame.AbsoluteSize.X)
		end,
		onScrolled = onLayoutOrScrollChanged,
		onLayoutChanged = onLayoutOrScrollChanged,
		padding = p1.padding or {
			top = UDim.new(0, UseStatusBarHeightResult),
			left = UDim.new(0, UseDeviceInsetsResult.left),
			right = UDim.new(0, UseDeviceInsetsResult.right)
		},
		gap = UDim.new(0, UseTokensResult.Gap.Small),
		labels = {
			search = UseLocalizationResult.search,
			recommended = Recommended,
			empty = UseLocalizationResult.empty,
			error = UseLocalizationResult.error,
			retry = UseLocalizationResult.retry,
			more = UseLocalizationResult.more
		},
		selectedSource = if UseMemoResult then UseMemoResult.source else nil,
		selectedIndex = if UseMemoResult then UseMemoResult.index else 1,
		backEventHandlers = {
			[FocusNavigationUtilsModule.FocusNavigationEventNameEnum.NavigateBack] = {
				handler = InputHandlersModule.onRelease(function(p3)
					-- upvalues: UseStateResult4 (copy), UseStateResult2_3 (copy), UseRefResult (copy), UseRefResult3 (copy), clearToLanding (copy), p1 (copy)
					if UseStateResult4 == nil then
						if UseRefResult.current.status == "idle" and UseRefResult3.current:match("^%s*$") ~= nil then
							p1.onBack()
						else
							clearToLanding()
						end
					else
						UseStateResult2_3(nil)
					end
					p3:cancel()
				end)
			}
		},
		onOpenRecommendations = function()
			-- upvalues: p1 (copy), UseStateResult2_3 (copy)
			local RecommendedMomentIds = p1.provider.recommendedMomentIds
			local Id = nil
			
			for _, recommendedMomentId in RecommendedMomentIds do
				if p1.provider.getMoment(recommendedMomentId) ~= nil then
					Id = recommendedMomentId
					break
				end
			end
			if Id ~= nil then
				UseStateResult2_3({ ids = table.clone(RecommendedMomentIds), id = Id })
			end
		end,
		onCloseViewer = function()
			-- upvalues: UseStateResult2_3 (copy)
			UseStateResult2_3(nil)
		end,
		playbackActive = p1.playbackActive ~= false,
		bottomInset = p1.bottomInset or 0
	}
end