local runService = game:GetService("RunService")
local parent = script:FindFirstAncestor("AppBlox").Parent
local eventConnection = require(parent.ReactUtils).EventConnection
local otterModule = require(parent.Otter)
local roactModule = require(parent.Roact)
local UIBloxModule = require(parent.UIBlox)
local iconButton = UIBloxModule.App.Button.IconButton
local iconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local images = UIBloxModule.App.ImageSet.Images
local getIconSize = UIBloxModule.App.ImageSet.getIconSize
local withStyle = UIBloxModule.Core.Style.withStyle
local tModule = require(parent.t)
local thumbnailButtonModule = require(script.Parent.ThumbnailButton)
local calcMediaGallerySizesFromHeightModule = require(script.Parent.calcMediaGallerySizesFromHeight)
local calcMediaGallerySizesFromWidthModule = require(script.Parent.calcMediaGallerySizesFromWidth)
local getShowItemsModule = require(script.Parent.getShowItems)
local var1 = getIconSize(iconSize.Medium)
local t = { frequency = 4, dampingRatio = 1 }
local mediaGalleryPreview = roactModule.Component:extend("MediaGalleryPreview")
mediaGalleryPreview.validateProps = tModule.strictInterface({
	layoutOrder = tModule.optional(tModule.integer),
	size = tModule.optional(tModule.UDim2),
	fullWidth = tModule.optional(tModule.boolean),
	anchorPoint = tModule.optional(tModule.Vector2),
	position = tModule.optional(tModule.UDim2),
	items = tModule.array(tModule.strictInterface({
		imageId = tModule.string,
		isYouTubeVideo = tModule.optional(tModule.boolean)
	})),
	numberOfThumbnails = tModule.optional(tModule.integer),
	onPreviewActivated = tModule.optional(tModule.callback),
	onThumbnailActivated = tModule.optional(tModule.callback),
	onVideoPlayActivated = tModule.optional(tModule.callback)
})
mediaGalleryPreview.defaultProps = {
	numberOfThumbnails = 5,
	fullWidth = false,
	size = UDim2.fromScale(1, 1)
}

function mediaGalleryPreview.getDerivedStateFromProps(p1, p2)
	-- upvalues: getShowItemsModule (ref)
	if p2.items == p1.items and p2.numberOfThumbnails == p1.numberOfThumbnails then
		return
	end
	local var2, var3, var4 = getShowItemsModule(p1)
	
	return {
		items = p1.items,
		numberOfThumbnails = p1.numberOfThumbnails,
		itemsToShow = var2,
		youTubeVideoItemsSize = var3,
		imageItemsSize = var4,
		animationOn = var4 > 1,
		animatedIndex = var3 + 1,
		selectedIndex = var3 + 1
	}
end

