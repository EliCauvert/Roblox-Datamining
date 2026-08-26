local dependenciesModule = require(script:FindFirstAncestor("SocialLibraries").dependencies)
local react = dependenciesModule.React
local UIBlox = dependenciesModule.UIBlox
local object = dependenciesModule.LuauPolyfill.Object
local rect = Rect.new(10, 10, 11, 11)
local t = {
	isIncoming = false,
	hasTail = false,
	padding = 12,
	LayoutOrder = 0,
	isPending = false,
	[react.Change.AbsoluteSize] = function(_) end,
	overrideImageColor = false
}

return function(p1)
	-- upvalues: react (ref), t (ref), UIBlox (ref), rect (ref), object (ref)
	local var1, var2 = react.useState(0)
	local absoluteSize = p1[react.Change.AbsoluteSize] or t[react.Change.AbsoluteSize]
	
	return UIBlox.Style.withStyle(function(p2)
		-- upvalues: p1 (ref), t (copy), react (copy), var1 (ref), rect (copy), absoluteSize (ref), object (copy), var2 (ref)
		local children = p1.children or {}
		local hasTail = p1.hasTail or t.hasTail
		local isIncoming = p1.isIncoming or t.isIncoming
		local isPending = p1.isPending or t.isPending
		local var3 = if isIncoming then p2.Theme.UIDefault elseif isPending then p2.Theme.UIMuted else p2.Theme.UIEmphasis
		local color = var3.Color
		local transparency = var3.Transparency
		
		if p1.overrideImageColor or t.overrideImageColor then
			color = nil
			
			if not isPending then
				transparency = nil
			end
		end
		local uDim = UDim.new(0, p1.padding or t.padding)
		
		return react.createElement("Frame", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.XY,
			Size = UDim2.new(0, var1 + 6, 0, 0),
			LayoutOrder = p1.LayoutOrder or t.LayoutOrder
		}, {
			bubble = react.createElement("ImageLabel", {
				AutomaticSize = Enum.AutomaticSize.XY,
				Size = UDim2.new(0, var1, 0, 0),
				AnchorPoint = isIncoming and Vector2.new(0, 0) or Vector2.new(1, 0),
				BackgroundTransparency = 1,
				ImageColor3 = color,
				Image = if hasTail then if isIncoming then "rbxasset://textures/ui/LuaChat/9-slice/chat-bubble.png" else "rbxasset://textures/ui/LuaChat/9-slice/chat-bubble-self.png" else "rbxasset://textures/ui/LuaChat/9-slice/chat-bubble-self2.png",
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = rect,
				ImageTransparency = transparency,
				Position = isIncoming and UDim2.new(0, 6, 0, 0) or UDim2.new(1, -6, 0, 0),
				[react.Change.AbsoluteSize] = function(p3)
					-- upvalues: absoluteSize (copy)
					absoluteSize(p3)
				end
			}, object.assign(table.clone(children), {
				["$margin"] = react.createElement("UIPadding", {
					PaddingBottom = uDim,
					PaddingTop = uDim,
					PaddingRight = uDim,
					PaddingLeft = uDim
				}),
				["$layout"] = react.createElement("UIListLayout", {
					[react.Change.AbsoluteContentSize] = function(p3)
						-- upvalues: var2 (copy), uDim (ref)
						var2(p3.AbsoluteContentSize.X + uDim.Offset * 2)
					end
				})
			})),
			tail = react.createElement("ImageLabel", {
				BackgroundTransparency = 1,
				AnchorPoint = isIncoming and Vector2.new(0, 0) or Vector2.new(1, 0),
				Size = UDim2.new(0, 6, 0, 6),
				ImageColor3 = color,
				Position = isIncoming and UDim2.new(0, 0, 0, 0) or UDim2.new(1, 0, 0, 0),
				Image = if isIncoming then "rbxasset://textures/ui/LuaChat/9-slice/chat-bubble-tip.png" else "rbxasset://textures/ui/LuaChat/9-slice/chat-bubble-self-tip.png",
				ImageTransparency = transparency,
				Visible = hasTail
			})
		})
	end)
end