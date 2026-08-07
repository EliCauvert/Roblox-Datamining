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
local var9 = getIconSize(iconSize.Medium)
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

function mediaGalleryPreview.getDerivedStateFromProps(p0, p1) --[[ line: 77 ]]
	-- upvalues: getShowItemsModule (ref)
	if p1.items == p0.items and p1.numberOfThumbnails == p0.numberOfThumbnails then
		return
	end
	local var12, var13, var14 = getShowItemsModule(p0)
	
	return {
		items = p0.items,
		numberOfThumbnails = p0.numberOfThumbnails,
		itemsToShow = var12,
		youTubeVideoItemsSize = var13,
		imageItemsSize = var14,
		animationOn = var14 > 1,
		animatedIndex = var13 + 1,
		selectedIndex = var13 + 1
	}
end

function mediaGalleryPreview.init(p2) --[[ line: 95 ]]
	-- upvalues: otterModule (ref), roactModule (ref)
	p2.state = {
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
	p2.animationTime = 0
	p2.scrolling = false
	p2.scrollMotor = otterModule.createSingleMotor(0)
	local var15, var16 = roactModule.createBinding(UDim2.fromScale(1, 1))
	p2.contentSize = var15
	p2.updateContentSize = var16
	local var17, var18 = roactModule.createBinding(UDim2.fromScale(1, 0.5))
	p2.previewSize = var17
	p2.updatePreviewSize = var18
	local var19, var20 = roactModule.createBinding(UDim2.fromScale(1, 0.5))
	p2.paginationSize = var19
	p2.updatePaginationSize = var20
	local var21, var22 = roactModule.createBinding(UDim2.fromScale(0, 0))
	p2.thumbnailSize = var21
	p2.updateThumbnailSize = var22
	local var23, var24 = roactModule.createBinding(Vector2.new(0, 0))
	p2.canvasPosition = var23
	p2.updateCanvasPosition = var24
	local var25, var26 = roactModule.createBinding(0)
	p2.progress = var25
	p2.updateProgress = var26
	local var27, var28 = roactModule.createBinding(0)
	p2.previewTransparency = var27
	p2.updatePreviewTransparency = var28
	
	function p2.onResize(p3) --[[ line: 122 ]]
		-- upvalues: p2 (ref)
		p2:updateSizes(p3)
		p2.updateCanvasPosition(Vector2.new(p2:getCanvasPositionX(), 0))
	end
	
	function p2.onMouseLeave(_, p4) --[[ line: 127 ]]
		-- upvalues: p2 (ref)
		if p4.UserInputType == Enum.UserInputType.MouseMovement then
			p2.resetAnimation()
			p2:setState(function(p5) --[[ line: 133 ]]
				-- upvalues: p2 (copy)
				local selectedIndex = p5.selectedIndex
				
				return {
					animationOn = p5.imageItemsSize > 1,
					animatedIndex = selectedIndex,
					focusIndex = p2.getNextFocusIndex(selectedIndex)
				}
			end)
			
			return
		end
	end
	
	function p2.onPreviewActivated() --[[ line: 145 ]]
		-- upvalues: p2 (ref)
		p2.resetAnimation()
		p2:setState({ animationOn = false })
		
		if p2.props.onPreviewActivated then
			p2.props.onPreviewActivated(p2.state.itemsToShow[p2.state.selectedIndex].originalIndex)
		end
	end
	
	function p2.onMouseEnterPagination(_, p6) --[[ line: 160 ]]
		-- upvalues: p2 (ref)
		if p6.UserInputType == Enum.UserInputType.MouseMovement then
			p2:setState(function(p7) --[[ line: 165 ]]
				if p7.showArrows then
					return
				end
				return { showArrows = true }
			end)
			
			return
		end
	end
	
	function p2.onMouseLeavePagination(_, p8) --[[ line: 176 ]]
		-- upvalues: p2 (ref)
		if p8.UserInputType == Enum.UserInputType.MouseMovement then
			p2:setState(function(p9) --[[ line: 181 ]]
				if p9.showArrows then
					return { showArrows = false }
				end
			end)
			
			return
		end
	end
	
	function p2.onCycleLeftActivated() --[[ line: 192 ]]
		-- upvalues: p2 (ref)
		if p2.scrolling then
			return
		end
		local maxValue = math.max(p2.state.focusIndex - 1, 1)
		p2.resetAnimation()
		p2:setState({ animationOn = false, focusIndex = maxValue })
	end
	
	function p2.onCycleRightActivated() --[[ line: 206 ]]
		-- upvalues: p2 (ref)
		if p2.scrolling then
			return
		end
		local minValue = math.min(p2.state.focusIndex + 1, #p2.props.items)
		p2.resetAnimation()
		p2:setState({ animationOn = false, focusIndex = minValue })
	end
	
	function p2.onItemActivated(p10) --[[ line: 221 ]]
		-- upvalues: p2 (ref)
		local isYouTubeVideo = p2.state.itemsToShow[p10].isYouTubeVideo
		local selectedIndex = p2.state.selectedIndex
		p2.resetAnimation()
		p2:setState({
			animationOn = false,
			selectedIndex = if not isYouTubeVideo then p10 else nil
		})
		
		if isYouTubeVideo then
			p2.onVideoPlayActivated(p10)
		end
		if p2.props.onThumbnailActivated then
			p2.props.onThumbnailActivated(selectedIndex, p10)
		end
	end
	
	function p2.onItemPlayActivated(p11) --[[ line: 241 ]]
		-- upvalues: p2 (ref)
		p2.resetAnimation()
		p2:setState({ animationOn = false })
		p2.onVideoPlayActivated(p11)
	end
	
	function p2.onVideoPlayActivated(p12) --[[ line: 250 ]]
		-- upvalues: p2 (ref)
		if p2.props.onVideoPlayActivated then
			p2.props.onVideoPlayActivated(p2.state.itemsToShow[p12].originalIndex)
		end
	end
	
	function p2.getNextFocusIndex(p13) --[[ line: 259 ]]
		-- upvalues: p2 (ref)
		local focusIndex = p2.state.focusIndex
		local numberOfThumbnails = p2.props.numberOfThumbnails
		
		return if p13 < focusIndex then p13 elseif focusIndex + numberOfThumbnails <= p13 then p13 - numberOfThumbnails + 1 else focusIndex
	end
	
	function p2.resetAnimation() --[[ line: 274 ]]
		-- upvalues: p2 (ref)
		p2.animationTime = 0
		p2.updateProgress(0)
		p2.updatePreviewTransparency(0)
	end
	
	function p2.renderSteppedCallback(p14) --[[ line: 280 ]]
		-- upvalues: p2 (ref)
		p2.animationTime += p14
		local var31 = p2.animationTime - 4.5
		
		if p2.animationTime > 5 then
			p2.animationTime = 0
			p2.updateProgress(0)
			local youTubeVideoItemsSize = p2.state.youTubeVideoItemsSize
			local var32 = (p2.state.animatedIndex - youTubeVideoItemsSize) % p2.state.imageItemsSize + 1 + youTubeVideoItemsSize
			p2:setState({
				animatedIndex = var32,
				selectedIndex = var32,
				focusIndex = p2.getNextFocusIndex(var32)
			})
			
			return
		end
		p2.updateProgress(p2.animationTime / 5)
		
		if var31 > 0 then
			p2.updatePreviewTransparency(var31 / 0.5)
		end
	end
	
	function p2.scrollMotorOnStep(p15) --[[ line: 310 ]]
		-- upvalues: p2 (ref)
		p2.updateCanvasPosition(Vector2.new(p15, 0))
	end
	
	function p2.scrollMotorOnComplete() --[[ line: 314 ]]
		-- upvalues: p2 (ref)
		p2.scrolling = false
	end
	
	p2.scrollMotor:onStep(p2.scrollMotorOnStep)
	p2.scrollMotor:onComplete(p2.scrollMotorOnComplete)
end

function mediaGalleryPreview.render(p16) --[[ line: 322 ]]
	-- upvalues: withStyle (ref), roactModule (ref), iconButton (ref), var9 (ref), images (ref), eventConnection (ref), runService (ref)
	local layoutOrder = p16.props.layoutOrder
	local anchorPoint = p16.props.anchorPoint
	local position = p16.props.position
	local size = p16.props.size
	local numberOfThumbnails = p16.props.numberOfThumbnails
	local itemsCount = #p16.props.items
	local itemsToShow = p16.state.itemsToShow
	local showArrows = p16.state.showArrows
	local focusIndex = p16.state.focusIndex
	local selectedIndex = p16.state.selectedIndex
	local animationOn = p16.state.animationOn
	local youTubeVideoItemsSize = p16.state.youTubeVideoItemsSize
	local var34 = itemsCount > 1 and not animationOn
	local var35 = if animationOn then (selectedIndex - youTubeVideoItemsSize) % p16.state.imageItemsSize + 1 + youTubeVideoItemsSize else nil
	local var36 = numberOfThumbnails < itemsCount
	local var37 = focusIndex <= 1
	local var38 = #itemsToShow < focusIndex + numberOfThumbnails
	
	return withStyle(function(p17) --[[ line: 346 ]]
		-- upvalues: roactModule (copy), layoutOrder (ref), size (ref), anchorPoint (ref), position (ref), p16 (ref), var34 (ref), animationOn (ref), var35 (ref), itemsToShow (ref), selectedIndex (ref), var36 (ref), showArrows (ref), iconButton (copy), var9 (copy), images (copy), var37 (ref), var38 (ref), eventConnection (copy), runService (copy)
		return roactModule.createElement("Frame", {
			LayoutOrder = layoutOrder,
			Size = size,
			AnchorPoint = anchorPoint,
			Position = position,
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			[roactModule.Change.AbsoluteSize] = p16.onResize,
			[roactModule.Event.InputEnded] = if var34 then p16.onMouseLeave else nil
		}, {
			Content = roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				Size = p16.contentSize
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
					Size = p16.previewSize
				}, {
					AnimationLabel = animationOn and (roactModule.createElement("ImageLabel", {
						BackgroundTransparency = 1,
						ZIndex = -1,
						Size = UDim2.fromScale(1, 1),
						Image = var35 and itemsToShow[var35].imageId
					}, {
						Corner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) })
					}) or nil),
					Button = roactModule.createElement("ImageButton", {
						Size = UDim2.fromScale(1, 1),
						Image = itemsToShow[selectedIndex].imageId,
						ImageTransparency = p16.previewTransparency,
						BackgroundTransparency = 1,
						AutoButtonColor = false,
						ZIndex = 1,
						[roactModule.Event.Activated] = p16.onPreviewActivated
					}, {
						Corner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) })
					})
				}),
				Pagination = roactModule.createElement("Frame", {
					LayoutOrder = 2,
					Size = p16.paginationSize,
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					[roactModule.Event.InputBegan] = if var36 then p16.onMouseEnterPagination else nil,
					[roactModule.Event.InputEnded] = if var36 then p16.onMouseLeavePagination else nil
				}, {
					LeftArrow = showArrows and roactModule.createElement(iconButton, {
						size = UDim2.new(0, var9, 1, 0),
						anchorPoint = Vector2.new(0, 0.5),
						position = UDim2.fromScale(0, 0.5),
						icon = images["icons/actions/cycleLeft"],
						isDisabled = var37,
						onActivated = p16.onCycleLeftActivated
					}) or nil,
					Scroller = p16:renderScroller(p17),
					RightArrow = showArrows and roactModule.createElement(iconButton, {
						size = UDim2.new(0, var9, 1, 0),
						anchorPoint = Vector2.new(1, 0.5),
						position = UDim2.fromScale(1, 0.5),
						icon = images["icons/actions/cycleRight"],
						isDisabled = var38,
						onActivated = p16.onCycleRightActivated
					}) or nil
				})
			}),
			EventConnection = animationOn and roactModule.createElement(eventConnection, {
				event = runService.RenderStepped,
				callback = p16.renderSteppedCallback
			}) or nil
		})
	end)