function mediaGalleryPreview.init(p1)
	-- upvalues: otterModule (ref), roactModule (ref)
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
	p1.scrollMotor = otterModule.createSingleMotor(0)
	local var2, var3 = roactModule.createBinding(UDim2.fromScale(1, 1))
	p1.contentSize = var2
	p1.updateContentSize = var3
	local var4, var5 = roactModule.createBinding(UDim2.fromScale(1, 0.5))
	p1.previewSize = var4
	p1.updatePreviewSize = var5
	local var6, var7 = roactModule.createBinding(UDim2.fromScale(1, 0.5))
	p1.paginationSize = var6
	p1.updatePaginationSize = var7
	local var8, var9 = roactModule.createBinding(UDim2.fromScale(0, 0))
	p1.thumbnailSize = var8
	p1.updateThumbnailSize = var9
	local var10, var11 = roactModule.createBinding(Vector2.new(0, 0))
	p1.canvasPosition = var10
	p1.updateCanvasPosition = var11
	local var12, var13 = roactModule.createBinding(0)
	p1.progress = var12
	p1.updateProgress = var13
	local var14, var15 = roactModule.createBinding(0)
	p1.previewTransparency = var14
	p1.updatePreviewTransparency = var15
	
	function p2.onResize(p2)
		-- upvalues: p1 (ref)
		p1:updateSizes(p2)
		p1.updateCanvasPosition(Vector2.new(p1:getCanvasPositionX(), 0))
	end
	
	function p2.onMouseLeave(_, p2)
		-- upvalues: p1 (ref)
		if p2.UserInputType == Enum.UserInputType.MouseMovement then
			p1.resetAnimation()
			p1:setState(function(p3)
				-- upvalues: p1 (copy)
				local selectedIndex = p3.selectedIndex
				
				return {
					animationOn = p3.imageItemsSize > 1,
					animatedIndex = selectedIndex,
					focusIndex = p1.getNextFocusIndex(selectedIndex)
				}
			end)
			
			return
		end
	end
	
	function p2.onPreviewActivated()
		-- upvalues: p1 (ref)
		p1.resetAnimation()
		p1:setState({ animationOn = false })
		
		if p1.props.onPreviewActivated then
			p1.props.onPreviewActivated(p1.state.itemsToShow[p1.state.selectedIndex].originalIndex)
		end
	end
	
	function p2.onMouseEnterPagination(_, p2)
		-- upvalues: p1 (ref)
		if p2.UserInputType == Enum.UserInputType.MouseMovement then
			p1:setState(function(p3)
				if p3.showArrows then
					return
				end
				return { showArrows = true }
			end)
			
			return
		end
	end
	
	function p2.onMouseLeavePagination(_, p2)
		-- upvalues: p1 (ref)
		if p2.UserInputType == Enum.UserInputType.MouseMovement then
			p1:setState(function(p3)
				if p3.showArrows then
					return { showArrows = false }
				end
			end)
			
			return
		end
	end
	
	function p2.onCycleLeftActivated()
		-- upvalues: p1 (ref)
		if p1.scrolling then
			return
		end
		local maxValue = math.max(p1.state.focusIndex - 1, 1)
		p1.resetAnimation()
		p1:setState({ animationOn = false, focusIndex = maxValue })
	end
	
	function p2.onCycleRightActivated()
		-- upvalues: p1 (ref)
		if p1.scrolling then
			return
		end
		local minValue = math.min(p1.state.focusIndex + 1, #p1.props.items)
		p1.resetAnimation()
		p1:setState({ animationOn = false, focusIndex = minValue })
	end
	
	function p2.onItemActivated(p2)
		-- upvalues: p1 (ref)
		local isYouTubeVideo = p1.state.itemsToShow[p2].isYouTubeVideo
		local selectedIndex = p1.state.selectedIndex
		p1.resetAnimation()
		p1:setState({
			animationOn = false,
			selectedIndex = if not isYouTubeVideo then p2 else nil
		})
		
		if isYouTubeVideo then
			p1.onVideoPlayActivated(p2)
		end
		if p1.props.onThumbnailActivated then
			p1.props.onThumbnailActivated(selectedIndex, p2)
		end
	end
	
	function p2.onItemPlayActivated(p2)
		-- upvalues: p1 (ref)
		p1.resetAnimation()
		p1:setState({ animationOn = false })
		p1.onVideoPlayActivated(p2)
	end
	
	function p2.onVideoPlayActivated(p2)
		-- upvalues: p1 (ref)
		if p1.props.onVideoPlayActivated then
			p1.props.onVideoPlayActivated(p1.state.itemsToShow[p2].originalIndex)
		end
	end
	
	function p2.getNextFocusIndex(p2)
		-- upvalues: p1 (ref)
		local focusIndex = p1.state.focusIndex
		local numberOfThumbnails = p1.props.numberOfThumbnails
		
		return if p2 < focusIndex then p2 elseif focusIndex + numberOfThumbnails <= p2 then p2 - numberOfThumbnails + 1 else focusIndex
	end
	
	function p2.resetAnimation()
		-- upvalues: p1 (ref)
		p1.animationTime = 0
		p1.updateProgress(0)
		p1.updatePreviewTransparency(0)
	end
	
	function p2.renderSteppedCallback(p2)
		-- upvalues: p1 (ref)
		p1.animationTime += p2
		local var16 = p1.animationTime - 4.5
		
		if p1.animationTime > 5 then
			p1.animationTime = 0
			p1.updateProgress(0)
			local youTubeVideoItemsSize = p1.state.youTubeVideoItemsSize
			local var17 = (p1.state.animatedIndex - youTubeVideoItemsSize) % p1.state.imageItemsSize + 1 + youTubeVideoItemsSize
			p1:setState({
				animatedIndex = var17,
				selectedIndex = var17,
				focusIndex = p1.getNextFocusIndex(var17)
			})
			
			return
		end
		p1.updateProgress(p1.animationTime / 5)
		
		if var16 > 0 then
			p1.updatePreviewTransparency(var16 / 0.5)
		end
	end
	
	function p2.scrollMotorOnStep(p2)
		-- upvalues: p1 (ref)
		p1.updateCanvasPosition(Vector2.new(p2, 0))
	end
	
	function p2.scrollMotorOnComplete()
		-- upvalues: p1 (ref)
		p1.scrolling = false
	end
	
	p1.scrollMotor:onStep(p1.scrollMotorOnStep)
	p1.scrollMotor:onComplete(p1.scrollMotorOnComplete)
end

function mediaGalleryPreview.render(p1)
	-- upvalues: withStyle (ref), roactModule (ref), iconButton (ref), var1 (ref), images (ref), eventConnection (ref), runService (ref)
	local layoutOrder = p1.props.layoutOrder
	local anchorPoint = p1.props.anchorPoint
	local position = p1.props.position
	local size = p1.props.size
	local numberOfThumbnails = p1.props.numberOfThumbnails
	local itemsCount = #p1.props.items
	local itemsToShow = p1.state.itemsToShow
	local showArrows = p1.state.showArrows
	local focusIndex = p1.state.focusIndex
	local selectedIndex = p1.state.selectedIndex
	local animationOn = p1.state.animationOn
	local youTubeVideoItemsSize = p1.state.youTubeVideoItemsSize
	local var2 = itemsCount > 1 and not animationOn
	local var3 = if animationOn then (selectedIndex - youTubeVideoItemsSize) % p1.state.imageItemsSize + 1 + youTubeVideoItemsSize else nil
	local var4 = numberOfThumbnails < itemsCount
	local var5 = focusIndex <= 1
	local var6 = #itemsToShow < focusIndex + numberOfThumbnails
	
	return withStyle(function(p2)
		-- upvalues: roactModule (copy), layoutOrder (ref), size (ref), anchorPoint (ref), position (ref), p1 (ref), var2 (ref), animationOn (ref), var3 (ref), itemsToShow (ref), selectedIndex (ref), var4 (ref), showArrows (ref), iconButton (copy), var1 (copy), images (copy), var5 (ref), var6 (ref), eventConnection (copy), runService (copy)
		return roactModule.createElement("Frame", {
			LayoutOrder = layoutOrder,
			Size = size,
			AnchorPoint = anchorPoint,
			Position = position,
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			[roactModule.Change.AbsoluteSize] = p1.onResize,
			[roactModule.Event.InputEnded] = if var2 then p1.onMouseLeave else nil
		}, {
			Content = roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				Size = p1.contentSize
			}, {
				ListLayout = roactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 24)
				}),
				Preview = roactModule.createElement("Frame", {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					Size = p1.previewSize
				}, {
					AnimationLabel = animationOn and (roactModule.createElement("ImageLabel", {
						BackgroundTransparency = 1,
						ZIndex = -1,
						Size = UDim2.fromScale(1, 1),
						Image = var3 and itemsToShow[var3].imageId
					}, {
						Corner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) })
					}) or nil),
					Button = roactModule.createElement("ImageButton", {
						Size = UDim2.fromScale(1, 1),
						Image = itemsToShow[selectedIndex].imageId,
						ImageTransparency = p1.previewTransparency,
						BackgroundTransparency = 1,
						AutoButtonColor = false,
						ZIndex = 1,
						[roactModule.Event.Activated] = p1.onPreviewActivated
					}, {
						Corner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) })
					})
				}),
				Pagination = roactModule.createElement("Frame", {
					LayoutOrder = 2,
					Size = p1.paginationSize,
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					[roactModule.Event.InputBegan] = if var4 then p1.onMouseEnterPagination else nil,
					[roactModule.Event.InputEnded] = if var4 then p1.onMouseLeavePagination else nil
				}, {
					LeftArrow = showArrows and roactModule.createElement(iconButton, {
						size = UDim2.new(0, var1, 1, 0),
						anchorPoint = Vector2.new(0, 0.5),
						position = UDim2.fromScale(0, 0.5),
						icon = images["icons/actions/cycleLeft"],
						isDisabled = var5,
						onActivated = p1.onCycleLeftActivated
					}) or nil,
					Scroller = p1:renderScroller(p2),
					RightArrow = showArrows and roactModule.createElement(iconButton, {
						size = UDim2.new(0, var1, 1, 0),
						anchorPoint = Vector2.new(1, 0.5),
						position = UDim2.fromScale(1, 0.5),
						icon = images["icons/actions/cycleRight"],
						isDisabled = var6,
						onActivated = p1.onCycleRightActivated
					}) or nil
				})
			}),
			EventConnection = animationOn and roactModule.createElement(eventConnection, {
				event = runService.RenderStepped,
				callback = p1.renderSteppedCallback
			}) or nil
		})
	end)
