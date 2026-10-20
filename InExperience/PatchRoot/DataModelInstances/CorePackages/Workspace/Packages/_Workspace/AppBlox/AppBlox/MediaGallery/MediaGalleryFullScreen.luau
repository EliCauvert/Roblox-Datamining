local UserInputService = game:GetService("UserInputService")
local Parent = script:FindFirstAncestor("AppBlox").Parent
local EventConnection = require(Parent.ReactUtils).EventConnection
local RoactModule = require(Parent.Roact)
local TModule = require(Parent.t)
local UIBloxModule = require(Parent.UIBlox)
local IconButton = UIBloxModule.App.Button.IconButton
local Images = UIBloxModule.App.ImageSet.Images
local WithStyleFunction = UIBloxModule.Core.Style.withStyle
local ThumbnailButtonModule = require(script.Parent.ThumbnailButton)
local GetShowItemsModule = require(script.Parent.getShowItems)
local MediaGalleryFullScreen = RoactModule.Component:extend("MediaGalleryFullScreen")
MediaGalleryFullScreen.validateProps = TModule.strictInterface({
	layoutOrder = TModule.optional(TModule.integer),
	size = TModule.optional(TModule.UDim2),
	anchorPoint = TModule.optional(TModule.Vector2),
	position = TModule.optional(TModule.UDim2),
	items = TModule.array(TModule.interface({
		imageId = TModule.string,
		isYouTubeVideo = TModule.optional(TModule.boolean)
	})),
	showIndex = TModule.optional(TModule.integer),
	onVideoPlayActivated = TModule.optional(TModule.callback)
})
MediaGalleryFullScreen.defaultProps = { showIndex = 1, size = UDim2.fromScale(1, 1) }

function MediaGalleryFullScreen.getDerivedStateFromProps(State, State1)
	-- upvalues: GetShowItemsModule (copy)
	local State2 = nil
	
	if State1.items ~= State.items then
		local ShowItemsModule = GetShowItemsModule(State)
		State2 = {
			items = State.items,
			itemsToShow = ShowItemsModule,
			showArrows = #ShowItemsModule > 1,
			focusIndex = math.min(State1.focusIndex or 1, #ShowItemsModule)
		}
	end
	if State1.showIndex ~= State.showIndex then
		State2 = State2 or {}
		State2.showIndex = State.showIndex
		State2.focusIndex = math.min(State.showIndex, #State.items)
	end
	return State2
end

function MediaGalleryFullScreen.init(p1)
	-- upvalues: RoactModule (copy)
	p1.state = {
		items = nil,
		itemsToShow = nil,
		showArrows = true,
		focusIndex = 1,
		showIndex = 1
	}
	p1.itemFrameSize, p1.updateItemFrameSize = RoactModule.createBinding(UDim2.fromScale(1, 1))
	p1.arrowButtonSize, p1.updateArrowButtonSize = RoactModule.createBinding(UDim2.new(0, 96, 1, 0))
	p1.leftArrowPosition, p1.updateLeftArrowPosition = RoactModule.createBinding(UDim2.new(0.5, 0, 0.5, 0))
	p1.rightArrowPosition, p1.updateRightArrowPosition = RoactModule.createBinding(UDim2.new(0.5, 0, 0.5, 0))
	
	function p1.onResize(Frame: Frame)
		-- upvalues: p1 (copy)
		local X = Frame.AbsoluteSize.X
		local Y = Frame.AbsoluteSize.Y
		local Floored = math.floor(Y * 1.7777777777777777)
		
		if X < Floored then
			Floored = X
			Y = math.floor(Floored / 1.7777777777777777)
		end
		p1.updateItemFrameSize(UDim2.new(0, Floored, 0, Y))
	end
	
	function p1.onImageResize(Frame: Frame)
		-- upvalues: p1 (copy)
		local X: number = Frame.AbsoluteSize.X
		local Y = Frame.AbsoluteSize.Y
		p1.updateLeftArrowPosition(UDim2.new(0.5, -X / 2, 0.5, 0))
		p1.updateRightArrowPosition(UDim2.new(0.5, X / 2, 0.5, 0))
		p1.updateArrowButtonSize(UDim2.new(0, 96, 0, Y))
	end
	
	function p1.onUserInputBegan(Input)
		-- upvalues: p1 (copy)
		if Input.UserInputType ~= Enum.UserInputType.Keyboard then return end
		local FocusIndex: number = p1.state.focusIndex
		local CountItems = #p1.props.items
		
		if Input.KeyCode == Enum.KeyCode.Left and FocusIndex > 1 then
			p1.showPreviousItem()
			
			return
		end
		if Input.KeyCode == Enum.KeyCode.Right and FocusIndex < CountItems then
			p1.showNextItem()
		end
	end
	
	function p1.showPreviousItem()
		-- upvalues: p1 (copy)
		local FocusIndexDelta = p1.state.focusIndex - 1
		
		if FocusIndexDelta < 1 then
			FocusIndexDelta = 1
		end
		p1:setState({ focusIndex = FocusIndexDelta })
	end
	
	function p1.showNextItem()
		-- upvalues: p1 (copy)
		local CountItems = #p1.props.items
		local NewFocusIndex = p1.state.focusIndex + 1
		
		if CountItems < NewFocusIndex then
			NewFocusIndex = CountItems
		end
		p1:setState({ focusIndex = NewFocusIndex })
	end
	
	function p1.cycleNext()
		-- upvalues: p1 (copy)
		local NewFocusIndex = p1.state.focusIndex + 1
		
		if #p1.props.items < NewFocusIndex then
			NewFocusIndex = 1
		end
		p1:setState({ focusIndex = NewFocusIndex })
	end
	
	function p1.onVideoPlayActivated(p2)
		-- upvalues: p1 (copy)
		if p1.props.onVideoPlayActivated then
			p1.props.onVideoPlayActivated(p1.state.itemsToShow[p2].originalIndex)
		end
	end
end

local function renderArrowButton(_, p1, IsDisabled, Vector, Position, ArrowButtonSize, OnActivated)
	-- upvalues: RoactModule (copy), IconButton (copy), Images (copy)
	return RoactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		ZIndex = 100,
		Size = ArrowButtonSize,
		AnchorPoint = Vector,
		Position = Position
	}, {
		ArrowButton = RoactModule.createElement(IconButton, {
			showBackground = true,
			backgroundTransparency = 1,
			size = UDim2.fromScale(1, 1),
			icon = Images[p1],
			isDisabled = IsDisabled,
			onActivated = OnActivated
		})
	})
