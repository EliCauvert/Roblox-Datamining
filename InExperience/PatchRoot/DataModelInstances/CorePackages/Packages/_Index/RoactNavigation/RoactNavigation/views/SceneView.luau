local parent = script.Parent
local reactModule = require(parent.Parent.Parent.React)
local navigationContextModule = require(parent.NavigationContext)
local sceneView = reactModule.PureComponent:extend("SceneView")

function sceneView.render(p0) --[[ line: 11 ]]
	-- upvalues: reactModule (ref), navigationContextModule (ref)
	local navigation = p0.props.navigation
	
	return reactModule.createElement(navigationContextModule.Provider, { value = navigation }, {
		Scene = reactModule.createElement(p0.props.component, {
			screenProps = p0.props.screenProps,
			navigation = navigation
		})
	})
end

return sceneView