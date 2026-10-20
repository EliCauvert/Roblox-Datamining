local Parent = script:FindFirstAncestor("MarkdownCore").Parent
local ReactModule = require(Parent.React)
local DashModule = require(Parent.Dash)
local FoundationModule = require(Parent.Foundation)
local MapFunction = DashModule.map
local FlagsModule = require(script:FindFirstAncestor("MarkdownCore").Flags)
local View = FoundationModule.View
local Image = FoundationModule.Image
local Text = FoundationModule.Text
local Flags = FoundationModule.Utility.Flags
local Label = {
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

local function _(p1, p2)
	return p2 + p1
end

local _ = function(p1: string): boolean
	return p1 and (not p1:find("^*") and not p1:find("^-"))
end

return function(Frame)
	-- upvalues: FoundationModule (copy), Label (copy), FlagsModule (copy), MapFunction (copy), ReactModule (copy), Text (copy), Flags (copy), View (copy), Image (copy), DashModule (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local TextWrapped = Frame.TextWrapped
	local TextTruncate = Frame.TextTruncate
	local ListStyle = Frame.ListStyle or Label
	local Items = Frame.Items
	local ItemIndentation = ListStyle.ItemIndentation or Label.ItemIndentation
	local _UDim2 = UDim2.new(1, -((ListStyle.MarkerSize or Label.MarkerSize) + UseTokensResult.Gap.Small), 0, 0)
	local _Font = nil
	local TextSize = nil
	local TextColor = nil
	local LineHeight = nil
	
	if FlagsModule.FFlagMarkdownAssistantParity then
		local BodyMedium = UseTokensResult.Typography.BodyMedium
		_Font = ListStyle.Font or BodyMedium.Font
		TextSize = ListStyle.TextSize or BodyMedium.FontSize
		TextColor = ListStyle.TextColor or UseTokensResult.Color.Content.Default.Color3
		LineHeight = ListStyle.LineHeight or TextSize * BodyMedium.LineHeight
	else
		_Font = ListStyle.Font or Label.Font
		TextSize = ListStyle.TextSize or Label.TextSize
		TextColor = ListStyle.TextColor or Label.TextColor
		LineHeight = ListStyle.LineHeight or Label.LineHeight
	end
	local Size = Frame.Size
	
	return ReactModule.createElement(View, {
		testId = "--markdown--bullet-list",
		tag = "col align-x-left gap-xsmall",
		AutomaticSize = if Size and (Size.X.Scale > 0 or Size.X.Offset > 0) then Enum.AutomaticSize.Y else Enum.AutomaticSize.XY,
		backgroundStyle = { Transparency = 1 },
		LayoutOrder = Frame.LayoutOrder or 1,
		Position = Frame.Position,
		Size = Size
	}, DashModule.assign(MapFunction(Items, function(ContentElement, LayoutOrder)
		-- upvalues: ItemIndentation (copy), ListStyle (copy), Label (upval), ReactModule (upval), Text (upval), Flags (upval), _Font (ref), TextSize (ref), _UDim2 (copy), TextColor (ref), TextTruncate (copy), TextWrapped (copy), View (upval), LineHeight (ref), Image (upval)
		local MarkerImage = ListStyle.MarkerImage or Label.MarkerImage
		local UIPadding = nil
		local Prefix = nil
		local Element = nil
		
		if type(ContentElement) == "string" then
			Element = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				AutomaticSize = Enum.AutomaticSize.XY,
				Font = if Flags.FoundationFontFaceMigration then nil else _Font,
				fontStyle = if Flags.FoundationFontFaceMigration then { Font = _Font, FontSize = TextSize } else nil,
				Size = _UDim2,
				Text = ContentElement,
				TextColor = if Flags.FoundationFontFaceMigration then nil else TextColor,
				textStyle = if Flags.FoundationFontFaceMigration then { Color3 = TextColor } else nil,
				TextSize = if Flags.FoundationFontFaceMigration then nil else TextSize,
				TextTruncate = TextTruncate,
				TextWrapped = TextWrapped,
				Padding = ListStyle.Padding or Label.Padding,
				TextXAlignment = Enum.TextXAlignment.Left
			})
		elseif typeof(ContentElement) == "table" and ContentElement.Text then
			Prefix = ContentElement.Prefix
			local SubItemStyle = ListStyle.SubItemStyle
			local _UDim2_1 = UDim2.new(1, -SubItemStyle.ItemOffset or Label.SubItemStyle.ItemOffset, 0, 0)
			local ItemIndentation1 = SubItemStyle.ItemIndentation or ItemIndentation
			MarkerImage = SubItemStyle.MarkerStyle or MarkerImage
			
			if ItemIndentation1 then
				UIPadding = ReactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, ItemIndentation1) })
			end
			Element = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				AutomaticSize = Enum.AutomaticSize.XY,
				Size = _UDim2_1,
				textStyle = { Color3 = TextColor },
				FontStyle = if Flags.FoundationFontFaceMigration then nil else { Font = _Font, FontSize = TextSize },
				fontStyle = if Flags.FoundationFontFaceMigration then { Font = _Font, FontSize = TextSize } else nil,
				Text = ContentElement.Text,
				TextWrapped = TextWrapped,
				TextTruncate = TextTruncate,
				TextXAlignment = Enum.TextXAlignment.Left
			})
		elseif typeof(ContentElement) == "table" and ContentElement.Item then
			Prefix = ContentElement.Prefix
			Element = ReactModule.createElement(View, { tag = "auto-y", LayoutOrder = 2, Size = _UDim2 }, { ContentElement = ContentElement.Item })
		else
			Element = ReactModule.createElement(View, { tag = "auto-y", LayoutOrder = 2, Size = _UDim2 }, { ContentElement = ContentElement })
		end
		return ReactModule.createElement(View, {
			testId = "--markdown--bullet-list-item",
			tag = "gap-xsmall auto-xy row align-x-left align-y-top",
			key = tostring(LayoutOrder),
			LayoutOrder = LayoutOrder
		}, {
			Marker = ReactModule.createElement(View, {
				LayoutOrder = 1,
				Size = UDim2.fromOffset(ListStyle.MarkerSize or Label.MarkerSize, LineHeight)
			}, {
				Image = if Prefix and (not Prefix:find("^*") and not Prefix:find("^-")) then ReactModule.createElement(Text, {
					tag = "position-center-left anchor-center-left",
					Text = `{Prefix}.`,
					fontStyle = { Font = _Font, FontSize = TextSize },
					textStyle = { Color3 = TextColor },
					Size = UDim2.fromOffset(ListStyle.MarkerSize or Label.MarkerSize, ListStyle.MarkerSize or Label.MarkerSize)
				}) else ReactModule.createElement(Image, {
					tag = "position-center-left anchor-center-left",
					LayoutOrder = 1,
					Image = MarkerImage,
					imageStyle = { Color3 = TextColor },
					Size = UDim2.fromOffset(ListStyle.MarkerSize or Label.MarkerSize, ListStyle.MarkerSize or Label.MarkerSize)
				})
			}),
			Content = Element,
			Padding = UIPadding
		})
	end), Frame.children or {}))
end