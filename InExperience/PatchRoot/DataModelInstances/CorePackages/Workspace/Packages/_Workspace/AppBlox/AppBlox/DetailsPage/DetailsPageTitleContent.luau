local parent = script:FindFirstAncestor("AppBlox").Parent
local UIBloxModule = require(parent.UIBlox)
local withStyle = UIBloxModule.Core.Style.withStyle
local styledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local roactModule = require(parent.Roact)
local tModule = require(parent.t)
local getTextSize = require(parent.Style).GetTextSize
local detailsPageTitleContent = roactModule.PureComponent:extend("DetailsPageTitleContent")
detailsPageTitleContent.validateProps = tModule.strictInterface({
	titleText = tModule.optional(tModule.string),
	subTitleText = tModule.optional(tModule.string),
	renderInfoContent = tModule.optional(tModule.callback),
	layoutOrder = tModule.optional(tModule.number),
	verticalAlignment = tModule.optional(tModule.enum(Enum.VerticalAlignment))
})

function detailsPageTitleContent.init(p1)
	-- upvalues: getTextSize (ref)
	p1.state = { containerWidth = nil }
	
	function p0.onContainerSizeChange(p2)
		-- upvalues: p1 (ref)
		p1:setState(function(_, _)
			-- upvalues: p2 (ref)
			return { containerWidth = p2.AbsoluteSize.X }
		end)
	end
	
	function p0.getTextSize(p2, p3, p4)
		-- upvalues: getTextSize (copy)
		return getTextSize(p2, p3.RelativeSize * p4.Font.BaseSize, p3.Font, Vector2.new(10000, 10000))
	end
end

function detailsPageTitleContent.render(p1)
	-- upvalues: withStyle (ref), roactModule (ref), styledTextLabel (ref)
	return withStyle(function(p2)
		-- upvalues: p1 (ref), roactModule (copy), styledTextLabel (copy)
		local theme = p2.Theme
		local font = p2.Font
		local uDim2 = UDim2.new(0, 0, 1, 0)
		
		if p1.props.titleText then
			local textSize = p1.getTextSize(p1.props.titleText, font.Title, p2)
			local var1 = textSize.Y * 1
			uDim2 = if p1.state.containerWidth == nil or p1.state.containerWidth > textSize.X then UDim2.new(0, 0, 0, var1) else UDim2.new(0, 0, 0, var1 * 2)
		end
		return roactModule.createElement("Frame", {
			Size = UDim2.fromScale(1, 0),
			BackgroundTransparency = 1,
			[roactModule.Change.AbsoluteSize] = p1.onContainerSizeChange,
			AutomaticSize = Enum.AutomaticSize.Y,
			LayoutOrder = p1.props.layoutOrder
		}, {
			ListLayout = roactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				VerticalAlignment = p1.props.verticalAlignment
			}),
			Title = p1.props.titleText and roactModule.createElement(styledTextLabel, {
				lineHeight = 1,
				fluidSizing = false,
				layoutOrder = 1,
				richText = false,
				text = p1.props.titleText,
				size = uDim2,
				automaticSize = Enum.AutomaticSize.X,
				fontStyle = font.Title,
				colorStyle = theme.TextEmphasis,
				textTruncate = Enum.TextTruncate.AtEnd
			}) or nil,
			SubTitle = p1.props.subTitleText and roactModule.createElement(styledTextLabel, {
				layoutOrder = 2,
				richText = false,
				text = p1.props.subTitleText,
				fontStyle = font.Header2,
				colorStyle = theme.TextMuted,
				automaticSize = Enum.AutomaticSize.XY
			}) or nil,
			CustomContentComponentFrame = p1.props.renderInfoContent and roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 3,
				Size = UDim2.fromScale(1, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, { CustomContent = p1.props.renderInfoContent() }) or nil
		})
	end)
end

return detailsPageTitleContent