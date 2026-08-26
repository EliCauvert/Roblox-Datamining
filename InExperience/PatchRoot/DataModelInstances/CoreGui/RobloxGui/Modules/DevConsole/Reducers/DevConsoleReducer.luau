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

return function(p1, p2)
	-- upvalues: devConsoleDisplayOptionsModule (ref), mainViewModule (ref), memoryDataModule (ref), networkDataModule (ref), scriptsDataModule (ref), dataStoresDataModule (ref), serverStatsDataModule (ref), serverJobsDataModule (ref), actionBindingsDataModule (ref), microProfilerModule (ref), debugVisualizationsDataModule (ref), scriptProfilerModule (ref), luauHeapModule (ref)
	p1 = p1 or {}
	
	return {
		DisplayOptions = devConsoleDisplayOptionsModule(p1.DisplayOptions, p2),
		MainView = mainViewModule(p1.MainView, p2),
		MemoryData = memoryDataModule(p1.MemoryData, p2),
		NetworkData = networkDataModule(p1.NetworkData, p2),
		ScriptsData = scriptsDataModule(p1.ScriptsData, p2),
		DataStoresData = dataStoresDataModule(p1.DataStoresData, p2),
		ServerStatsData = serverStatsDataModule(p1.ServerStatsData, p2),
		ServerJobsData = serverJobsDataModule(p1.ServerJobsData, p2),
		ActionBindingsData = actionBindingsDataModule(p1.ActionBindingsData, p2),
		MicroProfiler = microProfilerModule(p1.MicroProfiler, p2),
		DebugVisualizationsData = debugVisualizationsDataModule(p1.DebugVisualizationsData, p2),
		ScriptProfiler = scriptProfilerModule(p1.ScriptProfiler, p2),
		LuauHeap = luauHeapModule(p1.LuauHeap, p2)
	}
end