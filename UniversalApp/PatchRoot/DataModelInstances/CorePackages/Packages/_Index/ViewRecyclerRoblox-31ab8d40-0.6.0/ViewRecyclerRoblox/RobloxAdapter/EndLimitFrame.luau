local ViewRecyclerRoblox = script:FindFirstAncestor("ViewRecyclerRoblox")
local TransparentFrameModule = require(ViewRecyclerRoblox.RobloxAdapter.transparentFrame)
local Axis = require(ViewRecyclerRoblox.Parent.ViewRecycler).Axis

return {
	new = function() --[[ Line: 20 ]]
		-- upvalues: TransparentFrameModule (copy), Axis (copy)
		local ViewRecyclerEndLimit = TransparentFrameModule("ViewRecyclerEndLimit")
		local Spacer = TransparentFrameModule("Spacer")
		Spacer.Parent = ViewRecyclerEndLimit
		
		return {
			instance = ViewRecyclerEndLimit,
			place = function(Parent, X, p1, XOffset, ZIndex) --[[ Line: 27 ]]
				-- upvalues: Axis (upval), ViewRecyclerEndLimit (copy), Spacer (copy)
				local Largest = math.max(0, XOffset - p1)
				
				if X == Axis.X then
					ViewRecyclerEndLimit.AnchorPoint = Vector2.xAxis
					ViewRecyclerEndLimit.Position = UDim2.fromOffset(XOffset, 0)
					ViewRecyclerEndLimit.Size = UDim2.fromScale(0, 1)
					ViewRecyclerEndLimit.AutomaticSize = Enum.AutomaticSize.X
					Spacer.Size = UDim2.fromOffset(Largest, 0)
				else
					ViewRecyclerEndLimit.AnchorPoint = Vector2.yAxis
					ViewRecyclerEndLimit.Position = UDim2.fromOffset(0, XOffset)
					ViewRecyclerEndLimit.Size = UDim2.fromScale(1, 0)
					ViewRecyclerEndLimit.AutomaticSize = Enum.AutomaticSize.Y
					Spacer.Size = UDim2.fromOffset(0, Largest)
				end
				ViewRecyclerEndLimit.ZIndex = ZIndex
				ViewRecyclerEndLimit.Parent = Parent
			end,
			destroy = function() --[[ Line: 45 ]]
				-- upvalues: ViewRecyclerEndLimit (copy)
				ViewRecyclerEndLimit:Destroy()
			end
		}
	end
}