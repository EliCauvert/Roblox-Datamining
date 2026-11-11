local ImmutableModule = require(script.Parent.Parent.Immutable)
local SetScriptProfilerStateModule = require(script.Parent.Parent.Actions.SetScriptProfilerState)
local SetScriptProfilerRootModule = require(script.Parent.Parent.Actions.SetScriptProfilerRoot)
local SetIsProfilingModule = require(script.Parent.Parent.Components.ScriptProfiler.Actions.SetIsProfiling)
local SetDataModule = require(script.Parent.Parent.Components.ScriptProfiler.Actions.SetData)
local SetThreadsModule = require(script.Parent.Parent.Components.ScriptProfiler.Actions.SetThreads)
local SetTimerStateModule = require(script.Parent.Parent.Components.ScriptProfiler.Actions.SetTimerState)
local ClearStateForNewProfilingSessionModule = require(script.Parent.Parent.Components.ScriptProfiler.Actions.ClearStateForNewProfilingSession)
local SetAverageModule = require(script.Parent.Parent.Components.ScriptProfiler.Actions.SetAverage)
local SetFrequencyModule = require(script.Parent.Parent.Components.ScriptProfiler.Actions.SetFrequency)
local SetDataViewModule = require(script.Parent.Parent.Components.ScriptProfiler.Actions.SetDataView)
local SetLiveUpdateModule = require(script.Parent.Parent.Components.ScriptProfiler.Actions.SetLiveUpdate)
local SetShowPluginsModule = require(script.Parent.Parent.Components.ScriptProfiler.Actions.SetShowPlugins)
local SetShowGCModule = require(script.Parent.Parent.Components.ScriptProfiler.Actions.SetShowGC)
local SetSearchDataModule = require(script.Parent.Parent.Components.ScriptProfiler.Actions.SetSearchData)
local _ = require(script.Parent.Parent.Components.ScriptProfiler.ProfilerDataFormatV2)

local function _(p1, p2)
	return if p1 then p2.client else p2.server
end

local function Update(IsClient, p1, p2)
	-- upvalues: ImmutableModule (copy)
	local JoinDictionariesResult = ImmutableModule.JoinDictionaries(if IsClient then p1.client else p1.server, p2)
	
	return ImmutableModule.JoinDictionaries(p1, {
		client = if IsClient then JoinDictionariesResult else nil,
		server = if IsClient then nil else JoinDictionariesResult
	})
end

