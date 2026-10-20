local Parent = script:FindFirstAncestor("RobloxAppNavigationCore").Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.Navigation)
local AppCardModule = require(script.Parent.AppCard)

return function(p1)
	-- upvalues: ReactModule (copy), AppCardModule (copy)
	local State = p1.navigation.state
	local Key = State.routes[State.index].key
	local Elements = {}
	
	for Key1, descriptor in p1.descriptors do
		Elements[Key1] = ReactModule.createElement(AppCardModule, {
			isActive = Key1 == Key,
			descriptor = descriptor,
			screenProps = p1.screenProps,
			isVisible = Key1 == Key
		})
	end
	return ReactModule.createElement(ReactModule.Fragment, nil, Elements)
end