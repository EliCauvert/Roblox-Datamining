local RunService = game:GetService("RunService")
local Parent = script:FindFirstAncestor("AppBlox").Parent
local EventConnection = require(Parent.ReactUtils).EventConnection
local OtterModule = require(Parent.Otter)
local RoactModule = require(Parent.Roact)
local UIBloxModule = require(Parent.UIBlox)
local IconButton = UIBloxModule.App.Button.IconButton
local Images = UIBloxModule.App.ImageSet.Images
local WithStyleFunction = UIBloxModule.Core.Style.withStyle
local TModule = require(Parent.t)
local ThumbnailButtonModule = require(script.Parent.ThumbnailButton)
local CalcMediaGallerySizesFromHeightModule = require(script.Parent.calcMediaGallerySizesFromHeight)
local CalcMediaGallerySizesFromWidthModule = require(script.Parent.calcMediaGallerySizesFromWidth)
local GetShowItemsModule = require(script.Parent.getShowItems)
local IconSize = UIBloxModule.App.ImageSet.getIconSize(UIBloxModule.App.ImageSet.Enum.IconSize.Medium)
local config = { frequency = 4, dampingRatio = 1 }
local MediaGalleryPreview = RoactModule.Component:extend("MediaGalleryPreview")
MediaGalleryPreview.validateProps = TModule.strictInterface({
	layoutOrder = TModule.optional(TModule.integer),
	size = TModule.optional(TModule.UDim2),
	fullWidth = TModule.optional(TModule.boolean),
	anchorPoint = TModule.optional(TModule.Vector2),
	position = TModule.optional(TModule.UDim2),
	items = TModule.array(TModule.strictInterface({
		imageId = TModule.string,
		isYouTubeVideo = TModule.optional(TModule.boolean)
	})),
	numberOfThumbnails = TModule.optional(TModule.integer),
	onPreviewActivated = TModule.optional(TModule.callback),
	onThumbnailActivated = TModule.optional(TModule.callback),
	onVideoPlayActivated = TModule.optional(TModule.callback)
})
MediaGalleryPreview.defaultProps = {
	numberOfThumbnails = 5,
	fullWidth = false,
	size = UDim2.fromScale(1, 1)
}

function MediaGalleryPreview.getDerivedStateFromProps(State, State1) --[[ Line: 77 ]]
	-- upvalues: GetShowItemsModule (copy)
	if State1.items == State.items and State1.numberOfThumbnails == State.numberOfThumbnails then return end
	local ShowItemsModule, ShowItemsModule2, ShowItemsModule3 = GetShowItemsModule(State)
	
	return {
		items = State.items,
		numberOfThumbnails = State.numberOfThumbnails,
		itemsToShow = ShowItemsModule,
		youTubeVideoItemsSize = ShowItemsModule2,
		imageItemsSize = ShowItemsModule3,
		animationOn = ShowItemsModule3 > 1,
		animatedIndex = ShowItemsModule2 + 1,
		selectedIndex = ShowItemsModule2 + 1
	}
end

