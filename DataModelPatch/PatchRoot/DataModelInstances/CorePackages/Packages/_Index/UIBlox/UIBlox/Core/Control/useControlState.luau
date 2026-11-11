local Parent = script.Parent.Parent
local ReactModule = require(Parent.Parent.Parent.React)
local ControlStateModule = require(Parent.Control.Enum.ControlState)

return function()
	-- upvalues: ReactModule (copy), ControlStateModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(ControlStateModule.Initialize)
	
	return UseStateResult, (ReactModule.useCallback(function(_, p1)
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(p1)
	end, {}))
end