-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:00 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local luauPolyfillModule = require(parent_1.LuauPolyfill)
local object = luauPolyfillModule.Object
local array = luauPolyfillModule.Array
local invariantModule = require(parent.utils.invariant)
local navigationFocusEventsModule = require(parent.views.NavigationFocusEvents)

return function(p0, p1, p2) --[[ line: 12 ]]
	-- upvalues: reactModule (ref), invariantModule (ref), array (ref), object (ref), navigationFocusEventsModule (ref)
	local navigator = reactModule.Component:extend("Navigator")
	navigator.router = p1
	navigator.navigationOptions = p2.navigationOptions
	
	function navigator.init(p3) --[[ line: 20 ]]
		p3.state = {
			descriptors = {},
			transitioningDescriptors = {},
			screenProps = p3.props.screenProps
		}
	end
	
	function navigator.getDerivedStateFromProps(p4, p5) --[[ line: 32 ]]
		-- upvalues: invariantModule (copy), array (copy), p1 (ref), object (copy)
		local descriptors = p5.descriptors
		local transitioningDescriptors = p5.transitioningDescriptors
		local navigation = p4.navigation
		local screenProps = p4.screenProps
		invariantModule(navigation ~= nil, "The navigation prop is missing for this navigator. In react-navigation v3 and v4 you must set up your app container directly. More info: https://reactnavigation.org/docs/en/app-containers.html")
		local routes = navigation.state.routes
		invariantModule(type(routes) == "table", "No \"routes\" found in navigation state. Did you try to pass the navigation prop of a React component to a Navigator child? See https://reactnavigation.org/docs/en/custom-navigators.html#navigator-navigation-prop")
		
		return {
			descriptors = array.reduce(routes, function(p6, p7) --[[ line: 55 ]]
				-- upvalues: descriptors (ref), screenProps (ref), p5 (ref), p1 (copy), navigation (ref)
				if descriptors and descriptors[p7.key] and (p7 == descriptors[p7.key].state and screenProps == p5.screenProps) then
					p6[p7.key] = descriptors[p7.key]
					
					return p6
				end
				local childNavigation = navigation.getChildNavigation(p7.key)
				p6[p7.key] = {
					key = p7.key,
					getComponent = function() --[[ line: 65 ]]
						-- upvalues: p1 (copy), p7 (ref)
						return p1.getComponentForRouteName(p7.routeName)
					end,
					options = p1.getScreenOptions(childNavigation, screenProps),
					state = p7,
					navigation = childNavigation
				}
				
				return p6
			end, {}),
			transitioningDescriptors = if navigation.state.isTransitioning then object.assign({}, transitioningDescriptors, descriptors, array.reduce(routes, function(p8, p9) --[[ line: 92 ]]
				-- upvalues: object (copy)
				p8[p9.key] = object.None
				
				return p8
			end, {})) else {},
			screenProps = screenProps
		}
	end
	
	function navigator.render(p10) --[[ line: 111 ]]
		-- upvalues: reactModule (copy), navigationFocusEventsModule (copy), p0 (ref), object (copy), p2 (ref)
		local navigation = p10.props.navigation
		local screenProps = p10.state.screenProps
		local descriptors = p10.state.descriptors
		local transitioningDescriptors = p10.state.transitioningDescriptors
		
		return reactModule.createElement(reactModule.Fragment, {}, {
			Events = reactModule.createElement(navigationFocusEventsModule, {
				navigation = navigation,
				onEvent = function(p11, p12, p13) --[[ line: 121 ]]
					-- upvalues: descriptors (ref), transitioningDescriptors (ref)
					if descriptors[p11] then
						descriptors[p11].navigation.emit(p12, p13)
						
						return
					elseif transitioningDescriptors[p11] then
						transitioningDescriptors[p11].navigation.emit(p12, p13)
					end
				end
			}),
			View = reactModule.createElement(p0, object.assign(table.clone(p10.props), {
				screenProps = screenProps,
				navigation = navigation,
				navigationConfig = p2,
				descriptors = descriptors
			}))
		})
	end
	
	return navigator
end