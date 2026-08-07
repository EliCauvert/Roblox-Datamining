-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:24 2026 Pacific Standard Time.

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
	[react.Change.AbsoluteSize] = function(_) --[[ line: 21 ]] end,
	overrideImageColor = false
}

return function(p0) --[[ line: 26 | named "ChatBubbleContainer" ]]
	-- upvalues: react (ref), t (ref), UIBlox (ref), rect (ref), object (ref)
	local var3, var4 = react.useState(0)
	local absoluteSize = p0[react.Change.AbsoluteSize] or t[react.Change.AbsoluteSize]
	
	return UIBlox.Style.withStyle(function(p1) --[[ line: 30 ]]
		-- upvalues: p0 (ref), t (copy), react (copy), var3 (ref), rect (copy), absoluteSize (ref), object (copy), var4 (ref)
		local children = p0.children or {}
		local hasTail = p0.hasTail or t.hasTail
		local isIncoming = p0.isIncoming or t.isIncoming
		local isPending = p0.isPending or t.isPending
		local var10 = if isIncoming then p1.Theme.UIDefault elseif isPending then p1.Theme.UIMuted else p1.Theme.UIEmphasis
		local color = var10.Color
		local transparency = var10.Transparency
		
		if p0.overrideImageColor or t.overrideImageColor then
			color = nil
			
			if not isPending then
				transparency = nil
			end
		end
		local uDim = UDim.new(0, p0.padding or t.padding)
		
		return react.createElement("Frame", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.XY,
			Size = UDim2.new(0, var3 + 6, 0, 0),
			LayoutOrder = p0.LayoutOrder or t.LayoutOrder
		}, {
			bubble = react.createElement("ImageLabel", {
				AutomaticSize = Enum.AutomaticSize.XY,
				Size = UDim2.new(0, var3, 0, 0),
				AnchorPoint = isIncoming and Vector2.new(0, 0) or Vector2.new(1, 0),
				BackgroundTransparency = 1,
				ImageColor3 = color,
				Image = if hasTail then if isIncoming then "rbxasset://textures/ui/LuaChat/9-slice/chat-bubble.png" else "rbxasset://textures/ui/LuaChat/9-slice/chat-bubble-self.png" else "rbxasset://textures/ui/LuaChat/9-slice/chat-bubble-self2.png",
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = rect,
				ImageTransparency = transparency,
				Position = isIncoming and UDim2.new(0, 6, 0, 0) or UDim2.new(1, -6, 0, 0),
				[react.Change.AbsoluteSize] = function(p2) --[[ line: 82 ]]
					-- upvalues: absoluteSize (copy)
					absoluteSize(p2)
				end
			}, object.assign(table.clone(children), {
				["$margin"] = react.createElement("UIPadding", {
					PaddingBottom = uDim,
					PaddingTop = uDim,
					PaddingRight = uDim,
					PaddingLeft = uDim
				}),
				["$layout"] = react.createElement("UIListLayout", {
					[react.Change.AbsoluteContentSize] = function(p3) --[[ line: 93 ]]
						-- upvalues: var4 (copy), uDim (ref)
						var4(p3.AbsoluteContentSize.X + uDim.Offset * 2)
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