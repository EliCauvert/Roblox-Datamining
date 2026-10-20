local Parent = script:FindFirstAncestor("AppBlox").Parent
local UIBloxModule = require(Parent.UIBlox)
local WithStyleFunction = UIBloxModule.Core.Style.withStyle
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local RoactModule = require(Parent.Roact)
local TModule = require(Parent.t)
local GetTextSizeFunction = require(Parent.Style).GetTextSize
local DetailsPageTitleContent = RoactModule.PureComponent:extend("DetailsPageTitleContent")
DetailsPageTitleContent.validateProps = TModule.strictInterface({
	titleText = TModule.optional(TModule.string),
	subTitleText = TModule.optional(TModule.string),
	renderInfoContent = TModule.optional(TModule.callback),
	layoutOrder = TModule.optional(TModule.number),
	verticalAlignment = TModule.optional(TModule.enum(Enum.VerticalAlignment))
})

function DetailsPageTitleContent.init(p1)
	-- upvalues: GetTextSizeFunction (copy)
	p1.state = { containerWidth = nil }
	
	function p1.onContainerSizeChange(Frame)
		-- upvalues: p1 (copy)
		p1:setState(function(_, _)
			-- upvalues: Frame (copy)
			return { containerWidth = Frame.AbsoluteSize.X }
		end)
	end
	
	function p1.getTextSize(TitleText, Title, p2)
		-- upvalues: GetTextSizeFunction (upval)
		return GetTextSizeFunction(TitleText, Title.RelativeSize * p2.Font.BaseSize, Title.Font, (Vector2.new(10000, 10000)))
	end
end

function DetailsPageTitleContent.render(p1)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), StyledTextLabel (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: p1 (copy), RoactModule (upval), StyledTextLabel (upval)
		local Theme = p2.Theme
		local _Font = p2.Font
		local _UDim2 = UDim2.new(0, 0, 1, 0)
		
		if p1.props.titleText then
			local TextSize = p1.getTextSize(p1.props.titleText, _Font.Title, p2)
			local ScaledY = TextSize.Y * 1
			_UDim2 = if p1.state.containerWidth == nil or p1.state.containerWidth > TextSize.X then UDim2.new(0, 0, 0, ScaledY) else UDim2.new(0, 0, 0, ScaledY * 2)
		end
		return RoactModule.createElement("Frame", {
			Size = UDim2.fromScale(1, 0),
			BackgroundTransparency = 1,
			[RoactModule.Change.AbsoluteSize] = p1.onContainerSizeChange,
			AutomaticSize = Enum.AutomaticSize.Y,
			LayoutOrder = p1.props.layoutOrder
		}, {
			ListLayout = RoactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				VerticalAlignment = p1.props.verticalAlignment
			}),
			Title = p1.props.titleText and RoactModule.createElement(StyledTextLabel, {
				lineHeight = 1,
				fluidSizing = false,
				layoutOrder = 1,
				richText = false,
				text = p1.props.titleText,
				size = _UDim2,
				automaticSize = Enum.AutomaticSize.X,
				fontStyle = _Font.Title,
				colorStyle = Theme.TextEmphasis,
				textTruncate = Enum.TextTruncate.AtEnd
			}) or nil,
			SubTitle = p1.props.subTitleText and RoactModule.createElement(StyledTextLabel, {
				layoutOrder = 2,
				richText = false,
				text = p1.props.subTitleText,
				fontStyle = _Font.Header2,
				colorStyle = Theme.TextMuted,
				automaticSize = Enum.AutomaticSize.XY
			}) or nil,
			CustomContentComponentFrame = p1.props.renderInfoContent and RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 3,
				Size = UDim2.fromScale(1, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, { CustomContent = p1.props.renderInfoContent() }) or nil
		})
	end)
end

return DetailsPageTitleContent