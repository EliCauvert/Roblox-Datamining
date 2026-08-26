local reactModule = require(script:FindFirstAncestor("SduiSharedUtilities").Parent.React)

return function(p1)
	-- upvalues: reactModule (ref)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref)
		local current = p1.current
		
		if current then
			local var1 = -1
			local selectionChangedConnection = current.SelectionChanged:Connect(function(_, p2, p3)
				-- upvalues: current (ref), var1 (write)
				if p3 == nil or p2 == nil or (not p3:IsDescendantOf(current) or not p2:IsDescendantOf(current)) then
					return
				end
				p3.SelectionOrder = var1
				var1 -= 1
			end)
			
			return function()
				-- upvalues: selectionChangedConnection (ref)
				selectionChangedConnection:Disconnect()
			end
		end
	end, {})
end