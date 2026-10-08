local viewRecyclerRoblox = script:FindFirstAncestor("ViewRecyclerRoblox")
local transparentFrameModule = require(viewRecyclerRoblox.RobloxAdapter.transparentFrame)
local axis = require(viewRecyclerRoblox.Parent.ViewRecycler).Axis

return {
	new = function()
		-- upvalues: transparentFrameModule (ref), axis (ref)
		local var1 = transparentFrameModule("ViewRecyclerEndLimit")
		local var2 = transparentFrameModule("Spacer")
		var2.Parent = var1
		
		return {
			instance = var1,
			place = function(p1, p2, p3, p4, p5)
				-- upvalues: axis (copy), var1 (ref), var2 (ref)
				local maxValue = math.max(0, p4 - p3)
				
				if p2 == axis.X then
					var1.AnchorPoint = Vector2.xAxis
					var1.Position = UDim2.fromOffset(p4, 0)
					var1.Size = UDim2.fromScale(0, 1)
					var1.AutomaticSize = Enum.AutomaticSize.X
					var2.Size = UDim2.fromOffset(maxValue, 0)
				else
					var1.AnchorPoint = Vector2.yAxis
					var1.Position = UDim2.fromOffset(0, p4)
					var1.Size = UDim2.fromScale(1, 0)
					var1.AutomaticSize = Enum.AutomaticSize.Y
					var2.Size = UDim2.fromOffset(0, maxValue)
				end
				var1.ZIndex = p5
				var1.Parent = p1
			end,
			destroy = function()
				-- upvalues: var1 (ref)
				var1:Destroy()
			end
		}
	end
}