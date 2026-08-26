local parent = script.Parent
local reactModule = require(parent.Parent.Parent.React)
local navigationContextModule = require(parent.NavigationContext)
local sceneView = reactModule.PureComponent:extend("SceneView")

function sceneView.render(p1)
	-- upvalues: reactModule (ref), navigationContextModule (ref)
	local navigation = p1.props.navigation
	
	return reactModule.createElement(navigationContextModule.Provider, { value = navigation }, {
		Scene = reactModule.createElement(p1.props.component, {
			screenProps = p1.props.screenProps,
			navigation = navigation
		})
	})
end

return sceneView