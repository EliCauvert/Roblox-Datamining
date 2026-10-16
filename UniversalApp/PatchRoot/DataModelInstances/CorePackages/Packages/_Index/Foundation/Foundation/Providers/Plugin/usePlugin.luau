local ReactModule = require(script:FindFirstAncestor("Foundation").Parent.React)
local UseContextFunction = ReactModule.useContext
local PluginContextModule = require(script.Parent.PluginContext)
local IsPluginElevatedModule = require(script.Parent.isPluginElevated)

return function() --[[ Line: 10 | Named "usePlugin" ]]
	-- upvalues: UseContextFunction (copy), PluginContextModule (copy), ReactModule (copy), IsPluginElevatedModule (copy)
	local UseContextResult = UseContextFunction(PluginContextModule)
	
	if UseContextResult and UseContextResult ~= ReactModule.None then
		return UseContextResult, IsPluginElevatedModule(UseContextResult)
	else
		return nil, false
	end
end