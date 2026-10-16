local Responsive = script:FindFirstAncestor("Responsive")
local ReactModule = require(Responsive.Parent.React)
local InputModeModule = require(Responsive.InputMode)

return function() --[[ Line: 6 | Named "usePreferredInput" ]]
	-- upvalues: ReactModule (copy), InputModeModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(InputModeModule.preferred)
	ReactModule.useEffect(function() --[[ Line: 8 ]]
		-- upvalues: UseStateResult2 (copy), InputModeModule (upval)
		UseStateResult2(InputModeModule.preferred)
		local ConnectResult = InputModeModule.connect(function() --[[ Line: 10 ]]
			-- upvalues: UseStateResult2 (upval), InputModeModule (upval)
			UseStateResult2(InputModeModule.preferred)
		end)
		
		return function() --[[ Line: 13 ]]
			-- upvalues: ConnectResult (copy)
			ConnectResult:disconnect()
		end
	end, {})
	
	return UseStateResult or ""
end