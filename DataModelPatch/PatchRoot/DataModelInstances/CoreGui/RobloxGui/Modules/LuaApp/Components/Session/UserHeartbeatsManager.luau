local CorePackages = game:GetService("CorePackages")
local RunService = game:GetService("RunService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local NavigationRoduxModule = require(CorePackages.Workspace.Packages.NavigationRodux)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(Modules.Common.RoactRodux)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactServiceTagsModule = require(CorePackages.Workspace.Packages.RoactServiceTags)
local ExperienceEventReceiverModule = require(Modules.LuaApp.ExperienceEventReceiver)
local AppRunService = RoactServiceTagsModule.AppRunService
local AppUserInputService = RoactServiceTagsModule.AppUserInputService
local MessageBus = require(CorePackages.Workspace.Packages.MessageBus).MessageBus
local RoactNetworking = RoactServiceTagsModule.RoactNetworking
local EventConnection = require(CorePackages.Packages.ReactUtils).EventConnection
local FFlagSignalsNavP3cEvents = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3cEvents
local UseSignalState = require(CorePackages.Packages.SignalsReact).useSignalState
local GetLegacyNavigationStore = if FFlagSignalsNavP3cEvents then require(CorePackages.Workspace.Packages.NavigationRodux).GetLegacyNavigationStore else nil
local PostUserHeartbeatsActionReportModule = require(Modules.LuaApp.Http.Requests.UserHeartbeats.PostUserHeartbeatsActionReport)
local PostUserHeartbeatsPulseModule = require(Modules.LuaApp.Http.Requests.UserHeartbeats.PostUserHeartbeatsPulse)
local SelectCurrentLegacyPageFunction = NavigationRoduxModule.Selectors.selectCurrentLegacyPage
local SelectCurrentLegacyRouteFunction = NavigationRoduxModule.Selectors.selectCurrentLegacyRoute
game:DefineFastInt("UserHeartbeatsActionReportRolloutPerMyriad", 0)
game:DefineFastInt("UserHeartbeatsPulseRolloutPerMyriad", 0)
local UserHeartbeatsPulseIntervalSeconds = game:DefineFastInt("UserHeartbeatsPulseIntervalSeconds", 30)
local UserHeartbeatsInExperienceTracking = game:DefineFastFlag("UserHeartbeatsInExperienceTracking", false)
local UserHeartbeatsManager = RoactModule.Component:extend("UserHeartbeatsManager")
local config = {
	mid = MessageBus.getMessageId("Realtime", "appResume"),
	validateParams = function(_): boolean
		return true
	end
}
local config1 = {
	mid = MessageBus.getMessageId("Realtime", "appStop"),
	validateParams = function(_): boolean
		return true
	end
}

function UserHeartbeatsManager.init(p1)
	-- upvalues: UserHeartbeatsInExperienceTracking (copy), MessageBus (copy), ExperienceEventReceiverModule (copy), PostUserHeartbeatsActionReportModule (copy), UserHeartbeatsPulseIntervalSeconds (copy), PostUserHeartbeatsPulseModule (copy)
	p1._isMounted = false
	p1._nextPulseTick = tick()
	p1.state = {
		activeState = 1,
		inExperience = not UserHeartbeatsInExperienceTracking and nil
	}
	p1._subscriber = MessageBus.Subscriber.new()
	p1._rollout = Random.new():NextInteger(1, 10000)
	p1._isActionReportEnabled = p1._rollout <= game:GetFastInt("UserHeartbeatsActionReportRolloutPerMyriad")
	p1._isPulseEnabled = p1._rollout <= game:GetFastInt("UserHeartbeatsPulseRolloutPerMyriad")
	p1._experienceEventReceiver = if UserHeartbeatsInExperienceTracking then ExperienceEventReceiverModule.new() else nil
	
	function p1.onDataModelClose()
		-- upvalues: p1 (copy), PostUserHeartbeatsActionReportModule (upval)
		if not p1._isMounted then return end
		if p1._isActionReportEnabled then
			PostUserHeartbeatsActionReportModule(p1.props.networking, { logoutActionInfo = {} })
			
			return
		end
	end
	
	function p1.onBackgrounded()
		-- upvalues: p1 (copy)
		p1:setState({ activeState = 2 })
	end
	
	function p1.onForegrounded()
		-- upvalues: p1 (copy), UserHeartbeatsInExperienceTracking (upval)
		p1:setState({
			activeState = if UserHeartbeatsInExperienceTracking and p1.state.inExperience then 4 else 1
		})
	end
	
	function p1.heartbeatCallback()
		-- upvalues: p1 (copy), UserHeartbeatsPulseIntervalSeconds (upval), PostUserHeartbeatsPulseModule (upval)
		if not p1._isPulseEnabled then return end
		if UserHeartbeatsPulseIntervalSeconds <= 0 then return end
		local CurrentTime = tick()
		
		if CurrentTime >= p1._nextPulseTick then
			p1._nextPulseTick = CurrentTime + UserHeartbeatsPulseIntervalSeconds
			PostUserHeartbeatsPulseModule(p1.props.networking, p1.state.activeState, p1.props.currentPage.name)
			
			return
		end
	end
	
	function p1.onExperienceJoin()
		-- upvalues: p1 (copy)
		p1:setState({ activeState = 4, inExperience = true })
	end
	
	function p1.onExperienceLeave()
		-- upvalues: p1 (copy)
		p1:setState({ activeState = 1, inExperience = false })
	end
end

function UserHeartbeatsManager.render(p1)
	-- upvalues: RoactModule (copy), EventConnection (copy)
	local UserInputService = p1.props.userInputService
	
	return RoactModule.createFragment({
		HeartbeatListener = RoactModule.createElement(EventConnection, {
			callback = p1.heartbeatCallback,
			event = p1.props.runService.Heartbeat
		}),
		WindowFocusedListener = RoactModule.createElement(EventConnection, {
			callback = p1.onForegrounded,
			event = UserInputService.WindowFocused
		}),
		WindowFocusLostListener = RoactModule.createElement(EventConnection, {
			callback = p1.onBackgrounded,
			event = UserInputService.WindowFocusReleased
		})
	})
end

function UserHeartbeatsManager.didMount(p1)
	-- upvalues: config (copy), config1 (copy), UserHeartbeatsInExperienceTracking (copy), RunService (copy), PostUserHeartbeatsActionReportModule (copy)
	p1._isMounted = true
	p1._subscriber:subscribe(config, p1.onForegrounded)
	p1._subscriber:subscribe(config1, p1.onBackgrounded)
	
	if UserHeartbeatsInExperienceTracking then
		p1._onLaunchedConnection = p1._experienceEventReceiver:onLaunched(p1.onExperienceJoin)
		p1._onLeftConnection = p1._experienceEventReceiver:onLeft(p1.onExperienceLeave)
	end
	if p1._isActionReportEnabled then
		if not RunService:IsStudio() then
			game:BindToClose(p1.onDataModelClose)
		end
		PostUserHeartbeatsActionReportModule(p1.props.networking, { loginActionInfo = {} })
	end
end

function UserHeartbeatsManager.didUpdate(p1, _, p2)
	-- upvalues: PostUserHeartbeatsActionReportModule (copy)
	if not p1._isActionReportEnabled then return end
	if p2.activeState ~= p1.state.activeState then
		PostUserHeartbeatsActionReportModule(p1.props.networking, {
			universalAppActiveStateChangeActionInfo = {
				currentActiveState = p1.state.activeState,
				previousActiveState = p2.activeState
			}
		})
	end
end

function UserHeartbeatsManager.willUnmount(p1)
	-- upvalues: UserHeartbeatsInExperienceTracking (copy)
	p1._subscriber:unsubscribeFromAllMessages()
	
	if UserHeartbeatsInExperienceTracking then
		p1._onLaunchedConnection:disconnect()
		p1._onLeftConnection:disconnect()
		p1._experienceEventReceiver:UnsubscribeFromAllMessages()
	end
	p1._isMounted = false
end

local function mapStateToProps(p1)
	-- upvalues: SelectCurrentLegacyPageFunction (copy), SelectCurrentLegacyRouteFunction (copy)
	return {
		currentPage = SelectCurrentLegacyPageFunction(p1),
		route = SelectCurrentLegacyRouteFunction(p1)
	}
end

if FFlagSignalsNavP3cEvents then
	local ReactModule = require(CorePackages.Packages.React)
	local CryoModule = require(CorePackages.Packages.Cryo)
	
	local function v27(p1)
		-- upvalues: GetLegacyNavigationStore (copy), UseSignalState (copy), ReactModule (copy), UserHeartbeatsManager (copy), CryoModule (copy)
		return ReactModule.createElement(UserHeartbeatsManager, CryoModule.Dictionary.union(p1, {
			currentPage = UseSignalState(GetLegacyNavigationStore(false).getCurrentPage)
		}))
	end
else
	local v1: (any) -> any = RoactRoduxModule.connect(mapStateToProps, nil)(UserHeartbeatsManager)
end
return RoactServices.connect({
	networking = RoactNetworking,
	runService = AppRunService,
	userInputService = AppUserInputService
})(v1)