end

function MediaGalleryFullScreen.render(p1)
	-- upvalues: WithStyleFunction (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: p1 (copy)
		return p1:renderWithProvider(p2)
	end)
end

function MediaGalleryFullScreen.renderWithProvider(p1, p2)
	-- upvalues: RoactModule (copy), renderArrowButton (copy), ThumbnailButtonModule (copy), EventConnection (copy), UserInputService (copy)
	local ItemsToShow = p1.state.itemsToShow
	local ShowArrows = p1.state.showArrows
	local FocusIndex: number = p1.state.focusIndex
	local ItemsToShowEntry = ItemsToShow[FocusIndex]
	local IsFocusIndexBelow = FocusIndex <= 1
	local IsFocusIndexAbove = #ItemsToShow <= FocusIndex
	
	return RoactModule.createElement("Frame", {
		LayoutOrder = p1.props.layoutOrder,
		Size = p1.props.size,
		AnchorPoint = p1.props.anchorPoint,
		Position = p1.props.position,
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		[RoactModule.Change.AbsoluteSize] = p1.onResize
	}, {
		LeftArrow = if ShowArrows then renderArrowButton(p2, "icons/actions/cycleLeft", IsFocusIndexBelow, Vector2.new(1, 0.5), p1.leftArrowPosition, p1.arrowButtonSize, p1.showPreviousItem) else nil,
		FullScreenItemFrame = RoactModule.createElement("Frame", {
			Size = UDim2.new(1, -192, 1, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			BackgroundTransparency = 1,
			[RoactModule.Change.AbsoluteSize] = p1.onImageResize
		}, {
			UIAspectRatioConstraint = RoactModule.createElement("UIAspectRatioConstraint", { AspectRatio = 1.7777777777777777 }),
			Item = RoactModule.createElement(ThumbnailButtonModule, {
				userInteractionEnabled = true,
				itemKey = FocusIndex,
				imageId = ItemsToShowEntry.imageId,
				isVideo = ItemsToShowEntry.isYouTubeVideo,
				onActivated = p1.cycleNext,
				onPlayActivated = ItemsToShowEntry.isYouTubeVideo and p1.onVideoPlayActivated or nil
			})
		}),
		RightArrow = if ShowArrows then renderArrowButton(p2, "icons/actions/cycleRight", IsFocusIndexAbove, Vector2.new(0, 0.5), p1.rightArrowPosition, p1.arrowButtonSize, p1.showNextItem) else nil,
		EventConnection = ShowArrows and RoactModule.createElement(EventConnection, {
			event = UserInputService.InputBegan,
			callback = p1.onUserInputBegan
		}) or nil
	})
end

return MediaGalleryFullScreen