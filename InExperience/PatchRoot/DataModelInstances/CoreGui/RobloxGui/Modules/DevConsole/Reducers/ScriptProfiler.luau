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

local function _(p0, p1)
	return if p0 then p1.client else p1.server
end

local function Update(p2, p3, p4)
	-- upvalues: immutableModule (ref)
	local var16 = immutableModule.JoinDictionaries(if p2 then p3.client else p3.server, p4)
	
	return immutableModule.JoinDictionaries(p3, {
		client = if p2 then var16 else nil,
		server = if p2 then nil else var16
	})
end

return function(p5, p6)
	-- upvalues: setScriptProfilerStateModule (ref), immutableModule (ref), setIsProfilingModule (ref), Update (ref), setAverageModule (ref), setFrequencyModule (ref), setDataViewModule (ref), setLiveUpdateModule (ref), setShowPluginsModule (ref), setShowGCModule (ref), setSearchDataModule (ref), setTimerStateModule (ref), setDataModule (ref), setThreadsModule (ref), clearStateForNewProfilingSessionModule (ref), setScriptProfilerRootModule (ref)
	p5 = p5 or {
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
	
	if p6.type == setScriptProfilerStateModule.name then
		return immutableModule.JoinDictionaries(p5, {
			isClientView = p6.isClientView,
			usePercentages = p6.usePercentages,
			isExporting = p6.isExporting,
			isShowingMobileSettings = p6.isShowingMobileSettings,
			client = p6.clientSessionState,
			server = p6.serverSessionState
		})
	elseif p6.type == setIsProfilingModule.name then
		return Update(p6.isClient, p5, { isProfiling = p6.isProfiling })
	elseif p6.type == setAverageModule.name then
		return Update(p6.isClient, p5, { average = p6.average })
	elseif p6.type == setFrequencyModule.name then
		return Update(p6.isClient, p5, { frequency = p6.frequency })
	elseif p6.type == setDataViewModule.name then
		return Update(p6.isClient, p5, { isFunctionsView = p6.isFunctionsView })
	elseif p6.type == setLiveUpdateModule.name then
		return Update(p6.isClient, p5, { liveUpdate = p6.liveUpdate })
	elseif p6.type == setShowPluginsModule.name then
		return Update(p6.isClient, p5, { showPlugins = p6.showPlugins })
	elseif p6.type == setShowGCModule.name then
		return Update(p6.isClient, p5, { showGC = p6.showGC })
	elseif p6.type == setSearchDataModule.name then
		return Update(p6.isClient, p5, {
			searchTerm = p6.state.searchTerm,
			searchFilterFlat = p6.state.searchFilterFlat,
			searchFilterGraph = p6.state.searchFilterGraph
		})
	elseif p6.type == setTimerStateModule.name then
		return Update(p6.isClient, p5, {
			timedProfilingDuration = p6.state.timedProfilingDuration,
			timedProfilingCountdown = p6.state.timedProfilingCountdown
		})
	elseif p6.type == setDataModule.name then
		local cloned = table.clone(if p6.isClient then p5.client else p5.server)
		cloned.data = p6.state.data
		cloned.serializedData = p6.state.serializedData
		cloned.pluginOffsets = p6.state.pluginOffsets or {}
		cloned.pluginGCOffsets = p6.state.pluginGCOffsets or {}
		cloned.gcFunctionOffsets = p6.state.gcFunctionOffsets or {}
		cloned.gcNodeOffsets = p6.state.gcNodeOffsets or {}
		cloned.expandedNodes = p6.state.expandedNodes or {}
		local cloned_1 = table.clone(p5)
		
		if p6.isClient then
			cloned_1.client = cloned
		else
			cloned_1.server = cloned
		end
		return immutableModule.JoinDictionaries(p5, cloned_1)
	elseif p6.type == setThreadsModule.name then
		local cloned = table.clone(if p6.isClient then p5.client else p5.server)
		cloned.timedProfilingThread = p6.state.timedProfilingThread
		cloned.timedProfilingTimerThread = p6.state.timedProfilingTimerThread
		cloned.liveUpdateThread = p6.state.liveUpdateThread
		local cloned_1 = table.clone(p5)
		
		if p6.isClient then
			cloned_1.client = cloned
		else
			cloned_1.server = cloned
		end
		return immutableModule.JoinDictionaries(p5, cloned_1)
	elseif p6.type == clearStateForNewProfilingSessionModule.name then
		local cloned = table.clone(if p6.isClient then p5.client else p5.server)
		cloned.rootNode = 0
		cloned.rootFunc = 0
		cloned.rootNodeName = nil
		cloned.searchFilterFlat = {}
		cloned.searchFilterGraph = {}
		cloned.expandedNodes = {}
		local cloned_1 = table.clone(p5)
		
		if p6.isClient then
			cloned_1.client = cloned
		else
			cloned_1.server = cloned
		end
		return immutableModule.JoinDictionaries(p5, cloned_1)
	elseif p6.type ~= setScriptProfilerRootModule.name then
		return p5
	end
	local t = {}
	local cloned = table.clone(if p5.isClientView then p5.client else p5.server)
	
	if cloned.rootNode == p6.rootNode then
		cloned.rootNode = 0
		cloned.rootFunc = 0
		cloned.rootNodeName = nil
	else
		cloned.rootNode = p6.rootNode
		cloned.rootFunc = p6.rootFunc
		cloned.rootNodeName = p6.rootNodeName
	end
	if p5.isClientView then
		t.client = cloned
	else
		t.server = cloned
	end
	return immutableModule.JoinDictionaries(p5, t)
end