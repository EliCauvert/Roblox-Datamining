local reactModule = require(script.Parent.Parent.Parent.React)

return function(p1)
	-- upvalues: reactModule (ref)
	local var1, var2 = reactModule.useState(false)
	local var3, var4 = reactModule.useState(false)
	
	return {
		onInputBegan = function(_, p2)
			-- upvalues: var2 (ref)
			if p2.UserInputType == Enum.UserInputType.MouseButton1 then
				var2(true)
			end
		end,
		onInputEnded = function(_, p2)
			-- upvalues: var1 (ref), var3 (ref), p1 (ref), var2 (ref)
			if p2.UserInputType == Enum.UserInputType.MouseButton1 then
				if var1 and var3 then
					p1()
				end
				var2(false)
			end
		end,
		onMouseEnter = function()
			-- upvalues: var4 (ref)
			var4(true)
		end,
		onMouseLeave = function()
			-- upvalues: var4 (ref), var2 (ref)
			var4(false)
			var2(false)
		end
	}, var1, var3
end