function MediaGalleryPreview.init(p1) --[[ Line: 95 ]]
	-- upvalues: OtterModule (copy), RoactModule (copy)
	p1.state = {
		items = nil,
		numberOfThumbnails = 1,
		itemsToShow = nil,
		youTubeVideoItemsSize = 0,
		imageItemsSize = 0,
		animationOn = false,
		animatedIndex = 1,
		selectedIndex = 1,
		showArrows = false,
		focusIndex = 1
	}
	p1.animationTime = 0
	p1.scrolling = false
	p1.scrollMotor = OtterModule.createSingleMotor(0)
	p1.contentSize, p1.updateContentSize = RoactModule.createBinding(UDim2.fromScale(1, 1))
	p1.previewSize, p1.updatePreviewSize = RoactModule.createBinding(UDim2.fromScale(1, 0.5))
	p1.paginationSize, p1.updatePaginationSize = RoactModule.createBinding(UDim2.fromScale(1, 0.5))
	p1.thumbnailSize, p1.updateThumbnailSize = RoactModule.createBinding(UDim2.fromScale(0, 0))
	p1.canvasPosition, p1.updateCanvasPosition = RoactModule.createBinding(Vector2.new(0, 0))
	p1.progress, p1.updateProgress = RoactModule.createBinding(0)
	p1.previewTransparency, p1.updatePreviewTransparency = RoactModule.createBinding(0)
	
	function p1.onResize(Frame) --[[ Line: 122 ]]
		-- upvalues: p1 (copy)
		p1:updateSizes(Frame)
		p1.updateCanvasPosition(Vector2.new(p1:getCanvasPositionX(), 0))
	end
	
	function p1:onMouseLeave(Input) --[[ Line: 127 ]]
		-- upvalues: p1 (copy)
		if Input.UserInputType == Enum.UserInputType.MouseMovement then
			p1.resetAnimation()
			p1:setState(function(State) --[[ Line: 133 ]]
				-- upvalues: p1 (upval)
				local SelectedIndex = State.selectedIndex
				
				return {
					animationOn = State.imageItemsSize > 1,
					animatedIndex = SelectedIndex,
					focusIndex = p1.getNextFocusIndex(SelectedIndex)
				}
			end)
			
			return
		end
	end
	
	function p1.onPreviewActivated() --[[ Line: 145 ]]
		-- upvalues: p1 (copy)
		p1.resetAnimation()
		p1:setState({ animationOn = false })
		
		if p1.props.onPreviewActivated then
			p1.props.onPreviewActivated(p1.state.itemsToShow[p1.state.selectedIndex].originalIndex)
		end
	end
	
	function p1:onMouseEnterPagination(Input) --[[ Line: 160 ]]
		-- upvalues: p1 (copy)
		if Input.UserInputType == Enum.UserInputType.MouseMovement then
			p1:setState(function(p2) --[[ Line: 165 ]]
				if p2.showArrows then return end
				return { showArrows = true }
			end)
			
			return
		end
	end
	
	function p1:onMouseLeavePagination(Input) --[[ Line: 176 ]]
		-- upvalues: p1 (copy)
		if Input.UserInputType == Enum.UserInputType.MouseMovement then
			p1:setState(function(p2) --[[ Line: 181 ]]
				if not p2.showArrows then return end
				return { showArrows = false }
			end)
			
			return
		end
	end
	
	function p1.onCycleLeftActivated() --[[ Line: 192 ]]
		-- upvalues: p1 (copy)
		if not p1.scrolling then
			local Largest = math.max(p1.state.focusIndex - 1, 1)
			p1.resetAnimation()
			p1:setState({ animationOn = false, focusIndex = Largest })
			
			return
		end
	end
	
	function p1.onCycleRightActivated() --[[ Line: 206 ]]
		-- upvalues: p1 (copy)
		if not p1.scrolling then
			local Smallest = math.min(p1.state.focusIndex + 1, #p1.props.items)
			p1.resetAnimation()
			p1:setState({ animationOn = false, focusIndex = Smallest })
			
			return
		end
	end
	
	function p1.onItemActivated(p2) --[[ Line: 221 ]]
		-- upvalues: p1 (copy)
		local IsYouTubeVideo = p1.state.itemsToShow[p2].isYouTubeVideo
		local SelectedIndex = p1.state.selectedIndex
		p1.resetAnimation()
		p1:setState({
			animationOn = false,
			selectedIndex = if IsYouTubeVideo then nil else p2 or nil
		})
		
		if IsYouTubeVideo then
			p1.onVideoPlayActivated(p2)
		end
		if p1.props.onThumbnailActivated then
			p1.props.onThumbnailActivated(SelectedIndex, p2)
		end
	end
	
	function p1.onItemPlayActivated(p2) --[[ Line: 241 ]]
		-- upvalues: p1 (copy)
		p1.resetAnimation()
		p1:setState({ animationOn = false })
		p1.onVideoPlayActivated(p2)
	end
	
	function p1.onVideoPlayActivated(p2) --[[ Line: 250 ]]
		-- upvalues: p1 (copy)
		if p1.props.onVideoPlayActivated then
			p1.props.onVideoPlayActivated(p1.state.itemsToShow[p2].originalIndex)
		end
	end
	
	function p1.getNextFocusIndex(SelectedIndex) --[[ Line: 259 ]]
		-- upvalues: p1 (copy)
		local FocusIndex = p1.state.focusIndex
		local NumberOfThumbnails = p1.props.numberOfThumbnails
		
		return if SelectedIndex < FocusIndex then SelectedIndex elseif FocusIndex + NumberOfThumbnails <= SelectedIndex then SelectedIndex - NumberOfThumbnails + 1 else FocusIndex
	end
	
	function p1.resetAnimation() --[[ Line: 274 ]]
		-- upvalues: p1 (copy)
		p1.animationTime = 0
		p1.updateProgress(0)
		p1.updatePreviewTransparency(0)
	end
	
	function p1.renderSteppedCallback(p2) --[[ Line: 280 ]]
		-- upvalues: p1 (copy)
		p1.animationTime += p2
		local AnimationTimeDelta = p1.animationTime - 4.5
		
		if p1.animationTime > 5 then
			p1.animationTime = 0
			p1.updateProgress(0)
			local YouTubeVideoItemsSize = p1.state.youTubeVideoItemsSize
			local NewAnimatedIndex = (p1.state.animatedIndex - YouTubeVideoItemsSize) % p1.state.imageItemsSize + 1 + YouTubeVideoItemsSize
			p1:setState({
				animatedIndex = NewAnimatedIndex,
				selectedIndex = NewAnimatedIndex,
				focusIndex = p1.getNextFocusIndex(NewAnimatedIndex)
			})
			
			return
		else
			p1.updateProgress(p1.animationTime / 5)
			
			if AnimationTimeDelta > 0 then
				p1.updatePreviewTransparency(AnimationTimeDelta / 0.5)
			end
		end
	end
	
	function p1.scrollMotorOnStep(X) --[[ Line: 310 ]]
		-- upvalues: p1 (copy)
		p1.updateCanvasPosition(Vector2.new(X, 0))
	end
	
	function p1.scrollMotorOnComplete() --[[ Line: 314 ]]
		-- upvalues: p1 (copy)
		p1.scrolling = false
	end
	
	p1.scrollMotor:onStep(p1.scrollMotorOnStep)
	p1.scrollMotor:onComplete(p1.scrollMotorOnComplete)
end

function MediaGalleryPreview.render(p1) --[[ Line: 322 ]]
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), IconButton (copy), IconSize (copy), Images (copy), EventConnection (copy), RunService (copy)
	local LayoutOrder = p1.props.layoutOrder
	local AnchorPoint = p1.props.anchorPoint
	local Position = p1.props.position
	local Size = p1.props.size
	local NumberOfThumbnails: number = p1.props.numberOfThumbnails
	local CountItems = #p1.props.items
	local ItemsToShow = p1.state.itemsToShow
	local ShowArrows = p1.state.showArrows
	local FocusIndex: number = p1.state.focusIndex
	local SelectedIndex = p1.state.selectedIndex
	local AnimationOn = p1.state.animationOn
	local YouTubeVideoItemsSize = p1.state.youTubeVideoItemsSize
	local ImageItemsSize: number = p1.state.imageItemsSize
	local NoAnimationOn: boolean = CountItems > 1 and not AnimationOn
	local NewSelectedIndex = AnimationOn and (SelectedIndex - YouTubeVideoItemsSize) % ImageItemsSize + 1 + YouTubeVideoItemsSize or nil
	local IsNumberOfThumbnailsBelow = NumberOfThumbnails < CountItems
	local IsFocusIndexBelow = FocusIndex <= 1
	local IsFocusIndexAbove = #ItemsToShow < FocusIndex + NumberOfThumbnails
	
	return WithStyleFunction(function(p2) --[[ Line: 346 ]]
		-- upvalues: RoactModule (upval), LayoutOrder (copy), Size (copy), AnchorPoint (copy), Position (copy), p1 (copy), NoAnimationOn (copy), AnimationOn (copy), NewSelectedIndex (copy), ItemsToShow (copy), SelectedIndex (copy), IsNumberOfThumbnailsBelow (copy), ShowArrows (copy), IconButton (upval), IconSize (upval), Images (upval), IsFocusIndexBelow (copy), IsFocusIndexAbove (copy), EventConnection (upval), RunService (upval)
		return RoactModule.createElement("Frame", {
			LayoutOrder = LayoutOrder,
			Size = Size,
			AnchorPoint = AnchorPoint,
			Position = Position,
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			[RoactModule.Change.AbsoluteSize] = p1.onResize,
			[RoactModule.Event.InputEnded] = NoAnimationOn and p1.onMouseLeave or nil
		}, {
			Content = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				Size = p1.contentSize
			}, {
				ListLayout = RoactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 24)
				}),
				Preview = RoactModule.createElement("Frame", {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					Size = p1.previewSize
				}, {
					AnimationLabel = AnimationOn and RoactModule.createElement("ImageLabel", {
						BackgroundTransparency = 1,
						ZIndex = -1,
						Size = UDim2.fromScale(1, 1),
						Image = NewSelectedIndex and ItemsToShow[NewSelectedIndex].imageId
					}, {
						Corner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) })
					}) or nil,
					Button = RoactModule.createElement("ImageButton", {
						Size = UDim2.fromScale(1, 1),
						Image = ItemsToShow[SelectedIndex].imageId,
						ImageTransparency = p1.previewTransparency,
						BackgroundTransparency = 1,
						AutoButtonColor = false,
						ZIndex = 1,
						[RoactModule.Event.Activated] = p1.onPreviewActivated
					}, {
						Corner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) })
					})
				}),
				Pagination = RoactModule.createElement("Frame", {
					LayoutOrder = 2,
					Size = p1.paginationSize,
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					[RoactModule.Event.InputBegan] = IsNumberOfThumbnailsBelow and p1.onMouseEnterPagination or nil,
					[RoactModule.Event.InputEnded] = IsNumberOfThumbnailsBelow and p1.onMouseLeavePagination or nil
				}, {
					LeftArrow = ShowArrows and RoactModule.createElement(IconButton, {
						size = UDim2.new(0, IconSize, 1, 0),
						anchorPoint = Vector2.new(0, 0.5),
						position = UDim2.fromScale(0, 0.5),
						icon = Images["icons/actions/cycleLeft"],
						isDisabled = IsFocusIndexBelow,
						onActivated = p1.onCycleLeftActivated
					}) or nil,
					Scroller = p1:renderScroller(p2),
					RightArrow = ShowArrows and RoactModule.createElement(IconButton, {
						size = UDim2.new(0, IconSize, 1, 0),
						anchorPoint = Vector2.new(1, 0.5),
						position = UDim2.fromScale(1, 0.5),
						icon = Images["icons/actions/cycleRight"],
						isDisabled = IsFocusIndexAbove,
						onActivated = p1.onCycleRightActivated
					}) or nil
				})
			}),
			EventConnection = AnimationOn and RoactModule.createElement(EventConnection, {
				event = RunService.RenderStepped,
				callback = p1.renderSteppedCallback
			}) or nil
		})
	end)
