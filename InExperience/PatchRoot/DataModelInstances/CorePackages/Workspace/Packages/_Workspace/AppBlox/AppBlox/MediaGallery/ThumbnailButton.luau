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
local var4 = getIconSize(iconSize.Large)
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

function thumbnailButton.init(p0) --[[ line: 57 ]]
	-- upvalues: controlState (ref)
	p0:setState({ controlState = controlState.Initialize })
	
	function p0.onStateChanged(_, p1) --[[ line: 62 ]]
		-- upvalues: p0 (ref)
		p0:setState({ controlState = p1 })
	end
	
	function p0.onActivated() --[[ line: 68 ]]
		-- upvalues: p0 (ref)
		if p0.props.onActivated then
			p0.props.onActivated(p0.props.itemKey)
		end
	end
	
	function p0.onPlayActivated() --[[ line: 74 ]]
		-- upvalues: p0 (ref)
		if p0.props.onPlayActivated then
			p0.props.onPlayActivated(p0.props.itemKey)
		end
	end
end

function thumbnailButton.renderButton(p2) --[[ line: 81 ]]
	-- upvalues: uDim2 (ref), uDim2_1 (ref), withStyle (ref), controlState (ref), roactModule (ref), interactable (ref), loadableImage (ref), button (ref), buttonType (ref), images (ref), imageSetLabel (ref), uDim2_2 (ref), hoverButtonBackgroundModule (ref)
	local useScaledPlayButton = p2.props.useScaledPlayButton
	local var9 = if useScaledPlayButton then uDim2 else uDim2_1
	
	return withStyle(function(p3) --[[ line: 90 ]]
		-- upvalues: p2 (ref), controlState (copy), roactModule (copy), interactable (copy), loadableImage (copy), button (copy), buttonType (copy), var9 (write), useScaledPlayButton (ref), images (copy), imageSetLabel (copy), uDim2_2 (copy), hoverButtonBackgroundModule (copy)
		local layoutOrder = p2.props.layoutOrder
		local anchorPoint = p2.props.anchorPoint
		local position = p2.props.position
		local size = p2.props.size
		local isSelected = p2.props.isSelected
		local imageId = p2.props.imageId
		local isVideo = p2.props.isVideo
		local var10 = if isSelected then p3.Theme.BackgroundDefault else p3.Theme.BackgroundUIDefault
		
		return roactModule.createElement(interactable, {
			LayoutOrder = layoutOrder,
			Size = size,
			AnchorPoint = anchorPoint,
			Position = position,
			AutoButtonColor = false,
			BackgroundColor3 = var10.Color,
			BackgroundTransparency = var10.Transparency,
			onStateChanged = p2.onStateChanged,
			userInteractionEnabled = p2.props.userInteractionEnabled,
			[roactModule.Event.Activated] = p2.onActivated
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
				size = var9,
				anchorPoint = Vector2.new(0.5, 0.5),
				position = UDim2.fromScale(0.5, 0.5),
				icon = if useScaledPlayButton then nil else images["icons/common/play"],
				onActivated = p2.onPlayActivated
			}) else nil,
			PlayIcon = if isVideo and useScaledPlayButton then roactModule.createElement(imageSetLabel, {
				BackgroundTransparency = 1,
				ZIndex = 2,
				Size = uDim2_2,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				Image = images["icons/common/play"]
			}) else nil,
			HoverBackground = p2.state.controlState == controlState.Hover and roactModule.createElement(hoverButtonBackgroundModule) or nil
		})
	end)
end

function thumbnailButton.renderEmptyState(p4) --[[ line: 151 ]]
	-- upvalues: withStyle (ref), roactModule (ref), imageSetLabel (ref), var4 (ref), images (ref)
	return withStyle(function(p5) --[[ line: 152 ]]
		-- upvalues: p4 (ref), roactModule (copy), imageSetLabel (copy), var4 (copy), images (copy)
		return roactModule.createElement("Frame", {
			LayoutOrder = p4.props.layoutOrder,
			Size = p4.props.size,
			AnchorPoint = p4.props.anchorPoint,
			Position = p4.props.position,
			BackgroundColor3 = p5.Theme.BackgroundUIDefault.Color,
			BackgroundTransparency = p5.Theme.BackgroundUIDefault.Transparency
		}, {
			Corner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
			Icon = roactModule.createElement(imageSetLabel, {
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(var4, var4),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				Image = images["icons/imageUnavailable"],
				ImageColor3 = p5.Theme.UIDefault.Color,
				ImageTransparency = p5.Theme.UIDefault.Transparency
			})
		})
	end)
end

function thumbnailButton.render(p6) --[[ line: 182 ]]
	return if p6.props.imageId == "" then p6:renderEmptyState() else p6:renderButton()
end

return thumbnailButton