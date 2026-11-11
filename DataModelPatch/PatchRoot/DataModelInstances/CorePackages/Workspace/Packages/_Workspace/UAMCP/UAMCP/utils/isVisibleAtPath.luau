local ResolveInstanceModule = require(script.Parent.resolveInstance)

return function(p1)
	-- upvalues: ResolveInstanceModule (copy)
	local ResolveInstanceModuleResult = ResolveInstanceModule(p1)
	
	return if ResolveInstanceModuleResult and ResolveInstanceModuleResult:IsA("GuiObject") then ResolveInstanceModuleResult.Visible else false
end