end

function MediaGalleryPreview.renderScroller(p1, p2) --[[ Line: 432 ]]
	-- upvalues: RoactModule (copy), IconSize (copy)
	return RoactModule.createElement("ScrollingFrame", {
		BackgroundTransparency = 1,
		ScrollBarThickness = 0,
		ClipsDescendants = true,
		Selectable = false,
		Size = UDim2.new(1, -IconSize * 2, 1, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		ScrollingDirection = Enum.ScrollingDirection.X,
		AutomaticCanvasSize = Enum.AutomaticSize.XY,
		CanvasPosition = p1.canvasPosition
	}, p1:renderThumbnails(p2))
end

function MediaGalleryPreview.renderThumbnails(p1, p2) --[[ Line: 447 ]]
	-- upvalues: RoactModule (copy), ThumbnailButtonModule (copy)
	local SelectedIndex = p1.state.selectedIndex
	local AnimationOn = p1.state.animationOn
	local AnimatedIndex = p1.state.animatedIndex
	local config = {
		ListLayout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 12)
		})
	}
	
	for ItemKey, value in ipairs(p1.state.itemsToShow) do
		config["item" .. ItemKey] = RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			LayoutOrder = ItemKey,
			Size = p1.thumbnailSize
		}, {
			Thumbnail = RoactModule.createElement(ThumbnailButtonModule, {
				useScaledPlayButton = true,
				itemKey = ItemKey,
				imageId = value.imageId,
				isVideo = value.isYouTubeVideo,
				isSelected = ItemKey == SelectedIndex,
				onActivated = value.imageId and value.imageId ~= "" and p1.onItemActivated or nil,
				onPlayActivated = value.isYouTubeVideo and p1.onItemPlayActivated or nil
			}),
			TimerBar = AnimationOn and ItemKey == AnimatedIndex and p1:renderTimerBar(p2) or nil
		})
	end
	return config
