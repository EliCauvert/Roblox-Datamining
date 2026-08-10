local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local components = script.Parent.Parent.Components
local logDataModule = require(components.Log.LogData)
local clientMemoryDataModule = require(components.Memory.ClientMemoryData)
local serverMemoryDataModule = require(components.Memory.ServerMemoryData)
local networkDataModule = require(components.Network.NetworkData)
local serverScriptsDataModule = require(components.Scripts.ServerScriptsData)
local dataStoresDataModule = require(components.DataStores.DataStoresData)
local serverStatsDataModule = require(components.ServerStats.ServerStatsData)
local actionBindingsDataModule = require(components.ActionBindings.ActionBindingsData)
local serverJobsDataModule = require(components.ServerJobs.ServerJobsData)
local debugVisualizationsDataModule = require(components.DebugVisualizations.DebugVisualizationsData)
local luauHeapDataModule = require(components.LuauHeap.LuauHeapData)
local voiceChatDataModule = require(components.VoiceChat.VoiceChatData)
local dataContextModule = require(components.DataContext)
local dataProvider = roactModule.Component:extend("DataProvider")
local voiceChatDevConsoleTabEnabledEngineFeature = game:GetEngineFeature("VoiceChatDevConsoleTabEnabled")
local devConsoleStartDataOnMount = game:DefineFastFlag("DevConsoleStartDataOnMount", false)

function dataProvider.init(p0) --[[ line: 26 ]]
	-- upvalues: logDataModule (ref), clientMemoryDataModule (ref), serverMemoryDataModule (ref), networkDataModule (ref), serverScriptsDataModule (ref), dataStoresDataModule (ref), serverStatsDataModule (ref), actionBindingsDataModule (ref), serverJobsDataModule (ref), debugVisualizationsDataModule (ref), luauHeapDataModule (ref), voiceChatDevConsoleTabEnabledEngineFeature (ref), voiceChatDataModule (ref)
	p0:setState({
		DevConsoleData = {
			ClientLogData = logDataModule.new(true),
			ServerLogData = logDataModule.new(false),
			ClientMemoryData = clientMemoryDataModule.new(),
			ServerMemoryData = serverMemoryDataModule.new(),
			ClientNetworkData = networkDataModule.new(true),
			ServerNetworkData = networkDataModule.new(false),
			ServerScriptsData = serverScriptsDataModule.new(),
			DataStoresData = dataStoresDataModule.new(),
			ServerStatsData = serverStatsDataModule.new(),
			ActionBindingsData = actionBindingsDataModule.new(),
			ServerJobsData = serverJobsDataModule.new(),
			DebugVisualizationsData = debugVisualizationsDataModule.new(),
			LuauHeapData = luauHeapDataModule.new(),
			VoiceChatData = if voiceChatDevConsoleTabEnabledEngineFeature then voiceChatDataModule.new() else nil
		}
	})
end

function dataProvider.didMount(p1) --[[ line: 47 ]]
	-- upvalues: voiceChatDevConsoleTabEnabledEngineFeature (ref), devConsoleStartDataOnMount (ref)
	p1.state.DevConsoleData.ClientLogData:start()
	p1.state.DevConsoleData.ClientMemoryData:start()
	
	if voiceChatDevConsoleTabEnabledEngineFeature then
		p1.state.DevConsoleData.VoiceChatData:start()
	end
	if devConsoleStartDataOnMount and p1.props.isDeveloperView then
		for i, v in pairs(p1.state.DevConsoleData) do
			if not v:isRunning() then
				v:start()
			end
		end
	end
end

function dataProvider.willUpdate(p2, p3, _) --[[ line: 64 ]]
	if p3.isDeveloperView and not p2.props.isDeveloperView then
		for i, v in pairs(p2.state.DevConsoleData) do
			if not v:isRunning() then
				v:start()
			end
		end
	end
end

function dataProvider.render(p4) --[[ line: 74 ]]
	-- upvalues: roactModule (ref), dataContextModule (ref)
	return roactModule.createElement(dataContextModule.Provider, { value = p4.state.DevConsoleData }, roactModule.oneChild(p4.props[roactModule.Children]))
end

return roactRoduxModule.UNSTABLE_connect2(function(p5, _) --[[ line: 80 | named "mapStateToProps" ]]
	return { isDeveloperView = p5.MainView.isDeveloperView }
end, nil)(dataProvider)