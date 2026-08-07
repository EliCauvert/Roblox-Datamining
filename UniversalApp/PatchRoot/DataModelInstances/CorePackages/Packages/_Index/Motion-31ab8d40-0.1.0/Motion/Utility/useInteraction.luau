local reactModule = require(script.Parent.Parent.Parent.React)

return function(p0) --[[ line: 11 | named "useInteraction" ]]
	-- upvalues: reactModule (ref)
	local var1, var2 = reactModule.useState(false)
	local var3, var4 = reactModule.useState(false)
	
	return {
		onInputBegan = function(_, p1) --[[ line: 16 ]]
			-- upvalues: var2 (ref)
			if p1.UserInputType == Enum.UserInputType.MouseButton1 then
				var2(true)
			end
		end,
		onInputEnded = function(_, p2) --[[ line: 22 ]]
			-- upvalues: var1 (ref), var3 (ref), p0 (ref), var2 (ref)
			if p2.UserInputType == Enum.UserInputType.MouseButton1 then
				if var1 and var3 then
					p0()
				end
				var2(false)
			end
		end,
		onMouseEnter = function() --[[ line: 31 ]]
			-- upvalues: var4 (ref)
			var4(true)
		end,
		onMouseLeave = function() --[[ line: 35 ]]
			-- upvalues: var4 (ref), var2 (ref)
			var4(false)
			var2(false)
		end
	}, var1, var3
end