local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local contentModule = require(script.Parent.Content)
local contentPluginModule = require(script.Parent.ContentPlugin)
local flagsModule = require(foundation.Utility.Flags)
local isPluginSecurityModule = require(foundation.Utility.isPluginSecurity)
local usePluginModule = require(foundation.Providers.Plugin.usePlugin)

return reactModule.forwardRef(function(p0, p1) --[[ line: 14 | named "PopoverContentProxy" ]]
	-- upvalues: usePluginModule (ref), flagsModule (ref), isPluginSecurityModule (ref), reactModule (ref), contentPluginModule (ref), contentModule (ref)
	local _, var7 = usePluginModule()
	local var8 = p0
	
	if p1 then
		var8 = table.clone(p0)
		var8.ref = p1
	end
	local foundationPopoverPluginSupport = flagsModule.FoundationPopoverPluginSupport
	
	if flagsModule.FoundationPopoverPluginSecurityGate then
		foundationPopoverPluginSupport = foundationPopoverPluginSupport and isPluginSecurityModule()
	end
	return if foundationPopoverPluginSupport and var7 then reactModule.createElement(contentPluginModule, var8) else reactModule.createElement(contentModule, var8)
end)