local Parent = script:FindFirstAncestor("Moments").Parent
local CreatorAnalyticsModule = require(Parent.DataHydration.CreatorAnalytics)
local MomentsCommonModule = require(Parent.MomentsCommon)
local _ = require(Parent.MomentsTypes)
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local GetPostInsightsQueryParamsModule = require(script.Parent.getPostInsightsQueryParams)
local MetricSeriesToChartPointsModule = require(script.Parent.metricSeriesToChartPoints)
local DataStatus = CreatorAnalyticsModule.DataStatus
local GetCreatorAnalyticsStoreFunction = CreatorAnalyticsModule.getCreatorAnalyticsStore
local config = {
	views = "lifetime_views",
	watchTime = "lifetime_watch_time",
	watchTimeNoReplay = "lifetime_watch_time_no_replay",
	joins = "lifetime_joins"
}

local function _(p1): number?
	if p1 == nil then
		return nil
	end
	local NewValue = 0
	
	for _, dataPoint in p1.dataPoints do
		NewValue += dataPoint.value
	end
	return NewValue
end

local function combineStatus(List)
	-- upvalues: DataStatus (copy)
	local Ready = DataStatus.Ready
	
	for _, value in List do
		if value == DataStatus.Failed then
			return DataStatus.Failed
		elseif value == DataStatus.NotReady then
			Ready = DataStatus.NotReady
		end
	end
	return Ready
end

