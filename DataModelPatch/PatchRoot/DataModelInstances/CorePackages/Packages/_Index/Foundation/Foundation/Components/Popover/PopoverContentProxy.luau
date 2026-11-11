local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local ContentModule = require(script.Parent.Content)
local ContentPluginModule = require(script.Parent.ContentPlugin)
local FlagsModule = require(Foundation.Utility.Flags)
local IsPluginSecurityModule = require(Foundation.Utility.isPluginSecurity)
local UsePluginModule = require(Foundation.Providers.Plugin.usePlugin)

return ReactModule.forwardRef(function(Tbl, Ref)
	-- upvalues: UsePluginModule (copy), FlagsModule (copy), IsPluginSecurityModule (copy), ReactModule (copy), ContentPluginModule (copy), ContentModule (copy)
	local _, UsePluginModuleResult2 = UsePluginModule()
	local Tbl1 = Tbl
	
	if Ref then
		Tbl1 = table.clone(Tbl)
		Tbl1.ref = Ref
	end
	local FoundationPopoverPluginSupport = FlagsModule.FoundationPopoverPluginSupport
	
	if FlagsModule.FoundationPopoverPluginSecurityGate then
		FoundationPopoverPluginSupport = FoundationPopoverPluginSupport and IsPluginSecurityModule()
	end
	return if FoundationPopoverPluginSupport and UsePluginModuleResult2 then ReactModule.createElement(ContentPluginModule, Tbl1) else ReactModule.createElement(ContentModule, Tbl1)
end)