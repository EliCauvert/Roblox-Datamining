local Parent = script:FindFirstAncestor("SocialCommon").Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local UIBloxModule = require(Parent.UIBlox)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local Images = UIBloxModule.App.ImageSet.Images
local IconSize = UIBloxModule.App.Constant.IconSize
local UseTextSizeOffsetFunction = UIBloxModule.Core.Style.useTextSizeOffset
local Text = require(Parent.AppCommonLib).Text
local ConstantsModule = require(script.Parent.Constants)
local config = {
	maxNumberOfLines = ConstantsModule.LINES_MAX,
	lineWidth = ConstantsModule.TILE_SIZE
}

function CarouselUserContextualInfo(p1)
	-- upvalues: CryoModule (copy), config (copy), UseStyleFunction (copy), UseTextSizeOffsetFunction (copy), IconSize (copy), ReactModule (copy), Text (copy), ImageSetLabel (copy), Images (copy), StyledTextLabel (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local Icon = JoinResult.icon
	local Label = JoinResult.label
	local UseStyleResult = UseStyleFunction()
	local UseTextSizeOffsetResult = UseTextSizeOffsetFunction()
	local Theme = UseStyleResult.Theme
	local UseStyleResultFont = UseStyleResult.Font
	local _Font = Label.font or UseStyleResultFont.CaptionBody
	local Text1 = Label.text
	local LineWidthDelta = Icon and JoinResult.lineWidth - (IconSize.Small + 2) or JoinResult.lineWidth
	local UseMemoResult = ReactModule.useMemo(function(): number
		-- upvalues: UseStyleResultFont (copy), _Font (copy), UseTextSizeOffsetResult (copy), JoinResult (copy), Text (upval), Text1 (copy), LineWidthDelta (copy)
		return (math.min((UseStyleResultFont.BaseSize * _Font.RelativeSize + UseTextSizeOffsetResult) * JoinResult.maxNumberOfLines, Text.GetTextHeight(Text1 or "", _Font.Font, UseStyleResultFont.BaseSize * _Font.RelativeSize, LineWidthDelta)))
	end, {
		_Font.Font, UseStyleResultFont.BaseSize, _Font.RelativeSize,
		JoinResult.maxNumberOfLines, Text1, UseTextSizeOffsetResult, LineWidthDelta
	})
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = JoinResult.layoutOrder,
		Size = UDim2.new(1, 0, 1, 0)
	}, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, 2)
		}),
		IconFrame = if Icon and Icon.path then ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(IconSize.Small, IconSize.Small)
		}, {
			layout = ReactModule.createElement("UIListLayout", {
				VerticalAlignment = Enum.VerticalAlignment.Top,
				HorizontalAlignment = Enum.HorizontalAlignment.Center
			}),
			ImageLabel = ReactModule.createElement(ImageSetLabel, {
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
		ContextualText = if Text1 then ReactModule.createElement(StyledTextLabel, {
			layoutOrder = 2,
			lineHeight = 1,
			fluidSizing = false,
			richText = false,
			size = UDim2.fromOffset(LineWidthDelta, UseMemoResult),
			text = Text1,
			textXAlignment = Enum.TextXAlignment.Left,
			textYAlignment = Enum.TextYAlignment.Top,
			textTruncate = Enum.TextTruncate.AtEnd,
			fontStyle = _Font,
			colorStyle = Label.colorStyle or Theme.SecondaryContent
		}) else nil
	})
end

return CarouselUserContextualInfo