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

function mediaGalleryFullScreen.getDerivedStateFromProps(p1, p2)
	-- upvalues: getShowItemsModule (ref)
	local var1 = nil
	
	if p2.items ~= p1.items then
		local var2 = getShowItemsModule(p1)
		var1 = {
			items = p1.items,
			itemsToShow = var2,
			showArrows = #var2 > 1,
			focusIndex = math.min(p2.focusIndex or 1, #var2)
		}
	end
	if p2.showIndex ~= p1.showIndex then
		var1 = var1 or {}
		var1.showIndex = p1.showIndex
		var1.focusIndex = math.min(p1.showIndex, #p1.items)
	end
	return var1
end

function mediaGalleryFullScreen.init(p1)
	-- upvalues: roactModule (ref)
	p1.state = {
		items = nil,
		itemsToShow = nil,
		showArrows = true,
		focusIndex = 1,
		showIndex = 1
	}
	local var1, var2 = roactModule.createBinding(UDim2.fromScale(1, 1))
	p1.itemFrameSize = var1
	p1.updateItemFrameSize = var2
	local var3, var4 = roactModule.createBinding(UDim2.new(0, 96, 1, 0))
	p1.arrowButtonSize = var3
	p1.updateArrowButtonSize = var4
	local var5, var6 = roactModule.createBinding(UDim2.new(0.5, 0, 0.5, 0))
	p1.leftArrowPosition = var5
	p1.updateLeftArrowPosition = var6
	local var7, var8 = roactModule.createBinding(UDim2.new(0.5, 0, 0.5, 0))
	p1.rightArrowPosition = var7
	p1.updateRightArrowPosition = var8
	
	function p2.onResize(p2)
		-- upvalues: p1 (ref)
		local x = p2.AbsoluteSize.X
		local y = p2.AbsoluteSize.Y
		local floored = math.floor(y * 1.777777777778)
		
		if x < floored then
			floored = x
			y = math.floor(floored / 1.777777777778)
		end
		p1.updateItemFrameSize(UDim2.new(0, floored, 0, y))
	end
	
	function p2.onImageResize(p2)
		-- upvalues: p1 (ref)
		local x = p2.AbsoluteSize.X
		local y = p2.AbsoluteSize.Y
		p1.updateLeftArrowPosition(UDim2.new(0.5, -x / 2, 0.5, 0))
		p1.updateRightArrowPosition(UDim2.new(0.5, x / 2, 0.5, 0))
		p1.updateArrowButtonSize(UDim2.new(0, 96, 0, y))
	end
	
	function p2.onUserInputBegan(p2)
		-- upvalues: p1 (ref)
		if p2.UserInputType ~= Enum.UserInputType.Keyboard then return end
		local focusIndex = p1.state.focusIndex
		local itemsCount = #p1.props.items
		
		if p2.KeyCode == Enum.KeyCode.Left and focusIndex > 1 then
			p1.showPreviousItem()
			
			return
		elseif p2.KeyCode == Enum.KeyCode.Right and focusIndex < itemsCount then
			p1.showNextItem()
		end
	end
	
	function p2.showPreviousItem()
		-- upvalues: p1 (ref)
		local var9 = p1.state.focusIndex - 1
		
		if var9 < 1 then
			var9 = 1
		end
		p1:setState({ focusIndex = var9 })
	end
	
	function p2.showNextItem()
		-- upvalues: p1 (ref)
		local itemsCount = #p1.props.items
		local var9 = p1.state.focusIndex + 1
		
		if itemsCount < var9 then
			var9 = itemsCount
		end
		p1:setState({ focusIndex = var9 })
	end
	
	function p2.cycleNext()
		-- upvalues: p1 (ref)
		local var9 = p1.state.focusIndex + 1
		
		if #p1.props.items < var9 then
			var9 = 1
		end
		p1:setState({ focusIndex = var9 })
	end
	
	function p2.onVideoPlayActivated(p2)
		-- upvalues: p1 (ref)
		if p1.props.onVideoPlayActivated then
			p1.props.onVideoPlayActivated(p1.state.itemsToShow[p2].originalIndex)
		end
	end
end

local function renderArrowButton(_, p1, p2, p3, p4, p5, p6)
	-- upvalues: roactModule (ref), iconButton (ref), images (ref)
	return roactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		ZIndex = 100,
		Size = p5,
		AnchorPoint = p3,
		Position = p4
	}, {
		ArrowButton = roactModule.createElement(iconButton, {
			showBackground = true,
			backgroundTransparency = 1,
			size = UDim2.fromScale(1, 1),
			icon = images[p1],
			isDisabled = p2,
			onActivated = p6
		})
	})
end

function mediaGalleryFullScreen.render(p1)
	-- upvalues: withStyle (ref)
	return withStyle(function(p2)
		-- upvalues: p1 (ref)
		return p1:renderWithProvider(p2)
	end)
end

function mediaGalleryFullScreen.renderWithProvider(p1, p2)
	-- upvalues: roactModule (ref), renderArrowButton (ref), thumbnailButtonModule (ref), eventConnection (ref), userInputService (ref)
	local layoutOrder = p1.props.layoutOrder
	local anchorPoint = p1.props.anchorPoint
	local position = p1.props.position
	local size = p1.props.size
	local itemsToShow = p1.state.itemsToShow
	local showArrows = p1.state.showArrows
	local focusIndex = p1.state.focusIndex
	local var1 = itemsToShow[focusIndex]
	
	return roactModule.createElement("Frame", {
		LayoutOrder = layoutOrder,
		Size = size,
		AnchorPoint = anchorPoint,
		Position = position,
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		[roactModule.Change.AbsoluteSize] = p1.onResize
	}, {
		LeftArrow = if showArrows then renderArrowButton(p2, "icons/actions/cycleLeft", focusIndex <= 1, Vector2.new(1, 0.5), p1.leftArrowPosition, p1.arrowButtonSize, p1.showPreviousItem) else nil,
		FullScreenItemFrame = roactModule.createElement("Frame", {
			Size = UDim2.new(1, -192, 1, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			BackgroundTransparency = 1,
			[roactModule.Change.AbsoluteSize] = p1.onImageResize
		}, {
			UIAspectRatioConstraint = roactModule.createElement("UIAspectRatioConstraint", { AspectRatio = 1.777777777778 }),
			Item = roactModule.createElement(thumbnailButtonModule, {
				userInteractionEnabled = true,
				itemKey = focusIndex,
				imageId = var1.imageId,
				isVideo = var1.isYouTubeVideo,
				onActivated = p1.cycleNext,
				onPlayActivated = if var1.isYouTubeVideo then p1.onVideoPlayActivated else nil
			})
		}),
		RightArrow = if showArrows then renderArrowButton(p2, "icons/actions/cycleRight", #itemsToShow <= focusIndex, Vector2.new(0, 0.5), p1.rightArrowPosition, p1.arrowButtonSize, p1.showNextItem) else nil,
		EventConnection = showArrows and roactModule.createElement(eventConnection, {
			event = userInputService.InputBegan,
			callback = p1.onUserInputBegan
		}) or nil
	})
end

return mediaGalleryFullScreen