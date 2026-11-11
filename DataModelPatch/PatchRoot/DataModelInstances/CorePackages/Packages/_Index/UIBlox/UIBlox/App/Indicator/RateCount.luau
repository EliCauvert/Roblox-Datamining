local Parent = script.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent
local Parent3 = Parent2.Parent
local RoactModule = require(Parent3.Roact)
local TModule = require(Parent3.t)
local Label = require(Parent2.Core.ImageSet.ImageSetComponent).Label
local CryoModule = require(Parent3.Cryo)
local _ = require(Parent1.Style.StyleTypes)
local ValidateColorInfoModule = require(Parent2.Core.Style.Validator.validateColorInfo)
local ImagesModule = require(Parent1.ImageSet.Images)
local IconButtonModule = require(Parent1.Button.IconButton)
local GetIconSizeModule = require(Parent1.ImageSet.getIconSize)
local IconSizeModule = require(Parent1.ImageSet.Enum.IconSize)
local GenericTextLabelModule = require(Parent2.Core.Text.GenericTextLabel.GenericTextLabel)
local WithStyleModule = require(Parent2.Core.Style.withStyle)
local VoteStatesModule = require(Parent.Enum.VoteStates)
local IconsStatusGamesRatingLarge = ImagesModule["icons/status/games/rating_large"]
local IconsActionsVoteVoteDownOff = ImagesModule["icons/actions/vote/voteDownOff"]
local IconsActionsVoteVoteDownOn = ImagesModule["icons/actions/vote/voteDownOn"]
local IconsActionsVoteVoteUpOff = ImagesModule["icons/actions/vote/voteUpOff"]
local IconsActionsVoteVoteUpOn = ImagesModule["icons/actions/vote/voteUpOn"]
local config = {
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
	statWidgetIconSize = GetIconSizeModule(IconSizeModule.Large),
	buttonIconSizeEnum = IconSizeModule.Medium
}
local RateCount = RoactModule.PureComponent:extend("RateCount")
RateCount.validateProps = TModule.strictInterface({
	position = TModule.optional(TModule.UDim2),
	layoutOrder = TModule.optional(TModule.integer),
	anchorPoint = TModule.optional(TModule.Vector2),
	width = TModule.optional(TModule.integer),
	height = TModule.optional(TModule.integer),
	rateText = TModule.optional(TModule.string),
	rateLabel = TModule.optional(TModule.string),
	voteState = TModule.optional(VoteStatesModule.isEnumValue),
	onVoteDownActivated = TModule.optional(TModule.callback),
	onVoteUpActivated = TModule.optional(TModule.callback),
	styleProps = TModule.optional(TModule.strictInterface({
		containerSpacingTop = TModule.optional(TModule.integer),
		containerSpacingTrailing = TModule.optional(TModule.integer),
		containerSpacingBottom = TModule.optional(TModule.integer),
		containerSpacingLeading = TModule.optional(TModule.integer),
		containerBorderRadius = TModule.optional(TModule.integer),
		containerBackgroundColor = TModule.optional(ValidateColorInfoModule),
		containerGap = TModule.optional(TModule.integer),
		statWidgetContainerGap = TModule.optional(TModule.integer),
		statWidgetIconSize = TModule.optional(TModule.integer),
		statWidgetIconContentColor = TModule.optional(ValidateColorInfoModule),
		statWidgetDataGap = TModule.optional(TModule.integer),
		statWidgetDataContentColor = TModule.optional(ValidateColorInfoModule),
		statWidgetDataLabelContentColor = TModule.optional(ValidateColorInfoModule),
		buttonGroupGap = TModule.optional(TModule.integer),
		buttonSize = TModule.optional(TModule.integer),
		buttonIconSizeEnum = TModule.optional(IconSizeModule.isEnumValue)
	}))
})
RateCount.defaultProps = {
	height = 72,
	rateText = "",
	rateLabel = "",
	voteState = VoteStatesModule.notVoted
}

function RateCount.init(p1)
	function p1.onVoteDownActivated()
		-- upvalues: p1 (copy)
		local OnVoteDownActivatedFunction: () -> () = p1.props.onVoteDownActivated
		
		if OnVoteDownActivatedFunction then
			OnVoteDownActivatedFunction()
		end
	end
	
	function p1.onVoteUpActivated()
		-- upvalues: p1 (copy)
		local OnVoteUpActivatedFunction: () -> () = p1.props.onVoteUpActivated
		
		if OnVoteUpActivatedFunction then
			OnVoteUpActivatedFunction()
		end
	end
end

