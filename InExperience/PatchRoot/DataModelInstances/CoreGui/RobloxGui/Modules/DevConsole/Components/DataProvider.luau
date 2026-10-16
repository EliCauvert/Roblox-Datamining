local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local Components = script.Parent.Parent.Components
local LogDataModule = require(Components.Log.LogData)
local ClientMemoryDataModule = require(Components.Memory.ClientMemoryData)
local ServerMemoryDataModule = require(Components.Memory.ServerMemoryData)
local NetworkDataModule = require(Components.Network.NetworkData)
local ServerScriptsDataModule = require(Components.Scripts.ServerScriptsData)
local DataStoresDataModule = require(Components.DataStores.DataStoresData)
local ServerStatsDataModule = require(Components.ServerStats.ServerStatsData)
local ActionBindingsDataModule = require(Components.ActionBindings.ActionBindingsData)
local ServerJobsDataModule = require(Components.ServerJobs.ServerJobsData)
local DebugVisualizationsDataModule = require(Components.DebugVisualizations.DebugVisualizationsData)
local LuauHeapDataModule = require(Components.LuauHeap.LuauHeapData)
local VoiceChatDataModule = require(Components.VoiceChat.VoiceChatData)
local VoiceDebugDataModule = require(Components.VoiceDebug.VoiceDebugData)
local GetFFlagVoiceDebugConsoleV2Module = require(Components.VoiceDebug.GetFFlagVoiceDebugConsoleV2)
local DataContextModule = require(Components.DataContext)
local DataProvider = RoactModule.Component:extend("DataProvider")
local VoiceChatDevConsoleTabEnabledEngineFeature = game:GetEngineFeature("VoiceChatDevConsoleTabEnabled")
local DevConsoleStartDataOnMount = game:DefineFastFlag("DevConsoleStartDataOnMount", false)

function DataProvider.init(p1) --[[ Line: 28 ]]
	-- upvalues: LogDataModule (copy), ClientMemoryDataModule (copy), ServerMemoryDataModule (copy), NetworkDataModule (copy), ServerScriptsDataModule (copy), DataStoresDataModule (copy), ServerStatsDataModule (copy), ActionBindingsDataModule (copy), ServerJobsDataModule (copy), DebugVisualizationsDataModule (copy), LuauHeapDataModule (copy), VoiceChatDevConsoleTabEnabledEngineFeature (copy), GetFFlagVoiceDebugConsoleV2Module (copy), VoiceChatDataModule (copy), VoiceDebugDataModule (copy)
	p1:setState({
		DevConsoleData = {
			ClientLogData = LogDataModule.new(true),
			ServerLogData = LogDataModule.new(false),
			ClientMemoryData = ClientMemoryDataModule.new(),
			ServerMemoryData = ServerMemoryDataModule.new(),
			ClientNetworkData = NetworkDataModule.new(true),
			ServerNetworkData = NetworkDataModule.new(false),
			ServerScriptsData = ServerScriptsDataModule.new(),
			DataStoresData = DataStoresDataModule.new(),
			ServerStatsData = ServerStatsDataModule.new(),
			ActionBindingsData = ActionBindingsDataModule.new(),
			ServerJobsData = ServerJobsDataModule.new(),
			DebugVisualizationsData = DebugVisualizationsDataModule.new(),
			LuauHeapData = LuauHeapDataModule.new(),
			VoiceChatData = if VoiceChatDevConsoleTabEnabledEngineFeature and not GetFFlagVoiceDebugConsoleV2Module() then VoiceChatDataModule.new() else nil,
			VoiceDebugData = if VoiceChatDevConsoleTabEnabledEngineFeature and GetFFlagVoiceDebugConsoleV2Module() then VoiceDebugDataModule.new() else nil
		}
	})
end

function DataProvider.didMount(p1) --[[ Line: 54 ]]
	-- upvalues: VoiceChatDevConsoleTabEnabledEngineFeature (copy), GetFFlagVoiceDebugConsoleV2Module (copy), DevConsoleStartDataOnMount (copy)
	p1.state.DevConsoleData.ClientLogData:start()
	p1.state.DevConsoleData.ClientMemoryData:start()
	
	if VoiceChatDevConsoleTabEnabledEngineFeature then
		if GetFFlagVoiceDebugConsoleV2Module() then
			p1.state.DevConsoleData.VoiceDebugData:start()
		else
			p1.state.DevConsoleData.VoiceChatData:start()
		end
	end
	if DevConsoleStartDataOnMount and p1.props.isDeveloperView then
		for _, value in pairs(p1.state.DevConsoleData) do
			if not value:isRunning() then
				value:start()
			end
		end
	end
end

function DataProvider.willUpdate(p2, p3, _) --[[ Line: 75 ]]
	if p3.isDeveloperView and not p2.props.isDeveloperView then
		for _, value in pairs(p2.state.DevConsoleData) do
			if not value:isRunning() then
				value:start()
			end
		end
	end
end

function DataProvider.render(p4) --[[ Line: 85 ]]
	-- upvalues: RoactModule (copy), DataContextModule (copy)
	return RoactModule.createElement(DataContextModule.Provider, { value = p4.state.DevConsoleData }, RoactModule.oneChild(p4.props[RoactModule.Children]))
end

return RoactRoduxModule.UNSTABLE_connect2(function(p4, _) --[[ Line: 91 | Named "mapStateToProps" ]]
	return { isDeveloperView = p4.MainView.isDeveloperView }
end, nil)(DataProvider)