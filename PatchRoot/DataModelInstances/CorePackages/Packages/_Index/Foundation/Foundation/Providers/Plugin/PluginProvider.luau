-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:27 2026 Pacific Standard Time.

local reactModule = require(script:FindFirstAncestor("Foundation").Parent.React)
local pluginContextModule = require(script.Parent.PluginContext)

return function(p0) --[[ line: 13 | named "PluginProvider" ]]
	-- upvalues: reactModule (ref), pluginContextModule (ref)
	return reactModule.createElement(pluginContextModule.Provider, { value = p0.plugin or reactModule.None }, p0.children)
end