local ReactModule = require(script:FindFirstAncestor("SduiSharedUtilities").Parent.React)

return function(p1)
	-- upvalues: ReactModule (copy)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy)
		local Current = p1.current
		
		if not Current then return end
		local SelectionOrder = -1
		local SelectionChangedConnection = Current.SelectionChanged:Connect(function(_, Object, Object1)
			-- upvalues: Current (copy), SelectionOrder (ref)
			if Object1 ~= nil and Object ~= nil and Object1:IsDescendantOf(Current) and Object:IsDescendantOf(Current) then
				Object1.SelectionOrder = SelectionOrder
				SelectionOrder -= 1
				
				return
			end
		end)
		
		return function()
			-- upvalues: SelectionChangedConnection (copy)
			SelectionChangedConnection:Disconnect()
		end
	end, {})
end