local coreGuiService = game:GetService("CoreGui")
local starterGuiService = game:GetService("StarterGui")
local userInputService = game:GetService("UserInputService")
local corePackagesService = game:GetService("CorePackages")
local playersService = game:GetService("Players")
local roactModule = require(corePackagesService.Packages.Roact)
local roduxModule = require(corePackagesService.Packages.Rodux)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local devConsole = script.Parent.DevConsole
local constantsModule = require(devConsole.Constants)
local components = devConsole.Components
local devConsoleWindowModule = require(components.DevConsoleWindow)
local dataProviderModule = require(components.DataProvider)
local mainViewLogModule = require(components.Log.MainViewLog)
local mainViewMemoryModule = require(components.Memory.MainViewMemory)
local mainViewNetworkModule = require(components.Network.MainViewNetwork)
local mainViewScriptsModule = require(components.Scripts.MainViewScripts)
local mainViewDataStoresModule = require(components.DataStores.MainViewDataStores)
local mainViewServerStatsModule = require(components.ServerStats.MainViewServerStats)
local mainViewActionBindingsModule = require(components.ActionBindings.MainViewActionBindings)
local mainViewServerJobsModule = require(components.ServerJobs.MainViewServerJobs)
local mainViewMicroProfilerModule = require(components.MicroProfiler.MainViewMicroProfiler)
local mainViewScriptProfilerModule = require(components.ScriptProfiler.MainViewScriptProfiler)
local mainViewDebugVisualizationsModule = require(components.DebugVisualizations.MainViewDebugVisualizations)
local mainViewLuauHeapModule = require(components.LuauHeap.MainViewLuauHeap)
local mainViewVoiceChatModule = require(components.VoiceChat.MainViewVoiceChat)
local mainViewRequestOrchestratorModule = require(components.RequestOrchestrator.MainViewRequestOrchestrator)
local RCCProfilerDataCompleteListenerModule = require(components.MicroProfiler.RCCProfilerDataCompleteListener)
local getClientReplicatorModule = require(devConsole.Util.getClientReplicator)
local mainViewModule = require(devConsole.Reducers.MainView)
local devConsoleReducerModule = require(devConsole.Reducers.DevConsoleReducer)
local actions = devConsole.Actions
local setDevConsoleVisibilityModule = require(actions.SetDevConsoleVisibility)
local setTabListModule = require(actions.SetTabList)
local devConsoleAnalyticsModule = require(devConsole.MiddleWare.DevConsoleAnalytics)
local playerPermissionsModule = require(coreGuiService.RobloxGui.Modules.PlayerPermissionsModule)
local scriptProfilerEngineFeature = game:GetEngineFeature("ScriptProfiler")
local devConsoleRequestOrchestratorTab2 = game:DefineFastFlag("DevConsoleRequestOrchestratorTab2", false)
local devConsoleAdminSeesDevTabs = game:DefineFastFlag("DevConsoleAdminSeesDevTabs", false)
local default = require(coreGuiService.RobloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local t = {
	Log = {
		layoutOrder = 1,
		hasClientServer = true,
		tab = mainViewLogModule
	},
	Memory = {
		layoutOrder = 2,
		hasClientServer = true,
		tab = mainViewMemoryModule
	},
	Network = {
		layoutOrder = 3,
		hasClientServer = true,
		tab = mainViewNetworkModule
	},
	Scripts = { layoutOrder = 4, tab = mainViewScriptsModule },
	DataStores = { layoutOrder = 5, tab = mainViewDataStoresModule },
	ServerStats = { layoutOrder = 6, tab = mainViewServerStatsModule },
	ActionBindings = { layoutOrder = 7, tab = mainViewActionBindingsModule },
	ServerJobs = { layoutOrder = 8, tab = mainViewServerJobsModule },
	MicroProfiler = { layoutOrder = 9, tab = mainViewMicroProfilerModule },
	DebugVisualizations = {
		layoutOrder = 10,
		tab = mainViewDebugVisualizationsModule
	},
	ScriptProfiler = if scriptProfilerEngineFeature then { layoutOrder = 11, tab = mainViewScriptProfilerModule } else nil,
	LuauHeap = { layoutOrder = 12, tab = mainViewLuauHeapModule }
}
local t_1 = {
	Log = { layoutOrder = 1, tab = mainViewLogModule },
	Memory = { layoutOrder = 2, tab = mainViewMemoryModule },
	ScriptProfiler = if scriptProfilerEngineFeature then { layoutOrder = 3, tab = mainViewScriptProfilerModule } else nil,
	LuauHeap = { layoutOrder = 4, tab = mainViewLuauHeapModule },
	VoiceChat = if game:GetEngineFeature("VoiceChatDevConsoleTabEnabled") and default and default:canUseService() then { layoutOrder = 5, tab = mainViewVoiceChatModule } else nil
}
local t_2 = {
	Log = { layoutOrder = 1, tab = mainViewLogModule },
	Memory = { layoutOrder = 2, tab = mainViewMemoryModule }
}
local t_3 = {
	VoiceChat = {
		layoutOrder = 13,
		tab = mainViewVoiceChatModule,
		isEnabled = function() --[[ line: 159 ]]
			-- upvalues: default (ref)
			return game:GetEngineFeature("VoiceChatDevConsoleTabEnabled") and (default ~= nil and default:canUseService())
		end
	},
	RequestOrchestrator = {
		layoutOrder = 100,
		tab = mainViewRequestOrchestratorModule,
		isEnabled = function() --[[ line: 168 ]]
			-- upvalues: devConsoleRequestOrchestratorTab2 (ref)
			return devConsoleRequestOrchestratorTab2
		end
	}
}
local t_4 = {}
t_4.__index = t_4
local t_5 = {
	[Enum.Platform.Windows] = constantsModule.FormFactor.Large,
	[Enum.Platform.OSX] = constantsModule.FormFactor.Large,
	[Enum.Platform.IOS] = constantsModule.FormFactor.Small,
	[Enum.Platform.Android] = constantsModule.FormFactor.Small,
	[Enum.Platform.XBoxOne] = constantsModule.FormFactor.Console,
	[Enum.Platform.PS4] = constantsModule.FormFactor.Console,
	[Enum.Platform.PS3] = constantsModule.FormFactor.Console,
	[Enum.Platform.XBox360] = constantsModule.FormFactor.Console,
	[Enum.Platform.WiiU] = constantsModule.FormFactor.Console,
	[Enum.Platform.NX] = constantsModule.FormFactor.Console,
	[Enum.Platform.Ouya] = constantsModule.FormFactor.Console,
	[Enum.Platform.AndroidTV] = constantsModule.FormFactor.Console,
	[Enum.Platform.Chromecast] = constantsModule.FormFactor.Console,
	[Enum.Platform.Linux] = constantsModule.FormFactor.Large,
	[Enum.Platform.SteamOS] = constantsModule.FormFactor.Console,
	[Enum.Platform.WebOS] = constantsModule.FormFactor.Large,
	[Enum.Platform.DOS] = constantsModule.FormFactor.Large,
	[Enum.Platform.BeOS] = constantsModule.FormFactor.Large,
	[Enum.Platform.UWP] = constantsModule.FormFactor.Large,
	[Enum.Platform.None] = constantsModule.FormFactor.Large
}

local function _() --[[ line: 200 | named "isAdminAsync" ]]
	-- upvalues: playerPermissionsModule (ref), playersService (ref)
	return playerPermissionsModule.IsPlayerAdminAsync(playersService.LocalPlayer)
end

local function getAdminTabList() --[[ line: 207 ]]
	-- upvalues: t (ref), t_3 (ref)
	local cloned = table.clone(t)
	
	for i, v in pairs(t_3) do
		if v.isEnabled == nil or v.isEnabled() then
			cloned[i] = { tab = v.tab, layoutOrder = v.layoutOrder }
		end
	end
	return cloned
end

function t_4.new() --[[ line: 222 ]]
	-- upvalues: t_4 (ref)
	local t = {}
	setmetatable(t, t_4)
	t.init = false
	t.isDeveloperTabListActive = false
	t.isEmployee = false
	t.waitForStart = true
	t.waitForStartBindable = Instance.new("BindableEvent")
	coroutine.wrap(function() --[[ line: 233 ]]
		-- upvalues: t (ref)
		t:SetupDevConsole()
	end)()
	
	return t
end

function t_4:SetupDevConsole() --[[ line: 240 ]]
	-- upvalues: userInputService (ref), t_5 (ref), mainViewModule (ref), setTabListModule (ref), t_2 (ref), devConsoleAnalyticsModule (ref), roduxModule (ref), devConsoleReducerModule (ref), roactModule (ref), roactRoduxModule (ref), dataProviderModule (ref), devConsoleWindowModule (ref), constantsModule (ref), RCCProfilerDataCompleteListenerModule (ref)
	local var46 = t_5[userInputService:GetPlatform()]
	self.store = roduxModule.Store.new(devConsoleReducerModule, {
		MainView = mainViewModule(nil, setTabListModule(t_2, "Log"))
	}, { devConsoleAnalyticsModule })
	self.root = roactModule.createElement(roactRoduxModule.StoreProvider, { store = self.store }, {
		DataProvider = roactModule.createElement(dataProviderModule, { isDeveloperView = false }, {
			App = roactModule.createElement("ScreenGui", { OnTopOfCoreBlur = true, DisplayOrder = 10 }, {
				DevConsoleWindow = roactModule.createElement(devConsoleWindowModule, {
					isDeveloperView = false,
					isMinimized = false,
					formFactor = var46,
					isVisible = self.store:getState().DisplayOptions.isVisible,
					position = constantsModule.MainWindowInit.Position,
					size = constantsModule.MainWindowInit.Size,
					tabList = t_2,
					onCloseCallback = function(p0) --[[ line: 275 ]]
						-- upvalues: self (ref)
						self:SetServerStatsConnection(p0)
					end
				}),
				RCCProfilerDataCompleteListener = roactModule.createElement(RCCProfilerDataCompleteListenerModule)
			})
		})
	})
	self.waitForStart = false
	self.waitForStartBindable:Fire()
end

local var43 = t_4.new()

function t_4:refreshTabList() --[[ line: 294 ]]
	-- upvalues: setTabListModule (ref), getAdminTabList (ref), t (ref)
	if self.isEmployee then
		self.store:dispatch(setTabListModule(getAdminTabList(), "Log", true))
		
		return
	elseif self.isDeveloperTabListActive then
		self.store:dispatch(setTabListModule(t, "Log", true))
	end
end

function t_4:Start() --[[ line: 302 ]]
	-- upvalues: roactModule (ref), coreGuiService (ref), getClientReplicatorModule (ref), devConsoleAdminSeesDevTabs (ref), playerPermissionsModule (ref), playersService (ref), setTabListModule (ref), t_1 (ref), t (ref)
	if not self.init then
		if self.waitForStart then
			self.waitForStartBindable.Event:Wait()
		end
		self.init = true
		self.element = roactModule.mount(self.root, coreGuiService, "DevConsoleMaster")
		local var47 = getClientReplicatorModule()
		task.spawn(function() --[[ line: 312 ]]
			-- upvalues: devConsoleAdminSeesDevTabs (copy), playerPermissionsModule (copy), playersService (copy), self (ref), setTabListModule (copy), t_1 (copy)
			if devConsoleAdminSeesDevTabs then
				if playerPermissionsModule.IsPlayerAdminAsync(playersService.LocalPlayer) then
					self.isEmployee = true
					self:refreshTabList()
					
					return
				end
			elseif playerPermissionsModule.IsPlayerAdminAsync(playersService.LocalPlayer) and not self.isDeveloperTabListActive then
				self.store:dispatch(setTabListModule(t_1, "Log", false))
			end
		end)
		
		if var47 then
			self._statsConnector = var47.StatsReceived:connect(function(_) --[[ line: 327 ]]
				-- upvalues: self (ref), devConsoleAdminSeesDevTabs (copy), setTabListModule (copy), t (copy)
				if not self._statsConnector then return end
				self._statsConnector:Disconnect()
				self._statsConnector = nil
				self.isDeveloperTabListActive = true
				
				if devConsoleAdminSeesDevTabs then
					self:refreshTabList()
					
					return
				end
				self.store:dispatch(setTabListModule(t, "Log", true))
			end)
			self:SetServerStatsConnection(true)
		end
	end
end

function t_4:ToggleVisibility() --[[ line: 348 ]]
	-- upvalues: var43 (ref)
	if not self.init then
		var43:Start()
	end
	self:SetVisibility(not self.store:getState().DisplayOptions.isVisible)
end

function t_4:GetVisibility() --[[ line: 357 ]]
	if not self.init then
		return false
	end
	local state = self.store:getState()
	
	return if state and state.DisplayOptions then state.DisplayOptions.isVisible and not state.DisplayOptions.isMinimized else false
end

function t_4.SetServerStatsConnection(_, p1) --[[ line: 372 ]]
	-- upvalues: getClientReplicatorModule (ref)
	local var49 = getClientReplicatorModule()
	
	if var49 then
		var49:RequestServerStats(p1)
	end
end

function t_4:SetVisibility(p2) --[[ line: 379 ]]
	-- upvalues: var43 (ref), setDevConsoleVisibilityModule (ref)
	if type(p2) == "boolean" then
		if not self.init and p2 then
			var43:Start()
		end
		self:SetServerStatsConnection(p2)
		self.store:dispatch(setDevConsoleVisibilityModule(p2))
	end
end

starterGuiService:RegisterGetCore("DevConsoleVisible", function() --[[ line: 391 ]]
	-- upvalues: var43 (ref)
	return var43:GetVisibility()
end)
starterGuiService:RegisterSetCore("DevConsoleVisible", function(p3) --[[ line: 395 ]]
	-- upvalues: var43 (ref)
	if type(p3) ~= "boolean" then
		error("DevConsoleVisible must be given a boolean value.")
	end
	var43:SetVisibility(p3)
end)

return var43