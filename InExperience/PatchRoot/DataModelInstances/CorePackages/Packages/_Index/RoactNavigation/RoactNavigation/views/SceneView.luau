local Parent = script.Parent
local ReactModule = require(Parent.Parent.Parent.React)
local NavigationContextModule = require(Parent.NavigationContext)
local SceneView = ReactModule.PureComponent:extend("SceneView")

function SceneView.render(p1) --[[ Line: 11 ]]
	-- upvalues: ReactModule (copy), NavigationContextModule (copy)
	local Navigation = p1.props.navigation
	
	return ReactModule.createElement(NavigationContextModule.Provider, { value = Navigation }, {
		Scene = ReactModule.createElement(p1.props.component, {
			screenProps = p1.props.screenProps,
			navigation = Navigation
		})
	})
end

return SceneView