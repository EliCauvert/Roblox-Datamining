local reactModule = require(script:FindFirstAncestor("AppChat").Parent.React)
local t = {
	[Enum.HorizontalAlignment.Center] = {
		[Enum.VerticalAlignment.Center] = {
			anchor = Vector2.new(0.5, 0.5),
			position = UDim2.fromScale(0.5, 0.5)
		},
		[Enum.VerticalAlignment.Top] = {
			anchor = Vector2.new(0.5, 0),
			position = UDim2.fromScale(0.5, 0)
		},
		[Enum.VerticalAlignment.Bottom] = {
			anchor = Vector2.new(0.5, 1),
			position = UDim2.fromScale(0.5, 1)
		}
	},
	[Enum.HorizontalAlignment.Left] = {
		[Enum.VerticalAlignment.Center] = {
			anchor = Vector2.new(0, 0.5),
			position = UDim2.fromScale(0, 0.5)
		},
		[Enum.VerticalAlignment.Top] = {
			anchor = Vector2.new(0, 0),
			position = UDim2.fromScale(0, 0)
		},
		[Enum.VerticalAlignment.Bottom] = {
			anchor = Vector2.new(0, 1),
			position = UDim2.fromScale(0, 1)
		}
	},
	[Enum.HorizontalAlignment.Right] = {
		[Enum.VerticalAlignment.Center] = {
			anchor = Vector2.new(1, 0.5),
			position = UDim2.fromScale(1, 0.5)
		},
		[Enum.VerticalAlignment.Top] = {
			anchor = Vector2.new(1, 0),
			position = UDim2.fromScale(1, 0)
		},
		[Enum.VerticalAlignment.Bottom] = {
			anchor = Vector2.new(1, 1),
			position = UDim2.fromScale(1, 1)
		}
	}
}

return function(p1)
	-- upvalues: reactModule (ref), t (ref)
	local var1, var2 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), t (copy)
		if p1.horizontalAlignment and p1.verticalAlignment then
			return t[p1.horizontalAlignment][p1.verticalAlignment].anchor, t[p1.horizontalAlignment][p1.verticalAlignment].position
		end
		return nil, nil
	end, { p1.horizontalAlignment, p1.verticalAlignment })
	
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		AnchorPoint = p1.AnchorPoint or var1,
		BackgroundColor3 = p1.BackgroundColor3,
		BackgroundTransparency = p1.BackgroundTransparency or 1,
		ClipsDescendants = p1.ClipsDescendants,
		LayoutOrder = p1.LayoutOrder,
		Position = p1.Position or var2,
		Size = p1.Size or UDim2.fromScale(1, 1),
		ZIndex = p1.ZIndex,
		children = p1.children
	})
end