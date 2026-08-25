local parent = script.Parent
local devConsoleDisplayOptionsModule = require(parent.DevConsoleDisplayOptions)
local mainViewModule = require(parent.MainView)
local memoryDataModule = require(parent.MemoryData)
local networkDataModule = require(parent.NetworkData)
local scriptsDataModule = require(parent.ScriptsData)
local dataStoresDataModule = require(parent.DataStoresData)
local serverStatsDataModule = require(parent.ServerStatsData)
local serverJobsDataModule = require(parent.ServerJobsData)
local actionBindingsDataModule = require(parent.ActionBindingsData)
local microProfilerModule = require(parent.MicroProfiler)
local debugVisualizationsDataModule = require(parent.DebugVisualizationsData)
local scriptProfilerModule = require(parent.ScriptProfiler)
local luauHeapModule = require(parent.LuauHeap)

return function(p0, p1)
	-- upvalues: devConsoleDisplayOptionsModule (ref), mainViewModule (ref), memoryDataModule (ref), networkDataModule (ref), scriptsDataModule (ref), dataStoresDataModule (ref), serverStatsDataModule (ref), serverJobsDataModule (ref), actionBindingsDataModule (ref), microProfilerModule (ref), debugVisualizationsDataModule (ref), scriptProfilerModule (ref), luauHeapModule (ref)
	p0 = p0 or {}
	
	return {
		DisplayOptions = devConsoleDisplayOptionsModule(p0.DisplayOptions, p1),
		MainView = mainViewModule(p0.MainView, p1),
		MemoryData = memoryDataModule(p0.MemoryData, p1),
		NetworkData = networkDataModule(p0.NetworkData, p1),
		ScriptsData = scriptsDataModule(p0.ScriptsData, p1),
		DataStoresData = dataStoresDataModule(p0.DataStoresData, p1),
		ServerStatsData = serverStatsDataModule(p0.ServerStatsData, p1),
		ServerJobsData = serverJobsDataModule(p0.ServerJobsData, p1),
		ActionBindingsData = actionBindingsDataModule(p0.ActionBindingsData, p1),
		MicroProfiler = microProfilerModule(p0.MicroProfiler, p1),
		DebugVisualizationsData = debugVisualizationsDataModule(p0.DebugVisualizationsData, p1),
		ScriptProfiler = scriptProfilerModule(p0.ScriptProfiler, p1),
		LuauHeap = luauHeapModule(p0.LuauHeap, p1)
	}
end