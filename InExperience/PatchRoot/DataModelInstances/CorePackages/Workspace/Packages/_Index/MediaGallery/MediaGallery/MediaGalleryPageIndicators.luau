local MediaGallery = script:FindFirstAncestor("MediaGallery")
local Parent = MediaGallery.Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.ReactOtter)
local _ = require(Parent.AppCommonLib)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local UseIndicatorScrollAnimationModule = require(MediaGallery.Hooks.useIndicatorScrollAnimation)
local MAXVISIBLEINDICATORS = require(MediaGallery.MediaGalleryConstants).MAX_VISIBLE_INDICATORS

local function getDotAnchorPointAtIndex(CurrentItemIndex, PreviousItemIndex, CurrentItemIndex1): Vector2
	if CurrentItemIndex1 < PreviousItemIndex then
		if CurrentItemIndex == PreviousItemIndex then
			return Vector2.new(1, 0.5)
		elseif CurrentItemIndex == CurrentItemIndex1 then
			return Vector2.new(0, 0.5)
		end
	elseif PreviousItemIndex < CurrentItemIndex1 then
		if CurrentItemIndex == PreviousItemIndex then
			return Vector2.new(0, 0.5)
		elseif CurrentItemIndex == CurrentItemIndex1 then
			return Vector2.new(1, 0.5)
		end
	end
	return Vector2.new(0.5, 0.5)
end

local function getDotPositionAtIndex(CurrentItemIndex, PreviousItemIndex, CurrentItemIndex1): UDim2
	if CurrentItemIndex1 < PreviousItemIndex then
		if CurrentItemIndex == PreviousItemIndex then
			return UDim2.fromScale(1, 0.5)
		elseif CurrentItemIndex == CurrentItemIndex1 then
			return UDim2.fromScale(0, 0.5)
		end
	elseif PreviousItemIndex < CurrentItemIndex1 then
		if CurrentItemIndex == PreviousItemIndex then
			return UDim2.fromScale(0, 0.5)
		elseif CurrentItemIndex == CurrentItemIndex1 then
			return UDim2.fromScale(1, 0.5)
		end
	end
	return UDim2.fromScale(0.5, 0.5)
end

