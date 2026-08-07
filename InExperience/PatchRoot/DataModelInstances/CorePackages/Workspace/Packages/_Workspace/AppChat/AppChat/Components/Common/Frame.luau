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

return function(p0) --[[ line: 36 | named "Frame" ]]
	-- upvalues: reactModule (ref), t (ref)
	local var2, var3 = reactModule.useMemo(function() --[[ line: 37 ]]
		-- upvalues: p0 (ref), t (copy)
		if p0.horizontalAlignment and p0.verticalAlignment then
			return t[p0.horizontalAlignment][p0.verticalAlignment].anchor, t[p0.horizontalAlignment][p0.verticalAlignment].position
		end
		return nil, nil
	end, { p0.horizontalAlignment, p0.verticalAlignment })
	
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		AnchorPoint = p0.AnchorPoint or var2,
		BackgroundColor3 = p0.BackgroundColor3,
		BackgroundTransparency = p0.BackgroundTransparency or 1,
		ClipsDescendants = p0.ClipsDescendants,
		LayoutOrder = p0.LayoutOrder,
		Position = p0.Position or var3,
		Size = p0.Size or UDim2.fromScale(1, 1),
		ZIndex = p0.ZIndex,
		children = p0.children
	})
end