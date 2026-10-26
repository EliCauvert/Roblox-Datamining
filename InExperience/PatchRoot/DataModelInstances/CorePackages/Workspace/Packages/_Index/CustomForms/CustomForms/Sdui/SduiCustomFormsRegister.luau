local CustomForms = script:FindFirstAncestor("CustomForms")
local ReactModule = require(CustomForms.Parent.React)
local RegisterCustomFormsFunction = require(CustomForms.Sdui.registerCustomForms).registerCustomForms

return ReactModule.memo(function()
	-- upvalues: ReactModule (copy), RegisterCustomFormsFunction (copy)
	ReactModule.useEffect(function()
		-- upvalues: RegisterCustomFormsFunction (upval)
		RegisterCustomFormsFunction()
	end, {})
	
	return nil
end)