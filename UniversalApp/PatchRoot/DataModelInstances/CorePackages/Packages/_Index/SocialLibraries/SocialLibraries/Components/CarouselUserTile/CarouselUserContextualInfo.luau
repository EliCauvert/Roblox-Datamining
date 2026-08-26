local dependenciesModule = require(script:FindFirstAncestor("SocialLibraries").dependencies)
local roact = dependenciesModule.Roact
local llama = dependenciesModule.llama
local UIBlox = dependenciesModule.UIBlox
local styledTextLabel = UIBlox.App.Text.StyledTextLabel
local style = UIBlox.Style
local imageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local images = UIBlox.App.ImageSet.Images
local iconSize = UIBlox.App.Constant.IconSize
local getTextHeightModule = require(script.Parent.getTextHeight)
local _ = require(script.Parent.StyleTypes)
local constantsModule = require(script.Parent.Constants)
local t = {
	maxNumberOfLines = constantsModule.LINES_MAX,
	lineWidth = constantsModule.TILE_SIZE
}

return function(p1)
	-- upvalues: llama (ref), t (ref), style (ref), roact (ref), iconSize (ref), imageSetLabel (ref), images (ref), styledTextLabel (ref), getTextHeightModule (ref)
	local var1 = llama.Dictionary.join(t, p1)
	local icon = var1.icon
	local label = var1.label
	
	return style.withStyle(function(p2)
		-- upvalues: label (ref), roact (copy), var1 (ref), icon (ref), iconSize (copy), imageSetLabel (copy), images (copy), styledTextLabel (copy), getTextHeightModule (copy)
		local theme = p2.Theme
		local font = p2.Font
		local font_1 = label.font or font.CaptionBody
		local text = label.text
		
		return roact.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = var1.layoutOrder
		}, {
			UIListLayout = roact.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 2)
			}),
			IconFrame = if icon and icon.path then roact.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(iconSize.Small, iconSize.Small)
			}, {
				layout = roact.createElement("UIListLayout", {
					VerticalAlignment = Enum.VerticalAlignment.Top,
					HorizontalAlignment = Enum.HorizontalAlignment.Center
				}),
				ImageLabel = roact.createElement(imageSetLabel, {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					Image = images[icon.path],
					ImageColor3 = icon.color or theme.IconDefault.Color,
					ImageTransparency = icon.transparency or theme.IconDefault.Transparency,
					Size = icon.size or UDim2.fromOffset(iconSize.Small, iconSize.Small),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5)
				})
			}) else nil,
			ContextualText = if text then roact.createElement(styledTextLabel, {
				layoutOrder = 2,
				lineHeight = 1,
				fluidSizing = false,
				richText = false,
				size = UDim2.fromOffset(if icon then var1.lineWidth - (iconSize.Small + 2) else var1.lineWidth, getTextHeightModule(text, font_1.Font, font.BaseSize * font_1.RelativeSize) * var1.maxNumberOfLines),
				text = text,
				textXAlignment = Enum.TextXAlignment.Left,
				textYAlignment = Enum.TextYAlignment.Top,
				textTruncate = Enum.TextTruncate.AtEnd,
				fontStyle = font_1,
				colorStyle = label.colorStyle or theme.SecondaryContent
			}) else nil
		})
	end)
end