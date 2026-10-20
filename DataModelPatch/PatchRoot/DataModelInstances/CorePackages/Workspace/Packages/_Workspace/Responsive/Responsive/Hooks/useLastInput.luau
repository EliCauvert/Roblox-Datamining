local Responsive = script:FindFirstAncestor("Responsive")
local ReactModule = require(Responsive.Parent.React)
local InputModeModule = require(Responsive.InputMode)

return function()
	-- upvalues: ReactModule (copy), InputModeModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(InputModeModule.last)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2 (copy), InputModeModule (upval)
		UseStateResult2(InputModeModule.last)
		local ConnectResult = InputModeModule.connect(function()
			-- upvalues: UseStateResult2 (upval), InputModeModule (upval)
			UseStateResult2(InputModeModule.last)
		end)
		
		return function()
			-- upvalues: ConnectResult (copy)
			ConnectResult:disconnect()
		end
	end, {})
	
	return UseStateResult or ""
end