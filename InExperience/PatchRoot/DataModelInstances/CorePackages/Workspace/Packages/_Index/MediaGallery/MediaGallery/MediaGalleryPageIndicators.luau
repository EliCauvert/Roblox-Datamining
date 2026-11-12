local MediaGallery = script:FindFirstAncestor("MediaGallery")
local Parent = MediaGallery.Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.ReactOtter)
local _ = require(Parent.AppCommonLib)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local UseIndicatorScrollAnimationModule = require(MediaGallery.Hooks.useIndicatorScrollAnimation)
local MAXVISIBLEINDICATORS = require(MediaGallery.MediaGalleryConstants).MAX_VISIBLE_INDICATORS
local FFlagLuaAppMediaGalleryPageIndicatorOpacity = require(Parent.SharedFlags).FFlagLuaAppMediaGalleryPageIndicatorOpacity

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
	-- upvalues: UseTokensFunction (copy), FFlagLuaAppMediaGalleryPageIndicatorOpacity (copy), UseIndicatorScrollAnimationModule (copy), MAXVISIBLEINDICATORS (copy), ReactModule (copy), getDotAnchorPointAtIndex (copy), getDotPositionAtIndex (copy)
	local UseTokensResult = UseTokensFunction()
	local Size100 = UseTokensResult.Size.Size_100
	local Size150 = UseTokensResult.Size.Size_150
	local Size200 = UseTokensResult.Size.Size_200
	local Size600 = if FFlagLuaAppMediaGalleryPageIndicatorOpacity then UseTokensResult.Size.Size_600 else UseTokensResult.Size.Size_800
	local Size150_1 = if FFlagLuaAppMediaGalleryPageIndicatorOpacity then UseTokensResult.Size.Size_150 else UseTokensResult.Padding.Small
	local Muted = UseTokensResult.DarkMode.Content.Muted
	local Emphasis = UseTokensResult.DarkMode.Content.Emphasis
	local White = if FFlagLuaAppMediaGalleryPageIndicatorOpacity then UseTokensResult.Color.Extended.White else nil
	local UseIndicatorScrollAnimationModuleResult = UseIndicatorScrollAnimationModule({
		numberOfItems = Frame.numberOfItems,
		startIndex = Frame.startIndex,
		scrolledSignal = Frame.mediaGalleryScrolledSignal,
		useSpring = Frame.useSpring,
		springConfig = Frame.springConfig,
		indicatorSize = Size200,
		indicatorPadding = Size150_1
	})
	local Smallest = math.min(Frame.numberOfItems, MAXVISIBLEINDICATORS)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: Smallest (copy), Size200 (copy), Size150_1 (copy), Size600 (copy)
		return (Smallest - 1) * (Size200 + Size150_1) + Size600
	end, { Smallest, Size200, Size150_1, Size600 })
	local UseRefResult = ReactModule.useRef({})
	local UseResult = ReactModule.useCallback(function(CurrentItemIndex): UDim2
		-- upvalues: UseIndicatorScrollAnimationModuleResult (copy), Smallest (copy), Frame (copy), Size600 (copy), Size200 (copy), Size100 (copy), Size150 (copy)
		local Smallest1 = math.min(UseIndicatorScrollAnimationModuleResult.firstVisibleIndex + Smallest - 1, Frame.numberOfItems)
		local IsFirstVisibleIndexAbove = UseIndicatorScrollAnimationModuleResult.firstVisibleIndex > 1
		local IsSmallestBelow = Smallest1 < Frame.numberOfItems
		
		if CurrentItemIndex == UseIndicatorScrollAnimationModuleResult.currentItemIndex then
			return UDim2.fromOffset(Size600, Size200)
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
		Size200, Size600
	})
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: Frame (copy), UseRefResult (copy), UseResult (copy), FFlagLuaAppMediaGalleryPageIndicatorOpacity (upval), Muted (copy), UseIndicatorScrollAnimationModuleResult (copy), White (copy), ReactModule (upval), Size600 (copy), Size200 (copy), getDotAnchorPointAtIndex (upval), getDotPositionAtIndex (upval), Emphasis (copy)
		local Frames = {}
		
		for i = 1, Frame.numberOfItems do
			local CurrentEntry = UseRefResult.current[i]
			local UseResultResult = UseResult(i)
			local Muted1 = if FFlagLuaAppMediaGalleryPageIndicatorOpacity then if i == UseIndicatorScrollAnimationModuleResult.currentItemIndex then if Frame.currentItemProgressBinding then Muted else White.White_100 else White.White_20 else Muted
			Frames["Indicator" .. i] = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.fromOffset(if i == UseIndicatorScrollAnimationModuleResult.currentItemIndex then Size600 else Size200, Size200),
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
					BackgroundColor3 = Muted1.Color3,
					BackgroundTransparency = Muted1.Transparency
				}, {
					UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
					ProgressBar = if i == UseIndicatorScrollAnimationModuleResult.currentItemIndex and Frame.currentItemProgressBinding then ReactModule.createElement("Frame", {
						BorderSizePixel = 0,
						Size = Frame.currentItemProgressBinding:map(function(p1): UDim2
							-- upvalues: Size200 (upval), Size600 (upval)
							return UDim2.fromOffset(Size200 + p1 * (Size600 - Size200), Size200)
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
		Size600, Muted, Emphasis,
		UseIndicatorScrollAnimationModuleResult.animationProgressBinding,
		if FFlagLuaAppMediaGalleryPageIndicatorOpacity then White else nil
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
			Padding = UDim.new(0, Size150_1),
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		Items = ReactModule.createElement(ReactModule.Fragment, {}, UseMemoResult1)
	})
end)