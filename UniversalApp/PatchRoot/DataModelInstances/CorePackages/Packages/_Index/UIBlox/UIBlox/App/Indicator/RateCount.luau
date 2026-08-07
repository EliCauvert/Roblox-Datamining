local parent = script.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local parent_3 = parent_2.Parent
local roactModule = require(parent_3.Roact)
local tModule = require(parent_3.t)
local label = require(parent_2.Core.ImageSet.ImageSetComponent).Label
local cryoModule = require(parent_3.Cryo)
local _ = require(parent_1.Style.StyleTypes)
local validateColorInfoModule = require(parent_2.Core.Style.Validator.validateColorInfo)
local imagesModule = require(parent_1.ImageSet.Images)
local iconButtonModule = require(parent_1.Button.IconButton)
local getIconSizeModule = require(parent_1.ImageSet.getIconSize)
local iconSizeModule = require(parent_1.ImageSet.Enum.IconSize)
local genericTextLabelModule = require(parent_2.Core.Text.GenericTextLabel.GenericTextLabel)
local withStyleModule = require(parent_2.Core.Style.withStyle)
local voteStatesModule = require(parent.Enum.VoteStates)
local ratingLarge = imagesModule["icons/status/games/rating_large"]
local voteDownOff = imagesModule["icons/actions/vote/voteDownOff"]
local voteDownOn = imagesModule["icons/actions/vote/voteDownOn"]
local voteUpOff = imagesModule["icons/actions/vote/voteUpOff"]
local voteUpOn = imagesModule["icons/actions/vote/voteUpOn"]
local t = {
	containerSpacingTop = 12,
	containerSpacingTrailing = 12,
	containerSpacingBottom = 12,
	containerSpacingLeading = 12,
	containerBorderRadius = 8,
	containerGap = 12,
	statWidgetContainerGap = 12,
	statWidgetDataGap = 0,
	buttonGroupGap = 12,
	buttonSize = 44,
	statWidgetIconSize = getIconSizeModule(iconSizeModule.Large),
	buttonIconSizeEnum = iconSizeModule.Medium
}
local rateCount = roactModule.PureComponent:extend("RateCount")
rateCount.validateProps = tModule.strictInterface({
	position = tModule.optional(tModule.UDim2),
	layoutOrder = tModule.optional(tModule.integer),
	anchorPoint = tModule.optional(tModule.Vector2),
	width = tModule.optional(tModule.integer),
	height = tModule.optional(tModule.integer),
	rateText = tModule.optional(tModule.string),
	rateLabel = tModule.optional(tModule.string),
	voteState = tModule.optional(voteStatesModule.isEnumValue),
	onVoteDownActivated = tModule.optional(tModule.callback),
	onVoteUpActivated = tModule.optional(tModule.callback),
	styleProps = tModule.optional(tModule.strictInterface({
		containerSpacingTop = tModule.optional(tModule.integer),
		containerSpacingTrailing = tModule.optional(tModule.integer),
		containerSpacingBottom = tModule.optional(tModule.integer),
		containerSpacingLeading = tModule.optional(tModule.integer),
		containerBorderRadius = tModule.optional(tModule.integer),
		containerBackgroundColor = tModule.optional(validateColorInfoModule),
		containerGap = tModule.optional(tModule.integer),
		statWidgetContainerGap = tModule.optional(tModule.integer),
		statWidgetIconSize = tModule.optional(tModule.integer),
		statWidgetIconContentColor = tModule.optional(validateColorInfoModule),
		statWidgetDataGap = tModule.optional(tModule.integer),
		statWidgetDataContentColor = tModule.optional(validateColorInfoModule),
		statWidgetDataLabelContentColor = tModule.optional(validateColorInfoModule),
		buttonGroupGap = tModule.optional(tModule.integer),
		buttonSize = tModule.optional(tModule.integer),
		buttonIconSizeEnum = tModule.optional(iconSizeModule.isEnumValue)
	}))
})
rateCount.defaultProps = {
	height = 72,
	rateText = "",
	rateLabel = "",
	voteState = voteStatesModule.notVoted
}

function rateCount.init(p0) --[[ line: 151 ]]
	function p0.onVoteDownActivated() --[[ line: 152 ]]
		-- upvalues: p0 (ref)
		local onVoteDownActivated = p0.props.onVoteDownActivated
		
		if onVoteDownActivated then
			onVoteDownActivated()
		end
	end
	
	function p0.onVoteUpActivated() --[[ line: 159 ]]
		-- upvalues: p0 (ref)
		local onVoteUpActivated = p0.props.onVoteUpActivated
		
		if onVoteUpActivated then
			onVoteUpActivated()
		end
	end
end

