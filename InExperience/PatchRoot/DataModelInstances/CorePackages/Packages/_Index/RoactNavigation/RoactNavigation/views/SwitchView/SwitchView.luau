local reactModule = require(script.Parent.Parent.Parent.Parent.React)
local sceneViewModule = require(script.Parent.Parent.SceneView)

return function(p1)
	-- upvalues: reactModule (ref), sceneViewModule (ref)
	local state = p1.navigation.state
	local key = p1.descriptors[state.routes[state.index].key]
	
	return reactModule.createElement(sceneViewModule, {
		component = key.getComponent(),
		navigation = key.navigation,
		screenProps = p1.screenProps
	})
end