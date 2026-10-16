local Parent = script:FindFirstAncestor("AppBlox").Parent
local RoactModule = require(Parent.Roact)
local TModule = require(Parent.t)
local UIBloxModule = require(Parent.UIBlox)
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local ControlState = UIBloxModule.Core.Control.Enum.ControlState
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local Interactable = UIBloxModule.Core.Control.Interactable
local LoadableImage = UIBloxModule.App.Loading.LoadableImage
local WithStyleFunction = UIBloxModule.Core.Style.withStyle
local HoverButtonBackgroundModule = require(script.Parent.HoverButtonBackground)
local IconSize = UIBloxModule.App.ImageSet.getIconSize(UIBloxModule.App.ImageSet.Enum.IconSize.Large)
local _UDim2 = UDim2.fromScale(0.4, 0.512)
local _UDim2_1 = UDim2.fromOffset(64, 48)
local _UDim2_2 = UDim2.fromScale(0.25, 0.33)
local ThumbnailButton = RoactModule.Component:extend("ThumbnailButton")
ThumbnailButton.validateProps = TModule.strictInterface({
	layoutOrder = TModule.optional(TModule.number),
	size = TModule.optional(TModule.UDim2),
	anchorPoint = TModule.optional(TModule.Vector2),
	position = TModule.optional(TModule.UDim2),
	itemKey = TModule.any,
	imageId = TModule.optional(TModule.string),
	isVideo = TModule.optional(TModule.boolean),
	useScaledPlayButton = TModule.optional(TModule.boolean),
	isSelected = TModule.optional(TModule.boolean),
	userInteractionEnabled = TModule.optional(TModule.boolean),
	onActivated = TModule.optional(TModule.callback),
	onPlayActivated = TModule.optional(TModule.callback)
})
ThumbnailButton.defaultProps = {
	imageId = "",
	isVideo = false,
	isSelected = false,
	userInteractionEnabled = true,
	size = UDim2.fromScale(1, 1)
}

function ThumbnailButton.init(p1) --[[ Line: 57 ]]
	-- upvalues: ControlState (copy)
	p1:setState({ controlState = ControlState.Initialize })
	
	function p1:onStateChanged(ControlState) --[[ Line: 62 ]]
		-- upvalues: p1 (copy)
		p1:setState({ controlState = ControlState })
	end
	
	function p1.onActivated() --[[ Line: 68 ]]
		-- upvalues: p1 (copy)
		if p1.props.onActivated then
			p1.props.onActivated(p1.props.itemKey)
		end
	end
	
	function p1.onPlayActivated() --[[ Line: 74 ]]
		-- upvalues: p1 (copy)
		if p1.props.onPlayActivated then
			p1.props.onPlayActivated(p1.props.itemKey)
		end
	end
end

function ThumbnailButton.renderButton(p1) --[[ Line: 81 ]]
	-- upvalues: _UDim2 (copy), _UDim2_1 (copy), WithStyleFunction (copy), ControlState (copy), RoactModule (copy), Interactable (copy), LoadableImage (copy), Button (copy), ButtonType (copy), Images (copy), ImageSetLabel (copy), _UDim2_2 (copy), HoverButtonBackgroundModule (copy)
	local UseScaledPlayButton = p1.props.useScaledPlayButton
	local _UDim = nil
	_UDim = if UseScaledPlayButton then _UDim2 else _UDim2_1
	
	return WithStyleFunction(function(p2) --[[ Line: 90 ]]
		-- upvalues: p1 (copy), ControlState (upval), RoactModule (upval), Interactable (upval), LoadableImage (upval), Button (upval), ButtonType (upval), _UDim (ref), UseScaledPlayButton (copy), Images (upval), ImageSetLabel (upval), _UDim2_2 (upval), HoverButtonBackgroundModule (upval)
		local IsVideo = p1.props.isVideo
		local BackgroundDefault = p1.props.isSelected and p2.Theme.BackgroundDefault or p2.Theme.BackgroundUIDefault
		
		return RoactModule.createElement(Interactable, {
			LayoutOrder = p1.props.layoutOrder,
			Size = p1.props.size,
			AnchorPoint = p1.props.anchorPoint,
			Position = p1.props.position,
			AutoButtonColor = false,
			BackgroundColor3 = BackgroundDefault.Color,
			BackgroundTransparency = BackgroundDefault.Transparency,
			onStateChanged = p1.onStateChanged,
			userInteractionEnabled = p1.props.userInteractionEnabled,
			[RoactModule.Event.Activated] = p1.onActivated
		}, {
			Corner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
			Tile = RoactModule.createElement(LoadableImage, {
				useShimmerAnimationWhileLoading = true,
				ZIndex = -1,
				Size = UDim2.fromScale(1, 1),
				cornerRadius = UDim.new(0, 8),
				Image = p1.props.imageId
			}),
			PlayButton = if IsVideo then RoactModule.createElement(Button, {
				buttonType = ButtonType.PrimaryContextual,
				size = _UDim,
				anchorPoint = Vector2.new(0.5, 0.5),
				position = UDim2.fromScale(0.5, 0.5),
				icon = if UseScaledPlayButton then nil else Images["icons/common/play"],
				onActivated = p1.onPlayActivated
			}) else nil,
			PlayIcon = if IsVideo and UseScaledPlayButton then RoactModule.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				ZIndex = 2,
				Size = _UDim2_2,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				Image = Images["icons/common/play"]
			}) else nil,
			HoverBackground = p1.state.controlState == ControlState.Hover and RoactModule.createElement(HoverButtonBackgroundModule) or nil
		})
	end)
end

function ThumbnailButton.renderEmptyState(p1) --[[ Line: 151 ]]
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), ImageSetLabel (copy), IconSize (copy), Images (copy)
	return WithStyleFunction(function(p2) --[[ Line: 152 ]]
		-- upvalues: p1 (copy), RoactModule (upval), ImageSetLabel (upval), IconSize (upval), Images (upval)
		return RoactModule.createElement("Frame", {
			LayoutOrder = p1.props.layoutOrder,
			Size = p1.props.size,
			AnchorPoint = p1.props.anchorPoint,
			Position = p1.props.position,
			BackgroundColor3 = p2.Theme.BackgroundUIDefault.Color,
			BackgroundTransparency = p2.Theme.BackgroundUIDefault.Transparency
		}, {
			Corner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
			Icon = RoactModule.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(IconSize, IconSize),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				Image = Images["icons/imageUnavailable"],
				ImageColor3 = p2.Theme.UIDefault.Color,
				ImageTransparency = p2.Theme.UIDefault.Transparency
			})
		})
	end)
end

function ThumbnailButton.render(p1) --[[ Line: 182 ]]
	return if p1.props.imageId == "" then p1:renderEmptyState() else p1:renderButton()
end

return ThumbnailButton