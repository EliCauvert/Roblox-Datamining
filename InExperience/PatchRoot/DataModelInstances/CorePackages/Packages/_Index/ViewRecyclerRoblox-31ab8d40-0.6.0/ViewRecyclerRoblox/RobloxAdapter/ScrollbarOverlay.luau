local viewRecyclerModule = require(script:FindFirstAncestor("ViewRecyclerRoblox").Parent.ViewRecycler)

return {
	connect = function(p1, p2, p3)
		-- upvalues: viewRecyclerModule (ref)
		local var1 = false
		
		local function synchronize()
			-- upvalues: var1 (write), p1 (ref), p2 (ref), p3 (ref), viewRecyclerModule (copy)
			if var1 then return end
			local scrollBarThickness = p1.ScrollBarThickness
			p2.Position = UDim2.fromOffset(if p3 == viewRecyclerModule.Axis.Y and p1.VerticalScrollBarPosition == Enum.VerticalScrollBarPosition.Left then scrollBarThickness else 0, 0)
			p2.Size = if p3 == viewRecyclerModule.Axis.X then UDim2.new(1, 0, 1, -scrollBarThickness) else UDim2.new(1, -scrollBarThickness, 1, 0)
		end
		
		synchronize()
		local var2 = p1:GetPropertyChangedSignal("ScrollBarThickness"):Connect(synchronize)
		local var3 = p1:GetPropertyChangedSignal("VerticalScrollBarPosition"):Connect(synchronize)
		
		return function()
			-- upvalues: var1 (write), var2 (ref), var3 (ref)
			if var1 then
				return
			end
			var1 = true
			var2:Disconnect()
			var3:Disconnect()
		end
	end
}