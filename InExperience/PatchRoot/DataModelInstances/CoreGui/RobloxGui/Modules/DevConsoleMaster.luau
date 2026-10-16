local CoreGui = game:GetService("CoreGui")
local StarterGui = game:GetService("StarterGui")
local UserInputService = game:GetService("UserInputService")
local CorePackages = game:GetService("CorePackages")
local Players = game:GetService("Players")
local RoactModule = require(CorePackages.Packages.Roact)
local RoduxModule = require(CorePackages.Packages.Rodux)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local DevConsole = script.Parent.DevConsole
local ConstantsModule = require(DevConsole.Constants)
local Components = DevConsole.Components
local DevConsoleWindowModule = require(Components.DevConsoleWindow)
local DataProviderModule = require(Components.DataProvider)
local MainViewLogModule = require(Components.Log.MainViewLog)
local MainViewMemoryModule = require(Components.Memory.MainViewMemory)
local MainViewScriptProfilerModule = require(Components.ScriptProfiler.MainViewScriptProfiler)
local MainViewLuauHeapModule = require(Components.LuauHeap.MainViewLuauHeap)
local MainViewVoiceChatModule = require(Components.VoiceChat.MainViewVoiceChat)
local MainViewVoiceDebugModule = require(Components.VoiceDebug.MainViewVoiceDebug)
local GetFFlagVoiceDebugConsoleV2Module = require(Components.VoiceDebug.GetFFlagVoiceDebugConsoleV2)
local RCCProfilerDataCompleteListenerModule = require(Components.MicroProfiler.RCCProfilerDataCompleteListener)
local GetClientReplicatorModule = require(DevConsole.Util.getClientReplicator)
local MainViewModule = require(DevConsole.Reducers.MainView)
local DevConsoleReducerModule = require(DevConsole.Reducers.DevConsoleReducer)
local Actions = DevConsole.Actions
local SetDevConsoleVisibilityModule = require(Actions.SetDevConsoleVisibility)
local SetTabListModule = require(Actions.SetTabList)
local DevConsoleAnalyticsModule = require(DevConsole.MiddleWare.DevConsoleAnalytics)
local PlayerPermissionsModule = require(CoreGui.RobloxGui.Modules.PlayerPermissionsModule)
local ScriptProfilerEngineFeature = game:GetEngineFeature("ScriptProfiler")
local DevConsoleRequestOrchestratorTab2 = game:DefineFastFlag("DevConsoleRequestOrchestratorTab2", false)
local DevConsoleAdminSeesDevTabs = game:DefineFastFlag("DevConsoleAdminSeesDevTabs", false)
local Default = require(CoreGui.RobloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local v1 = false
local config = {
	VoiceDebug = nil,
	Log = {
		layoutOrder = 1,
		hasClientServer = true,
		tab = MainViewLogModule
	},
	Memory = {
		layoutOrder = 2,
		hasClientServer = true,
		tab = MainViewMemoryModule
	},
	Network = {
		layoutOrder = 3,
		hasClientServer = true,
		tab = require(Components.Network.MainViewNetwork)
	},
	Scripts = {
		layoutOrder = 4,
		tab = require(Components.Scripts.MainViewScripts)
	},
	DataStores = {
		layoutOrder = 5,
		tab = require(Components.DataStores.MainViewDataStores)
	},
	ServerStats = {
		layoutOrder = 6,
		tab = require(Components.ServerStats.MainViewServerStats)
	},
	ActionBindings = {
		layoutOrder = 7,
		tab = require(Components.ActionBindings.MainViewActionBindings)
	},
	ServerJobs = {
		layoutOrder = 8,
		tab = require(Components.ServerJobs.MainViewServerJobs)
	},
	MicroProfiler = {
		layoutOrder = 9,
		tab = require(Components.MicroProfiler.MainViewMicroProfiler)
	},
	DebugVisualizations = {
		layoutOrder = 10,
		tab = require(Components.DebugVisualizations.MainViewDebugVisualizations)
	},
	ScriptProfiler = if ScriptProfilerEngineFeature then { layoutOrder = 11, tab = MainViewScriptProfilerModule } else nil,
	LuauHeap = { layoutOrder = 12, tab = MainViewLuauHeapModule }
}
local config1 = {
	Log = { layoutOrder = 1, tab = MainViewLogModule },
	Memory = { layoutOrder = 2, tab = MainViewMemoryModule },
	ScriptProfiler = if ScriptProfilerEngineFeature then { layoutOrder = 3, tab = MainViewScriptProfilerModule } else nil,
	LuauHeap = { layoutOrder = 4, tab = MainViewLuauHeapModule },
	VoiceChat = if GetFFlagVoiceDebugConsoleV2Module() or not game:GetEngineFeature("VoiceChatDevConsoleTabEnabled") or not Default or not Default:canUseService() then nil else { layoutOrder = 5, tab = MainViewVoiceChatModule }
}
local TabList = {
	Log = { layoutOrder = 1, tab = MainViewLogModule },
	Memory = { layoutOrder = 2, tab = MainViewMemoryModule }
}
local config2 = {
	VoiceChat = {
		layoutOrder = 13,
		tab = MainViewVoiceChatModule,
		isEnabled = function() --[[ Line: 172 ]]
			-- upvalues: GetFFlagVoiceDebugConsoleV2Module (copy), Default (copy)
			return not GetFFlagVoiceDebugConsoleV2Module() and (game:GetEngineFeature("VoiceChatDevConsoleTabEnabled") and (Default ~= nil and Default:canUseService()))
		end
	},
	RequestOrchestrator = {
		layoutOrder = 100,
		tab = require(Components.RequestOrchestrator.MainViewRequestOrchestrator),
		isEnabled = function() --[[ Line: 184 ]]
			-- upvalues: DevConsoleRequestOrchestratorTab2 (copy)
			return DevConsoleRequestOrchestratorTab2
		end
	}
}
local Module = {}
Module.__index = Module
local config3 = {
	[Enum.Platform.Windows] = ConstantsModule.FormFactor.Large,
	[Enum.Platform.OSX] = ConstantsModule.FormFactor.Large,
	[Enum.Platform.IOS] = ConstantsModule.FormFactor.Small,
	[Enum.Platform.Android] = ConstantsModule.FormFactor.Small,
	[Enum.Platform.XBoxOne] = ConstantsModule.FormFactor.Console,
	[Enum.Platform.PS4] = ConstantsModule.FormFactor.Console,
	[Enum.Platform.PS3] = ConstantsModule.FormFactor.Console,
	[Enum.Platform.XBox360] = ConstantsModule.FormFactor.Console,
	[Enum.Platform.WiiU] = ConstantsModule.FormFactor.Console,
	[Enum.Platform.NX] = ConstantsModule.FormFactor.Console,
	[Enum.Platform.Ouya] = ConstantsModule.FormFactor.Console,
	[Enum.Platform.AndroidTV] = ConstantsModule.FormFactor.Console,
	[Enum.Platform.Chromecast] = ConstantsModule.FormFactor.Console,
	[Enum.Platform.Linux] = ConstantsModule.FormFactor.Large,
	[Enum.Platform.SteamOS] = ConstantsModule.FormFactor.Console,
	[Enum.Platform.WebOS] = ConstantsModule.FormFactor.Large,
	[Enum.Platform.DOS] = ConstantsModule.FormFactor.Large,
	[Enum.Platform.BeOS] = ConstantsModule.FormFactor.Large,
	[Enum.Platform.UWP] = ConstantsModule.FormFactor.Large,
	[Enum.Platform.None] = ConstantsModule.FormFactor.Large
}

local function _() --[[ Line: 216 | Named "isAdminAsync" ]]
	-- upvalues: PlayerPermissionsModule (copy), Players (copy)
	return PlayerPermissionsModule.IsPlayerAdminAsync(Players.LocalPlayer)
end

local function getAdminTabList() --[[ Line: 223 ]]
	-- upvalues: config (copy), config2 (copy)
	local Copy = table.clone(config)
	
	for i, value in pairs(config2) do
		if value.isEnabled == nil or value.isEnabled() then
			Copy[i] = { tab = value.tab, layoutOrder = value.layoutOrder }
		end
	end
	return Copy
end

function Module.new() --[[ Line: 238 ]]
	-- upvalues: Module (copy)
	local t = {}
	setmetatable(t, Module)
	t.init = false
	t.isDeveloperTabListActive = false
	t.isEmployee = false
	t.waitForStart = true
	t.waitForStartBindable = Instance.new("BindableEvent")
	coroutine.wrap(function() --[[ Line: 249 ]]
		-- upvalues: t (copy)
		t:SetupDevConsole()
	end)()
	
	return t
end

function Module:SetupDevConsole() --[[ Line: 256 ]]
	-- upvalues: UserInputService (copy), config3 (copy), MainViewModule (copy), SetTabListModule (copy), TabList (copy), DevConsoleAnalyticsModule (copy), RoduxModule (copy), DevConsoleReducerModule (copy), RoactModule (copy), RoactRoduxModule (copy), DataProviderModule (copy), DevConsoleWindowModule (copy), ConstantsModule (copy), RCCProfilerDataCompleteListenerModule (copy)
	local Entry = config3[UserInputService:GetPlatform()]
	self.store = RoduxModule.Store.new(DevConsoleReducerModule, {
		MainView = MainViewModule(nil, SetTabListModule(TabList, "Log"))
	}, { DevConsoleAnalyticsModule })
	self.root = RoactModule.createElement(RoactRoduxModule.StoreProvider, { store = self.store }, {
		DataProvider = RoactModule.createElement(DataProviderModule, { isDeveloperView = false }, {
			App = RoactModule.createElement("ScreenGui", { OnTopOfCoreBlur = true, DisplayOrder = 10 }, {
				DevConsoleWindow = RoactModule.createElement(DevConsoleWindowModule, {
					isDeveloperView = false,
					isMinimized = false,
					formFactor = Entry,
					isVisible = self.store:getState().DisplayOptions.isVisible,
					position = ConstantsModule.MainWindowInit.Position,
					size = ConstantsModule.MainWindowInit.Size,
					tabList = TabList,
					onCloseCallback = function(p1) --[[ Line: 291 ]]
						-- upvalues: self (copy)
						self:SetServerStatsConnection(p1)
					end
				}),
				RCCProfilerDataCompleteListener = RoactModule.createElement(RCCProfilerDataCompleteListenerModule)
			})
		})
	})
	self.waitForStart = false
	self.waitForStartBindable:Fire()
end

local NewModule = Module.new()

function Module:refreshTabList() --[[ Line: 310 ]]
	-- upvalues: SetTabListModule (copy), getAdminTabList (copy), config (copy)
	if self.isEmployee then
		self.store:dispatch(SetTabListModule(getAdminTabList(), "Log", true))
		
		return
	end
	if self.isDeveloperTabListActive then
		self.store:dispatch(SetTabListModule(config, "Log", true))
	end
end

function Module.refreshVoiceDevConsoleAvailability(p1) --[[ Line: 318 ]]
	-- upvalues: GetFFlagVoiceDebugConsoleV2Module (copy), Default (copy), v1 (ref), config (copy), MainViewVoiceDebugModule (copy)
	if not GetFFlagVoiceDebugConsoleV2Module() then return end
	if game:GetEngineFeature("VoiceChatDevConsoleTabEnabled") and Default then
		local function apply() --[[ Line: 333 ]]
			-- upvalues: Default (upval), v1 (upval), config (upval), MainViewVoiceDebugModule (upval), p1 (copy)
			local VoiceChatAvailableResult = Default:VoiceChatAvailable()
			
			if VoiceChatAvailableResult ~= v1 then
				v1 = VoiceChatAvailableResult
				config.VoiceDebug = if v1 then { layoutOrder = 13, tab = MainViewVoiceDebugModule } else nil
				p1:refreshTabList()
				
				return
			end
		end
		
		Default:asyncInit():andThen(apply):catch(apply)
		
		return
	end
end

function Module:Start() --[[ Line: 353 ]]
	-- upvalues: RoactModule (copy), CoreGui (copy), GetClientReplicatorModule (copy), DevConsoleAdminSeesDevTabs (copy), PlayerPermissionsModule (copy), Players (copy), SetTabListModule (copy), config1 (copy), config (copy)
	if not self.init then
		if self.waitForStart then
			self.waitForStartBindable.Event:Wait()
		end
		self.init = true
		self.element = RoactModule.mount(self.root, CoreGui, "DevConsoleMaster")
		local ClientReplicatorModule = GetClientReplicatorModule()
		task.spawn(function() --[[ Line: 363 ]]
			-- upvalues: DevConsoleAdminSeesDevTabs (upval), PlayerPermissionsModule (upval), Players (upval), self (copy), SetTabListModule (upval), config1 (upval)
			if DevConsoleAdminSeesDevTabs then
				if PlayerPermissionsModule.IsPlayerAdminAsync(Players.LocalPlayer) then
					self.isEmployee = true
					self:refreshTabList()
					
					return
				end
			elseif PlayerPermissionsModule.IsPlayerAdminAsync(Players.LocalPlayer) and not self.isDeveloperTabListActive then
				self.store:dispatch(SetTabListModule(config1, "Log", false))
			end
		end)
		task.spawn(function() --[[ Line: 377 ]]
			-- upvalues: self (copy)
			self:refreshVoiceDevConsoleAvailability()
		end)
		
		if ClientReplicatorModule then
			self._statsConnector = ClientReplicatorModule.StatsReceived:connect(function(_) --[[ Line: 382 ]]
				-- upvalues: self (copy), DevConsoleAdminSeesDevTabs (upval), SetTabListModule (upval), config (upval)
				if not self._statsConnector then return end
				self._statsConnector:Disconnect()
				self._statsConnector = nil
				self.isDeveloperTabListActive = true
				
				if DevConsoleAdminSeesDevTabs then
					self:refreshTabList()
					
					return
				else
					self.store:dispatch(SetTabListModule(config, "Log", true))
				end
			end)
			self:SetServerStatsConnection(true)
		end
	end
end

function Module:ToggleVisibility() --[[ Line: 403 ]]
	-- upvalues: GetFFlagVoiceDebugConsoleV2Module (copy), NewModule (copy)
	if not self.init then
		if GetFFlagVoiceDebugConsoleV2Module() then
			self:Start()
		else
			NewModule:Start()
		end
	end
	self:SetVisibility(not self.store:getState().DisplayOptions.isVisible)
end

function Module:GetVisibility(): boolean --[[ Line: 416 ]]
	if self.init then
		local State = self.store:getState()
		
		return if State and State.DisplayOptions then State.DisplayOptions.isVisible and not State.DisplayOptions.isMinimized else false
	else
		return false
	end
end

function Module:SetServerStatsConnection(Request) --[[ Line: 431 ]]
	-- upvalues: GetClientReplicatorModule (copy)
	local ClientReplicatorModule = GetClientReplicatorModule()
	
	if ClientReplicatorModule then
		ClientReplicatorModule:RequestServerStats(Request)
	end
end

function Module:SetVisibility(NoIsVisible) --[[ Line: 438 ]]
	-- upvalues: GetFFlagVoiceDebugConsoleV2Module (copy), NewModule (copy), SetDevConsoleVisibilityModule (copy)
	if type(NoIsVisible) == "boolean" then
		if self.init or not NoIsVisible then
			if GetFFlagVoiceDebugConsoleV2Module() and NoIsVisible then
				self:refreshVoiceDevConsoleAvailability()
			end
		elseif GetFFlagVoiceDebugConsoleV2Module() then
			self:Start()
		else
			NewModule:Start()
		end
		self:SetServerStatsConnection(NoIsVisible)
		self.store:dispatch(SetDevConsoleVisibilityModule(NoIsVisible))
	end
end

StarterGui:RegisterGetCore("DevConsoleVisible", function() --[[ Line: 456 ]]
	-- upvalues: NewModule (copy)
	return NewModule:GetVisibility()
end)
StarterGui:RegisterSetCore("DevConsoleVisible", function(p1: boolean) --[[ Line: 460 ]]
	-- upvalues: NewModule (copy)
	if type(p1) ~= "boolean" then
		error("DevConsoleVisible must be given a boolean value.")
	end
	NewModule:SetVisibility(p1)
end)

if GetFFlagVoiceDebugConsoleV2Module() then
	NewModule.Klass = Module
end
return NewModule