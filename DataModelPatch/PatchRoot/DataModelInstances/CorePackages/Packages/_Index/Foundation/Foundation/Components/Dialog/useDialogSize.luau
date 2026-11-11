local ReactModule = require(script:FindFirstAncestor("Foundation").Parent.React)

return function(p1)
	-- upvalues: ReactModule (copy)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(Vector2.new(0, 0))
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseBindingResult2 (copy)
		local Current = p1.current
		
		if not Current then return end
		local function updateDialogSize()
			-- upvalues: Current (copy), UseBindingResult2 (upval)
			local AbsoluteSize = Current.AbsoluteSize
			
			if AbsoluteSize.X ~= 0 and AbsoluteSize.Y ~= 0 then
				UseBindingResult2(AbsoluteSize)
				
				return
			end
		end
		
		local AbsoluteSize = Current.AbsoluteSize
		
		if AbsoluteSize.X ~= 0 and AbsoluteSize.Y ~= 0 then
			UseBindingResult2(AbsoluteSize)
		end
		local Connection = Current:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateDialogSize)
		
		return function()
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, {})
	
	return UseBindingResult
end