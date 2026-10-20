local ViewRecyclerModule = require(script:FindFirstAncestor("ViewRecyclerRoblox").Parent.ViewRecycler)

return {
	connect = function(Object, p1, X)
		-- upvalues: ViewRecyclerModule (copy)
		local Flag = false
		
		local function synchronize()
			-- upvalues: Flag (ref), Object (copy), p1 (copy), X (copy), ViewRecyclerModule (upval)
			if not Flag then
				local ScrollBarThickness = Object.ScrollBarThickness
				p1.Position = UDim2.fromOffset(if X == ViewRecyclerModule.Axis.Y and Object.VerticalScrollBarPosition == Enum.VerticalScrollBarPosition.Left then ScrollBarThickness else 0, 0)
				p1.Size = if X == ViewRecyclerModule.Axis.X then UDim2.new(1, 0, 1, -ScrollBarThickness) else UDim2.new(1, -ScrollBarThickness, 1, 0)
				
				return
			end
		end
		
		synchronize()
		local Connection = Object:GetPropertyChangedSignal("ScrollBarThickness"):Connect(synchronize)
		local Connection1 = Object:GetPropertyChangedSignal("VerticalScrollBarPosition"):Connect(synchronize)
		
		return function()
			-- upvalues: Flag (ref), Connection (copy), Connection1 (copy)
			if not Flag then
				Flag = true
				Connection:Disconnect()
				Connection1:Disconnect()
				
				return
			end
		end
	end
}