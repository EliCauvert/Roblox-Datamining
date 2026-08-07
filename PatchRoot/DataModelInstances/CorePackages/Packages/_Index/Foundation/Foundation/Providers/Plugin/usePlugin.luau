-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:27 2026 Pacific Standard Time.

local reactModule = require(script:FindFirstAncestor("Foundation").Parent.React)
local useContext = reactModule.useContext
local pluginContextModule = require(script.Parent.PluginContext)
local isPluginElevatedModule = require(script.Parent.isPluginElevated)

return function() --[[ line: 10 | named "usePlugin" ]]
	-- upvalues: useContext (ref), pluginContextModule (ref), reactModule (ref), isPluginElevatedModule (ref)
	local var3 = useContext(pluginContextModule)
	
	if var3 and var3 ~= reactModule.None then
		return var3, isPluginElevatedModule(var3)
	end
	return nil, false
end