function rateCount.render(p1) --[[ line: 167 ]]
	-- upvalues: voteStatesModule (ref), withStyleModule (ref), cryoModule (ref), t (ref), getIconSizeModule (ref), roactModule (ref), label (ref), ratingLarge (ref), genericTextLabelModule (ref), iconButtonModule (ref), voteDownOn (ref), voteDownOff (ref), voteUpOn (ref), voteUpOff (ref)
	local position = p1.props.position
	local layoutOrder = p1.props.layoutOrder
	local anchorPoint = p1.props.anchorPoint
	local width = p1.props.width
	local height = p1.props.height
	local var13 = if width then UDim2.new(0, width, 0, height) else UDim2.new(1, 0, 0, height)
	local rateText = p1.props.rateText
	local rateLabel = p1.props.rateLabel
	local voteState = p1.props.voteState
	local var14 = voteState == voteStatesModule.votedDown
	local var15 = voteState == voteStatesModule.votedUp
	
	return withStyleModule(function(p2) --[[ line: 187 ]]
		-- upvalues: cryoModule (copy), t (copy), p1 (ref), getIconSizeModule (copy), roactModule (copy), var13 (write), position (ref), anchorPoint (ref), layoutOrder (ref), label (copy), ratingLarge (copy), genericTextLabelModule (copy), rateText (ref), rateLabel (ref), iconButtonModule (copy), var14 (ref), voteDownOn (copy), voteDownOff (copy), var15 (ref), voteUpOn (copy), voteUpOff (copy)
		local var16 = cryoModule.Dictionary.join(t, p1.props.styleProps or {})
		local containerSpacingLeading = var16.containerSpacingLeading
		local containerSpacingTrailing = var16.containerSpacingTrailing
		local containerBorderRadius = var16.containerBorderRadius
		local containerBackgroundColor = var16.containerBackgroundColor or p2.Theme.BackgroundContrast
		local containerGap = var16.containerGap
		local statWidgetContainerGap = var16.statWidgetContainerGap
		local statWidgetIconSize = var16.statWidgetIconSize
		local statWidgetIconContentColor = var16.statWidgetIconContentColor or p2.Theme.IconEmphasis
		local statWidgetDataGap = var16.statWidgetDataGap
		local statWidgetDataContentColor = var16.statWidgetDataContentColor or p2.Theme.TextEmphasis
		local statWidgetDataLabelContentColor = var16.statWidgetDataLabelContentColor or p2.Theme.TextEmphasis
		local buttonGroupGap = var16.buttonGroupGap
		local buttonSize = var16.buttonSize
		local buttonIconSizeEnum = var16.buttonIconSizeEnum
		
		return roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = var13,
			Position = position,
			AnchorPoint = anchorPoint,
			BackgroundColor3 = containerBackgroundColor.Color,
			BackgroundTransparency = containerBackgroundColor.Transparency,
			LayoutOrder = layoutOrder
		}, {
			RoundCorner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0, containerBorderRadius) }),
			ListLayout = roactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, containerGap)
			}),
			Padding = roactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, containerSpacingLeading),
				PaddingRight = UDim.new(0, containerSpacingTrailing)
			}),
			Icon = roactModule.createElement(label, {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(statWidgetIconSize, statWidgetIconSize),
				Image = ratingLarge,
				ImageColor3 = statWidgetIconContentColor.Color,
				ImageTransparency = statWidgetIconContentColor.Transparency
			}),
			TextSection = roactModule.createElement("Frame", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, -(statWidgetIconSize + math.max(getIconSizeModule(buttonIconSizeEnum, p2), buttonSize) * 2 + statWidgetContainerGap + containerGap + buttonGroupGap), 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				ListLayout = roactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical,
					Padding = UDim.new(0, statWidgetDataGap)
				}),
				RateText = roactModule.createElement(genericTextLabelModule, {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.XY,
					Text = rateText,
					colorStyle = statWidgetDataContentColor,
					fontStyle = p2.Font.Title
				}),
				RateLabel = roactModule.createElement(genericTextLabelModule, {
					LayoutOrder = 2,
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.XY,
					Text = rateLabel,
					colorStyle = statWidgetDataLabelContentColor,
					fontStyle = p2.Font.CaptionHeader
				})
			}),
			VoteDown = roactModule.createElement(iconButtonModule, {
				layoutOrder = 3,
				showBackground = true,
				size = UDim2.fromOffset(buttonSize, buttonSize),
				icon = if var14 then voteDownOn else voteDownOff,
				iconColor3 = p2.Theme.IconEmphasis.Color,
				iconSize = buttonIconSizeEnum,
				onActivated = p1.onVoteDownActivated
			}),
			VoteUp = roactModule.createElement(iconButtonModule, {
				layoutOrder = 4,
				showBackground = true,
				size = UDim2.fromOffset(buttonSize, buttonSize),
				icon = if var15 then voteUpOn else voteUpOff,
				iconColor3 = p2.Theme.IconEmphasis.Color,
				iconSize = buttonIconSizeEnum,
				onActivated = p1.onVoteUpActivated
			})
		})
	end)
end

return rateCount