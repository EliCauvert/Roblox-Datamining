local ReactModule = require(script:FindFirstAncestor("ServerDrivenUi").Parent.React)
local config = {
	topLeftSlot = {
		AnchorPoint = Vector2.zero,
		Position = UDim2.fromScale(0, 0)
	},
	topMiddleSlot = {
		AnchorPoint = Vector2.new(0.5, 0),
		Position = UDim2.fromScale(0.5, 0)
	},
	topRightSlot = {
		AnchorPoint = Vector2.new(1, 0),
		Position = UDim2.fromScale(1, 0)
	},
	centerLeftSlot = {
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.fromScale(0, 0.5)
	},
	centerMiddleSlot = {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5)
	},
	centerRightSlot = {
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.fromScale(1, 0.5)
	},
	bottomLeftSlot = {
		AnchorPoint = Vector2.new(0, 1),
		Position = UDim2.fromScale(0, 1)
	},
	bottomMiddleSlot = {
		AnchorPoint = Vector2.new(0.5, 1),
		Position = UDim2.fromScale(0.5, 1)
	},
	bottomRightSlot = {
		AnchorPoint = Vector2.new(1, 1),
		Position = UDim2.fromScale(1, 1)
	}
}

return ReactModule.memo(function(Frames)
	-- upvalues: ReactModule (copy), config (copy)
	local Padding = Frames.padding or 0
	
	return ReactModule.createElement("Frame", {
		LayoutOrder = Frames.layoutOrder,
		AnchorPoint = Frames.anchorPoint,
		AutomaticSize = Frames.automaticSize,
		Size = Frames.size or UDim2.new(1, 0, 1, 0),
		Position = Frames.position,
		BackgroundTransparency = 1,
		[ReactModule.Tag] = "data-testid=--sdui-slot-overlay"
	}, (ReactModule.useMemo(function()
		-- upvalues: ReactModule (upval), Padding (copy), config (upval), Frames (copy)
		local config1 = {
			UIPadding = ReactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, Padding),
				PaddingTop = UDim.new(0, Padding),
				PaddingRight = UDim.new(0, Padding),
				PaddingBottom = UDim.new(0, Padding)
			})
		}
		
		for i, Frame in config do
			if Frames[i] ~= nil then
				config1[i] = ReactModule.createElement("Frame", {
					AnchorPoint = Frame.AnchorPoint,
					AutomaticSize = Enum.AutomaticSize.XY,
					Position = Frame.Position,
					BackgroundTransparency = 1,
					Size = UDim2.new(0, 0, 0, 0),
					[ReactModule.Tag] = `data-testid=--sdui-slot-{i}`
				}, { item = Frames[i] })
			end
		end
		return config1
	end, {
		Frames.topLeftSlot, Frames.topMiddleSlot, Frames.topRightSlot,
		Frames.centerLeftSlot, Frames.centerMiddleSlot, Frames.centerRightSlot,
		Frames.bottomLeftSlot, Frames.bottomMiddleSlot, Frames.bottomRightSlot, Padding
	})))
end)