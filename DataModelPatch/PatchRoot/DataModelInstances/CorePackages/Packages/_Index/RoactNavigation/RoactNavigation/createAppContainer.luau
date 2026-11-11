local Parent = script.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local LuauPolyfillModule = require(Parent1.LuauPolyfill)
local Console = LuauPolyfillModule.console
local Object = LuauPolyfillModule.Object
local NavigationActionsModule = require(Parent.NavigationActions)
local EventsModule = require(Parent.Events)
local NavigationContextModule = require(Parent.views.NavigationContext)
local GetNavigationModule = require(Parent.getNavigation)
local Callback = assert
local UrlToPathAndParamsFunction = require(Parent.routers.pathUtils).urlToPathAndParams

local function _(p1): boolean
	return not p1.navigation
end

local function validateProps(Tbl)
	-- upvalues: Object (copy), Callback (copy)
	if Tbl.persistenceKey then
		warn("You passed persistenceKey prop to a navigator. The persistenceKey prop was replaced by a more flexible persistence mechanism, please see the navigation state persistence docs for more information. Passing the persistenceKey prop is a no-op.")
	end
	if not Tbl.navigation then return end
	local AssignResult = Object.assign(table.clone(Tbl), {
		navigation = Object.None,
		screenProps = Object.None,
		persistNavigationState = Object.None,
		loadNavigationState = Object.None,
		externalDispatchConnector = Object.None
	})
	
	if next(AssignResult) ~= nil then
		error("This navigator has both navigation and container props, so it is " .. ("unclear if it should own its own state. Remove props: %q "):format(table.concat(Object.keys(AssignResult), ", ")) .. "if the navigator should get its state from the navigation prop. If the " .. "navigator should maintain its own state, do not pass a navigation prop.")
	end
	local PersistNavigationStateFunction = Tbl.persistNavigationState
	local LoadNavigationStateFunction = Tbl.loadNavigationState
	Callback(PersistNavigationStateFunction == nil and LoadNavigationStateFunction == nil or type(PersistNavigationStateFunction) == "function" and type(LoadNavigationStateFunction) == "function", "both persistNavigationState and loadNavigationState must either be undefined, or be functions")
end

local Count = 0

