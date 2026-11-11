local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local HttpService = game:GetService("HttpService")
local MemStorageService = game:GetService("MemStorageService")
local RunService = game:GetService("RunService")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local ScreenTimeModule = require(CorePackages.Workspace.Packages.ScreenTime)
local HttpRequests = ScreenTimeModule.HttpRequests
local Constants = ScreenTimeModule.Constants
local GetFFlagScreenTimeSignalRFunction = ScreenTimeModule.GetFFlagScreenTimeSignalR
local Utils = ScreenTimeModule.Utils
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local Modules = CoreGui.RobloxGui.Modules
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local AppGuiService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppGuiService
local NotificationTypeModule = require(Modules.LuaApp.Enum.NotificationType)
local AntiAddictionPromptModule = require(Modules.LuaApp.Components.AntiAddictionPrompt)
local LogoutModule = require(Modules.LuaApp.Thunks.Authentication.Logout)
local LuaLogoutReasonNamesModule = require(Modules.LuaApp.Analytics.Events.Auth.luaLogoutReasonNames)
local ScreenGuiWithBlurControlModule = require(Modules.LuaApp.Components.ScreenGuiWithBlurControl)
local Toast = require(CorePackages.Packages.UIBlox).App.Dialog.Toast
local ConstantsModule = require(Modules.LuaApp.Constants)
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local ScreenTimeEventReceiver = RoactModule.Component:extend("ScreenTimeEventReceiver")

function ScreenTimeEventReceiver.showScreenTimeHeartbeatConsecutiveFailurePrompt(p1)
	p1:setState({ heartbeatConsecutiveFailure = true })
end

function ScreenTimeEventReceiver.init(p1)
	-- upvalues: HttpRequests (copy), HttpService (copy), Utils (copy), MemStorageService (copy), RunService (copy), Logging (copy), GetFFlagScreenTimeSignalRFunction (copy), Constants (copy), RbxAnalyticsService (copy), NotificationTypeModule (copy)
	local RobloxEventReceiver = p1.props.RobloxEventReceiver
	p1:setState({
		promptsCount = 0,
		promptsIndex = 0,
		heartbeatConsecutiveFailure = false,
		prompts = {}
	})
	
	function p1.setScreenTimePrompts(List)
		-- upvalues: p1 (copy)
		local Prompts = {}
		
		for _, value in ipairs(List) do
			table.insert(Prompts, {
				type = value.type,
				instructionName = value.instructionName,
				id = value.serialId,
				title = value.title,
				text = value.message,
				url = value.url,
				modalType = value.modalType
			})
		end
		p1:setState({
			promptsIndex = 1,
			promptsCount = #Prompts,
			prompts = Prompts
		})
	end
	
	p1.screenTimeHttpRequests = HttpRequests:new(HttpService)
	p1.screenTimeUtils = Utils:new({
		globalGetter = function(Key)
			-- upvalues: MemStorageService (upval)
			return MemStorageService:GetItem(Key)
		end,
		globalSetter = function(Key, Value)
			-- upvalues: MemStorageService (upval)
			MemStorageService:SetItem(Key, Value)
		end
	})
	
	function p1.processInstructions(List)
		-- upvalues: p1 (copy), RunService (upval)
		local List1 = {}
		
		for _, value in ipairs(List) do
			if value.type == 2 then
				p1.screenTimeUtils:setLockedOut()
			end
			if value.type ~= 1 or RunService:IsRunning() then
				table.insert(List1, value)
			end
		end
		p1.setScreenTimePrompts(List1)
	end
	
	function p1.requestInstructions()
		-- upvalues: p1 (copy), Logging (upval)
		p1.screenTimeHttpRequests:getInstructions(function(p2, p3, p4)
			-- upvalues: p1 (upval), Logging (upval)
			if p2 then
				p1.processInstructions(p4)
				
				return
			end
			if p3 then
				Logging.warn("ScreenTimeEventReceiver requestInstructions failed: unauthorized")
				p1.props.doLogout(p1.props.networking, p1.props.guiService)
				
				return
			else
				Logging.warn("ScreenTimeEventReceiver requestInstructions failed: error")
			end
		end)
	end
	
	p1.tokens = {}
	
	if GetFFlagScreenTimeSignalRFunction() then
		table.insert(p1.tokens, (RobloxEventReceiver:observeEvent(Constants.SIGNALR_NAMESPACE, function(_, SIGNALRTYPENEWINSTRUCTION)
			-- upvalues: Constants (upval), p1 (copy)
			if SIGNALRTYPENEWINSTRUCTION == Constants.SIGNALR_TYPE_NEW_INSTRUCTION then
				p1.requestInstructions()
			end
		end)))
	else
		table.insert(p1.tokens, (RobloxEventReceiver:observeEvent(Constants.HEARTBEAT_NOTIFICATIONS_NAMESPACE, function(p2, HEARTBEATCONSECUTIVEFAILURE)
			-- upvalues: Constants (upval), p1 (copy), Logging (upval)
			if HEARTBEATCONSECUTIVEFAILURE == Constants.HEARTBEAT_CONSECUTIVE_FAILURE then
				p1:showScreenTimeHeartbeatConsecutiveFailurePrompt()
				
				return
			end
			if p2.notifications == nil then
				Logging.warn("ScreenTimeEventReceiver empty heartbeat notifications")
				
				return
			end
			for _, notification in ipairs(p2.notifications) do
				if notification.type == Constants.HEARTBEAT_NOTIFICATION_TYPE_NEW_INSTRUCTION then
					p1.requestInstructions()
				end
			end
		end)))
	end
	function p1.ok()
		-- upvalues: p1 (copy)
		local PromptsIndex: number = p1.state.promptsIndex
		local Prompt = p1.state.prompts[PromptsIndex]
		p1.screenTimeHttpRequests:reportExecution(Prompt.instructionName, Prompt.id)
		
		if Prompt.type == 2 then return end
		if Prompt.type == 3 then
			p1.openWebView(Prompt.url)
		end
		local NewPromptsIndex = PromptsIndex + 1
		
		if p1.state.promptsCount < NewPromptsIndex then
			p1:setState({ promptsIndex = 0, promptsCount = 0 })
			
			return
		else
			p1:setState({ promptsIndex = NewPromptsIndex })
		end
	end
	
	function p1.toastDismissed()
		-- upvalues: p1 (copy)
		local PromptsIndex: number = p1.state.promptsIndex
		local Prompt = p1.state.prompts[PromptsIndex]
		p1.screenTimeHttpRequests:reportExecution(Prompt.instructionName, Prompt.id)
		local NewPromptsIndex = PromptsIndex + 1
		
		if p1.state.promptsCount < NewPromptsIndex then
			p1:setState({ promptsIndex = 0, promptsCount = 0 })
			
			return
		else
			p1:setState({ promptsIndex = NewPromptsIndex })
		end
	end
	
	function p1.heartbeatConsecutiveFailureLogoutCallback()
		-- upvalues: RbxAnalyticsService (upval)
		RbxAnalyticsService:ReportCounter("ScreenTime-LogoutAfterConsecutiveHeartbeatFailure-FromApp")
	end
	
	function p1.openWebView(Url)
		-- upvalues: p1 (copy), NotificationTypeModule (upval), HttpService (upval)
		p1.props.guiService:BroadcastNotification(HttpService:JSONEncode({ encodeUrl = false, type = "fullScreen", url = Url }), NotificationTypeModule.SDK_OPEN_URL)
	end
