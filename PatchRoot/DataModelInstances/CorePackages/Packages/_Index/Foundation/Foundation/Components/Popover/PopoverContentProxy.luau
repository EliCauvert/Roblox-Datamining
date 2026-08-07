-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:07 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local contentModule = require(script.Parent.Content)
local contentPluginModule = require(script.Parent.ContentPlugin)
local isPluginSecurityModule = require(foundation.Utility.isPluginSecurity)
local usePluginModule = require(foundation.Providers.Plugin.usePlugin)

return reactModule.forwardRef(function(p0, p1) --[[ line: 13 | named "PopoverContentProxy" ]]
	-- upvalues: usePluginModule (ref), isPluginSecurityModule (ref), reactModule (ref), contentPluginModule (ref), contentModule (ref)
	local _, var6 = usePluginModule()
	local var7 = p0
	
	if p1 then
		var7 = table.clone(p0)
		var7.ref = p1
	end
	return if isPluginSecurityModule() and var6 then reactModule.createElement(contentPluginModule, var7) else reactModule.createElement(contentModule, var7)
end)