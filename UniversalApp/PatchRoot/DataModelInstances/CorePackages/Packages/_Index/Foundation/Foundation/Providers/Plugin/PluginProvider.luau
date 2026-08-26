local reactModule = require(script:FindFirstAncestor("Foundation").Parent.React)
local pluginContextModule = require(script.Parent.PluginContext)

return function(p1)
	-- upvalues: reactModule (ref), pluginContextModule (ref)
	return reactModule.createElement(pluginContextModule.Provider, { value = p1.plugin or reactModule.None }, p1.children)
end