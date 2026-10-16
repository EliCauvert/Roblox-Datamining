local CorePackages = game:GetService("CorePackages")
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local TModule = require(CorePackages.Packages.t)
local RoactModule = require(CorePackages.Packages.Roact)
local WithStyleFunction = UIBloxModule.Core.Style.withStyle
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local FeedbackBarHintSizeAdjustment = game:DefineFastFlag("FeedbackBarHintSizeAdjustment", false)
local FeedbackBarHint = RoactModule.PureComponent:extend("FeedbackBarHint")
FeedbackBarHint.validateProps = TModule.strictInterface({
	layoutOrder = TModule.optional(TModule.integer),
	text = TModule.string,
	maxWidth = TModule.optional(TModule.number),
	hintTextSize = TModule.optional(TModule.number)
})

function FeedbackBarHint.render(p1) --[[ Line: 32 ]]
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), StyledTextLabel (copy), FeedbackBarHintSizeAdjustment (copy)
	return WithStyleFunction(function(p2) --[[ Line: 33 ]]
		-- upvalues: RoactModule (upval), p1 (copy), StyledTextLabel (upval), FeedbackBarHintSizeAdjustment (upval)
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = p1.props.layoutOrder,
			AutomaticSize = Enum.AutomaticSize.X
		}, {
			Layout = RoactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UDim.new(0, 8)
			}),
			FeedbackBarHintText = RoactModule.createElement(StyledTextLabel, {
				layoutOrder = 2,
				textSize = p1.props.hintTextSize,
				maxSize = if p1.props.maxWidth then if FeedbackBarHintSizeAdjustment then Vector2.new(1000, p1.props.maxWidth) else Vector2.new(p1.props.maxWidth) else nil,
				fontStyle = p2.Font.Header2,
				colorStyle = p2.Theme.TextEmphasis,
				automaticSize = if p1.props.maxWidth then nil else Enum.AutomaticSize.X,
				fluidSizing = if p1.props.maxWidth then true else false,
				text = p1.props.text,
				textTruncate = if p1.props.maxWidth then Enum.TextTruncate.AtEnd else nil,
				textXAlignment = Enum.TextXAlignment.Left,
				textYAlignment = Enum.TextYAlignment.Center
			})
		})
	end)
end

return FeedbackBarHint