end

function mediaGalleryPreview.renderScroller(p18, p19) --[[ line: 432 ]]
	-- upvalues: roactModule (ref), var9 (ref)
	return roactModule.createElement("ScrollingFrame", {
		BackgroundTransparency = 1,
		ScrollBarThickness = 0,
		ClipsDescendants = true,
		Selectable = false,
		Size = UDim2.new(1, -var9 * 2, 1, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		ScrollingDirection = Enum.ScrollingDirection.X,
		AutomaticCanvasSize = Enum.AutomaticSize.XY,
		CanvasPosition = p18.canvasPosition
	}, p18:renderThumbnails(p19))
end

function mediaGalleryPreview.renderThumbnails(p20, p21) --[[ line: 447 ]]
	-- upvalues: roactModule (ref), thumbnailButtonModule (ref)
	local selectedIndex = p20.state.selectedIndex
	local animationOn = p20.state.animationOn
	local animatedIndex = p20.state.animatedIndex
	local t = {
		ListLayout = roactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 12)
		})
	}
	
	for i, v in ipairs(p20.state.itemsToShow) do
		t["item" .. i] = roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			LayoutOrder = i,
			Size = p20.thumbnailSize
		}, {
			Thumbnail = roactModule.createElement(thumbnailButtonModule, {
				useScaledPlayButton = true,
				itemKey = i,
				imageId = v.imageId,
				isVideo = v.isYouTubeVideo,
				isSelected = i == selectedIndex,
				onActivated = if v.imageId and v.imageId ~= "" then p20.onItemActivated else nil,
				onPlayActivated = if v.isYouTubeVideo then p20.onItemPlayActivated else nil
			}),
			TimerBar = animationOn and i == animatedIndex and p20:renderTimerBar(p21) or nil
		})
	end
	return t
