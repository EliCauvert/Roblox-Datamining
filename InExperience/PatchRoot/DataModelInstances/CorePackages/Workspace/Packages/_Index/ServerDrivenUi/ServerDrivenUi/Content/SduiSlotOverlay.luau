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

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), t (ref)
	local padding = p1.padding or 0
	
	return reactModule.createElement("Frame", {
		LayoutOrder = p1.layoutOrder,
		AnchorPoint = p1.anchorPoint,
		AutomaticSize = p1.automaticSize,
		Size = p1.size or UDim2.new(1, 0, 1, 0),
		Position = p1.position,
		BackgroundTransparency = 1,
		[reactModule.Tag] = "data-testid=--sdui-slot-overlay"
	}, reactModule.useMemo(function()
		-- upvalues: reactModule (copy), padding (ref), t (copy), p1 (ref)
		local t_1 = {
			UIPadding = reactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, padding),
				PaddingTop = UDim.new(0, padding),
				PaddingRight = UDim.new(0, padding),
				PaddingBottom = UDim.new(0, padding)
			})
		}
		
		for i, v in t do
			if p1[i] ~= nil then
				t_1[i] = reactModule.createElement("Frame", {
					AnchorPoint = v.AnchorPoint,
					AutomaticSize = Enum.AutomaticSize.XY,
					Position = v.Position,
					BackgroundTransparency = 1,
					Size = UDim2.new(0, 0, 0, 0),
					[reactModule.Tag] = `data-testid=--sdui-slot-{i}`
				}, { item = p1[i] })
			end
		end
		return t_1
	end, {
		p1.topLeftSlot, p1.topMiddleSlot, p1.topRightSlot, p1.centerLeftSlot,
		p1.centerMiddleSlot, p1.centerRightSlot, p1.bottomLeftSlot,
		p1.bottomMiddleSlot, p1.bottomRightSlot, padding
	}))
end)