end

function MediaGalleryPreview.renderTimerBar(p3, p4) --[[ Line: 488 ]]
	-- upvalues: RoactModule (copy)
	local UIDefault = p4.Theme.UIDefault
	local SecondaryContent = p4.Theme.SecondaryContent
	
	return RoactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		ZIndex = 100,
		Size = UDim2.new(1, 0, 0, 2),
		AnchorPoint = Vector2.new(0, 1),
		Position = UDim2.fromScale(0, 1)
	}, {
		Background = RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = p3.thumbnailSize,
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.fromScale(0, 1),
			BackgroundColor3 = UIDefault.Color,
			BackgroundTransparency = UIDefault.Transparency
		}, {
			Corner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
			Progress = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				ClipsDescendants = true,
				Size = p3.progress:map(function(XScale): UDim2 --[[ Line: 513 ]]
					return UDim2.fromScale(XScale, 1)
				end)
			}, {
				Foreground = RoactModule.createElement("Frame", {
					BorderSizePixel = 0,
					Size = p3.thumbnailSize,
					BackgroundColor3 = SecondaryContent.Color,
					BackgroundTransparency = SecondaryContent.Transparency
				}, {
					Corner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) })
				})
			})
		})
	})
end

function MediaGalleryPreview.didUpdate(p3, _, State) --[[ Line: 535 ]]
	if p3.state.focusIndex ~= State.focusIndex then
		p3:scrollToNewIndex()
	end
	if p3.state.selectedIndex ~= State.selectedIndex then
		p3.updatePreviewTransparency(0)
	end
