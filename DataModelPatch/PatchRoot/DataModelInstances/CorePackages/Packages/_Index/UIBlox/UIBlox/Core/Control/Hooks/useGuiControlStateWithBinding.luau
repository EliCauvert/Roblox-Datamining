local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.Parent.React)
local ControlStateModule = require(Parent1.Core.Control.Enum.ControlState)
local UseGuiControlStateModule = require(Parent.Control.Hooks.useGuiControlState)

return function(p1, Callback, p2)
	-- upvalues: ReactModule (copy), ControlStateModule (copy), UseGuiControlStateModule (copy)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(ControlStateModule.Initialize)
	local UseGuiControlStateModuleResult, _ = UseGuiControlStateModule(p1, ReactModule.useCallback(function(p3, p4)
		-- upvalues: UseBindingResult2 (copy), Callback (copy)
		UseBindingResult2((tostring(p4)))
		
		if Callback then
			Callback(p3, p4)
		end
	end, {}), p2)
	
	return UseGuiControlStateModuleResult, UseBindingResult
end