local userInputService = game:GetService("UserInputService")
local parent = script:FindFirstAncestor("AppBlox").Parent
local eventConnection = require(parent.ReactUtils).EventConnection
local roactModule = require(parent.Roact)
local tModule = require(parent.t)
local UIBloxModule = require(parent.UIBlox)
local iconButton = UIBloxModule.App.Button.IconButton
local images = UIBloxModule.App.ImageSet.Images
local withStyle = UIBloxModule.Core.Style.withStyle
local thumbnailButtonModule = require(script.Parent.ThumbnailButton)
local getShowItemsModule = require(script.Parent.getShowItems)
local mediaGalleryFullScreen = roactModule.Component:extend("MediaGalleryFullScreen")
mediaGalleryFullScreen.validateProps = tModule.strictInterface({
	layoutOrder = tModule.optional(tModule.integer),
	size = tModule.optional(tModule.UDim2),
	anchorPoint = tModule.optional(tModule.Vector2),
	position = tModule.optional(tModule.UDim2),
	items = tModule.array(tModule.interface({
		imageId = tModule.string,
		isYouTubeVideo = tModule.optional(tModule.boolean)
	})),
	showIndex = tModule.optional(tModule.integer),
	onVideoPlayActivated = tModule.optional(tModule.callback)
})
mediaGalleryFullScreen.defaultProps = { showIndex = 1, size = UDim2.fromScale(1, 1) }

function mediaGalleryFullScreen.getDerivedStateFromProps(p0, p1) --[[ line: 53 ]]
	-- upvalues: getShowItemsModule (ref)
	local var8 = nil
	
	if p1.items ~= p0.items then
		local var9 = getShowItemsModule(p0)
		var8 = {
			items = p0.items,
			itemsToShow = var9,
			showArrows = #var9 > 1,
			focusIndex = math.min(p1.focusIndex or 1, #var9)
		}
	end
	if p1.showIndex ~= p0.showIndex then
		var8 = var8 or {}
		var8.showIndex = p0.showIndex
		var8.focusIndex = math.min(p0.showIndex, #p0.items)
	end
	return var8
end

function mediaGalleryFullScreen.init(p2) --[[ line: 76 ]]
	-- upvalues: roactModule (ref)
	p2.state = {
		items = nil,
		itemsToShow = nil,
		showArrows = true,
		focusIndex = 1,
		showIndex = 1
	}
	local var10, var11 = roactModule.createBinding(UDim2.fromScale(1, 1))
	p2.itemFrameSize = var10
	p2.updateItemFrameSize = var11
	local var12, var13 = roactModule.createBinding(UDim2.new(0, 96, 1, 0))
	p2.arrowButtonSize = var12
	p2.updateArrowButtonSize = var13
	local var14, var15 = roactModule.createBinding(UDim2.new(0.5, 0, 0.5, 0))
	p2.leftArrowPosition = var14
	p2.updateLeftArrowPosition = var15
	local var16, var17 = roactModule.createBinding(UDim2.new(0.5, 0, 0.5, 0))
	p2.rightArrowPosition = var16
	p2.updateRightArrowPosition = var17
	
	function p2.onResize(p3) --[[ line: 90 ]]
		-- upvalues: p2 (ref)
		local x = p3.AbsoluteSize.X
		local y = p3.AbsoluteSize.Y
		local floored = math.floor(y * 1.777777777778)
		
		if x < floored then
			floored = x
			y = math.floor(floored / 1.777777777778)
		end
		p2.updateItemFrameSize(UDim2.new(0, floored, 0, y))
	end
	
	function p2.onImageResize(p4) --[[ line: 104 ]]
		-- upvalues: p2 (ref)
		local x = p4.AbsoluteSize.X
		local y = p4.AbsoluteSize.Y
		p2.updateLeftArrowPosition(UDim2.new(0.5, -x / 2, 0.5, 0))
		p2.updateRightArrowPosition(UDim2.new(0.5, x / 2, 0.5, 0))
		p2.updateArrowButtonSize(UDim2.new(0, 96, 0, y))
	end
	
	function p2.onUserInputBegan(p5) --[[ line: 113 ]]
		-- upvalues: p2 (ref)
		if p5.UserInputType ~= Enum.UserInputType.Keyboard then return end
		local focusIndex = p2.state.focusIndex
		local itemsCount = #p2.props.items
		
		if p5.KeyCode == Enum.KeyCode.Left and focusIndex > 1 then
			p2.showPreviousItem()
			
			return
		elseif p5.KeyCode == Enum.KeyCode.Right and focusIndex < itemsCount then
			p2.showNextItem()
		end
	end
	
	function p2.showPreviousItem() --[[ line: 128 ]]
		-- upvalues: p2 (ref)
		local var20 = p2.state.focusIndex - 1
		
		if var20 < 1 then
			var20 = 1
		end
		p2:setState({ focusIndex = var20 })
	end
	
	function p2.showNextItem() --[[ line: 139 ]]
		-- upvalues: p2 (ref)
		local itemsCount = #p2.props.items
		local var22 = p2.state.focusIndex + 1
		
		if itemsCount < var22 then
			var22 = itemsCount
		end
		p2:setState({ focusIndex = var22 })
	end
	
	function p2.cycleNext() --[[ line: 151 ]]
		-- upvalues: p2 (ref)
		local var23 = p2.state.focusIndex + 1
		
		if #p2.props.items < var23 then
			var23 = 1
		end
		p2:setState({ focusIndex = var23 })
	end
	
	function p2.onVideoPlayActivated(p6) --[[ line: 163 ]]
		-- upvalues: p2 (ref)
		if p2.props.onVideoPlayActivated then
			p2.props.onVideoPlayActivated(p2.state.itemsToShow[p6].originalIndex)
		end
	end
end

local function renderArrowButton(_, p7, p8, p9, p10, p11, p12) --[[ line: 172 ]]
	-- upvalues: roactModule (ref), iconButton (ref), images (ref)
	return roactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		ZIndex = 100,
		Size = p11,
		AnchorPoint = p9,
		Position = p10
	}, {
		ArrowButton = roactModule.createElement(iconButton, {
			showBackground = true,
			backgroundTransparency = 1,
			size = UDim2.fromScale(1, 1),
			icon = images[p7],
			isDisabled = p8,
			onActivated = p12
		})
	})