end

function MediaGalleryPreview.updateSizes(p3, Frame: Frame) --[[ Line: 545 ]]
	-- upvalues: CalcMediaGallerySizesFromWidthModule (copy), CalcMediaGallerySizesFromHeightModule (copy)
	local Y = Frame.AbsoluteSize.Y
	local NumberOfThumbnails = p3.props.numberOfThumbnails
	local MediaGallerySizesFromWidthModule = CalcMediaGallerySizesFromWidthModule(Frame.AbsoluteSize.X, NumberOfThumbnails, p3.props.fullWidth)
	
	if Y < MediaGallerySizesFromWidthModule.contentSize.Y.Offset then
		MediaGallerySizesFromWidthModule = CalcMediaGallerySizesFromHeightModule(Y, NumberOfThumbnails, p3.props.fullWidth)
	end
	p3.updateContentSize(MediaGallerySizesFromWidthModule.contentSize)
	p3.updatePreviewSize(MediaGallerySizesFromWidthModule.previewSize)
	p3.updatePaginationSize(MediaGallerySizesFromWidthModule.paginationSize)
	p3.updateThumbnailSize(MediaGallerySizesFromWidthModule.thumbnailSize)
end

function MediaGalleryPreview.getCanvasPositionX(p3): number --[[ Line: 561 ]]
	return (p3.state.focusIndex - 1) * (p3.thumbnailSize:getValue().X.Offset + 12)
end

function MediaGalleryPreview.scrollToNewIndex(p3) --[[ Line: 567 ]]
	-- upvalues: OtterModule (copy), config (copy)
	local CanvasPositionX = p3:getCanvasPositionX()
	p3.scrollMotor:setGoal(OtterModule.instant(p3.canvasPosition:getValue().X))
	p3.scrollMotor:setGoal(OtterModule.spring(CanvasPositionX, config))
	p3.scrolling = true
end

return MediaGalleryPreview