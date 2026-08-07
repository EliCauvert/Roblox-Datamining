-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:03 2026 Pacific Standard Time.

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