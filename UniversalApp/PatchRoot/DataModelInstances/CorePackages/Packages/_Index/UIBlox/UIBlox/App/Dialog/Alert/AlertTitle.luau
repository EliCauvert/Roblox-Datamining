local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local core = parent_1.Core
local roactModule = require(parent_2.Roact)
local tModule = require(parent_2.t)
local cryoModule = require(parent_2.Cryo)
local fitFrameOnAxis = require(parent_2.FitFrame).FitFrameOnAxis
local genericTextLabelModule = require(parent_1.Core.Text.GenericTextLabel.GenericTextLabel)
local withStyleModule = require(parent_1.Core.Style.withStyle)
local imagesModule = require(parent.ImageSet.Images)
local imageSetComponentModule = require(core.ImageSet.ImageSetComponent)
local useCursorModule = require(parent_1.App.SelectionCursor.useCursor)
local UIBloxConfigModule = require(parent_1.UIBloxConfig)
local uDim = UDim.new(0, 8)
local alertTitle = roactModule.PureComponent:extend("AlertTitle")
alertTitle.validateProps = tModule.strictInterface({
	layoutOrder = tModule.optional(tModule.number),
	margin = tModule.optional(tModule.table),
	maxWidth = tModule.optional(tModule.number),
	minWidth = tModule.optional(tModule.number),
	screenSize = tModule.Vector2,
	title = tModule.string,
	titlePadding = tModule.optional(tModule.number),
	titleContent = tModule.optional(tModule.callback),
	onCloseClicked = tModule.optional(tModule.callback),
	closeCursor = tModule.optional(tModule.table)
})
alertTitle.defaultProps = {
	maxWidth = 400,
	minWidth = 272,
	titlePadding = 12,
	margin = { top = 0, bottom = 24, left = 24, right = 24 }
}

function alertTitle.render(p0)
	-- upvalues: withStyleModule (ref), UIBloxConfigModule (ref), roactModule (ref), fitFrameOnAxis (ref), imageSetComponentModule (ref), imagesModule (ref), genericTextLabelModule (ref)
	local var11 = math.clamp(p0.props.screenSize.X - p0.props.margin.left - p0.props.margin.right, p0.props.minWidth, p0.props.maxWidth) - p0.props.margin.left - p0.props.margin.right
	
	return withStyleModule(function(p1)
		-- upvalues: UIBloxConfigModule (copy), roactModule (copy), fitFrameOnAxis (copy), p0 (ref), imageSetComponentModule (copy), imagesModule (copy), genericTextLabelModule (copy), var11 (ref)
		local theme = p1.Theme
		local var12 = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p1.Tokens.Typography.HeadingSmall else p1.Tokens.Semantic.Typography.Header
		local fontSize = var12.FontSize
		
		return roactModule.createElement(fitFrameOnAxis, {
			BackgroundTransparency = 1,
			contentPadding = UDim.new(0, 8),
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			LayoutOrder = p0.props.layoutOrder,
			margin = { top = 12, bottom = 0, left = 0, right = 0 },
			minimumSize = UDim2.new(1, 0, 0, 0)
		}, {
			TitleContent = p0.props.titleContent and roactModule.createElement(fitFrameOnAxis, {
				BackgroundTransparency = 1,
				LayoutOrder = 0,
				minimumSize = UDim2.new(1, 0, 0, 0)
			}, { Content = p0.props.titleContent() }),
			TitleArea = roactModule.createElement(fitFrameOnAxis, {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				contentPadding = UDim.new(0, 12),
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				minimumSize = UDim2.new(1, 0, 0, 0)
			}, {
				Title = if p0.props.onCloseClicked then roactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Size = UDim2.new(1, 0, 0, fontSize)
				}, {
					CloseButton = roactModule.createElement(imageSetComponentModule.Button, {
						BackgroundTransparency = 1,
						Size = UDim2.new(0, 36, 0, 36),
						Image = imagesModule["icons/navigation/close"],
						ImageColor3 = theme.IconEmphasis.Color,
						ImageTransparency = theme.IconEmphasis.Transparency,
						AnchorPoint = Vector2.new(0, 0.5),
						Position = UDim2.new(0, 0, 0.5, 0),
						[roactModule.Event.Activated] = p0.props.onCloseClicked,
						SelectionImageObject = p0.props.closeCursor
					}),
					TitleText = roactModule.createElement(genericTextLabelModule, {
						LayoutOrder = 1,
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.new(0.5, 0, 0.5, 0),
						colorStyle = theme.TextEmphasis,
						fontStyle = var12,
						Size = UDim2.new(1, -(2 * (36 + p0.props.titlePadding)), 0, fontSize * 2),
						Text = p0.props.title,
						TextSize = fontSize,
						TextTruncate = Enum.TextTruncate.AtEnd
					})
				}) else roactModule.createElement(genericTextLabelModule, {
					LayoutOrder = 1,
					colorStyle = theme.TextEmphasis,
					fontStyle = var12,
					maxSize = Vector2.new(var11, fontSize * 2),
					Text = p0.props.title,
					TextSize = fontSize,
					TextTruncate = Enum.TextTruncate.AtEnd
				}),
				Underline = roactModule.createElement("Frame", {
					BorderSizePixel = 0,
					LayoutOrder = 2,
					BackgroundColor3 = theme.Divider.Color,
					BackgroundTransparency = theme.Divider.Transparency,
					Size = UDim2.new(1, 0, 0, 1)
				})
			})
		})
	end)
end

return function(p2)
	-- upvalues: useCursorModule (ref), uDim (ref), roactModule (ref), alertTitle (ref), cryoModule (ref)
	return roactModule.createElement(alertTitle, cryoModule.Dictionary.join(p2, { closeCursor = useCursorModule(uDim) }))
end