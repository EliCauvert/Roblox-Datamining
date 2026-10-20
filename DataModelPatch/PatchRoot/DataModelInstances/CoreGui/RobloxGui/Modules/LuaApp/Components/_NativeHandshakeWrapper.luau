local HttpService = game:GetService("HttpService")
local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local TModule = require(CorePackages.Packages.t)
local WithStyleFunction = UIBloxModule.Style.withStyle
local LoadingAlert = UIBloxModule.App.Dialog.Alert.LoadingAlert
local ConstantsModule = require(Modules.LuaApp.Constants)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local AppGuiService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppGuiService
local AppRunService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppRunService
local AppNotificationService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppNotificationService
local TopBarModule = require(Modules.LuaApp.Components.TopBar.TopBar)
local ScreenGuiWithBlurControlModule = require(Modules.LuaApp.Components.ScreenGuiWithBlurControl)
local ExternalEventConnectionModule = require(Modules.Common.RoactUtilities.ExternalEventConnection)
local StateTableModule = require(Modules.LuaApp.StateTable)
local NewResult = require(CorePackages.Workspace.Packages.Loggers).Logger:new(script:GetFullName())
local AndroidTVExitButtonManager = require(CorePackages.Workspace.Packages.RobloxAppNavigationCore).AndroidTVExitButtonManager
local FFlagAndroidTVExitWithB = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAndroidTVExitWithB
local NativeHandshakeWrapper = RoactModule.PureComponent:extend("NativeHandshakeWrapper")
NativeHandshakeWrapper.validateProps = TModule.strictInterface({
	errorMessage = TModule.string,
	notificationData = TModule.string,
	notificationType = TModule.any,
	responseType = TModule.string,
	title = TModule.string,
	navigation = TModule.table,
	isVisible = TModule.optional(TModule.boolean),
	cancelTimeout = TModule.optional(TModule.number),
	dispatchTimeout = TModule.optional(TModule.number),
	DisplayOrder = TModule.optional(TModule.number),
	errorSubMessage = TModule.optional(TModule.string),
	responseNamespace = TModule.optional(TModule.string),
	responseCancelled = TModule.optional(TModule.string),
	responseFailure = TModule.optional(TModule.string),
	responseSuccess = TModule.optional(TModule.string),
	showBackButton = TModule.optional(TModule.boolean),
	navigateBack = TModule.callback,
	onError = TModule.callback,
	guiService = TModule.table,
	runService = TModule.table,
	appNotificationService = TModule.table
})
NativeHandshakeWrapper.defaultProps = {
	cancelTimeout = 1,
	dispatchTimeout = 5,
	DisplayOrder = 0,
	responseNamespace = "AppShellNotifications",
	responseCancelled = "cancelled",
	responseFailure = "failure",
	responseSuccess = "success",
	showBackButton = false
}
local config = {
	Theme = {
		Overlay = { Transparency = 0.5, Color = ConstantsModule.Color.GRAY1 }
	}
}

function NativeHandshakeWrapper.init(p1)
	-- upvalues: NewResult (copy), StateTableModule (copy), TopBarModule (copy), FFlagAndroidTVExitWithB (copy), AndroidTVExitButtonManager (copy)
	p1.state = { screenSize = Vector2.new() }
	p1.waitingTimeoutRunning = false
	p1.cancelTimeoutRunning = false
	
	function p1.stopTimers()
		-- upvalues: p1 (copy)
		p1.waitingTimeoutRunning = false
		p1.cancelTimeoutRunning = false
	end
	
	function p1.closeSelf()
		-- upvalues: p1 (copy)
		p1.stopTimers()
		p1:close()
	end
	
	function p1.closeWithError()
		-- upvalues: p1 (copy)
		if p1.props.onError then
			p1.props.onError(p1.props.errorMessage, p1.props.errorSubMessage)
		end
		p1.closeSelf()
	end
	
	function p1.broadcastNotification()
		-- upvalues: NewResult (upval), p1 (copy)
		NewResult:debug("Broadcasting NativeHandshakeWrapper notification")
		p1.startTime = tick()
		p1.waitingTimeoutRunning = true
		p1:_broadcast(false)
	end
	
	function p1.broadcastCancel()
		-- upvalues: NewResult (upval), p1 (copy)
		NewResult:debug("Broadcasting NativeHandshakeWrapper cancellation")
		p1.waitingTimeoutRunning = false
		p1.cancelTime = tick()
		p1.cancelTimeoutRunning = true
		p1:_broadcast(true)
	end
	
	p1.stateTable = StateTableModule.new("NativeHandshakeWrapper", "waiting", {}, {
		waiting = {
			successReceived = { nextState = "success", action = p1.stopTimers },
			failureReceived = { nextState = "halt", action = p1.closeWithError },
			cancelReceived = { nextState = "halt", action = p1.closeWithError },
			onTimeout = { nextState = "timed_out", action = p1.broadcastCancel },
			onCancel = { nextState = "cancelled", action = p1.broadcastCancel }
		},
		cancelled = {
			successReceived = { nextState = "success" },
			failureReceived = { nextState = "halt", action = p1.closeWithError },
			cancelReceived = { nextState = "halt", action = p1.closeSelf },
			onTimeout = { nextState = "halt", action = p1.closeWithError }
		},
		timed_out = {
			successReceived = { nextState = "success" },
			failureReceived = { nextState = "halt", action = p1.closeWithError },
			cancelReceived = { nextState = "halt", action = p1.closeWithError },
			onTimeout = { nextState = "halt", action = p1.closeWithError }
		},
		success = {
			focusReceived = { nextState = "halt", action = p1.closeSelf }
		},
		halt = {}
	})
	
	function p1.back()
		-- upvalues: p1 (copy)
		p1.stateTable.events.onCancel()
	end
	
	p1.backButton = TopBarModule.makeBackButton(p1.back, true)
	
	function p1.checkEvent(p2)
		-- upvalues: p1 (copy), NewResult (upval)
		if p2.namespace == p1.props.responseNamespace and p2.detailType == p1.props.responseType then
			NewResult:debug("Received message {}: {}", tostring(p2.detailType), (tostring(p2.detail)))
			
			if p2.detail == p1.props.responseSuccess then
				p1.stateTable.events.successReceived()
			elseif p2.detail == p1.props.responseFailure then
				p1.stateTable.events.failureReceived()
			elseif p2.detail == p1.props.responseCancelled then
				p1.stateTable.events.cancelReceived()
			end
		end
		if p2.namespace == "AppInput" and p2.detailType == "Focused" then
			NewResult:debug("Received app focused message")
			p1.stateTable.events.focusReceived()
		end
	end
	
	function p1.heartbeat()
		-- upvalues: p1 (copy), NewResult (upval)
		if p1.waitingTimeoutRunning and p1.props.dispatchTimeout < tick() - p1.startTime then
			NewResult:info("Timed out waiting for native response")
			p1.stateTable.events.onTimeout()
			
			return
		end
		if p1.cancelTimeoutRunning and p1.props.cancelTimeout < tick() - p1.cancelTime then
			NewResult:warning("Timed out waiting for cancellation acknowledgement")
			p1.stateTable.events.onTimeout()
		end
	end
	
	function p1.onResize(Frame)
		-- upvalues: p1 (copy)
		p1:setState({ screenSize = Frame.AbsoluteSize })
	end
	
	if FFlagAndroidTVExitWithB then
		p1.tvExitDisconnect = AndroidTVExitButtonManager.register(p1.stateTable.events.onCancel)
	end
