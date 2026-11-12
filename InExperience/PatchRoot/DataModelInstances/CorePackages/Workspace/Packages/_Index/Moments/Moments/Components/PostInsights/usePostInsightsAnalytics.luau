local Parent = script:FindFirstAncestor("Moments").Parent
local CreatorAnalyticsModule = require(Parent.DataHydration.CreatorAnalytics)
local _ = require(Parent.MomentsTypes)
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local GetPostInsightsQueryParamsModule = require(script.Parent.getPostInsightsQueryParams)
local MetricSeriesToChartPointsModule = require(script.Parent.metricSeriesToChartPoints)
local DataStatus = CreatorAnalyticsModule.DataStatus
local GetCreatorAnalyticsStoreFunction = CreatorAnalyticsModule.getCreatorAnalyticsStore

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
	-- upvalues: ReactModule (copy), GetPostInsightsQueryParamsModule (copy), SignalsModule (copy), DataStatus (copy), GetCreatorAnalyticsStoreFunction (copy), combineStatus (copy), SignalsReactModule (copy), MetricSeriesToChartPointsModule (copy)
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
				viewsStatus = AndFetchResourceMetric.status(p5),
				views = AndFetchResourceMetric.data(p5),
				lifetimeStatus = combineStatus(List),
				lifetime = Lifetime,
				lifetimeStatuses = LifetimeStatuses
			}
		end)
	end, { UseMemoResult })))
	local Current = ReactModule.useRef({ views = nil, params = UseMemoResult, lifetimeTotals = {} }).current
	
	if Current.params ~= UseMemoResult then
		Current.params = UseMemoResult
		Current.views = nil
		Current.lifetimeTotals = {}
	end
	if UseSignalStateResult.viewsStatus == DataStatus.Ready then
		Current.views = UseSignalStateResult
	end
	for i, lifetimeStatus in UseSignalStateResult.lifetimeStatuses do
		if lifetimeStatus == DataStatus.Ready then
			local LifetimeTotals = Current.lifetimeTotals
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
			LifetimeTotals[i] = v1
		end
	end
	local UseSignalStateResult1 = if UseSignalStateResult.viewsStatus == DataStatus.Ready or Current.views == nil then UseSignalStateResult else Current.views
	local LifetimeTotals = Current.lifetimeTotals
	local HasJoins: boolean = UseMemoResult ~= nil and (LifetimeTotals.views ~= nil and (LifetimeTotals.watchTime ~= nil and LifetimeTotals.joins ~= nil))
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
	
	return {
		viewsStatus = UseSignalStateResult1.viewsStatus,
		viewsSeries = ReactModule.useMemo(function()
			-- upvalues: UseMemoResult (copy), UseSignalStateResult1 (copy), DataStatus (upval), MetricSeriesToChartPointsModule (upval)
			return if UseMemoResult == nil or UseSignalStateResult1.viewsStatus ~= DataStatus.Ready then nil else MetricSeriesToChartPointsModule(UseSignalStateResult1.views, UseMemoResult.window)
		end, {
			UseMemoResult,
			UseSignalStateResult1.viewsStatus,
			UseSignalStateResult1.views
		}),
		window = if UseMemoResult == nil then nil else UseMemoResult.window,
		lifetimeStatus = if HasJoins then DataStatus.Ready else UseSignalStateResult.lifetimeStatus,
		lifetimeViews = LifetimeTotals.views,
		lifetimeWatchTimeSeconds = LifetimeTotals.watchTime,
		lifetimeJoins = LifetimeTotals.joins
	}
end