return function(p1, p2)
	-- upvalues: SetScriptProfilerStateModule (copy), ImmutableModule (copy), SetIsProfilingModule (copy), Update (copy), SetAverageModule (copy), SetFrequencyModule (copy), SetDataViewModule (copy), SetLiveUpdateModule (copy), SetShowPluginsModule (copy), SetShowGCModule (copy), SetSearchDataModule (copy), SetTimerStateModule (copy), SetDataModule (copy), SetThreadsModule (copy), ClearStateForNewProfilingSessionModule (copy), SetScriptProfilerRootModule (copy)
	local Tbl = p1 or {
		isClientView = true,
		usePercentages = false,
		isExporting = false,
		isShowingMobileSettings = false,
		client = {
			isProfiling = false,
			data = nil,
			serializedData = nil,
			frequency = 1000,
			timedProfilingThread = nil,
			timedProfilingTimerThread = nil,
			timedProfilingDuration = 0,
			timedProfilingCountdown = 0,
			isFunctionsView = false,
			average = 0,
			searchTerm = "",
			rootNode = 0,
			rootFunc = 0,
			rootNodeName = nil,
			liveUpdate = false,
			liveUpdateThread = nil,
			showPlugins = false,
			showGC = false,
			searchFilterGraph = {},
			searchFilterFlat = {},
			pluginOffsets = {},
			gcFunctionOffsets = {},
			gcNodeOffsets = {},
			pluginGCOffsets = {},
			expandedNodes = {}
		},
		server = {
			isProfiling = false,
			data = nil,
			serializedData = nil,
			frequency = 1000,
			timedProfilingThread = nil,
			timedProfilingTimerThread = nil,
			timedProfilingDuration = 0,
			timedProfilingCountdown = 0,
			isFunctionsView = false,
			average = 0,
			searchTerm = "",
			rootNode = 0,
			rootFunc = 0,
			rootNodeName = nil,
			liveUpdate = false,
			liveUpdateThread = nil,
			showPlugins = false,
			showGC = false,
			searchFilterGraph = {},
			searchFilterFlat = {},
			pluginOffsets = {},
			gcFunctionOffsets = {},
			gcNodeOffsets = {},
			pluginGCOffsets = {},
			expandedNodes = {}
		}
	}
	
	if p2.type == SetScriptProfilerStateModule.name then
		return (ImmutableModule.JoinDictionaries(Tbl, {
			isClientView = p2.isClientView,
			usePercentages = p2.usePercentages,
			isExporting = p2.isExporting,
			isShowingMobileSettings = p2.isShowingMobileSettings,
			client = p2.clientSessionState,
			server = p2.serverSessionState
		}))
	end
	if p2.type == SetIsProfilingModule.name then
		return Update(p2.isClient, Tbl, { isProfiling = p2.isProfiling })
	end
	if p2.type == SetAverageModule.name then
		return Update(p2.isClient, Tbl, { average = p2.average })
	end
	if p2.type == SetFrequencyModule.name then
		return Update(p2.isClient, Tbl, { frequency = p2.frequency })
	end
	if p2.type == SetDataViewModule.name then
		return Update(p2.isClient, Tbl, { isFunctionsView = p2.isFunctionsView })
	end
	if p2.type == SetLiveUpdateModule.name then
		return Update(p2.isClient, Tbl, { liveUpdate = p2.liveUpdate })
	end
	if p2.type == SetShowPluginsModule.name then
		return Update(p2.isClient, Tbl, { showPlugins = p2.showPlugins })
	end
	if p2.type == SetShowGCModule.name then
		return Update(p2.isClient, Tbl, { showGC = p2.showGC })
	end
	if p2.type == SetSearchDataModule.name then
		return Update(p2.isClient, Tbl, {
			searchTerm = p2.state.searchTerm,
			searchFilterFlat = p2.state.searchFilterFlat,
			searchFilterGraph = p2.state.searchFilterGraph
		})
	end
	if p2.type == SetTimerStateModule.name then
		return Update(p2.isClient, Tbl, {
			timedProfilingDuration = p2.state.timedProfilingDuration,
			timedProfilingCountdown = p2.state.timedProfilingCountdown
		})
	end
	if p2.type == SetDataModule.name then
		local Copy = table.clone(if p2.isClient then Tbl.client else Tbl.server)
		Copy.data = p2.state.data
		Copy.serializedData = p2.state.serializedData
		Copy.pluginOffsets = p2.state.pluginOffsets or {}
		Copy.pluginGCOffsets = p2.state.pluginGCOffsets or {}
		Copy.gcFunctionOffsets = p2.state.gcFunctionOffsets or {}
		Copy.gcNodeOffsets = p2.state.gcNodeOffsets or {}
		Copy.expandedNodes = p2.state.expandedNodes or {}
		local Copy1 = table.clone(Tbl)
		
		if p2.isClient then
			Copy1.client = Copy
		else
			Copy1.server = Copy
		end
		return ImmutableModule.JoinDictionaries(Tbl, Copy1)
	elseif p2.type == SetThreadsModule.name then
		local Copy = table.clone(if p2.isClient then Tbl.client else Tbl.server)
		Copy.timedProfilingThread = p2.state.timedProfilingThread
		Copy.timedProfilingTimerThread = p2.state.timedProfilingTimerThread
		Copy.liveUpdateThread = p2.state.liveUpdateThread
		local Copy2 = table.clone(Tbl)
		
		if p2.isClient then
			Copy2.client = Copy
		else
			Copy2.server = Copy
		end
		return ImmutableModule.JoinDictionaries(Tbl, Copy2)
	elseif p2.type == ClearStateForNewProfilingSessionModule.name then
		local Copy = table.clone(if p2.isClient then Tbl.client else Tbl.server)
		Copy.rootNode = 0
		Copy.rootFunc = 0
		Copy.rootNodeName = nil
		Copy.searchFilterFlat = {}
		Copy.searchFilterGraph = {}
		Copy.expandedNodes = {}
		local Copy3 = table.clone(Tbl)
		
		if p2.isClient then
			Copy3.client = Copy
		else
			Copy3.server = Copy
		end
		return ImmutableModule.JoinDictionaries(Tbl, Copy3)
	else
		if p2.type ~= SetScriptProfilerRootModule.name then
			return Tbl
		end
		local t = {}
		local Copy = table.clone(if Tbl.isClientView then Tbl.client else Tbl.server)
		
		if Copy.rootNode == p2.rootNode then
			Copy.rootNode = 0
			Copy.rootFunc = 0
			Copy.rootNodeName = nil
		else
			Copy.rootNode = p2.rootNode
			Copy.rootFunc = p2.rootFunc
			Copy.rootNodeName = p2.rootNodeName
		end
		if Tbl.isClientView then
			t.client = Copy
		else
			t.server = Copy
		end
		return ImmutableModule.JoinDictionaries(Tbl, t)
	end
end