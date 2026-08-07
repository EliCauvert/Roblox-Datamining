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

function detailsPageTitleContent.init(p0) --[[ line: 27 ]]
	-- upvalues: getTextSize (ref)
	p0.state = { containerWidth = nil }
	
	function p0.onContainerSizeChange(p1) --[[ line: 31 ]]
		-- upvalues: p0 (ref)
		p0:setState(function(_, _) --[[ line: 32 ]]
			-- upvalues: p1 (ref)
			return { containerWidth = p1.AbsoluteSize.X }
		end)
	end
	
	function p0.getTextSize(p2, p3, p4) --[[ line: 38 ]]
		-- upvalues: getTextSize (copy)
		return getTextSize(p2, p3.RelativeSize * p4.Font.BaseSize, p3.Font, Vector2.new(10000, 10000))
	end
end

function detailsPageTitleContent.render(p5) --[[ line: 46 ]]
	-- upvalues: withStyle (ref), roactModule (ref), styledTextLabel (ref)
	return withStyle(function(p6) --[[ line: 47 ]]
		-- upvalues: p5 (ref), roactModule (copy), styledTextLabel (copy)
		local theme = p6.Theme
		local font = p6.Font
		local uDim2 = UDim2.new(0, 0, 1, 0)
		
		if p5.props.titleText then
			local textSize = p5.getTextSize(p5.props.titleText, font.Title, p6)
			local var6 = textSize.Y * 1
			uDim2 = if p5.state.containerWidth == nil or p5.state.containerWidth > textSize.X then UDim2.new(0, 0, 0, var6) else UDim2.new(0, 0, 0, var6 * 2)
		end
		return roactModule.createElement("Frame", {
			Size = UDim2.fromScale(1, 0),
			BackgroundTransparency = 1,
			[roactModule.Change.AbsoluteSize] = p5.onContainerSizeChange,
			AutomaticSize = Enum.AutomaticSize.Y,
			LayoutOrder = p5.props.layoutOrder
		}, {
			ListLayout = roactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				VerticalAlignment = p5.props.verticalAlignment
			}),
			Title = p5.props.titleText and roactModule.createElement(styledTextLabel, {
				lineHeight = 1,
				fluidSizing = false,
				layoutOrder = 1,
				richText = false,
				text = p5.props.titleText,
				size = uDim2,
				automaticSize = Enum.AutomaticSize.X,
				fontStyle = font.Title,
				colorStyle = theme.TextEmphasis,
				textTruncate = Enum.TextTruncate.AtEnd
			}) or nil,
			SubTitle = p5.props.subTitleText and roactModule.createElement(styledTextLabel, {
				layoutOrder = 2,
				richText = false,
				text = p5.props.subTitleText,
				fontStyle = font.Header2,
				colorStyle = theme.TextMuted,
				automaticSize = Enum.AutomaticSize.XY
			}) or nil,
			CustomContentComponentFrame = p5.props.renderInfoContent and roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 3,
				Size = UDim2.fromScale(1, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, { CustomContent = p5.props.renderInfoContent() }) or nil
		})
	end)
end

return detailsPageTitleContent