end

function mediaGalleryPreview.renderScroller(p1, p2)
	-- upvalues: roactModule (ref), var1 (ref)
	return roactModule.createElement("ScrollingFrame", {
		BackgroundTransparency = 1,
		ScrollBarThickness = 0,
		ClipsDescendants = true,
		Selectable = false,
		Size = UDim2.new(1, -var1 * 2, 1, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		ScrollingDirection = Enum.ScrollingDirection.X,
		AutomaticCanvasSize = Enum.AutomaticSize.XY,
		CanvasPosition = p1.canvasPosition
	}, p1:renderThumbnails(p2))
end

function mediaGalleryPreview.renderThumbnails(p1, p2)
	-- upvalues: roactModule (ref), thumbnailButtonModule (ref)
	local selectedIndex = p1.state.selectedIndex
	local animationOn = p1.state.animationOn
	local animatedIndex = p1.state.animatedIndex
	local t = {
		ListLayout = roactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 12)
		})
	}
	
	for i, v in ipairs(p1.state.itemsToShow) do
		t["item" .. i] = roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			LayoutOrder = i,
			Size = p1.thumbnailSize
		}, {
			Thumbnail = roactModule.createElement(thumbnailButtonModule, {
				useScaledPlayButton = true,
				itemKey = i,
				imageId = v.imageId,
				isVideo = v.isYouTubeVideo,
				isSelected = i == selectedIndex,
				onActivated = if v.imageId and v.imageId ~= "" then p1.onItemActivated else nil,
				onPlayActivated = if v.isYouTubeVideo then p1.onItemPlayActivated else nil
			}),
			TimerBar = animationOn and i == animatedIndex and p1:renderTimerBar(p2) or nil
		})
	end
	return t