function RateCount.render(p1)
	-- upvalues: VoteStatesModule (copy), WithStyleModule (copy), CryoModule (copy), config (copy), GetIconSizeModule (copy), RoactModule (copy), Label (copy), IconsStatusGamesRatingLarge (copy), GenericTextLabelModule (copy), IconButtonModule (copy), IconsActionsVoteVoteDownOn (copy), IconsActionsVoteVoteDownOff (copy), IconsActionsVoteVoteUpOn (copy), IconsActionsVoteVoteUpOff (copy)
	local Position = p1.props.position
	local LayoutOrder = p1.props.layoutOrder
	local AnchorPoint = p1.props.anchorPoint
	local Width = p1.props.width
	local Height = p1.props.height
	local _UDim2 = nil
	_UDim2 = if Width then UDim2.new(0, Width, 0, Height) else UDim2.new(1, 0, 0, Height)
	local RateText = p1.props.rateText
	local RateLabel = p1.props.rateLabel
	local VoteState = p1.props.voteState
	local IsVoteStateMatch = VoteState == VoteStatesModule.votedDown
	local IsVoteStateMatch1 = VoteState == VoteStatesModule.votedUp
	
	return WithStyleModule(function(p2)
		-- upvalues: CryoModule (upval), config (upval), p1 (copy), GetIconSizeModule (upval), RoactModule (upval), _UDim2 (ref), Position (copy), AnchorPoint (copy), LayoutOrder (copy), Label (upval), IconsStatusGamesRatingLarge (upval), GenericTextLabelModule (upval), RateText (copy), RateLabel (copy), IconButtonModule (upval), IsVoteStateMatch (copy), IconsActionsVoteVoteDownOn (upval), IconsActionsVoteVoteDownOff (upval), IsVoteStateMatch1 (copy), IconsActionsVoteVoteUpOn (upval), IconsActionsVoteVoteUpOff (upval)
		local JoinResult = CryoModule.Dictionary.join(config, p1.props.styleProps or {})
		local ContainerBackgroundColor = JoinResult.containerBackgroundColor or p2.Theme.BackgroundContrast
		local ContainerGap = JoinResult.containerGap
		local StatWidgetIconSize = JoinResult.statWidgetIconSize
		local StatWidgetIconContentColor = JoinResult.statWidgetIconContentColor or p2.Theme.IconEmphasis
		local ButtonSize: number = JoinResult.buttonSize
		local ButtonIconSizeEnum = JoinResult.buttonIconSizeEnum
		
		return RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = _UDim2,
			Position = Position,
			AnchorPoint = AnchorPoint,
			BackgroundColor3 = ContainerBackgroundColor.Color,
			BackgroundTransparency = ContainerBackgroundColor.Transparency,
			LayoutOrder = LayoutOrder
		}, {
			RoundCorner = RoactModule.createElement("UICorner", {
				CornerRadius = UDim.new(0, JoinResult.containerBorderRadius)
			}),
			ListLayout = RoactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, ContainerGap)
			}),
			Padding = RoactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, JoinResult.containerSpacingLeading),
				PaddingRight = UDim.new(0, JoinResult.containerSpacingTrailing)
			}),
			Icon = RoactModule.createElement(Label, {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(StatWidgetIconSize, StatWidgetIconSize),
				Image = IconsStatusGamesRatingLarge,
				ImageColor3 = StatWidgetIconContentColor.Color,
				ImageTransparency = StatWidgetIconContentColor.Transparency
			}),
			TextSection = RoactModule.createElement("Frame", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, -(StatWidgetIconSize + math.max(GetIconSizeModule(ButtonIconSizeEnum, p2), ButtonSize) * 2 + JoinResult.statWidgetContainerGap + ContainerGap + JoinResult.buttonGroupGap), 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				ListLayout = RoactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical,
					Padding = UDim.new(0, JoinResult.statWidgetDataGap)
				}),
				RateText = RoactModule.createElement(GenericTextLabelModule, {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.XY,
					Text = RateText,
					colorStyle = JoinResult.statWidgetDataContentColor or p2.Theme.TextEmphasis,
					fontStyle = p2.Font.Title
				}),
				RateLabel = RoactModule.createElement(GenericTextLabelModule, {
					LayoutOrder = 2,
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.XY,
					Text = RateLabel,
					colorStyle = JoinResult.statWidgetDataLabelContentColor or p2.Theme.TextEmphasis,
					fontStyle = p2.Font.CaptionHeader
				})
			}),
			VoteDown = RoactModule.createElement(IconButtonModule, {
				layoutOrder = 3,
				showBackground = true,
				size = UDim2.fromOffset(ButtonSize, ButtonSize),
				icon = IsVoteStateMatch and IconsActionsVoteVoteDownOn or IconsActionsVoteVoteDownOff,
				iconColor3 = p2.Theme.IconEmphasis.Color,
				iconSize = ButtonIconSizeEnum,
				onActivated = p1.onVoteDownActivated
			}),
			VoteUp = RoactModule.createElement(IconButtonModule, {
				layoutOrder = 4,
				showBackground = true,
				size = UDim2.fromOffset(ButtonSize, ButtonSize),
				icon = IsVoteStateMatch1 and IconsActionsVoteVoteUpOn or IconsActionsVoteVoteUpOff,
				iconColor3 = p2.Theme.IconEmphasis.Color,
				iconSize = ButtonIconSizeEnum,
				onActivated = p1.onVoteUpActivated
			})
		})
	end)
end

return RateCount