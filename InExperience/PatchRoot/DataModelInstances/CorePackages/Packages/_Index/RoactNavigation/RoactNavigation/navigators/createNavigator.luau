local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local LuauPolyfillModule = require(Parent1.LuauPolyfill)
local Object = LuauPolyfillModule.Object
local Array = LuauPolyfillModule.Array
local InvariantModule = require(Parent.utils.invariant)
local NavigationFocusEventsModule = require(Parent.views.NavigationFocusEvents)

return function(p1, Router, NavigationConfig) --[[ Line: 12 ]]
	-- upvalues: ReactModule (copy), InvariantModule (copy), Array (copy), Object (copy), NavigationFocusEventsModule (copy)
	local Navigator = ReactModule.Component:extend("Navigator")
	Navigator.router = Router
	Navigator.navigationOptions = NavigationConfig.navigationOptions
	
	function Navigator.init(p2) --[[ Line: 20 ]]
		p2.state = {
			descriptors = {},
			transitioningDescriptors = {},
			screenProps = p2.props.screenProps
		}
	end
	
	function Navigator.getDerivedStateFromProps(p2, State) --[[ Line: 32 ]]
		-- upvalues: InvariantModule (upval), Array (upval), Router (copy), Object (upval)
		local Descriptors = State.descriptors
		local TransitioningDescriptors = State.transitioningDescriptors
		local Navigation = p2.navigation
		local ScreenProps = p2.screenProps
		InvariantModule(Navigation ~= nil, "The navigation prop is missing for this navigator. In react-navigation v3 and v4 you must set up your app container directly. More info: https://reactnavigation.org/docs/en/app-containers.html")
		local Routes = Navigation.state.routes
		InvariantModule(type(Routes) == "table", "No \"routes\" found in navigation state. Did you try to pass the navigation prop of a React component to a Navigator child? See https://reactnavigation.org/docs/en/custom-navigators.html#navigator-navigation-prop")
		
		return {
			descriptors = Array.reduce(Routes, function(p3, State1) --[[ Line: 55 ]]
				-- upvalues: Descriptors (copy), ScreenProps (copy), State (copy), Router (upval), Navigation (copy)
				if Descriptors and Descriptors[State1.key] and State1 == Descriptors[State1.key].state and ScreenProps == State.screenProps then
					p3[State1.key] = Descriptors[State1.key]
					
					return p3
				else
					local ChildNavigation = Navigation.getChildNavigation(State1.key)
					p3[State1.key] = {
						key = State1.key,
						getComponent = function() --[[ Line: 65 ]]
							-- upvalues: Router (upval), State1 (copy)
							return Router.getComponentForRouteName(State1.routeName)
						end,
						options = Router.getScreenOptions(ChildNavigation, ScreenProps),
						state = State1,
						navigation = ChildNavigation
					}
					
					return p3
				end
			end, {}),
			transitioningDescriptors = if Navigation.state.isTransitioning then Object.assign({}, TransitioningDescriptors, Descriptors, Array.reduce(Routes, function(Nones, p3) --[[ Line: 92 ]]
				-- upvalues: Object (upval)
				Nones[p3.key] = Object.None
				
				return Nones
			end, {})) else {},
			screenProps = ScreenProps
		}
	end
	
	function Navigator.render(p2) --[[ Line: 111 ]]
		-- upvalues: ReactModule (upval), NavigationFocusEventsModule (upval), p1 (copy), Object (upval), NavigationConfig (copy)
		local Navigation = p2.props.navigation
		local Descriptors = p2.state.descriptors
		local TransitioningDescriptors = p2.state.transitioningDescriptors
		
		return ReactModule.createElement(ReactModule.Fragment, {}, {
			Events = ReactModule.createElement(NavigationFocusEventsModule, {
				navigation = Navigation,
				onEvent = function(p3, p4, p5) --[[ Line: 121 ]]
					-- upvalues: Descriptors (copy), TransitioningDescriptors (copy)
					if Descriptors[p3] then
						Descriptors[p3].navigation.emit(p4, p5)
						
						return
					end
					if TransitioningDescriptors[p3] then
						TransitioningDescriptors[p3].navigation.emit(p4, p5)
					end
				end
			}),
			View = ReactModule.createElement(p1, Object.assign(table.clone(p2.props), {
				screenProps = p2.state.screenProps,
				navigation = Navigation,
				navigationConfig = NavigationConfig,
				descriptors = Descriptors
			}))
		})
	end
	
	return Navigator
end