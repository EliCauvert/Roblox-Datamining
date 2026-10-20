local ReactModule = require(script:FindFirstAncestor("Foundation").Parent.React)
local PluginContextModule = require(script.Parent.PluginContext)

return function(p1)
	-- upvalues: ReactModule (copy), PluginContextModule (copy)
	return ReactModule.createElement(PluginContextModule.Provider, { value = p1.plugin or ReactModule.None }, p1.children)
end