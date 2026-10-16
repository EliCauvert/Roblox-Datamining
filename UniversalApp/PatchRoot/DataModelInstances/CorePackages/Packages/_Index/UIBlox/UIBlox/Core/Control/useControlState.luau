local Parent = script.Parent.Parent
local ReactModule = require(Parent.Parent.Parent.React)
local ControlStateModule = require(Parent.Control.Enum.ControlState)

return function() --[[ Line: 20 | Named "useControlState" ]]
	-- upvalues: ReactModule (copy), ControlStateModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(ControlStateModule.Initialize)
	
	return UseStateResult, (ReactModule.useCallback(function(_, p1) --[[ Line: 23 ]]
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(p1)
	end, {}))
end