return function(p2, p3, p4)
	-- upvalues: ReactModule (copy), GetPostInsightsQueryParamsModule (copy), SignalsModule (copy), DataStatus (copy), GetCreatorAnalyticsStoreFunction (copy), combineStatus (copy), SignalsReactModule (copy), MetricSeriesToChartPointsModule (copy), MomentsCommonModule (copy), config (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: GetPostInsightsQueryParamsModule (upval), p2 (copy), p3 (copy)
		return GetPostInsightsQueryParamsModule(p2, p3 or os.time())
	end, { p2.momentId, p2.createdAt or false, p3 or false })
	local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), UseMemoResult (copy), DataStatus (upval), GetCreatorAnalyticsStoreFunction (upval), combineStatus (upval)
		return SignalsModule.createComputed(function(p5)
			-- upvalues: UseMemoResult (upval), DataStatus (upval), GetCreatorAnalyticsStoreFunction (upval), combineStatus (upval)
			if UseMemoResult == nil then
				return {
					views = nil,
					params = UseMemoResult,
					viewsStatus = DataStatus.Failed,
					lifetimeStatus = DataStatus.Failed,
					lifetime = {},
					lifetimeStatuses = {}
				}
			end
			local CreatorAnalyticsStore = GetCreatorAnalyticsStoreFunction(p5)
			local AndFetchResourceMetric = CreatorAnalyticsStore.getAndFetchResourceMetric(UseMemoResult.views)
			local Lifetime = {}
			local LifetimeStatuses = {}
			local List = {}
			
			for i, value in UseMemoResult.lifetime do
				local AndFetchResourceMetric1 = CreatorAnalyticsStore.getAndFetchResourceMetric(value)
				Lifetime[i] = AndFetchResourceMetric1.data(p5)
				LifetimeStatuses[i] = AndFetchResourceMetric1.status(p5)
				table.insert(List, AndFetchResourceMetric1.status(p5))
			end
			return {
				params = UseMemoResult,
				viewsStatus = AndFetchResourceMetric.status(p5),
				views = AndFetchResourceMetric.data(p5),
				lifetimeStatus = combineStatus(List),
				lifetime = Lifetime,
				lifetimeStatuses = LifetimeStatuses
			}
		end)
	end, { UseMemoResult })))
	local Current = ReactModule.useRef({
		views = nil,
		params = UseMemoResult,
		lifetimeTotals = {},
		lifetimeFailed = {}
	}).current
	
	if Current.params ~= UseMemoResult then
		Current.params = UseMemoResult
		Current.views = nil
		Current.lifetimeTotals = {}
		Current.lifetimeFailed = {}
	end
	if UseSignalStateResult.params == UseMemoResult then
		if UseSignalStateResult.viewsStatus == DataStatus.Ready then
			Current.views = UseSignalStateResult
		end
		for i, lifetimeStatus in UseSignalStateResult.lifetimeStatuses do
			if lifetimeStatus ~= DataStatus.Ready then
				if lifetimeStatus == DataStatus.Failed then
					Current.lifetimeFailed[i] = true
					continue
				end
				continue
			end
			local LifetimeTotals1 = Current.lifetimeTotals
			local LifetimeEntry = UseSignalStateResult.lifetime[i]
			local v1 = nil
			
			if LifetimeEntry == nil then
				v1 = nil
			else
				local NewValue = 0
				
				for _, dataPoint in LifetimeEntry.dataPoints do
					NewValue += dataPoint.value
				end
				v1 = NewValue
			end
			LifetimeTotals1[i] = v1
		end
	end
	local UseSignalStateResult1 = if UseSignalStateResult.viewsStatus == DataStatus.Ready or Current.views == nil then UseSignalStateResult else Current.views
	local LifetimeTotals = Current.lifetimeTotals
	
	local function _(p5)
		-- upvalues: LifetimeTotals (copy), DataStatus (upval), Current (copy), UseSignalStateResult (copy)
		return if LifetimeTotals[p5] == nil then if Current.lifetimeFailed[p5] then DataStatus.Failed else UseSignalStateResult.lifetimeStatuses[p5] or DataStatus.Failed else DataStatus.Ready
	end
	
	local HasJoins: boolean = UseMemoResult ~= nil and (LifetimeTotals.views ~= nil and (LifetimeTotals.watchTime ~= nil and (LifetimeTotals.watchTimeNoReplay ~= nil and LifetimeTotals.joins ~= nil)))
	local Delay = p4 or 600
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult (copy), Delay (copy), GetCreatorAnalyticsStoreFunction (upval)
		if UseMemoResult == nil then return end
		local DelayedThread = nil
		
		local function scheduleRefresh()
			-- upvalues: DelayedThread (ref), Delay (upval), GetCreatorAnalyticsStoreFunction (upval), UseMemoResult (upval), scheduleRefresh (copy)
			DelayedThread = task.delay(Delay, function()
				-- upvalues: GetCreatorAnalyticsStoreFunction (upval), UseMemoResult (upval), scheduleRefresh (upval)
				local CreatorAnalyticsStore = GetCreatorAnalyticsStoreFunction(false)
				CreatorAnalyticsStore.refetchResourceMetric(UseMemoResult.views)
				
				for _, value in UseMemoResult.lifetime do
					CreatorAnalyticsStore.refetchResourceMetric(value)
				end
				scheduleRefresh()
			end)
		end
		
		DelayedThread = task.delay(Delay, function()
			-- upvalues: GetCreatorAnalyticsStoreFunction (upval), UseMemoResult (upval), scheduleRefresh (copy)
			local CreatorAnalyticsStore = GetCreatorAnalyticsStoreFunction(false)
			CreatorAnalyticsStore.refetchResourceMetric(UseMemoResult.views)
			
			for _, value in UseMemoResult.lifetime do
				CreatorAnalyticsStore.refetchResourceMetric(value)
			end
			scheduleRefresh()
		end)
		
		return function()
			-- upvalues: DelayedThread (ref)
			if DelayedThread ~= nil then
				task.cancel(DelayedThread)
			end
		end
	end, { UseMemoResult, Delay })
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: UseMemoResult (copy), UseSignalStateResult1 (copy), DataStatus (upval), MetricSeriesToChartPointsModule (upval)
		return if UseMemoResult == nil or UseSignalStateResult1.viewsStatus ~= DataStatus.Ready then nil else MetricSeriesToChartPointsModule(UseSignalStateResult1.views, UseMemoResult.window)
	end, {
		UseMemoResult,
		UseSignalStateResult1.viewsStatus,
		UseSignalStateResult1.views
	})
	local UseRefResult = ReactModule.useRef({ params = nil, queries = {}, inFlight = {} })
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult (copy), UseRefResult (copy), DataStatus (upval), MomentsCommonModule (upval), UseSignalStateResult (copy), config (upval)
		if UseMemoResult == nil then return end
		local Current = UseRefResult.current
		
		if Current.params ~= UseMemoResult then
			Current.params = UseMemoResult
			Current.queries = {}
			Current.inFlight = {}
		end
		local function reportOnce(p5, LifetimeStatus)
			-- upvalues: Current (copy), DataStatus (upval), MomentsCommonModule (upval)
			if Current.queries[p5] then return end
			if LifetimeStatus ~= DataStatus.NotReady then
				local InFlightEntry = Current.inFlight[p5]
				
				if InFlightEntry == nil then return end
				local Success = if LifetimeStatus == DataStatus.Ready then "success" elseif LifetimeStatus == DataStatus.Failed then "failed" else nil
				
				if Success ~= nil then
					Current.queries[p5] = true
					MomentsCommonModule.Analytics.reportMomentsPostInsightsRequest(p5, Success)
					MomentsCommonModule.Analytics.reportMomentsPostInsightsRequestLatency(p5, Success, (math.round((os.clock() - InFlightEntry) * 1000)))
					
					return
				end
				return
			elseif Current.inFlight[p5] == nil then
				Current.inFlight[p5] = os.clock()
			end
		end
		
		reportOnce("views", UseSignalStateResult.viewsStatus)
		
		for i, value in config do
			reportOnce(value, UseSignalStateResult.lifetimeStatuses[i])
		end
	end, { UseMemoResult, UseSignalStateResult })
	
	return {
		viewsStatus = UseSignalStateResult1.viewsStatus,
		viewsSeries = UseMemoResult1,
		window = if UseMemoResult == nil then nil else UseMemoResult.window,
		lifetimeStatus = if HasJoins then DataStatus.Ready else UseSignalStateResult.lifetimeStatus,
		lifetimeViews = LifetimeTotals.views,
		lifetimeViewsStatus = if LifetimeTotals.views == nil then if Current.lifetimeFailed.views then DataStatus.Failed else UseSignalStateResult.lifetimeStatuses.views or DataStatus.Failed else DataStatus.Ready,
		lifetimeWatchTimeSeconds = LifetimeTotals.watchTime,
		lifetimeWatchTimeStatus = if LifetimeTotals.watchTime == nil then if Current.lifetimeFailed.watchTime then DataStatus.Failed else UseSignalStateResult.lifetimeStatuses.watchTime or DataStatus.Failed else DataStatus.Ready,
		lifetimeWatchTimeNoReplaySeconds = LifetimeTotals.watchTimeNoReplay,
		lifetimeWatchTimeNoReplayStatus = if LifetimeTotals.watchTimeNoReplay == nil then if Current.lifetimeFailed.watchTimeNoReplay then DataStatus.Failed else UseSignalStateResult.lifetimeStatuses.watchTimeNoReplay or DataStatus.Failed else DataStatus.Ready,
		lifetimeJoins = LifetimeTotals.joins,
		lifetimeJoinsStatus = if LifetimeTotals.joins == nil then if Current.lifetimeFailed.joins then DataStatus.Failed else UseSignalStateResult.lifetimeStatuses.joins or DataStatus.Failed else DataStatus.Ready
	}
end