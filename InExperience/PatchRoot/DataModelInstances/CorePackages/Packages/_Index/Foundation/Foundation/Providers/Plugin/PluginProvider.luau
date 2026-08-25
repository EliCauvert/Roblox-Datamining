local reactModule = require(script:FindFirstAncestor("Foundation").Parent.React)
local pluginContextModule = require(script.Parent.PluginContext)

return function(p0)
	-- upvalues: reactModule (ref), pluginContextModule (ref)
	return reactModule.createElement(pluginContextModule.Provider, { value = p0.plugin or reactModule.None }, p0.children)
end