end

function mediaGalleryFullScreen.render(p13) --[[ line: 192 ]]
	-- upvalues: withStyle (ref)
	return withStyle(function(p14) --[[ line: 193 ]]
		-- upvalues: p13 (ref)
		return p13:renderWithProvider(p14)
	end)
end

function mediaGalleryFullScreen.renderWithProvider(p15, p16) --[[ line: 198 ]]
	-- upvalues: roactModule (ref), renderArrowButton (ref), thumbnailButtonModule (ref), eventConnection (ref), userInputService (ref)
	local layoutOrder = p15.props.layoutOrder
	local anchorPoint = p15.props.anchorPoint
	local position = p15.props.position
	local size = p15.props.size
	local itemsToShow = p15.state.itemsToShow
	local showArrows = p15.state.showArrows
	local focusIndex = p15.state.focusIndex
	local var24 = itemsToShow[focusIndex]
	
	return roactModule.createElement("Frame", {
		LayoutOrder = layoutOrder,
		Size = size,
		AnchorPoint = anchorPoint,
		Position = position,
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		[roactModule.Change.AbsoluteSize] = p15.onResize
	}, {
		LeftArrow = if showArrows then renderArrowButton(p16, "icons/actions/cycleLeft", focusIndex <= 1, Vector2.new(1, 0.5), p15.leftArrowPosition, p15.arrowButtonSize, p15.showPreviousItem) else nil,
		FullScreenItemFrame = roactModule.createElement("Frame", {
			Size = UDim2.new(1, -192, 1, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			BackgroundTransparency = 1,
			[roactModule.Change.AbsoluteSize] = p15.onImageResize
		}, {
			UIAspectRatioConstraint = roactModule.createElement("UIAspectRatioConstraint", { AspectRatio = 1.777777777778 }),
			Item = roactModule.createElement(thumbnailButtonModule, {
				userInteractionEnabled = true,
				itemKey = focusIndex,
				imageId = var24.imageId,
				isVideo = var24.isYouTubeVideo,
				onActivated = p15.cycleNext,
				onPlayActivated = if var24.isYouTubeVideo then p15.onVideoPlayActivated else nil
			})
		}),
		RightArrow = if showArrows then renderArrowButton(p16, "icons/actions/cycleRight", #itemsToShow <= focusIndex, Vector2.new(0, 0.5), p15.rightArrowPosition, p15.arrowButtonSize, p15.showNextItem) else nil,
		EventConnection = showArrows and roactModule.createElement(eventConnection, {
			event = userInputService.InputBegan,
			callback = p15.onUserInputBegan
		}) or nil
	})
end

return mediaGalleryFullScreen