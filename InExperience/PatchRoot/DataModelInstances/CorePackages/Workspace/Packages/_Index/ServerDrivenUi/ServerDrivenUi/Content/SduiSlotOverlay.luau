local reactModule = require(script:FindFirstAncestor("ServerDrivenUi").Parent.React)
local t = {
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

return reactModule.memo(function(p0)
	-- upvalues: reactModule (ref), t (ref)
	local padding = p0.padding or 0
	
	return reactModule.createElement("Frame", {
		LayoutOrder = p0.layoutOrder,
		AnchorPoint = p0.anchorPoint,
		AutomaticSize = p0.automaticSize,
		Size = p0.size or UDim2.new(1, 0, 1, 0),
		Position = p0.position,
		BackgroundTransparency = 1,
		[reactModule.Tag] = "data-testid=--sdui-slot-overlay"
	}, reactModule.useMemo(function()
		-- upvalues: reactModule (copy), padding (ref), t (copy), p0 (ref)
		local t_1 = {
			UIPadding = reactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, padding),
				PaddingTop = UDim.new(0, padding),
				PaddingRight = UDim.new(0, padding),
				PaddingBottom = UDim.new(0, padding)
			})
		}
		
		for i, v in t do
			if p0[i] ~= nil then
				t_1[i] = reactModule.createElement("Frame", {
					AnchorPoint = v.AnchorPoint,
					AutomaticSize = Enum.AutomaticSize.XY,
					Position = v.Position,
					BackgroundTransparency = 1,
					Size = UDim2.new(0, 0, 0, 0),
					[reactModule.Tag] = `data-testid=--sdui-slot-{i}`
				}, { item = p0[i] })
			end
		end
		return t_1
	end, {
		p0.topLeftSlot, p0.topMiddleSlot, p0.topRightSlot, p0.centerLeftSlot,
		p0.centerMiddleSlot, p0.centerRightSlot, p0.bottomLeftSlot,
		p0.bottomMiddleSlot, p0.bottomRightSlot, padding
	}))
end)