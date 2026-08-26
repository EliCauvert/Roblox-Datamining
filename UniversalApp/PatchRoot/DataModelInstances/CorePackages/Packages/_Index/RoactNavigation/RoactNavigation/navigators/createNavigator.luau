local parent = script.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local luauPolyfillModule = require(parent_1.LuauPolyfill)
local object = luauPolyfillModule.Object
local array = luauPolyfillModule.Array
local invariantModule = require(parent.utils.invariant)
local navigationFocusEventsModule = require(parent.views.NavigationFocusEvents)

return function(p1, p2, p3)
	-- upvalues: reactModule (ref), invariantModule (ref), array (ref), object (ref), navigationFocusEventsModule (ref)
	local navigator = reactModule.Component:extend("Navigator")
	navigator.router = p2
	navigator.navigationOptions = p3.navigationOptions
	
	function navigator.init(p4)
		p4.state = {
			descriptors = {},
			transitioningDescriptors = {},
			screenProps = p4.props.screenProps
		}
	end
	
	function navigator.getDerivedStateFromProps(p4, p5)
		-- upvalues: invariantModule (copy), array (copy), p2 (ref), object (copy)
		local descriptors = p5.descriptors
		local transitioningDescriptors = p5.transitioningDescriptors
		local navigation = p4.navigation
		local screenProps = p4.screenProps
		invariantModule(navigation ~= nil, "The navigation prop is missing for this navigator. In react-navigation v3 and v4 you must set up your app container directly. More info: https://reactnavigation.org/docs/en/app-containers.html")
		local routes = navigation.state.routes
		invariantModule(type(routes) == "table", "No \"routes\" found in navigation state. Did you try to pass the navigation prop of a React component to a Navigator child? See https://reactnavigation.org/docs/en/custom-navigators.html#navigator-navigation-prop")
		
		return {
			descriptors = array.reduce(routes, function(p6, p7)
				-- upvalues: descriptors (ref), screenProps (ref), p5 (ref), p2 (copy), navigation (ref)
				if descriptors and descriptors[p7.key] and (p7 == descriptors[p7.key].state and screenProps == p5.screenProps) then
					p6[p7.key] = descriptors[p7.key]
					
					return p6
				end
				local childNavigation = navigation.getChildNavigation(p7.key)
				p6[p7.key] = {
					key = p7.key,
					getComponent = function()
						-- upvalues: p2 (copy), p7 (ref)
						return p2.getComponentForRouteName(p7.routeName)
					end,
					options = p2.getScreenOptions(childNavigation, screenProps),
					state = p7,
					navigation = childNavigation
				}
				
				return p6
			end, {}),
			transitioningDescriptors = if navigation.state.isTransitioning then object.assign({}, transitioningDescriptors, descriptors, array.reduce(routes, function(p6, p7)
				-- upvalues: object (copy)
				p6[p7.key] = object.None
				
				return p6
			end, {})) else {},
			screenProps = screenProps
		}
	end
	
	function navigator.render(p4)
		-- upvalues: reactModule (copy), navigationFocusEventsModule (copy), p1 (ref), object (copy), p3 (ref)
		local navigation = p4.props.navigation
		local screenProps = p4.state.screenProps
		local descriptors = p4.state.descriptors
		local transitioningDescriptors = p4.state.transitioningDescriptors
		
		return reactModule.createElement(reactModule.Fragment, {}, {
			Events = reactModule.createElement(navigationFocusEventsModule, {
				navigation = navigation,
				onEvent = function(p5, p6, p7)
					-- upvalues: descriptors (ref), transitioningDescriptors (ref)
					if descriptors[p5] then
						descriptors[p5].navigation.emit(p6, p7)
						
						return
					elseif transitioningDescriptors[p5] then
						transitioningDescriptors[p5].navigation.emit(p6, p7)
					end
				end
			}),
			View = reactModule.createElement(p1, object.assign(table.clone(p4.props), {
				screenProps = screenProps,
				navigation = navigation,
				navigationConfig = p3,
				descriptors = descriptors
			}))
		})
	end
	
	return navigator
end