return {
	createAppContainer = function(p1, p2)
		-- upvalues: Callback (copy), ReactModule (copy), validateProps (copy), NavigationActionsModule (copy), UrlToPathAndParamsFunction (copy), Console (copy), Count (ref), EventsModule (copy), GetNavigationModule (copy), NavigationContextModule (copy), Object (copy)
		Callback(type(p1) == "table" and p1.router ~= nil, "AppComponent must be a navigator or a stateful Roact component with a 'router' field")
		local ExtendResult = ReactModule.Component:extend((string.format("NavigationContainer(%s)", (tostring(p1)))))
		ExtendResult.router = p1.router
		
		function ExtendResult.getDerivedStateFromProps(p3)
			-- upvalues: validateProps (upval)
			validateProps(p3)
			
			return nil
		end
		
		function ExtendResult.init(p3)
			-- upvalues: validateProps (upval), NavigationActionsModule (upval), p1 (copy)
			validateProps(p3.props)
			p3._actionEventSubscribers = {}
			p3._initialAction = NavigationActionsModule.init()
			p3.state = {
				nav = if p3:_isStateful() and not p3.props.loadNavigationState then p1.router.getStateForAction(p3._initialAction) else nil
			}
		end
		
		function ExtendResult._updateExternalDispatchConnector(p3)
			if p3._disconnectExternalDispatch then
				p3._disconnectExternalDispatch()
				p3._disconnectExternalDispatch = nil
			end
			local ExternalDispatchConnectorFunction = p3.props.externalDispatchConnector
			
			if ExternalDispatchConnectorFunction ~= nil then
				p3._disconnectExternalDispatch = ExternalDispatchConnectorFunction(function(...)
					-- upvalues: p3 (copy)
					return if p3._isMounted then p3:dispatch(...) else false
				end)
			end
		end
		
		function ExtendResult._renderLoading(p3)
			return p3.props.renderLoading and p3.props.renderLoading()
		end
		
		function ExtendResult._isStateful(p3): boolean
			return not p3.props.navigation
		end
		
		function ExtendResult._handleOpenURL(p3, p4)
			-- upvalues: UrlToPathAndParamsFunction (upval), p1 (copy)
			local Url = p4.url
			local UriPrefix = p3.props.uriPrefix
			
			if p3.props.enableURLHandling == false then return end
			local UrlToPathAndParamsResult = UrlToPathAndParamsFunction(Url, UriPrefix)
			
			if UrlToPathAndParamsResult then
				local ActionForPathAndParams = p1.router.getActionForPathAndParams(UrlToPathAndParamsResult.path, UrlToPathAndParamsResult.params)
				
				if ActionForPathAndParams then
					p3:dispatch(ActionForPathAndParams)
				end
			end
		end
		
		function ExtendResult._onNavigationStateChange(p3, NavState, Nav, Action)
			-- upvalues: Console (upval)
			local OnNavigationStateChangeFunction: (any, any, any) -> () = p3.props.onNavigationStateChange
			
			if OnNavigationStateChangeFunction == nil and p3:_isStateful() and _G.REACT_NAV_LOGGING then
				Console.group("Navigation Dispatch: ")
				Console.log("Action: ", Action)
				Console.log("New State: ", Nav)
				Console.log("Last State: ", NavState)
				Console.groupEnd()
				
				return
			elseif type(OnNavigationStateChangeFunction) == "function" then
				OnNavigationStateChangeFunction(NavState, Nav, Action)
			end
		end
		
		function ExtendResult.didUpdate(p3, p4)
			if p3._navState == p3.state.nav then
				p3._navState = nil
			end
			if p3.props.externalDispatchConnector ~= p4.externalDispatchConnector then
				p3:_updateExternalDispatchConnector()
			end
		end
		
		function ExtendResult.didMount(p3)
			-- upvalues: Count (upval), Console (upval), p2 (copy), p1 (copy), EventsModule (upval)
			p3._isMounted = true
			p3:_updateExternalDispatchConnector()
			
			if not p3:_isStateful() then return end
			if _G.__DEV__ and not p3.props.detached and Count > 0 then
				Console.warn("You should only render one navigator explicitly in your app, and other navigators should be rendered by including them in that navigator. Full details at: https://reactnavigation.org/docs/4.x/common-mistakes#explicitly-rendering-more-than-one-navigator")
			end
			Count += 1
			
			if p2 then
				p2:listenForLuaURLs(function(Url)
					-- upvalues: p3 (copy)
					p3:_handleOpenURL({ url = Url })
				end, false)
			end
			local ParsedUrl = nil
			local UserProvidedStartupState = nil
			
			if p3.props.enableURLHandling ~= false then
				local StartupParams = p3:getStartupParams()
				ParsedUrl = StartupParams.parsedUrl
				UserProvidedStartupState = StartupParams.userProvidedStartupState
			end
			local InitialAction = p3._initialAction
			local UserProvidedStartupState1 = if UserProvidedStartupState then UserProvidedStartupState else p3.state.nav or p1.router.getStateForAction(InitialAction)
			
			if ParsedUrl then
				local ActionForPathAndParams = p1.router.getActionForPathAndParams(ParsedUrl.path, ParsedUrl.params)
				
				if ActionForPathAndParams then
					InitialAction = ActionForPathAndParams
					UserProvidedStartupState1 = p1.router.getStateForAction(ActionForPathAndParams, UserProvidedStartupState1)
				end
			end
			local function dispatchAction()
				-- upvalues: p3 (copy), EventsModule (upval), InitialAction (ref)
				for actionEventSubscriber in p3._actionEventSubscribers do
					actionEventSubscriber({
						lastState = nil,
						type = EventsModule.Action,
						action = InitialAction,
						state = p3.state.nav
					})
				end
			end
			
			if UserProvidedStartupState1 == p3.state.nav then
				spawn(dispatchAction)
				
				return
			else
				p3:setState({ nav = UserProvidedStartupState1 }, dispatchAction)
			end
		end
		
		function ExtendResult.getStartupParams(p4)
			-- upvalues: p2 (copy), UrlToPathAndParamsFunction (upval)
			local Props = p4.props
			local UriPrefix = Props.uriPrefix
			local LoadNavigationStateFunction = Props.loadNavigationState
			local LastLuaURL = nil
			local UserProvidedStartupState = nil
			
			if p2 then
				pcall(function()
					-- upvalues: LastLuaURL (ref), p2 (upval)
					LastLuaURL = p2:getLastLuaURL()
				end)
			end
			if LoadNavigationStateFunction then
				pcall(function()
					-- upvalues: UserProvidedStartupState (ref), LoadNavigationStateFunction (copy)
					UserProvidedStartupState = LoadNavigationStateFunction()
				end)
			end
			return {
				parsedUrl = LastLuaURL and UrlToPathAndParamsFunction(LastLuaURL, UriPrefix),
				userProvidedStartupState = UserProvidedStartupState
			}
		end
		
		function ExtendResult._persistNavigationState(p4, Nav)
			local PersistNavigationState = p4.props.persistNavigationState
			
			if PersistNavigationState then
				local Success, Result = pcall(PersistNavigationState, Nav)
				
				if not Success then
					warn("Uncaught error while calling persistNavigationState()! " .. "You should handle exceptions thrown from persistNavigationState(), " .. "ignoring them may result in undefined behavior.\n" .. Result)
				end
			end
		end
		
		function ExtendResult.willUnmount(p4)
			-- upvalues: p2 (copy), Count (upval)
			p4._isMounted = false
			
			if p2 then
				p2:stopListeningForLuaURLs()
			end
			if p4._disconnectExternalDispatch then
				p4._disconnectExternalDispatch()
				p4._disconnectExternalDispatch = nil
			end
			if p4:_isStateful() then
				Count -= 1
			end
		end
		
		function ExtendResult.dispatch(p4, Action)
			-- upvalues: Callback (upval), p1 (copy), EventsModule (upval)
			if p4.props.navigation then
				return p4.props.navigation.dispatch(Action)
			end
			p4._navState = p4._navState or p4.state.nav
			local NavState = p4._navState
			Callback(NavState ~= nil, "should be set in constructor if stateful")
			local StateForAction = p1.router.getStateForAction(Action, NavState)
			local NavState1 = if StateForAction == nil then NavState else StateForAction
			
			local function dispatchActionEvents()
				-- upvalues: p4 (copy), EventsModule (upval), Action (copy), NavState1 (ref), NavState (copy)
				for actionEventSubscriber in p4._actionEventSubscribers do
					actionEventSubscriber({
						type = EventsModule.Action,
						action = Action,
						state = NavState1,
						lastState = NavState
					})
				end
			end
			
			if StateForAction == nil then
				dispatchActionEvents()
				
				return true
			elseif NavState1 == NavState then
				dispatchActionEvents()
				
				return false
			else
				p4._navState = NavState1
				p4:setState({ nav = NavState1 }, function()
					-- upvalues: p4 (copy), NavState (copy), NavState1 (ref), Action (copy), dispatchActionEvents (copy)
					p4:_onNavigationStateChange(NavState, NavState1, Action)
					task.defer(dispatchActionEvents)
					p4:_persistNavigationState(NavState1)
				end)
				
				return true
			end
		end
		
		function ExtendResult._getScreenProps(p5, p6, p7)
			if p6 == nil then
				return p5.props.screenProps
			else
				local ScreenProps = p5.props.screenProps
				
				return if ScreenProps == nil or ScreenProps[p6] == nil then p7 else ScreenProps[p6]
			end
		end
		
		function ExtendResult.render(p5)
			-- upvalues: GetNavigationModule (upval), p1 (copy), Callback (upval), ReactModule (upval), NavigationContextModule (upval), Object (upval)
			local Navigation = p5.props.navigation
			
			if p5:_isStateful() then
				local Nav = p5.state.nav
				
				if not Nav then
					return p5:_renderLoading()
				end
				if not p5._navigation or p5._navigation.state ~= Nav then
					p5._navigation = GetNavigationModule(p1.router, Nav, function(...)
						-- upvalues: p5 (copy)
						return p5:dispatch(...)
					end, p5._actionEventSubscribers, function(...)
						-- upvalues: p5 (copy)
						return p5:_getScreenProps(...)
					end, function()
						-- upvalues: p5 (copy)
						return p5._navigation
					end)
				end
				Navigation = p5._navigation
			end
			Callback(Navigation ~= nil, "failed to get navigation")
			
			return ReactModule.createElement(NavigationContextModule.Provider, { value = Navigation }, {
				AppComponent = ReactModule.createElement(p1, Object.assign(table.clone(p5.props), { navigation = Navigation }))
			})
		end
		
		return ExtendResult
	end,
	_TESTING_ONLY_reset_container_count = function()
		-- upvalues: Count (ref)
		Count = 0
	end
}