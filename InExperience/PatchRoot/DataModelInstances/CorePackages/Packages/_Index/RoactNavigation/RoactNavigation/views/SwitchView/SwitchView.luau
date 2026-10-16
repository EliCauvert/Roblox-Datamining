local ReactModule = require(script.Parent.Parent.Parent.Parent.React)
local SceneViewModule = require(script.Parent.Parent.SceneView)

return function(p1) --[[ Line: 8 | Named "SwitchView" ]]
	-- upvalues: ReactModule (copy), SceneViewModule (copy)
	local State = p1.navigation.state
	local Descriptor = p1.descriptors[State.routes[State.index].key]
	
	return ReactModule.createElement(SceneViewModule, {
		component = Descriptor.getComponent(),
		navigation = Descriptor.navigation,
		screenProps = p1.screenProps
	})
end