local DependenciesModule = require(script:FindFirstAncestor("SocialLibraries").dependencies)
local React = DependenciesModule.React
local UIBlox = DependenciesModule.UIBlox
local Object = DependenciesModule.LuauPolyfill.Object
local _Rect = Rect.new(10, 10, 11, 11)
local Frame = {
	isIncoming = false,
	hasTail = false,
	padding = 12,
	LayoutOrder = 0,
	isPending = false,
	[React.Change.AbsoluteSize] = function(_) --[[ Line: 21 ]] end,
	overrideImageColor = false
}

return function(Frame1: Frame) --[[ Line: 26 | Named "ChatBubbleContainer" ]]
	-- upvalues: React (copy), Frame (copy), UIBlox (copy), _Rect (copy), Object (copy)
	local UseStateResult, UseStateResult2 = React.useState(0)
	local Callback = Frame1[React.Change.AbsoluteSize] or Frame[React.Change.AbsoluteSize]
	
	return UIBlox.Style.withStyle(function(p1) --[[ Line: 30 ]]
		-- upvalues: Frame1 (copy), Frame (upval), React (upval), UseStateResult (copy), _Rect (upval), Callback (copy), Object (upval), UseStateResult2 (copy)
		local Children = Frame1.children or {}
		local HasTail = Frame1.hasTail or Frame.hasTail
		local IsIncoming = Frame1.isIncoming or Frame.isIncoming
		local IsPending = Frame1.isPending or Frame.isPending
		local UIDefault = if IsIncoming then p1.Theme.UIDefault elseif IsPending then p1.Theme.UIMuted else p1.Theme.UIEmphasis
		local Color = UIDefault.Color
		local Transparency = UIDefault.Transparency
		
		if Frame1.overrideImageColor or Frame.overrideImageColor then
			Color = nil
			
			if not IsPending then
				Transparency = nil
			end
		end
		local _UDim = UDim.new(0, Frame1.padding or Frame.padding)
		
		return React.createElement("Frame", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.XY,
			Size = UDim2.new(0, UseStateResult + 6, 0, 0),
			LayoutOrder = Frame1.LayoutOrder or Frame.LayoutOrder
		}, {
			bubble = React.createElement("ImageLabel", {
				AutomaticSize = Enum.AutomaticSize.XY,
				Size = UDim2.new(0, UseStateResult, 0, 0),
				AnchorPoint = IsIncoming and Vector2.new(0, 0) or Vector2.new(1, 0),
				BackgroundTransparency = 1,
				ImageColor3 = Color,
				Image = if HasTail then if IsIncoming then "rbxasset://textures/ui/LuaChat/9-slice/chat-bubble.png" else "rbxasset://textures/ui/LuaChat/9-slice/chat-bubble-self.png" else "rbxasset://textures/ui/LuaChat/9-slice/chat-bubble-self2.png",
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = _Rect,
				ImageTransparency = Transparency,
				Position = IsIncoming and UDim2.new(0, 6, 0, 0) or UDim2.new(1, -6, 0, 0),
				[React.Change.AbsoluteSize] = function(p2) --[[ Line: 82 ]]
					-- upvalues: Callback (upval)
					Callback(p2)
				end
			}, Object.assign(table.clone(Children), {
				["$margin"] = React.createElement("UIPadding", {
					PaddingBottom = _UDim,
					PaddingTop = _UDim,
					PaddingRight = _UDim,
					PaddingLeft = _UDim
				}),
				["$layout"] = React.createElement("UIListLayout", {
					[React.Change.AbsoluteContentSize] = function(p2) --[[ Line: 93 ]]
						-- upvalues: UseStateResult2 (upval), _UDim (copy)
						UseStateResult2(p2.AbsoluteContentSize.X + _UDim.Offset * 2)
					end
				})
			})),
			tail = React.createElement("ImageLabel", {
				BackgroundTransparency = 1,
				AnchorPoint = IsIncoming and Vector2.new(0, 0) or Vector2.new(1, 0),
				Size = UDim2.new(0, 6, 0, 6),
				ImageColor3 = Color,
				Position = IsIncoming and UDim2.new(0, 0, 0, 0) or UDim2.new(1, 0, 0, 0),
				Image = if IsIncoming then "rbxasset://textures/ui/LuaChat/9-slice/chat-bubble-tip.png" else "rbxasset://textures/ui/LuaChat/9-slice/chat-bubble-self-tip.png",
				ImageTransparency = Transparency,
				Visible = HasTail
			})
		})
	end)
end