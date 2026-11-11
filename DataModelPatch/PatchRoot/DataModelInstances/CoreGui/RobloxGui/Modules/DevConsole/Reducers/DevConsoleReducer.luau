local Parent = script.Parent
local DevConsoleDisplayOptionsModule = require(Parent.DevConsoleDisplayOptions)
local MainViewModule = require(Parent.MainView)
local MemoryDataModule = require(Parent.MemoryData)
local NetworkDataModule = require(Parent.NetworkData)
local ScriptsDataModule = require(Parent.ScriptsData)
local DataStoresDataModule = require(Parent.DataStoresData)
local ServerStatsDataModule = require(Parent.ServerStatsData)
local ServerJobsDataModule = require(Parent.ServerJobsData)
local ActionBindingsDataModule = require(Parent.ActionBindingsData)
local MicroProfilerModule = require(Parent.MicroProfiler)
local DebugVisualizationsDataModule = require(Parent.DebugVisualizationsData)
local ScriptProfilerModule = require(Parent.ScriptProfiler)
local LuauHeapModule = require(Parent.LuauHeap)

return function(p1, p2)
	-- upvalues: DevConsoleDisplayOptionsModule (copy), MainViewModule (copy), MemoryDataModule (copy), NetworkDataModule (copy), ScriptsDataModule (copy), DataStoresDataModule (copy), ServerStatsDataModule (copy), ServerJobsDataModule (copy), ActionBindingsDataModule (copy), MicroProfilerModule (copy), DebugVisualizationsDataModule (copy), ScriptProfilerModule (copy), LuauHeapModule (copy)
	local P0 = p1 or {}
	
	return {
		DisplayOptions = DevConsoleDisplayOptionsModule(P0.DisplayOptions, p2),
		MainView = MainViewModule(P0.MainView, p2),
		MemoryData = MemoryDataModule(P0.MemoryData, p2),
		NetworkData = NetworkDataModule(P0.NetworkData, p2),
		ScriptsData = ScriptsDataModule(P0.ScriptsData, p2),
		DataStoresData = DataStoresDataModule(P0.DataStoresData, p2),
		ServerStatsData = ServerStatsDataModule(P0.ServerStatsData, p2),
		ServerJobsData = ServerJobsDataModule(P0.ServerJobsData, p2),
		ActionBindingsData = ActionBindingsDataModule(P0.ActionBindingsData, p2),
		MicroProfiler = MicroProfilerModule(P0.MicroProfiler, p2),
		DebugVisualizationsData = DebugVisualizationsDataModule(P0.DebugVisualizationsData, p2),
		ScriptProfiler = ScriptProfilerModule(P0.ScriptProfiler, p2),
		LuauHeap = LuauHeapModule(P0.LuauHeap, p2)
	}
end