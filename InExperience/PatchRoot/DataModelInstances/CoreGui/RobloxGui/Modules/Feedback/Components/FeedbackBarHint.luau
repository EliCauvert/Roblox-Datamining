local corePackagesService = game:GetService("CorePackages")
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local tModule = require(corePackagesService.Packages.t)
local roactModule = require(corePackagesService.Packages.Roact)
local withStyle = UIBloxModule.Core.Style.withStyle
local styledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local feedbackBarHintSizeAdjustment = game:DefineFastFlag("FeedbackBarHintSizeAdjustment", false)
local feedbackBarHint = roactModule.PureComponent:extend("FeedbackBarHint")
feedbackBarHint.validateProps = tModule.strictInterface({
	layoutOrder = tModule.optional(tModule.integer),
	text = tModule.string,
	maxWidth = tModule.optional(tModule.number),
	hintTextSize = tModule.optional(tModule.number)
})

function feedbackBarHint.render(p0)
	-- upvalues: withStyle (ref), roactModule (ref), styledTextLabel (ref), feedbackBarHintSizeAdjustment (ref)
	return withStyle(function(p1)
		-- upvalues: roactModule (copy), p0 (ref), styledTextLabel (copy), feedbackBarHintSizeAdjustment (copy)
		return roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = p0.props.layoutOrder,
			AutomaticSize = Enum.AutomaticSize.X
		}, {
			Layout = roactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UDim.new(0, 8)
			}),
			FeedbackBarHintText = roactModule.createElement(styledTextLabel, {
				layoutOrder = 2,
				textSize = p0.props.hintTextSize,
				maxSize = if p0.props.maxWidth then if feedbackBarHintSizeAdjustment then Vector2.new(1000, p0.props.maxWidth) else Vector2.new(p0.props.maxWidth) else nil,
				fontStyle = p1.Font.Header2,
				colorStyle = p1.Theme.TextEmphasis,
				automaticSize = if not p0.props.maxWidth then Enum.AutomaticSize.X else nil,
				fluidSizing = if p0.props.maxWidth then true else false,
				text = p0.props.text,
				textTruncate = if p0.props.maxWidth then Enum.TextTruncate.AtEnd else nil,
				textXAlignment = Enum.TextXAlignment.Left,
				textYAlignment = Enum.TextYAlignment.Center
			})
		})
	end)
end

return feedbackBarHint