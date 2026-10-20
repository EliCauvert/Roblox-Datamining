local ReactModule = require(script.Parent.Parent.Parent.React)

return function(Callback)
	-- upvalues: ReactModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	
	return {
		onInputBegan = function(_, Input)
			-- upvalues: UseStateResult2 (copy)
			if Input.UserInputType == Enum.UserInputType.MouseButton1 then
				UseStateResult2(true)
			end
		end,
		onInputEnded = function(_, Input)
			-- upvalues: UseStateResult (copy), UseStateResult1 (copy), Callback (copy), UseStateResult2 (copy)
			if Input.UserInputType == Enum.UserInputType.MouseButton1 then
				if UseStateResult and UseStateResult1 then
					Callback()
				end
				UseStateResult2(false)
			end
		end,
		onMouseEnter = function()
			-- upvalues: UseStateResult2_1 (copy)
			UseStateResult2_1(true)
		end,
		onMouseLeave = function()
			-- upvalues: UseStateResult2_1 (copy), UseStateResult2 (copy)
			UseStateResult2_1(false)
			UseStateResult2(false)
		end
	}, UseStateResult, UseStateResult1
end