end

function ScreenTimeEventReceiver.render(p2)
	-- upvalues: RoactModule (copy), CoreGui (copy), ScreenGuiWithBlurControlModule (copy), ConstantsModule (copy), Toast (copy), AntiAddictionPromptModule (copy), WithLocalizationModule (copy)
	local Element = nil
	
	if p2.state.promptsCount > 0 then
		local Prompt = p2.state.prompts[p2.state.promptsIndex]
		local Type = Prompt.type
		local Id = Prompt.id or ""
		local Text = Prompt.text
		Element = if Prompt.modalType == 2 then RoactModule.createElement(RoactModule.Portal, { target = CoreGui }, {
			["prompt:" .. Id] = RoactModule.createElement(ScreenGuiWithBlurControlModule, {
				ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
				DisplayOrder = ConstantsModule.DisplayOrder.AntiAddictionPrompt
			}, {
				Toast = RoactModule.createElement(Toast, {
					duration = 5,
					toastContent = { toastTitle = Text, onDismissed = p2.toastDismissed }
				})
			})
		}) else RoactModule.createElement(RoactModule.Portal, { target = CoreGui }, {
			["prompt:" .. Id] = RoactModule.createElement(AntiAddictionPromptModule, {
				okCallback = p2.ok,
				logoutCallback = p2.ok,
				message = Text,
				lockOut = Type == 2
			})
		})
	end
	if p2.state.heartbeatConsecutiveFailure then
		Element = WithLocalizationModule({
			heartbeatConsecutiveFailureMessage = "Feature.Screentime.Description.HeartbeatConsecutiveFailure"
		})(function(p3)
			-- upvalues: RoactModule (upval), CoreGui (upval), AntiAddictionPromptModule (upval), p2 (copy)
			return RoactModule.createElement(RoactModule.Portal, { target = CoreGui }, {
				hearbeatFailurePrompt = RoactModule.createElement(AntiAddictionPromptModule, {
					lockOut = true,
					logoutCallback = p2.heartbeatConsecutiveFailureLogoutCallback,
					message = p3.heartbeatConsecutiveFailureMessage
				})
			})
		end)
	end
	return Element
end

function ScreenTimeEventReceiver.willUnmount(p2)
	for _, token in pairs(p2.tokens) do
		token:disconnect()
	end
end

return RoactServices.connect({
	networking = RoactNetworkingModule,
	guiService = AppGuiService
})((RoactRoduxModule.connect(nil, function(Callback)
	-- upvalues: LogoutModule (copy), LuaLogoutReasonNamesModule (copy)
	return {
		doLogout = function(p3, p4)
			-- upvalues: Callback (copy), LogoutModule (upval), LuaLogoutReasonNamesModule (upval)
			Callback(LogoutModule(p3, p4, LuaLogoutReasonNamesModule.ScreenTimeEvent))
		end
	}
end)(ScreenTimeEventReceiver)))