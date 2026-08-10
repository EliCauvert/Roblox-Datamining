local parent = script:FindFirstAncestor("MarkdownCore").Parent
local reactModule = require(parent.React)
local dashModule = require(parent.Dash)
local foundationModule = require(parent.Foundation)
local map = dashModule.map
local view = foundationModule.View
local image = foundationModule.Image
local text = foundationModule.Text
local t = {
	ItemOffset = 12,
	MarkerImage = "rbxasset://textures/StudioSharedUI/dot.png",
	MarkerSize = 4,
	Padding = 6,
	LineHeight = 18,
	TextSize = 18,
	ItemIndentation = 0,
	Font = Enum.Font.BuilderSans,
	TextColor = Color3.fromRGB(0, 0, 0),
	SubItemStyle = { ItemIndentation = 20, ItemOffset = 12 }
}

local function _(value, p0) --[[ line: 57 | named "calculateItemOffset" ]]
	return p0 + value
end

local _ = function(p1) --[[ line: 98 | named "isOrdered" ]]
	return p1 and (not p1:find("^*") and not p1:find("^-"))
end

return function(p2) --[[ line: 102 | named "BulletList" ]]
	-- upvalues: foundationModule (ref), t (ref), map (ref), reactModule (ref), text (ref), view (ref), image (ref), dashModule (ref)
	local var4 = foundationModule.Hooks.useTokens()
	local textWrapped = p2.TextWrapped
	local textTruncate = p2.TextTruncate
	local listStyle = p2.ListStyle or t
	local items = p2.Items
	local itemIndentation = listStyle.ItemIndentation or t.ItemIndentation
	local uDim2 = UDim2.new(1, -((listStyle.MarkerSize or t.MarkerSize) + var4.Gap.Small), 0, 0)
	local size = p2.Size
	
	return reactModule.createElement(view, {
		testId = "--markdown--bullet-list",
		tag = "col align-x-left gap-xsmall",
		AutomaticSize = if size and (size.X.Scale > 0 or size.X.Offset > 0) then Enum.AutomaticSize.Y else Enum.AutomaticSize.XY,
		backgroundStyle = { Transparency = 1 },
		LayoutOrder = p2.LayoutOrder or 1,
		Position = p2.Position,
		Size = size
	}, dashModule.assign(map(items, function(p3, p4) --[[ line: 116 ]]
		-- upvalues: itemIndentation (ref), listStyle (ref), t (copy), reactModule (copy), text (copy), uDim2 (ref), textTruncate (ref), textWrapped (ref), view (copy), image (copy)
		local var11
		local _ = nil
		local var8 = itemIndentation
		local var9 = listStyle.MarkerImage or t.MarkerImage
		local UIPadding = nil
		local prefix = nil
		
		if type(p3) == "string" then
			var11 = reactModule.createElement(text, {
				LayoutOrder = 2,
				AutomaticSize = Enum.AutomaticSize.XY,
				Font = listStyle.Font or t.Font,
				Size = uDim2,
				Text = p3,
				TextColor = listStyle.TextColor or t.TextColor,
				TextSize = listStyle.TextSize or t.TextSize,
				TextTruncate = textTruncate,
				TextWrapped = textWrapped,
				Padding = listStyle.Padding or t.Padding,
				TextXAlignment = Enum.TextXAlignment.Left
			})
		elseif typeof(p3) == "table" and p3.Text then
			prefix = p3.Prefix
			local subItemStyle = listStyle.SubItemStyle
			local uDim2_1 = UDim2.new(1, -subItemStyle.ItemOffset or t.SubItemStyle.ItemOffset, 0, 0)
			var8 = subItemStyle.ItemIndentation or var8
			var9 = subItemStyle.MarkerStyle or var9
			
			if var8 then
				UIPadding = reactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, var8) })
			end
			var11 = reactModule.createElement(text, {
				LayoutOrder = 2,
				AutomaticSize = Enum.AutomaticSize.XY,
				Size = uDim2_1,
				textStyle = { Color3 = listStyle.TextColor or t.TextColor },
				FontStyle = {
					Font = listStyle.Font or t.Font,
					FontSize = listStyle.TextSize or t.TextSize
				},
				Text = p3.Text,
				TextWrapped = textWrapped,
				TextTruncate = textTruncate,
				TextXAlignment = Enum.TextXAlignment.Left
			})
		elseif typeof(p3) == "table" and p3.Item then
			prefix = p3.Prefix
			var11 = reactModule.createElement(view, { tag = "auto-y", LayoutOrder = 2, Size = uDim2 }, { ContentElement = p3.Item })
		else
			var11 = reactModule.createElement(view, { tag = "auto-y", LayoutOrder = 2, Size = uDim2 }, { ContentElement = p3 })
		end
		return reactModule.createElement(view, {
			testId = "--markdown--bullet-list-item",
			tag = "gap-xsmall auto-xy row align-x-left align-y-top",
			key = tostring(p4),
			LayoutOrder = p4
		}, {
			Marker = reactModule.createElement(view, {
				LayoutOrder = 1,
				Size = UDim2.fromOffset(listStyle.MarkerSize or t.MarkerSize, listStyle.LineHeight or t.LineHeight)
			}, {
				Image = if prefix and (not prefix:find("^*") and not prefix:find("^-")) then reactModule.createElement(text, {
					tag = "position-center-left anchor-center-left",
					Text = `{prefix}.`,
					fontStyle = {
						Font = listStyle.Font or t.Font,
						FontSize = listStyle.TextSize or t.TextSize
					},
					textStyle = { Color3 = listStyle.TextColor or t.TextColor },
					Size = UDim2.fromOffset(listStyle.MarkerSize or t.MarkerSize, listStyle.MarkerSize or t.MarkerSize)
				}) else reactModule.createElement(image, {
					tag = "position-center-left anchor-center-left",
					LayoutOrder = 1,
					Image = var9,
					imageStyle = { Color3 = listStyle.TextColor or t.TextColor },
					Size = UDim2.fromOffset(listStyle.MarkerSize or t.MarkerSize, listStyle.MarkerSize or t.MarkerSize)
				})
			}),
			Content = var11,
			Padding = UIPadding
		})
	end), p2.children or {}))
end