return ReactModule.memo(function(Frame)
	-- upvalues: UseTokensFunction (copy), UseIndicatorScrollAnimationModule (copy), MAXVISIBLEINDICATORS (copy), ReactModule (copy), getDotAnchorPointAtIndex (copy), getDotPositionAtIndex (copy)
	local UseTokensResult = UseTokensFunction()
	local Size100 = UseTokensResult.Size.Size_100
	local Size150 = UseTokensResult.Size.Size_150
	local Size200 = UseTokensResult.Size.Size_200
	local Size800 = UseTokensResult.Size.Size_800
	local Small = UseTokensResult.Padding.Small
	local Muted = UseTokensResult.DarkMode.Content.Muted
	local Emphasis = UseTokensResult.DarkMode.Content.Emphasis
	local UseIndicatorScrollAnimationModuleResult = UseIndicatorScrollAnimationModule({
		numberOfItems = Frame.numberOfItems,
		startIndex = Frame.startIndex,
		scrolledSignal = Frame.mediaGalleryScrolledSignal,
		useSpring = Frame.useSpring,
		springConfig = Frame.springConfig,
		indicatorSize = Size200,
		indicatorPadding = Small
	})
	local Smallest = math.min(Frame.numberOfItems, MAXVISIBLEINDICATORS)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: Smallest (copy), Size200 (copy), Small (copy), Size800 (copy)
		return (Smallest - 1) * (Size200 + Small) + Size800
	end, { Smallest, Size200, Small, Size800 })
	local UseRefResult = ReactModule.useRef({})
	local UseResult = ReactModule.useCallback(function(CurrentItemIndex): UDim2
		-- upvalues: UseIndicatorScrollAnimationModuleResult (copy), Smallest (copy), Frame (copy), Size800 (copy), Size200 (copy), Size100 (copy), Size150 (copy)
		local Smallest1 = math.min(UseIndicatorScrollAnimationModuleResult.firstVisibleIndex + Smallest - 1, Frame.numberOfItems)
		local IsFirstVisibleIndexAbove = UseIndicatorScrollAnimationModuleResult.firstVisibleIndex > 1
		local IsSmallestBelow = Smallest1 < Frame.numberOfItems
		
		if CurrentItemIndex == UseIndicatorScrollAnimationModuleResult.currentItemIndex then
			return UDim2.fromOffset(Size800, Size200)
		elseif IsFirstVisibleIndexAbove then
			if CurrentItemIndex < UseIndicatorScrollAnimationModuleResult.firstVisibleIndex then
				return UDim2.fromOffset(0, 0)
			elseif CurrentItemIndex == UseIndicatorScrollAnimationModuleResult.firstVisibleIndex then
				return UDim2.fromOffset(Size100, Size100)
			elseif CurrentItemIndex == UseIndicatorScrollAnimationModuleResult.firstVisibleIndex + 1 then
				return UDim2.fromOffset(Size150, Size150)
			end
		end
		if IsSmallestBelow then
			if Smallest1 < CurrentItemIndex then
				return UDim2.fromOffset(0, 0)
			elseif CurrentItemIndex == Smallest1 then
				return UDim2.fromOffset(Size100, Size100)
			elseif CurrentItemIndex == Smallest1 - 1 then
				return UDim2.fromOffset(Size150, Size150)
			end
		end
		return UDim2.fromOffset(Size200, Size200)
	end, {
		Frame.numberOfItems, Smallest,
		UseIndicatorScrollAnimationModuleResult.firstVisibleIndex,
		UseIndicatorScrollAnimationModuleResult.currentItemIndex, Size100, Size150,
		Size200, Size800
	})
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: Frame (copy), UseRefResult (copy), UseResult (copy), ReactModule (upval), UseIndicatorScrollAnimationModuleResult (copy), Size800 (copy), Size200 (copy), getDotAnchorPointAtIndex (upval), getDotPositionAtIndex (upval), Muted (copy), Emphasis (copy)
		local Frames = {}
		
		for i = 1, Frame.numberOfItems do
			local CurrentEntry = UseRefResult.current[i]
			local UseResultResult = UseResult(i)
			Frames["Indicator" .. i] = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.fromOffset(if i == UseIndicatorScrollAnimationModuleResult.currentItemIndex then Size800 else Size200, Size200),
				LayoutOrder = i
			}, {
				Dot = ReactModule.createElement("Frame", {
					BorderSizePixel = 0,
					AnchorPoint = getDotAnchorPointAtIndex(i, UseIndicatorScrollAnimationModuleResult.previousItemIndex, UseIndicatorScrollAnimationModuleResult.currentItemIndex),
					Position = getDotPositionAtIndex(i, UseIndicatorScrollAnimationModuleResult.previousItemIndex, UseIndicatorScrollAnimationModuleResult.currentItemIndex),
					Size = UseIndicatorScrollAnimationModuleResult.animationProgressBinding:map(function(Alpha)
						-- upvalues: CurrentEntry (copy), UseResultResult (copy)
						return if CurrentEntry == nil then UseResultResult else CurrentEntry:Lerp(UseResultResult, Alpha)
					end),
					BackgroundColor3 = Muted.Color3,
					BackgroundTransparency = Muted.Transparency
				}, {
					UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
					ProgressBar = if i == UseIndicatorScrollAnimationModuleResult.currentItemIndex and Frame.currentItemProgressBinding then ReactModule.createElement("Frame", {
						BorderSizePixel = 0,
						Size = Frame.currentItemProgressBinding:map(function(p1): UDim2
							-- upvalues: Size200 (upval), Size800 (upval)
							return UDim2.fromOffset(Size200 + p1 * (Size800 - Size200), Size200)
						end),
						BackgroundColor3 = Emphasis.Color3,
						BackgroundTransparency = Emphasis.Transparency
					}, {
						UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
					}) else nil
				})
			})
		end
		return Frames
	end, {
		Frame.numberOfItems, Frame.currentItemProgressBinding,
		UseIndicatorScrollAnimationModuleResult.previousItemIndex,
		UseIndicatorScrollAnimationModuleResult.currentItemIndex, UseResult, Size200,
		Size800, Muted, Emphasis,
		UseIndicatorScrollAnimationModuleResult.animationProgressBinding
	})
	ReactModule.useEffect(function()
		-- upvalues: Frame (copy), UseRefResult (copy), UseResult (copy)
		for i = 1, Frame.numberOfItems do
			UseRefResult.current[i] = UseResult(i)
		end
	end, { Frame.numberOfItems, UseResult })
	
	return ReactModule.createElement("ScrollingFrame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		ScrollingEnabled = false,
		ScrollBarThickness = 0,
		Selectable = false,
		AnchorPoint = Frame.AnchorPoint,
		Position = Frame.Position,
		Size = UDim2.fromOffset(UseMemoResult, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		ZIndex = Frame.ZIndex,
		ScrollingDirection = Enum.ScrollingDirection.X,
		CanvasSize = UDim2.fromOffset(0, Size200),
		AutomaticCanvasSize = Enum.AutomaticSize.X,
		CanvasPosition = UseIndicatorScrollAnimationModuleResult.canvasPositionBinding
	}, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			Padding = UDim.new(0, Small),
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		Items = ReactModule.createElement(ReactModule.Fragment, {}, UseMemoResult1)
	})
end)