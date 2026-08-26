local parent = script:FindFirstAncestor("AppBlox").Parent
local roactModule = require(parent.Roact)
local tModule = require(parent.t)
local UIBloxModule = require(parent.UIBlox)
local button = UIBloxModule.App.Button.Button
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local controlState = UIBloxModule.Core.Control.Enum.ControlState
local iconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local images = UIBloxModule.App.ImageSet.Images
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local interactable = UIBloxModule.Core.Control.Interactable
local loadableImage = UIBloxModule.App.Loading.LoadableImage
local getIconSize = UIBloxModule.App.ImageSet.getIconSize
local withStyle = UIBloxModule.Core.Style.withStyle
local hoverButtonBackgroundModule = require(script.Parent.HoverButtonBackground)
local var1 = getIconSize(iconSize.Large)
local uDim2 = UDim2.fromScale(0.4, 0.512)
local uDim2_1 = UDim2.fromOffset(64, 48)
local uDim2_2 = UDim2.fromScale(0.25, 0.33)
local thumbnailButton = roactModule.Component:extend("ThumbnailButton")
thumbnailButton.validateProps = tModule.strictInterface({
	layoutOrder = tModule.optional(tModule.number),
	size = tModule.optional(tModule.UDim2),
	anchorPoint = tModule.optional(tModule.Vector2),
	position = tModule.optional(tModule.UDim2),
	itemKey = tModule.any,
	imageId = tModule.optional(tModule.string),
	isVideo = tModule.optional(tModule.boolean),
	useScaledPlayButton = tModule.optional(tModule.boolean),
	isSelected = tModule.optional(tModule.boolean),
	userInteractionEnabled = tModule.optional(tModule.boolean),
	onActivated = tModule.optional(tModule.callback),
	onPlayActivated = tModule.optional(tModule.callback)
})
thumbnailButton.defaultProps = {
	imageId = "",
	isVideo = false,
	isSelected = false,
	userInteractionEnabled = true,
	size = UDim2.fromScale(1, 1)
}

function thumbnailButton.init(p1)
	-- upvalues: controlState (ref)
	p1:setState({ controlState = controlState.Initialize })
	
	function p0.onStateChanged(_, p2)
		-- upvalues: p1 (ref)
		p1:setState({ controlState = p2 })
	end
	
	function p0.onActivated()
		-- upvalues: p1 (ref)
		if p1.props.onActivated then
			p1.props.onActivated(p1.props.itemKey)
		end
	end
	
	function p0.onPlayActivated()
		-- upvalues: p1 (ref)
		if p1.props.onPlayActivated then
			p1.props.onPlayActivated(p1.props.itemKey)
		end
	end
end

function thumbnailButton.renderButton(p1)
	-- upvalues: uDim2 (ref), uDim2_1 (ref), withStyle (ref), controlState (ref), roactModule (ref), interactable (ref), loadableImage (ref), button (ref), buttonType (ref), images (ref), imageSetLabel (ref), uDim2_2 (ref), hoverButtonBackgroundModule (ref)
	local useScaledPlayButton = p1.props.useScaledPlayButton
	local var2 = if useScaledPlayButton then uDim2 else uDim2_1
	
	return withStyle(function(p2)
		-- upvalues: p1 (ref), controlState (copy), roactModule (copy), interactable (copy), loadableImage (copy), button (copy), buttonType (copy), var2 (write), useScaledPlayButton (ref), images (copy), imageSetLabel (copy), uDim2_2 (copy), hoverButtonBackgroundModule (copy)
		local layoutOrder = p1.props.layoutOrder
		local anchorPoint = p1.props.anchorPoint
		local position = p1.props.position
		local size = p1.props.size
		local isSelected = p1.props.isSelected
		local imageId = p1.props.imageId
		local isVideo = p1.props.isVideo
		local var3 = if isSelected then p2.Theme.BackgroundDefault else p2.Theme.BackgroundUIDefault
		
		return roactModule.createElement(interactable, {
			LayoutOrder = layoutOrder,
			Size = size,
			AnchorPoint = anchorPoint,
			Position = position,
			AutoButtonColor = false,
			BackgroundColor3 = var3.Color,
			BackgroundTransparency = var3.Transparency,
			onStateChanged = p1.onStateChanged,
			userInteractionEnabled = p1.props.userInteractionEnabled,
			[roactModule.Event.Activated] = p1.onActivated
		}, {
			Corner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
			Tile = roactModule.createElement(loadableImage, {
				useShimmerAnimationWhileLoading = true,
				ZIndex = -1,
				Size = UDim2.fromScale(1, 1),
				cornerRadius = UDim.new(0, 8),
				Image = imageId
			}),
			PlayButton = if isVideo then roactModule.createElement(button, {
				buttonType = buttonType.PrimaryContextual,
				size = var2,
				anchorPoint = Vector2.new(0.5, 0.5),
				position = UDim2.fromScale(0.5, 0.5),
				icon = if useScaledPlayButton then nil else images["icons/common/play"],
				onActivated = p1.onPlayActivated
			}) else nil,
			PlayIcon = if isVideo and useScaledPlayButton then roactModule.createElement(imageSetLabel, {
				BackgroundTransparency = 1,
				ZIndex = 2,
				Size = uDim2_2,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				Image = images["icons/common/play"]
			}) else nil,
			HoverBackground = p1.state.controlState == controlState.Hover and roactModule.createElement(hoverButtonBackgroundModule) or nil
		})
	end)
end

function thumbnailButton.renderEmptyState(p1)
	-- upvalues: withStyle (ref), roactModule (ref), imageSetLabel (ref), var1 (ref), images (ref)
	return withStyle(function(p2)
		-- upvalues: p1 (ref), roactModule (copy), imageSetLabel (copy), var1 (copy), images (copy)
		return roactModule.createElement("Frame", {
			LayoutOrder = p1.props.layoutOrder,
			Size = p1.props.size,
			AnchorPoint = p1.props.anchorPoint,
			Position = p1.props.position,
			BackgroundColor3 = p2.Theme.BackgroundUIDefault.Color,
			BackgroundTransparency = p2.Theme.BackgroundUIDefault.Transparency
		}, {
			Corner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
			Icon = roactModule.createElement(imageSetLabel, {
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(var1, var1),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				Image = images["icons/imageUnavailable"],
				ImageColor3 = p2.Theme.UIDefault.Color,
				ImageTransparency = p2.Theme.UIDefault.Transparency
			})
		})
	end)
end

function thumbnailButton.render(p1)
	return if p1.props.imageId == "" then p1:renderEmptyState() else p1:renderButton()
end

return thumbnailButton