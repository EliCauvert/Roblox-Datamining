local ReactModule = require(script.Parent.Parent.Parent.React)

return function(Callback) --[[ Line: 11 | Named "useInteraction" ]]
	-- upvalues: ReactModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	
	return {
		onInputBegan = function(_, Input) --[[ Line: 16 ]]
			-- upvalues: UseStateResult2 (copy)
			if Input.UserInputType == Enum.UserInputType.MouseButton1 then
				UseStateResult2(true)
			end
		end,
		onInputEnded = function(_, Input) --[[ Line: 22 ]]
			-- upvalues: UseStateResult (copy), UseStateResult1 (copy), Callback (copy), UseStateResult2 (copy)
			if Input.UserInputType == Enum.UserInputType.MouseButton1 then
				if UseStateResult and UseStateResult1 then
					Callback()
				end
				UseStateResult2(false)
			end
		end,
		onMouseEnter = function() --[[ Line: 31 ]]
			-- upvalues: UseStateResult2_1 (copy)
			UseStateResult2_1(true)
		end,
		onMouseLeave = function() --[[ Line: 35 ]]
			-- upvalues: UseStateResult2_1 (copy), UseStateResult2 (copy)
			UseStateResult2_1(false)
			UseStateResult2(false)
		end
	}, UseStateResult, UseStateResult1
end