end

function mediaGalleryPreview.renderTimerBar(p3, p4)
	-- upvalues: roactModule (ref)
	local UIDefault = p4.Theme.UIDefault
	local secondaryContent = p4.Theme.SecondaryContent
	
	return roactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		ZIndex = 100,
		Size = UDim2.new(1, 0, 0, 2),
		AnchorPoint = Vector2.new(0, 1),
		Position = UDim2.fromScale(0, 1)
	}, {
		Background = roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = p3.thumbnailSize,
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.fromScale(0, 1),
			BackgroundColor3 = UIDefault.Color,
			BackgroundTransparency = UIDefault.Transparency
		}, {
			Corner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
			Progress = roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				ClipsDescendants = true,
				Size = p3.progress:map(function(p5)
					return UDim2.fromScale(p5, 1)
				end)
			}, {
				Foreground = roactModule.createElement("Frame", {
					BorderSizePixel = 0,
					Size = p3.thumbnailSize,
					BackgroundColor3 = secondaryContent.Color,
					BackgroundTransparency = secondaryContent.Transparency
				}, {
					Corner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) })
				})
			})
		})
	})
end

function mediaGalleryPreview.didUpdate(p3, _, p4)
	if p3.state.focusIndex ~= p4.focusIndex then
		p3:scrollToNewIndex()
	end
	if p3.state.selectedIndex ~= p4.selectedIndex then
		p3.updatePreviewTransparency(0)
	end
end

function mediaGalleryPreview.updateSizes(p3, p4)
	-- upvalues: calcMediaGallerySizesFromWidthModule (ref), calcMediaGallerySizesFromHeightModule (ref)
	local x = p4.AbsoluteSize.X
	local y = p4.AbsoluteSize.Y
	local numberOfThumbnails = p3.props.numberOfThumbnails
	local var2 = calcMediaGallerySizesFromWidthModule(x, numberOfThumbnails, p3.props.fullWidth)
	
	if y < var2.contentSize.Y.Offset then
		var2 = calcMediaGallerySizesFromHeightModule(y, numberOfThumbnails, p3.props.fullWidth)
	end
	p3.updateContentSize(var2.contentSize)
	p3.updatePreviewSize(var2.previewSize)
	p3.updatePaginationSize(var2.paginationSize)
	p3.updateThumbnailSize(var2.thumbnailSize)
end

function mediaGalleryPreview.getCanvasPositionX(p3)
	return (p3.state.focusIndex - 1) * (p3.thumbnailSize:getValue().X.Offset + 12)
end

function mediaGalleryPreview.scrollToNewIndex(p3)
	-- upvalues: otterModule (ref), t (ref)
	local canvasPositionX = p3:getCanvasPositionX()
	p3.scrollMotor:setGoal(otterModule.instant(p3.canvasPosition:getValue().X))
	p3.scrollMotor:setGoal(otterModule.spring(canvasPositionX, t))
	p3.scrolling = true
end

return mediaGalleryPreview