end

function mediaGalleryPreview.renderTimerBar(p22, p23) --[[ line: 488 ]]
	-- upvalues: roactModule (ref)
	local UIDefault = p23.Theme.UIDefault
	local secondaryContent = p23.Theme.SecondaryContent
	
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
			Size = p22.thumbnailSize,
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
				Size = p22.progress:map(function(p24) --[[ line: 513 ]]
					return UDim2.fromScale(p24, 1)
				end)
			}, {
				Foreground = roactModule.createElement("Frame", {
					BorderSizePixel = 0,
					Size = p22.thumbnailSize,
					BackgroundColor3 = secondaryContent.Color,
					BackgroundTransparency = secondaryContent.Transparency
				}, {
					Corner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) })
				})
			})
		})
	})
end

function mediaGalleryPreview.didUpdate(p25, _, p26) --[[ line: 535 ]]
	if p25.state.focusIndex ~= p26.focusIndex then
		p25:scrollToNewIndex()
	end
	if p25.state.selectedIndex ~= p26.selectedIndex then
		p25.updatePreviewTransparency(0)
	end
end

function mediaGalleryPreview.updateSizes(p27, p28) --[[ line: 545 ]]
	-- upvalues: calcMediaGallerySizesFromWidthModule (ref), calcMediaGallerySizesFromHeightModule (ref)
	local x = p28.AbsoluteSize.X
	local y = p28.AbsoluteSize.Y
	local numberOfThumbnails = p27.props.numberOfThumbnails
	local var40 = calcMediaGallerySizesFromWidthModule(x, numberOfThumbnails, p27.props.fullWidth)
	
	if y < var40.contentSize.Y.Offset then
		var40 = calcMediaGallerySizesFromHeightModule(y, numberOfThumbnails, p27.props.fullWidth)
	end
	p27.updateContentSize(var40.contentSize)
	p27.updatePreviewSize(var40.previewSize)
	p27.updatePaginationSize(var40.paginationSize)
	p27.updateThumbnailSize(var40.thumbnailSize)
end

function mediaGalleryPreview.getCanvasPositionX(p29) --[[ line: 561 ]]
	return (p29.state.focusIndex - 1) * (p29.thumbnailSize:getValue().X.Offset + 12)
end

function mediaGalleryPreview.scrollToNewIndex(p30) --[[ line: 567 ]]
	-- upvalues: otterModule (ref), t (ref)
	local canvasPositionX = p30:getCanvasPositionX()
	p30.scrollMotor:setGoal(otterModule.instant(p30.canvasPosition:getValue().X))
	p30.scrollMotor:setGoal(otterModule.spring(canvasPositionX, t))
	p30.scrolling = true
end

return mediaGalleryPreview