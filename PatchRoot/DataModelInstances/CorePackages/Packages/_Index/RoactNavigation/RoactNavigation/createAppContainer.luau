-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:00 2026 Pacific Standard Time.

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

local function _(p0) --[[ line: 20 | named "isStateful" ]]
	return not p0.navigation
end

local function validateProps(p1) --[[ line: 24 ]]
	-- upvalues: object (ref), _assert (ref)
	if p1.persistenceKey then
		warn("You passed persistenceKey prop to a navigator. The persistenceKey prop was replaced by a more flexible persistence mechanism, please see the navigation state persistence docs for more information. Passing the persistenceKey prop is a no-op.")
	end
	if p1.navigation then return end
	local var9 = object.assign(table.clone(p1), {
		navigation = object.None,
		screenProps = object.None,
		persistNavigationState = object.None,
		loadNavigationState = object.None,
		externalDispatchConnector = object.None
	})
	
	if next(var9) ~= nil then
		error("This navigator has both navigation and container props, so it is " .. ("unclear if it should own its own state. Remove props: %q "):format(table.concat(object.keys(var9), ", ")) .. "if the navigator should get its state from the navigation prop. If the " .. "navigator should maintain its own state, do not pass a navigation prop.")
	end
	local persistNavigationState = p1.persistNavigationState
	_assert(persistNavigationState == nil or (type(persistNavigationState) == "function" and type(p1.loadNavigationState) == "function"), "both persistNavigationState and loadNavigationState must either be undefined, or be functions")
end

local var8 = 0

