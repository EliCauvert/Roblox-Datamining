local ReactModule = require(script:FindFirstAncestor("AppChat").Parent.React)
local config = {
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

return function(Frame: Frame)
	-- upvalues: ReactModule (copy), config (copy)
	local UseMemoResult, UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: Frame (copy), config (upval)
		if Frame.horizontalAlignment and Frame.verticalAlignment then
			return config[Frame.horizontalAlignment][Frame.verticalAlignment].anchor, config[Frame.horizontalAlignment][Frame.verticalAlignment].position
		else
			return nil, nil
		end
	end, { Frame.horizontalAlignment, Frame.verticalAlignment })
	
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		AnchorPoint = Frame.AnchorPoint or UseMemoResult,
		BackgroundColor3 = Frame.BackgroundColor3,
		BackgroundTransparency = Frame.BackgroundTransparency or 1,
		ClipsDescendants = Frame.ClipsDescendants,
		LayoutOrder = Frame.LayoutOrder,
		Position = Frame.Position or UseMemoResult2,
		Size = Frame.Size or UDim2.fromScale(1, 1),
		ZIndex = Frame.ZIndex,
		children = Frame.children
	})
end