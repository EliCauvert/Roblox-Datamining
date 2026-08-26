local reactModule = require(script:FindFirstAncestor("Foundation").Parent.React)
local useContext = reactModule.useContext
local pluginContextModule = require(script.Parent.PluginContext)
local isPluginElevatedModule = require(script.Parent.isPluginElevated)

return function()
	-- upvalues: useContext (ref), pluginContextModule (ref), reactModule (ref), isPluginElevatedModule (ref)
	local var1 = useContext(pluginContextModule)
	
	if var1 and var1 ~= reactModule.None then
		return var1, isPluginElevatedModule(var1)
	end
	return nil, false
end