local reactModule = require(script:FindFirstAncestor("Foundation").Parent.React)
local useContext = reactModule.useContext
local pluginContextModule = require(script.Parent.PluginContext)
local isPluginElevatedModule = require(script.Parent.isPluginElevated)

return function()
	-- upvalues: useContext (ref), pluginContextModule (ref), reactModule (ref), isPluginElevatedModule (ref)
	local var3 = useContext(pluginContextModule)
	
	if var3 and var3 ~= reactModule.None then
		return var3, isPluginElevatedModule(var3)
	end
	return nil, false
end