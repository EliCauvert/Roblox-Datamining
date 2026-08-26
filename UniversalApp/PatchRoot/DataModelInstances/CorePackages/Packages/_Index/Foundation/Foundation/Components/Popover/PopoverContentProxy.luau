local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local contentModule = require(script.Parent.Content)
local contentPluginModule = require(script.Parent.ContentPlugin)
local isPluginSecurityModule = require(foundation.Utility.isPluginSecurity)
local usePluginModule = require(foundation.Providers.Plugin.usePlugin)

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: usePluginModule (ref), isPluginSecurityModule (ref), reactModule (ref), contentPluginModule (ref), contentModule (ref)
	local _, var1 = usePluginModule()
	local var2 = p1
	
	if p2 then
		var2 = table.clone(p1)
		var2.ref = p2
	end
	return if isPluginSecurityModule() and var1 then reactModule.createElement(contentPluginModule, var2) else reactModule.createElement(contentModule, var2)
end)