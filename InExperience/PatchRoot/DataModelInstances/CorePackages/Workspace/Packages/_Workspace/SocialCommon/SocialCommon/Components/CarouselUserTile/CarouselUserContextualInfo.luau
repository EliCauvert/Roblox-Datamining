local parent = script:FindFirstAncestor("SocialCommon").Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local UIBloxModule = require(parent.UIBlox)
local useStyle = UIBloxModule.Core.Style.useStyle
local styledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local images = UIBloxModule.App.ImageSet.Images
local iconSize = UIBloxModule.App.Constant.IconSize
local useTextSizeOffset = UIBloxModule.Core.Style.useTextSizeOffset
local text = require(parent.AppCommonLib).Text
local constantsModule = require(script.Parent.Constants)
local t = {
	maxNumberOfLines = constantsModule.LINES_MAX,
	lineWidth = constantsModule.TILE_SIZE
}

function CarouselUserContextualInfo(p1)
	-- upvalues: cryoModule (ref), t (ref), useStyle (ref), useTextSizeOffset (ref), iconSize (ref), reactModule (ref), text (ref), imageSetLabel (ref), images (ref), styledTextLabel (ref)
	local var1 = cryoModule.Dictionary.join(t, p1)
	local icon = var1.icon
	local label = var1.label
	local var2 = useStyle()
	local var3 = useTextSizeOffset()
	local theme = var2.Theme
	local font = var2.Font
	local font_1 = label.font or font.CaptionBody
	local text_1 = label.text
	local var4 = if icon then var1.lineWidth - (iconSize.Small + 2) else var1.lineWidth
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = var1.layoutOrder,
		Size = UDim2.new(1, 0, 1, 0)
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, 2)
		}),
		IconFrame = if icon and icon.path then reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(iconSize.Small, iconSize.Small)
		}, {
			layout = reactModule.createElement("UIListLayout", {
				VerticalAlignment = Enum.VerticalAlignment.Top,
				HorizontalAlignment = Enum.HorizontalAlignment.Center
			}),
			ImageLabel = reactModule.createElement(imageSetLabel, {
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
		ContextualText = if text_1 then reactModule.createElement(styledTextLabel, {
			layoutOrder = 2,
			lineHeight = 1,
			fluidSizing = false,
			richText = false,
			size = UDim2.fromOffset(var4, reactModule.useMemo(function()
				-- upvalues: font (ref), font_1 (ref), var3 (ref), var1 (ref), text (copy), text_1 (ref), var4 (ref)
				return math.min((font.BaseSize * font_1.RelativeSize + var3) * var1.maxNumberOfLines, text.GetTextHeight(text_1 or "", font_1.Font, font.BaseSize * font_1.RelativeSize, var4))
			end, {
				font_1.Font, font.BaseSize, font_1.RelativeSize, var1.maxNumberOfLines, text_1,
				var3, var4
			})),
			text = text_1,
			textXAlignment = Enum.TextXAlignment.Left,
			textYAlignment = Enum.TextYAlignment.Top,
			textTruncate = Enum.TextTruncate.AtEnd,
			fontStyle = font_1,
			colorStyle = label.colorStyle or theme.SecondaryContent
		}) else nil
	})
end

return CarouselUserContextualInfo