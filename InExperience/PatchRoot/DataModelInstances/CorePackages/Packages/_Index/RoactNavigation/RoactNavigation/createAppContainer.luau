local parent = script.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local luauPolyfillModule = require(parent_1.LuauPolyfill)
local console = luauPolyfillModule.console
local object = luauPolyfillModule.Object
local navigationActionsModule = require(parent.NavigationActions)
local eventsModule = require(parent.Events)
local navigationContextModule = require(parent.views.NavigationContext)
local getNavigationModule = require(parent.getNavigation)
local _assert = assert
local urlToPathAndParams = require(parent.routers.pathUtils).urlToPathAndParams

local function _(p1)
	return not p1.navigation
end

local function validateProps(p1)
	-- upvalues: object (ref), _assert (ref)
	if p1.persistenceKey then
		warn("You passed persistenceKey prop to a navigator. The persistenceKey prop was replaced by a more flexible persistence mechanism, please see the navigation state persistence docs for more information. Passing the persistenceKey prop is a no-op.")
	end
	if p1.navigation then return end
	local var1 = object.assign(table.clone(p1), {
		navigation = object.None,
		screenProps = object.None,
		persistNavigationState = object.None,
		loadNavigationState = object.None,
		externalDispatchConnector = object.None
	})
	
	if next(var1) ~= nil then
		error("This navigator has both navigation and container props, so it is " .. ("unclear if it should own its own state. Remove props: %q "):format(table.concat(object.keys(var1), ", ")) .. "if the navigator should get its state from the navigation prop. If the " .. "navigator should maintain its own state, do not pass a navigation prop.")
	end
	local persistNavigationState = p1.persistNavigationState
	_assert(persistNavigationState == nil or (type(persistNavigationState) == "function" and type(p1.loadNavigationState) == "function"), "both persistNavigationState and loadNavigationState must either be undefined, or be functions")
end

local var1 = 0

