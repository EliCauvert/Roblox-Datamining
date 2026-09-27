local parent = script:FindFirstAncestor("MarkdownCore").Parent
local reactModule = require(parent.React)
local dashModule = require(parent.Dash)
local foundationModule = require(parent.Foundation)
local map = dashModule.map
local flagsModule = require(script:FindFirstAncestor("MarkdownCore").Flags)
local view = foundationModule.View
local image = foundationModule.Image
local text = foundationModule.Text
local flags = foundationModule.Utility.Flags
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

local function _(value, p1)
	return p1 + value
end

local _ = function(p1)
	return p1 and (not p1:find("^*") and not p1:find("^-"))
end

return function(p1)
	-- upvalues: foundationModule (ref), t (ref), flagsModule (ref), map (ref), reactModule (ref), text (ref), flags (ref), view (ref), image (ref), dashModule (ref)
	local font, textSize, textColor, var1
	local var2 = foundationModule.Hooks.useTokens()
	local textWrapped = p1.TextWrapped
	local textTruncate = p1.TextTruncate
	local listStyle = p1.ListStyle or t
	local items = p1.Items
	local itemIndentation = listStyle.ItemIndentation or t.ItemIndentation
	local uDim2 = UDim2.new(1, -((listStyle.MarkerSize or t.MarkerSize) + var2.Gap.Small), 0, 0)
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	
	if flagsModule.FFlagMarkdownAssistantParity then
		local bodyMedium = var2.Typography.BodyMedium
		font = listStyle.Font or bodyMedium.Font
		textSize = listStyle.TextSize or bodyMedium.FontSize
		textColor = listStyle.TextColor or var2.Color.Content.Default.Color3
		var1 = listStyle.LineHeight or textSize * bodyMedium.LineHeight
	else
		font = listStyle.Font or t.Font
		textSize = listStyle.TextSize or t.TextSize
		textColor = listStyle.TextColor or t.TextColor
		var1 = listStyle.LineHeight or t.LineHeight
	end
	local size = p1.Size
	
	return reactModule.createElement(view, {
		testId = "--markdown--bullet-list",
		tag = "col align-x-left gap-xsmall",
		AutomaticSize = if size and (size.X.Scale > 0 or size.X.Offset > 0) then Enum.AutomaticSize.Y else Enum.AutomaticSize.XY,
		backgroundStyle = { Transparency = 1 },
		LayoutOrder = p1.LayoutOrder or 1,
		Position = p1.Position,
		Size = size
	}, dashModule.assign(map(items, function(p2, p3)
		-- upvalues: itemIndentation (ref), listStyle (ref), t (copy), reactModule (copy), text (copy), flags (copy), font (write), textSize (write), uDim2 (ref), textColor (write), textTruncate (ref), textWrapped (ref), view (copy), var1 (write), image (copy)
		local var3
		local _ = nil
		local var4 = itemIndentation
		local var5 = listStyle.MarkerImage or t.MarkerImage
		local UIPadding = nil
		local prefix = nil
		
		if type(p2) == "string" then
			var3 = reactModule.createElement(text, {
				LayoutOrder = 2,
				AutomaticSize = Enum.AutomaticSize.XY,
				Font = if flags.FoundationFontFaceMigration then nil else font,
				fontStyle = if flags.FoundationFontFaceMigration then { Font = font, FontSize = textSize } else nil,
				Size = uDim2,
				Text = p2,
				TextColor = if flags.FoundationFontFaceMigration then nil else textColor,
				textStyle = if flags.FoundationFontFaceMigration then { Color3 = textColor } else nil,
				TextSize = if flags.FoundationFontFaceMigration then nil else textSize,
				TextTruncate = textTruncate,
				TextWrapped = textWrapped,
				Padding = listStyle.Padding or t.Padding,
				TextXAlignment = Enum.TextXAlignment.Left
			})
		elseif typeof(p2) == "table" and p2.Text then
			prefix = p2.Prefix
			local subItemStyle = listStyle.SubItemStyle
			local uDim2_1 = UDim2.new(1, -subItemStyle.ItemOffset or t.SubItemStyle.ItemOffset, 0, 0)
			var4 = subItemStyle.ItemIndentation or var4
			var5 = subItemStyle.MarkerStyle or var5
			
			if var4 then
				UIPadding = reactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, var4) })
			end
			var3 = reactModule.createElement(text, {
				LayoutOrder = 2,
				AutomaticSize = Enum.AutomaticSize.XY,
				Size = uDim2_1,
				textStyle = { Color3 = textColor },
				FontStyle = if flags.FoundationFontFaceMigration then nil else { Font = font, FontSize = textSize },
				fontStyle = if flags.FoundationFontFaceMigration then { Font = font, FontSize = textSize } else nil,
				Text = p2.Text,
				TextWrapped = textWrapped,
				TextTruncate = textTruncate,
				TextXAlignment = Enum.TextXAlignment.Left
			})
		elseif typeof(p2) == "table" and p2.Item then
			prefix = p2.Prefix
			var3 = reactModule.createElement(view, { tag = "auto-y", LayoutOrder = 2, Size = uDim2 }, { ContentElement = p2.Item })
		else
			var3 = reactModule.createElement(view, { tag = "auto-y", LayoutOrder = 2, Size = uDim2 }, { ContentElement = p2 })
		end
		return reactModule.createElement(view, {
			testId = "--markdown--bullet-list-item",
			tag = "gap-xsmall auto-xy row align-x-left align-y-top",
			key = tostring(p3),
			LayoutOrder = p3
		}, {
			Marker = reactModule.createElement(view, {
				LayoutOrder = 1,
				Size = UDim2.fromOffset(listStyle.MarkerSize or t.MarkerSize, var1)
			}, {
				Image = if prefix and (not prefix:find("^*") and not prefix:find("^-")) then reactModule.createElement(text, {
					tag = "position-center-left anchor-center-left",
					Text = `{prefix}.`,
					fontStyle = { Font = font, FontSize = textSize },
					textStyle = { Color3 = textColor },
					Size = UDim2.fromOffset(listStyle.MarkerSize or t.MarkerSize, listStyle.MarkerSize or t.MarkerSize)
				}) else reactModule.createElement(image, {
					tag = "position-center-left anchor-center-left",
					LayoutOrder = 1,
					Image = var5,
					imageStyle = { Color3 = textColor },
					Size = UDim2.fromOffset(listStyle.MarkerSize or t.MarkerSize, listStyle.MarkerSize or t.MarkerSize)
				})
			}),
			Content = var3,
			Padding = UIPadding
		})
	end), p1.children or {}))
end