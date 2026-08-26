local immutableModule = require(script.Parent.Parent.Immutable)
local setScriptProfilerStateModule = require(script.Parent.Parent.Actions.SetScriptProfilerState)
local setScriptProfilerRootModule = require(script.Parent.Parent.Actions.SetScriptProfilerRoot)
local setIsProfilingModule = require(script.Parent.Parent.Components.ScriptProfiler.Actions.SetIsProfiling)
local setDataModule = require(script.Parent.Parent.Components.ScriptProfiler.Actions.SetData)
local setThreadsModule = require(script.Parent.Parent.Components.ScriptProfiler.Actions.SetThreads)
local setTimerStateModule = require(script.Parent.Parent.Components.ScriptProfiler.Actions.SetTimerState)
local clearStateForNewProfilingSessionModule = require(script.Parent.Parent.Components.ScriptProfiler.Actions.ClearStateForNewProfilingSession)
local setAverageModule = require(script.Parent.Parent.Components.ScriptProfiler.Actions.SetAverage)
local setFrequencyModule = require(script.Parent.Parent.Components.ScriptProfiler.Actions.SetFrequency)
local setDataViewModule = require(script.Parent.Parent.Components.ScriptProfiler.Actions.SetDataView)
local setLiveUpdateModule = require(script.Parent.Parent.Components.ScriptProfiler.Actions.SetLiveUpdate)
local setShowPluginsModule = require(script.Parent.Parent.Components.ScriptProfiler.Actions.SetShowPlugins)
local setShowGCModule = require(script.Parent.Parent.Components.ScriptProfiler.Actions.SetShowGC)
local setSearchDataModule = require(script.Parent.Parent.Components.ScriptProfiler.Actions.SetSearchData)
local _ = require(script.Parent.Parent.Components.ScriptProfiler.ProfilerDataFormatV2)

local function _(p1, p2)
	return if p1 then p2.client else p2.server
end

local function Update(p1, p2, p3)
	-- upvalues: immutableModule (ref)
	local var1 = immutableModule.JoinDictionaries(if p1 then p2.client else p2.server, p3)
	
	return immutableModule.JoinDictionaries(p2, {
		client = if p1 then var1 else nil,
		server = if p1 then nil else var1
	})
end

return function(p1, p2)
	-- upvalues: setScriptProfilerStateModule (ref), immutableModule (ref), setIsProfilingModule (ref), Update (ref), setAverageModule (ref), setFrequencyModule (ref), setDataViewModule (ref), setLiveUpdateModule (ref), setShowPluginsModule (ref), setShowGCModule (ref), setSearchDataModule (ref), setTimerStateModule (ref), setDataModule (ref), setThreadsModule (ref), clearStateForNewProfilingSessionModule (ref), setScriptProfilerRootModule (ref)
	p1 = p1 or {
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
	
	if p2.type == setScriptProfilerStateModule.name then
		return immutableModule.JoinDictionaries(p1, {
			isClientView = p2.isClientView,
			usePercentages = p2.usePercentages,
			isExporting = p2.isExporting,
			isShowingMobileSettings = p2.isShowingMobileSettings,
			client = p2.clientSessionState,
			server = p2.serverSessionState
		})
	elseif p2.type == setIsProfilingModule.name then
		return Update(p2.isClient, p1, { isProfiling = p2.isProfiling })
	elseif p2.type == setAverageModule.name then
		return Update(p2.isClient, p1, { average = p2.average })
	elseif p2.type == setFrequencyModule.name then
		return Update(p2.isClient, p1, { frequency = p2.frequency })
	elseif p2.type == setDataViewModule.name then
		return Update(p2.isClient, p1, { isFunctionsView = p2.isFunctionsView })
	elseif p2.type == setLiveUpdateModule.name then
		return Update(p2.isClient, p1, { liveUpdate = p2.liveUpdate })
	elseif p2.type == setShowPluginsModule.name then
		return Update(p2.isClient, p1, { showPlugins = p2.showPlugins })
	elseif p2.type == setShowGCModule.name then
		return Update(p2.isClient, p1, { showGC = p2.showGC })
	elseif p2.type == setSearchDataModule.name then
		return Update(p2.isClient, p1, {
			searchTerm = p2.state.searchTerm,
			searchFilterFlat = p2.state.searchFilterFlat,
			searchFilterGraph = p2.state.searchFilterGraph
		})
	elseif p2.type == setTimerStateModule.name then
		return Update(p2.isClient, p1, {
			timedProfilingDuration = p2.state.timedProfilingDuration,
			timedProfilingCountdown = p2.state.timedProfilingCountdown
		})
	elseif p2.type == setDataModule.name then
		local cloned = table.clone(if p2.isClient then p1.client else p1.server)
		cloned.data = p2.state.data
		cloned.serializedData = p2.state.serializedData
		cloned.pluginOffsets = p2.state.pluginOffsets or {}
		cloned.pluginGCOffsets = p2.state.pluginGCOffsets or {}
		cloned.gcFunctionOffsets = p2.state.gcFunctionOffsets or {}
		cloned.gcNodeOffsets = p2.state.gcNodeOffsets or {}
		cloned.expandedNodes = p2.state.expandedNodes or {}
		local cloned_1 = table.clone(p1)
		
		if p2.isClient then
			cloned_1.client = cloned
		else
			cloned_1.server = cloned
		end
		return immutableModule.JoinDictionaries(p1, cloned_1)
	elseif p2.type == setThreadsModule.name then
		local cloned = table.clone(if p2.isClient then p1.client else p1.server)
		cloned.timedProfilingThread = p2.state.timedProfilingThread
		cloned.timedProfilingTimerThread = p2.state.timedProfilingTimerThread
		cloned.liveUpdateThread = p2.state.liveUpdateThread
		local cloned_1 = table.clone(p1)
		
		if p2.isClient then
			cloned_1.client = cloned
		else
			cloned_1.server = cloned
		end
		return immutableModule.JoinDictionaries(p1, cloned_1)
	elseif p2.type == clearStateForNewProfilingSessionModule.name then
		local cloned = table.clone(if p2.isClient then p1.client else p1.server)
		cloned.rootNode = 0
		cloned.rootFunc = 0
		cloned.rootNodeName = nil
		cloned.searchFilterFlat = {}
		cloned.searchFilterGraph = {}
		cloned.expandedNodes = {}
		local cloned_1 = table.clone(p1)
		
		if p2.isClient then
			cloned_1.client = cloned
		else
			cloned_1.server = cloned
		end
		return immutableModule.JoinDictionaries(p1, cloned_1)
	elseif p2.type ~= setScriptProfilerRootModule.name then
		return p1
	end
	local t = {}
	local cloned = table.clone(if p1.isClientView then p1.client else p1.server)
	
	if cloned.rootNode == p2.rootNode then
		cloned.rootNode = 0
		cloned.rootFunc = 0
		cloned.rootNodeName = nil
	else
		cloned.rootNode = p2.rootNode
		cloned.rootFunc = p2.rootFunc
		cloned.rootNodeName = p2.rootNodeName
	end
	if p1.isClientView then
		t.client = cloned
	else
		t.server = cloned
	end
	return immutableModule.JoinDictionaries(p1, t)
end