return {
	createAppContainer = function(p1, p2)
		-- upvalues: _assert (ref), reactModule (ref), validateProps (ref), navigationActionsModule (ref), urlToPathAndParams (ref), console (ref), var1 (write), eventsModule (ref), getNavigationModule (ref), navigationContextModule (ref), object (ref)
		_assert(type(p1) == "table" and p1.router ~= nil, "AppComponent must be a navigator or a stateful Roact component with a 'router' field")
		local var2 = reactModule.Component:extend(string.format("NavigationContainer(%s)", tostring(p1)))
		var2.router = p1.router
		
		function var10.getDerivedStateFromProps(p3)
			-- upvalues: validateProps (copy)
			validateProps(p3)
			
			return nil
		end
		
		function var10.init(p3)
			-- upvalues: validateProps (copy), navigationActionsModule (copy), p1 (ref)
			validateProps(p3.props)
			p3._actionEventSubscribers = {}
			p3._initialAction = navigationActionsModule.init()
			p3.state = {
				nav = if p3:_isStateful() and not p3.props.loadNavigationState then p1.router.getStateForAction(p3._initialAction) else nil
			}
		end
		
		function var10._updateExternalDispatchConnector(p3)
			if p3._disconnectExternalDispatch then
				p3._disconnectExternalDispatch()
				p3._disconnectExternalDispatch = nil
			end
			local externalDispatchConnector = p3.props.externalDispatchConnector
			
			if externalDispatchConnector ~= nil then
				p3._disconnectExternalDispatch = externalDispatchConnector(function(...)
					-- upvalues: p3 (ref)
					return if p3._isMounted then p3:dispatch(...) else false
				end)
			end
		end
		
		function var10._renderLoading(p3)
			return p3.props.renderLoading and p3.props.renderLoading()
		end
		
		function var10._isStateful(p3)
			return not p3.props.navigation
		end
		
		function var10._handleOpenURL(p3, p4)
			-- upvalues: urlToPathAndParams (copy), p1 (ref)
			local url = p4.url
			local uriPrefix = p3.props.uriPrefix
			
			if p3.props.enableURLHandling == false then return end
			local var3 = urlToPathAndParams(url, uriPrefix)
			
			if var3 then
				local actionForPathAndParams = p1.router.getActionForPathAndParams(var3.path, var3.params)
				
				if actionForPathAndParams then
					p3:dispatch(actionForPathAndParams)
				end
			end
		end
		
		function var10._onNavigationStateChange(p3, p4, p5, p6)
			-- upvalues: console (copy)
			local onNavigationStateChange = p3.props.onNavigationStateChange
			
			if onNavigationStateChange == nil and p3:_isStateful() and _G.REACT_NAV_LOGGING then
				console.group("Navigation Dispatch: ")
				console.log("Action: ", p6)
				console.log("New State: ", p5)
				console.log("Last State: ", p4)
				console.groupEnd()
				
				return
			elseif type(onNavigationStateChange) == "function" then
				onNavigationStateChange(p4, p5, p6)
			end
		end
		
		function var10.didUpdate(p3, p4)
			if p3._navState == p3.state.nav then
				p3._navState = nil
			end
			if p3.props.externalDispatchConnector ~= p4.externalDispatchConnector then
				p3:_updateExternalDispatchConnector()
			end
		end
		
		function var10.didMount(p3)
			-- upvalues: var1 (copy), console (copy), p2 (ref), p1 (ref), eventsModule (copy)
			p3._isMounted = true
			p3:_updateExternalDispatchConnector()
			
			if not p3:_isStateful() then return end
			if _G.__DEV__ and not p3.props.detached and var1 > 0 then
				console.warn("You should only render one navigator explicitly in your app, and other navigators should be rendered by including them in that navigator. Full details at: https://reactnavigation.org/docs/4.x/common-mistakes#explicitly-rendering-more-than-one-navigator")
			end
			var1 += 1
			
			if p2 then
				p2:listenForLuaURLs(function(p4)
					-- upvalues: p3 (ref)
					p3:_handleOpenURL({ url = p4 })
				end, false)
			end
			local parsedUrl = nil
			local userProvidedStartupState = nil
			
			if p3.props.enableURLHandling ~= false then
				local startupParams = p3:getStartupParams()
				parsedUrl = startupParams.parsedUrl
				userProvidedStartupState = startupParams.userProvidedStartupState
			end
			local initialAction = p3._initialAction
			local var3 = p3.state.nav or p1.router.getStateForAction(initialAction)
			
			if userProvidedStartupState then
				var3 = userProvidedStartupState
			end
			if parsedUrl then
				local actionForPathAndParams = p1.router.getActionForPathAndParams(parsedUrl.path, parsedUrl.params)
				
				if actionForPathAndParams then
					initialAction = actionForPathAndParams
					var3 = p1.router.getStateForAction(actionForPathAndParams, var3)
				end
			end
			local function dispatchAction()
				-- upvalues: p3 (ref), eventsModule (copy), initialAction (write)
				for i in p3._actionEventSubscribers do
					i({
						lastState = nil,
						type = eventsModule.Action,
						action = initialAction,
						state = p3.state.nav
					})
				end
			end
			
			if var3 == p3.state.nav then
				spawn(dispatchAction)
				
				return
			end
			p3:setState({ nav = var3 }, dispatchAction)
		end
		
		function var10.getStartupParams(p4)
			-- upvalues: p2 (ref), urlToPathAndParams (copy)
			local props = p4.props
			local uriPrefix = props.uriPrefix
			local loadNavigationState = props.loadNavigationState
			local var4 = nil
			local var5 = nil
			
			if p2 then
				pcall(function()
					-- upvalues: var4 (write), p2 (copy)
					var4 = p2:getLastLuaURL()
				end)
			end
			if loadNavigationState then
				pcall(function()
					-- upvalues: var5 (write), loadNavigationState (ref)
					var5 = loadNavigationState()
				end)
			end
			return {
				parsedUrl = var4 and urlToPathAndParams(var4, uriPrefix),
				userProvidedStartupState = var5
			}
		end
		
		function var10._persistNavigationState(p4, p5)
			local persistNavigationState = p4.props.persistNavigationState
			
			if persistNavigationState then
				local ok, status = pcall(persistNavigationState, p5)
				
				if not ok then
					warn("Uncaught error while calling persistNavigationState()! " .. "You should handle exceptions thrown from persistNavigationState(), " .. "ignoring them may result in undefined behavior.\n" .. status)
				end
			end
		end
		
		function var10.willUnmount(p4)
			-- upvalues: p2 (ref), var1 (copy)
			p4._isMounted = false
			
			if p2 then
				p2:stopListeningForLuaURLs()
			end
			if p4._disconnectExternalDispatch then
				p4._disconnectExternalDispatch()
				p4._disconnectExternalDispatch = nil
			end
			if p4:_isStateful() then
				var1 -= 1
			end
		end
		
		function var10.dispatch(p4, p5)
			-- upvalues: _assert (copy), p1 (ref), eventsModule (copy)
			if p4.props.navigation then
				return p4.props.navigation.dispatch(p5)
			end
			p4._navState = p4._navState or p4.state.nav
			local navState = p4._navState
			_assert(navState ~= nil, "should be set in constructor if stateful")
			local stateForAction = p1.router.getStateForAction(p5, navState)
			local var4 = if stateForAction == nil then navState else stateForAction
			
			local function dispatchActionEvents()
				-- upvalues: p4 (ref), eventsModule (copy), p5 (ref), var4 (write), navState (ref)
				for i in p4._actionEventSubscribers do
					i({
						type = eventsModule.Action,
						action = p5,
						state = var4,
						lastState = navState
					})
				end
			end
			
			if stateForAction == nil then
				dispatchActionEvents()
				
				return true
			elseif var4 == navState then
				dispatchActionEvents()
				
				return false
			end
			p4._navState = var4
			p4:setState({ nav = var4 }, function()
				-- upvalues: p4 (ref), navState (ref), var4 (write), p5 (ref), dispatchActionEvents (ref)
				p4:_onNavigationStateChange(navState, var4, p5)
				task.defer(dispatchActionEvents)
				p4:_persistNavigationState(var4)
			end)
			
			return true
		end
		
		function var10._getScreenProps(p6, p7, p8)
			if p7 == nil then
				return p6.props.screenProps
			end
			local screenProps = p6.props.screenProps
			
			return if screenProps == nil or screenProps[p7] == nil then p8 else screenProps[p7]
		end
		
		function var10.render(p6)
			-- upvalues: getNavigationModule (copy), p1 (ref), _assert (copy), reactModule (copy), navigationContextModule (copy), object (copy)
			local navigation = p6.props.navigation
			
			if p6:_isStateful() then
				local nav = p6.state.nav
				
				if not nav then
					return p6:_renderLoading()
				elseif not p6._navigation or p6._navigation.state ~= nav then
					p6._navigation = getNavigationModule(p1.router, nav, function(...)
						-- upvalues: p6 (ref)
						return p6:dispatch(...)
					end, p6._actionEventSubscribers, function(...)
						-- upvalues: p6 (ref)
						return p6:_getScreenProps(...)
					end, function()
						-- upvalues: p6 (ref)
						return p6._navigation
					end)
				end
				navigation = p6._navigation
			end
			_assert(navigation ~= nil, "failed to get navigation")
			
			return reactModule.createElement(navigationContextModule.Provider, { value = navigation }, {
				AppComponent = reactModule.createElement(p1, object.assign(table.clone(p6.props), { navigation = navigation }))
			})
		end
		
		return var2
	end,
	_TESTING_ONLY_reset_container_count = function()
		-- upvalues: var1 (write)
		var1 = 0
	end
}