end

function NativeHandshakeWrapper.willUnmount(p1)
	-- upvalues: FFlagAndroidTVExitWithB (copy)
	if FFlagAndroidTVExitWithB and p1.tvExitDisconnect then
		p1.tvExitDisconnect()
		p1.tvExitDisconnect = nil
	end
end

function NativeHandshakeWrapper.didMount(p1)
	-- upvalues: NewResult (copy)
	NewResult:info("NativeHandshakeWrapper mounted")
	p1:broadcastNotification()
end

function NativeHandshakeWrapper.render(p1)
	-- upvalues: NewResult (copy), WithStyleFunction (copy), config (copy), RoactModule (copy), ScreenGuiWithBlurControlModule (copy), TopBarModule (copy), LoadingAlert (copy), ExternalEventConnectionModule (copy)
	NewResult:trace("Rendering NativeHandshakeWrapper")
	
	return WithStyleFunction(function(p2)
		-- upvalues: config (upval), RoactModule (upval), ScreenGuiWithBlurControlModule (upval), p1 (copy), TopBarModule (upval), LoadingAlert (upval), ExternalEventConnectionModule (upval)
		if not p2 then
			p2 = config
		end
		return RoactModule.createElement(ScreenGuiWithBlurControlModule, {
			Enabled = true,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
			DisplayOrder = p1.props.DisplayOrder,
			[RoactModule.Change.AbsoluteSize] = p1.onResize
		}, {
			Background = RoactModule.createElement("Frame", {
				ZIndex = 0,
				Active = true,
				BorderSizePixel = 0,
				BackgroundColor3 = p2.Theme.Overlay.Color,
				BackgroundTransparency = p2.Theme.Overlay.Transparency,
				Size = UDim2.fromScale(1, 1)
			}),
			TopBar = if p1.props.showBackButton then RoactModule.createElement(TopBarModule.Container, { titleText = "", ZIndex = 2, leftItem = p1.backButton }) else nil,
			Loading = RoactModule.createElement(LoadingAlert, { title = p1.props.title, screenSize = p1.state.screenSize }),
			EventConnection = RoactModule.createElement(ExternalEventConnectionModule, {
				event = p1.props.appNotificationService.RobloxEventReceived,
				callback = p1.checkEvent
			}),
			HeartbeatConnection = RoactModule.createElement(ExternalEventConnectionModule, {
				event = p1.props.runService.Heartbeat,
				callback = p1.heartbeat
			}),
			BackButtonConnection = RoactModule.createElement(ExternalEventConnectionModule, {
				event = p1.props.guiService.ShowLeaveConfirmation,
				callback = p1.stateTable.events.onCancel
			})
		})
	end)
end

function NativeHandshakeWrapper._broadcast(p1, p2)
	-- upvalues: HttpService (copy), NewResult (copy)
	local NotificationType = p1.props.notificationType
	local GuiService = p1.props.guiService
	local Json = if p2 then HttpService:JSONEncode({ cancel = true }) else p1.props.notificationData
	
	if p1.props.isVisible and Json ~= nil and NotificationType ~= nil then
		NewResult:trace("Broadcasting {}: {}", NotificationType, Json)
		GuiService:BroadcastNotification(Json, NotificationType)
	end
end

function NativeHandshakeWrapper.close(p1)
	-- upvalues: NewResult (copy)
	NewResult:debug("Closing NativeHandshakerapper")
	p1.props.navigation.goBack()
end

return (RoactServices.connect({
	guiService = AppGuiService,
	runService = AppRunService,
	appNotificationService = AppNotificationService
})(NativeHandshakeWrapper))