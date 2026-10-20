local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent
local RoactModule = require(Parent2.Roact)
local TModule = require(Parent2.t)
local CryoModule = require(Parent2.Cryo)
local FitFrameOnAxis = require(Parent2.FitFrame).FitFrameOnAxis
local GenericTextLabelModule = require(Parent1.Core.Text.GenericTextLabel.GenericTextLabel)
local WithStyleModule = require(Parent1.Core.Style.withStyle)
local ImagesModule = require(Parent.ImageSet.Images)
local ImageSetComponentModule = require(Parent1.Core.ImageSet.ImageSetComponent)
local UseCursorModule = require(Parent1.App.SelectionCursor.useCursor)
local _UDim = UDim.new(0, 8)
local AlertTitle = RoactModule.PureComponent:extend("AlertTitle")
AlertTitle.validateProps = TModule.strictInterface({
	layoutOrder = TModule.optional(TModule.number),
	margin = TModule.optional(TModule.table),
	maxWidth = TModule.optional(TModule.number),
	minWidth = TModule.optional(TModule.number),
	screenSize = TModule.Vector2,
	title = TModule.string,
	titlePadding = TModule.optional(TModule.number),
	titleContent = TModule.optional(TModule.callback),
	onCloseClicked = TModule.optional(TModule.callback),
	closeCursor = TModule.optional(TModule.table)
})
AlertTitle.defaultProps = {
	maxWidth = 400,
	minWidth = 272,
	titlePadding = 12,
	margin = { top = 0, bottom = 24, left = 24, right = 24 }
}

function AlertTitle.render(p1)
	-- upvalues: WithStyleModule (copy), RoactModule (copy), FitFrameOnAxis (copy), ImageSetComponentModule (copy), ImagesModule (copy), GenericTextLabelModule (copy)
	local ClampedValueDelta = math.clamp(p1.props.screenSize.X - p1.props.margin.left - p1.props.margin.right, p1.props.minWidth, p1.props.maxWidth) - p1.props.margin.left - p1.props.margin.right
	
	return WithStyleModule(function(p2)
		-- upvalues: RoactModule (upval), FitFrameOnAxis (upval), p1 (copy), ImageSetComponentModule (upval), ImagesModule (upval), GenericTextLabelModule (upval), ClampedValueDelta (copy)
		local Theme = p2.Theme
		local HeadingSmall = p2.Tokens.Typography.HeadingSmall
		local FontSize: number = HeadingSmall.FontSize
		
		return RoactModule.createElement(FitFrameOnAxis, {
			BackgroundTransparency = 1,
			contentPadding = UDim.new(0, 8),
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			LayoutOrder = p1.props.layoutOrder,
			margin = { top = 12, bottom = 0, left = 0, right = 0 },
			minimumSize = UDim2.new(1, 0, 0, 0)
		}, {
			TitleContent = p1.props.titleContent and RoactModule.createElement(FitFrameOnAxis, {
				BackgroundTransparency = 1,
				LayoutOrder = 0,
				minimumSize = UDim2.new(1, 0, 0, 0)
			}, { Content = p1.props.titleContent() }),
			TitleArea = RoactModule.createElement(FitFrameOnAxis, {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				contentPadding = UDim.new(0, 12),
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				minimumSize = UDim2.new(1, 0, 0, 0)
			}, {
				Title = if p1.props.onCloseClicked then RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Size = UDim2.new(1, 0, 0, FontSize)
				}, {
					CloseButton = RoactModule.createElement(ImageSetComponentModule.Button, {
						BackgroundTransparency = 1,
						Size = UDim2.new(0, 36, 0, 36),
						Image = ImagesModule["icons/navigation/close"],
						ImageColor3 = Theme.IconEmphasis.Color,
						ImageTransparency = Theme.IconEmphasis.Transparency,
						AnchorPoint = Vector2.new(0, 0.5),
						Position = UDim2.new(0, 0, 0.5, 0),
						[RoactModule.Event.Activated] = p1.props.onCloseClicked,
						SelectionImageObject = p1.props.closeCursor
					}),
					TitleText = RoactModule.createElement(GenericTextLabelModule, {
						LayoutOrder = 1,
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.new(0.5, 0, 0.5, 0),
						colorStyle = Theme.TextEmphasis,
						fontStyle = HeadingSmall,
						Size = UDim2.new(1, -(2 * (36 + p1.props.titlePadding)), 0, FontSize * 2),
						Text = p1.props.title,
						TextSize = FontSize,
						TextTruncate = Enum.TextTruncate.AtEnd
					})
				}) else RoactModule.createElement(GenericTextLabelModule, {
					LayoutOrder = 1,
					colorStyle = Theme.TextEmphasis,
					fontStyle = HeadingSmall,
					maxSize = Vector2.new(ClampedValueDelta, FontSize * 2),
					Text = p1.props.title,
					TextSize = FontSize,
					TextTruncate = Enum.TextTruncate.AtEnd
				}),
				Underline = RoactModule.createElement("Frame", {
					BorderSizePixel = 0,
					LayoutOrder = 2,
					BackgroundColor3 = Theme.Divider.Color,
					BackgroundTransparency = Theme.Divider.Transparency,
					Size = UDim2.new(1, 0, 0, 1)
				})
			})
		})
	end)
end

return function(p1)
	-- upvalues: UseCursorModule (copy), _UDim (copy), RoactModule (copy), AlertTitle (copy), CryoModule (copy)
	return RoactModule.createElement(AlertTitle, CryoModule.Dictionary.join(p1, { closeCursor = UseCursorModule(_UDim) }))
end