return {
	createAppContainer = function(p2, p3) --[[ line: 117 ]]
		-- upvalues: _assert (ref), reactModule (ref), validateProps (ref), navigationActionsModule (ref), urlToPathAndParams (ref), console (ref), var8 (write), eventsModule (ref), getNavigationModule (ref), navigationContextModule (ref), object (ref)
		_assert(type(p2) == "table" and p2.router ~= nil, "AppComponent must be a navigator or a stateful Roact component with a 'router' field")
		local var10 = reactModule.Component:extend(string.format("NavigationContainer(%s)", tostring(p2)))
		var10.router = p2.router
		
		function var10.getDerivedStateFromProps(p4) --[[ line: 128 ]]
			-- upvalues: validateProps (copy)
			validateProps(p4)
			
			return nil
		end
		
		function var10.init(p5) --[[ line: 133 ]]
			-- upvalues: validateProps (copy), navigationActionsModule (copy), p2 (ref)
			validateProps(p5.props)
			p5._actionEventSubscribers = {}
			p5._initialAction = navigationActionsModule.init()
			p5.state = {
				nav = if p5:_isStateful() and not p5.props.loadNavigationState then p2.router.getStateForAction(p5._initialAction) else nil
			}
		end
		
		function var10._updateExternalDispatchConnector(p6) --[[ line: 155 ]]
			if p6._disconnectExternalDispatch then
				p6._disconnectExternalDispatch()
				p6._disconnectExternalDispatch = nil
			end
			local externalDispatchConnector = p6.props.externalDispatchConnector
			
			if externalDispatchConnector ~= nil then
				p6._disconnectExternalDispatch = externalDispatchConnector(function(...) --[[ line: 163 ]]
					-- upvalues: p6 (ref)
					return if p6._isMounted then p6:dispatch(...) else false
				end)
			end
		end
		
		function var10._renderLoading(p7) --[[ line: 174 ]]
			return p7.props.renderLoading and p7.props.renderLoading()
		end
		
		function var10._isStateful(p8) --[[ line: 178 ]]
			return not p8.props.navigation
		end
		
		function var10._handleOpenURL(p9, p10) --[[ line: 182 ]]
			-- upvalues: urlToPathAndParams (copy), p2 (ref)
			local url = p10.url
			local uriPrefix = p9.props.uriPrefix
			
			if p9.props.enableURLHandling == false then return end
			local var11 = urlToPathAndParams(url, uriPrefix)
			
			if var11 then
				local actionForPathAndParams = p2.router.getActionForPathAndParams(var11.path, var11.params)
				
				if actionForPathAndParams then
					p9:dispatch(actionForPathAndParams)
				end
			end
		end
		
		function var10._onNavigationStateChange(p11, p12, p13, p14) --[[ line: 201 ]]
			-- upvalues: console (copy)
			local onNavigationStateChange = p11.props.onNavigationStateChange
			
			if onNavigationStateChange == nil and p11:_isStateful() and _G.REACT_NAV_LOGGING then
				console.group("Navigation Dispatch: ")
				console.log("Action: ", p14)
				console.log("New State: ", p13)
				console.log("Last State: ", p12)
				console.groupEnd()
				
				return
			elseif type(onNavigationStateChange) == "function" then
				onNavigationStateChange(p12, p13, p14)
			end
		end
		
		function var10.didUpdate(p15, p16) --[[ line: 218 ]]
			if p15._navState == p15.state.nav then
				p15._navState = nil
			end
			if p15.props.externalDispatchConnector ~= p16.externalDispatchConnector then
				p15:_updateExternalDispatchConnector()
			end
		end
		
		function var10.didMount(p17) --[[ line: 231 ]]
			-- upvalues: var8 (copy), console (copy), p3 (ref), p2 (ref), eventsModule (copy)
			p17._isMounted = true
			p17:_updateExternalDispatchConnector()
			
			if not p17:_isStateful() then return end
			if _G.__DEV__ and not p17.props.detached and var8 > 0 then
				console.warn("You should only render one navigator explicitly in your app, and other navigators should be rendered by including them in that navigator. Full details at: https://reactnavigation.org/docs/4.x/common-mistakes#explicitly-rendering-more-than-one-navigator")
			end
			var8 += 1
			
			if p3 then
				p3:listenForLuaURLs(function(p18) --[[ line: 256 ]]
					-- upvalues: p17 (ref)
					p17:_handleOpenURL({ url = p18 })
				end, false)
			end
			local parsedUrl = nil
			local userProvidedStartupState = nil
			
			if p17.props.enableURLHandling ~= false then
				local startupParams = p17:getStartupParams()
				parsedUrl = startupParams.parsedUrl
				userProvidedStartupState = startupParams.userProvidedStartupState
			end
			local initialAction = p17._initialAction
			local var14 = p17.state.nav or p2.router.getStateForAction(initialAction)
			
			if userProvidedStartupState then
				var14 = userProvidedStartupState
			end
			if parsedUrl then
				local actionForPathAndParams = p2.router.getActionForPathAndParams(parsedUrl.path, parsedUrl.params)
				
				if actionForPathAndParams then
					initialAction = actionForPathAndParams
					var14 = p2.router.getStateForAction(actionForPathAndParams, var14)
				end
			end
			local function dispatchAction() --[[ line: 300 ]]
				-- upvalues: p17 (ref), eventsModule (copy), initialAction (write)
				for i in p17._actionEventSubscribers do
					i({
						lastState = nil,
						type = eventsModule.Action,
						action = initialAction,
						state = p17.state.nav
					})
				end
			end
			
			if var14 == p17.state.nav then
				spawn(dispatchAction)
				
				return
			end
			p17:setState({ nav = var14 }, dispatchAction)
		end
		
		function var10.getStartupParams(p19) --[[ line: 326 ]]
			-- upvalues: p3 (ref), urlToPathAndParams (copy)
			local props = p19.props
			local uriPrefix = props.uriPrefix
			local loadNavigationState = props.loadNavigationState
			local var17 = nil
			local var18 = nil
			
			if p3 then
				pcall(function() --[[ line: 334 ]]
					-- upvalues: var17 (write), p3 (copy)
					var17 = p3:getLastLuaURL()
				end)
			end
			if loadNavigationState then
				pcall(function() --[[ line: 340 ]]
					-- upvalues: var18 (write), loadNavigationState (ref)
					var18 = loadNavigationState()
				end)
			end
			return {
				parsedUrl = var17 and urlToPathAndParams(var17, uriPrefix),
				userProvidedStartupState = var18
			}
		end
		
		function var10._persistNavigationState(p20, p21) --[[ line: 353 ]]
			local persistNavigationState = p20.props.persistNavigationState
			
			if persistNavigationState then
				local ok, status = pcall(persistNavigationState, p21)
				
				if not ok then
					warn("Uncaught error while calling persistNavigationState()! " .. "You should handle exceptions thrown from persistNavigationState(), " .. "ignoring them may result in undefined behavior.\n" .. status)
				end
			end
		end
		
		function var10.willUnmount(p22) --[[ line: 369 ]]
			-- upvalues: p3 (ref), var8 (copy)
			p22._isMounted = false
			
			if p3 then
				p3:stopListeningForLuaURLs()
			end
			if p22._disconnectExternalDispatch then
				p22._disconnectExternalDispatch()
				p22._disconnectExternalDispatch = nil
			end
			if p22:_isStateful() then
				var8 -= 1
			end
		end
		
		function var10.dispatch(p23, p24) --[[ line: 395 ]]
			-- upvalues: _assert (copy), p2 (ref), eventsModule (copy)
			if p23.props.navigation then
				return p23.props.navigation.dispatch(p24)
			end
			p23._navState = p23._navState or p23.state.nav
			local navState = p23._navState
			_assert(navState ~= nil, "should be set in constructor if stateful")
			local stateForAction = p2.router.getStateForAction(p24, navState)
			local var20 = if stateForAction == nil then navState else stateForAction
			
			local function dispatchActionEvents() --[[ line: 411 ]]
				-- upvalues: p23 (ref), eventsModule (copy), p24 (ref), var20 (write), navState (ref)
				for i in p23._actionEventSubscribers do
					i({
						type = eventsModule.Action,
						action = p24,
						state = var20,
						lastState = navState
					})
				end
			end
			
			if stateForAction == nil then
				dispatchActionEvents()
				
				return true
			elseif var20 == navState then
				dispatchActionEvents()
				
				return false
			end
			p23._navState = var20
			p23:setState({ nav = var20 }, function() --[[ line: 436 ]]
				-- upvalues: p23 (ref), navState (ref), var20 (write), p24 (ref), dispatchActionEvents (ref)
				p23:_onNavigationStateChange(navState, var20, p24)
				task.defer(dispatchActionEvents)
				p23:_persistNavigationState(var20)
			end)
			
			return true
		end
		
		function var10._getScreenProps(p25, p26, p27) --[[ line: 450 ]]
			if p26 == nil then
				return p25.props.screenProps
			end
			local screenProps = p25.props.screenProps
			
			return if screenProps == nil or screenProps[p26] == nil then p27 else screenProps[p26]
		end
		
		function var10.render(p28) --[[ line: 465 ]]
			-- upvalues: getNavigationModule (copy), p2 (ref), _assert (copy), reactModule (copy), navigationContextModule (copy), object (copy)
			local navigation = p28.props.navigation
			
			if p28:_isStateful() then
				local nav = p28.state.nav
				
				if not nav then
					return p28:_renderLoading()
				elseif not p28._navigation or p28._navigation.state ~= nav then
					p28._navigation = getNavigationModule(p2.router, nav, function(...) --[[ line: 478 ]]
						-- upvalues: p28 (ref)
						return p28:dispatch(...)
					end, p28._actionEventSubscribers, function(...) --[[ line: 482 ]]
						-- upvalues: p28 (ref)
						return p28:_getScreenProps(...)
					end, function() --[[ line: 485 ]]
						-- upvalues: p28 (ref)
						return p28._navigation
					end)
				end
				navigation = p28._navigation
			end
			_assert(navigation ~= nil, "failed to get navigation")
			
			return reactModule.createElement(navigationContextModule.Provider, { value = navigation }, {
				AppComponent = reactModule.createElement(p2, object.assign(table.clone(p28.props), { navigation = navigation }))
			})
		end
		
		return var10
	end,
	_TESTING_ONLY_reset_container_count = function() --[[ line: 72 ]]
		-- upvalues: var8 (write)
		var8 = 0
	end
}