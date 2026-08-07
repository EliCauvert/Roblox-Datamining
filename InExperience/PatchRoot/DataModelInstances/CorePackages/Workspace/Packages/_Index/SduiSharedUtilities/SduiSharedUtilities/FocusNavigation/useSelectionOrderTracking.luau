local reactModule = require(script:FindFirstAncestor("SduiSharedUtilities").Parent.React)

return function(p0) --[[ line: 8 | named "useSelectionOrderTracking" ]]
	-- upvalues: reactModule (ref)
	reactModule.useEffect(function() --[[ line: 9 ]]
		-- upvalues: p0 (ref)
		local current = p0.current
		
		if current then
			local var1 = -1
			local selectionChangedConnection = current.SelectionChanged:Connect(function(_, p1, p2) --[[ line: 17 ]]
				-- upvalues: current (ref), var1 (write)
				if p2 == nil or p1 == nil or (not p2:IsDescendantOf(current) or not p1:IsDescendantOf(current)) then
					return
				end
				p2.SelectionOrder = var1
				var1 -= 1
			end)
			
			return function() --[[ line: 31 ]]
				-- upvalues: selectionChangedConnection (ref)
				selectionChangedConnection:Disconnect()
			end
		end
	end, {})
end