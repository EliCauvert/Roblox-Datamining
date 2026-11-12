local DependenciesModule = require(script:FindFirstAncestor("SocialLibraries").dependencies)
local Roact = DependenciesModule.Roact
local Llama = DependenciesModule.llama
local UIBlox = DependenciesModule.UIBlox
local StyledTextLabel = UIBlox.App.Text.StyledTextLabel
local Style = UIBlox.Style
local ImageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local Images = UIBlox.App.ImageSet.Images
local IconSize = UIBlox.App.Constant.IconSize
local GetTextHeightModule = require(script.Parent.getTextHeight)
local _ = require(script.Parent.StyleTypes)
local ConstantsModule = require(script.Parent.Constants)
local FoundationFontFaceMigration = DependenciesModule.Foundation.Utility.Flags.FoundationFontFaceMigration
local config = {
	maxNumberOfLines = ConstantsModule.LINES_MAX,
	lineWidth = ConstantsModule.TILE_SIZE
}

return function(p1)
	-- upvalues: Llama (copy), config (copy), Style (copy), Roact (copy), IconSize (copy), ImageSetLabel (copy), Images (copy), StyledTextLabel (copy), FoundationFontFaceMigration (copy), GetTextHeightModule (copy)
	local JoinResult = Llama.Dictionary.join(config, p1)
	local Icon = JoinResult.icon
	local Label = JoinResult.label
	
	return Style.withStyle(function(p2)
		-- upvalues: Label (copy), Roact (upval), JoinResult (copy), Icon (copy), IconSize (upval), ImageSetLabel (upval), Images (upval), StyledTextLabel (upval), FoundationFontFaceMigration (upval), GetTextHeightModule (upval)
		local Theme = p2.Theme
		local _Font = p2.Font
		local _Font1 = Label.font or _Font.CaptionBody
		local Text = Label.text
		
		return Roact.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = JoinResult.layoutOrder
		}, {
			UIListLayout = Roact.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 2)
			}),
			IconFrame = if Icon and Icon.path then Roact.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(IconSize.Small, IconSize.Small)
			}, {
				layout = Roact.createElement("UIListLayout", {
					VerticalAlignment = Enum.VerticalAlignment.Top,
					HorizontalAlignment = Enum.HorizontalAlignment.Center
				}),
				ImageLabel = Roact.createElement(ImageSetLabel, {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					Image = Images[Icon.path],
					ImageColor3 = Icon.color or Theme.IconDefault.Color,
					ImageTransparency = Icon.transparency or Theme.IconDefault.Transparency,
					Size = Icon.size or UDim2.fromOffset(IconSize.Small, IconSize.Small),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5)
				})
			}) else nil,
			ContextualText = if Text then Roact.createElement(StyledTextLabel, {
				layoutOrder = 2,
				lineHeight = 1,
				fluidSizing = false,
				richText = false,
				size = UDim2.fromOffset(Icon and JoinResult.lineWidth - (IconSize.Small + 2) or JoinResult.lineWidth, (if FoundationFontFaceMigration then _Font.BaseSize * _Font1.RelativeSize else GetTextHeightModule(Text, _Font1.Font, _Font.BaseSize * _Font1.RelativeSize)) * JoinResult.maxNumberOfLines),
				text = Text,
				textXAlignment = Enum.TextXAlignment.Left,
				textYAlignment = Enum.TextYAlignment.Top,
				textTruncate = Enum.TextTruncate.AtEnd,
				fontStyle = _Font1,
				colorStyle = Label.colorStyle or Theme.SecondaryContent
			}) else nil
		})
	end)
end