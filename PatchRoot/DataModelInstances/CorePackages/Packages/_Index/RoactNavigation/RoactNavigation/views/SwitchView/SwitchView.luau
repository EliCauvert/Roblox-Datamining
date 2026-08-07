-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:03 2026 Pacific Standard Time.

local reactModule = require(script.Parent.Parent.Parent.Parent.React)
local sceneViewModule = require(script.Parent.Parent.SceneView)

return function(p0) --[[ line: 8 | named "SwitchView" ]]
	-- upvalues: reactModule (ref), sceneViewModule (ref)
	local state = p0.navigation.state
	local key = p0.descriptors[state.routes[state.index].key]
	
	return reactModule.createElement(sceneViewModule, {
		component = key.getComponent(),
		navigation = key.navigation,
		screenProps = p0.screenProps
	})
end