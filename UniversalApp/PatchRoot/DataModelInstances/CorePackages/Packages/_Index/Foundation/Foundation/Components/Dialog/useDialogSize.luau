local reactModule = require(script:FindFirstAncestor("Foundation").Parent.React)

return function(p1)
	-- upvalues: reactModule (ref)
	local var1, var2 = reactModule.useBinding(Vector2.new(0, 0))
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var2 (ref)
		local current = p1.current
		
		if not current then return end
		local function updateDialogSize()
			-- upvalues: current (ref), var2 (copy)
			local absoluteSize = current.AbsoluteSize
			
			if absoluteSize.X == 0 or absoluteSize.Y == 0 then
				return
			end
			var2(absoluteSize)
		end
		
		local absoluteSize = current.AbsoluteSize
		
		if absoluteSize.X ~= 0 and absoluteSize.Y ~= 0 then
			var2(absoluteSize)
		end
		local var3 = current:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateDialogSize)
		
		return function()
			-- upvalues: var3 (ref)
			var3:Disconnect()
		end
	end, {})
	
	return var1
end