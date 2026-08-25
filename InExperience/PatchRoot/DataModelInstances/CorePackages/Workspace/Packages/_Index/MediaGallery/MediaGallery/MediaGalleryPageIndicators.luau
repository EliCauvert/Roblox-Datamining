local mediaGallery = script:FindFirstAncestor("MediaGallery")
local parent = mediaGallery.Parent
local reactModule = require(parent.React)
local _ = require(parent.ReactOtter)
local _ = require(parent.AppCommonLib)
local useTokens = require(parent.Foundation).Hooks.useTokens
local useIndicatorScrollAnimationModule = require(mediaGallery.Hooks.useIndicatorScrollAnimation)
local MAX_VISIBLE_INDICATORS = require(mediaGallery.MediaGalleryConstants).MAX_VISIBLE_INDICATORS

local function getDotAnchorPointAtIndex(vectorA, vectorB, p0)
	if p0 < vectorB then
		if vectorA == vectorB then
			return Vector2.new(1, 0.5)
		elseif vectorA == p0 then
			return Vector2.new(0, 0.5)
		end
	elseif vectorB < p0 then
		return if vectorA == vectorB then Vector2.new(0, 0.5) elseif vectorA == p0 then Vector2.new(1, 0.5) else Vector2.new(0.5, 0.5)
	end
end

local function getDotPositionAtIndex(vectorA, vectorB, p1)
	if p1 < vectorB then
		if vectorA == vectorB then
			return UDim2.fromScale(1, 0.5)
		elseif vectorA == p1 then
			return UDim2.fromScale(0, 0.5)
		end
	elseif vectorB < p1 then
		return if vectorA == vectorB then UDim2.fromScale(0, 0.5) elseif vectorA == p1 then UDim2.fromScale(1, 0.5) else UDim2.fromScale(0.5, 0.5)
	end
end

return reactModule.memo(function(p2)
	-- upvalues: useTokens (ref), useIndicatorScrollAnimationModule (ref), MAX_VISIBLE_INDICATORS (ref), reactModule (ref), getDotAnchorPointAtIndex (ref), getDotPositionAtIndex (ref)
	local var5 = useTokens()
	local size100 = var5.Size.Size_100
	local size150 = var5.Size.Size_150
	local size200 = var5.Size.Size_200
	local size800 = var5.Size.Size_800
	local small = var5.Padding.Small
	local muted = var5.DarkMode.Content.Muted
	local emphasis = var5.DarkMode.Content.Emphasis
	local var6 = useIndicatorScrollAnimationModule({
		numberOfItems = p2.numberOfItems,
		startIndex = p2.startIndex,
		scrolledSignal = p2.mediaGalleryScrolledSignal,
		useSpring = p2.useSpring,
		springConfig = p2.springConfig,
		indicatorSize = size200,
		indicatorPadding = small
	})
	local minValue = math.min(p2.numberOfItems, MAX_VISIBLE_INDICATORS)
	local var8 = reactModule.useMemo(function()
		-- upvalues: minValue (ref), size200 (ref), small (ref), size800 (ref)
		return (minValue - 1) * (size200 + small) + size800
	end, { minValue, size200, small, size800 })
	local var9 = reactModule.useRef({})
	local var10 = reactModule.useCallback(function(p3)
		-- upvalues: var6 (ref), minValue (ref), p2 (ref), size800 (ref), size200 (ref), size100 (ref), size150 (ref)
		local minValue_1 = math.min(var6.firstVisibleIndex + minValue - 1, p2.numberOfItems)
		local var13 = var6.firstVisibleIndex > 1
		local var14 = minValue_1 < p2.numberOfItems
		
		if p3 == var6.currentItemIndex then
			return UDim2.fromOffset(size800, size200)
		elseif var13 then
			if p3 < var6.firstVisibleIndex then
				return UDim2.fromOffset(0, 0)
			elseif p3 == var6.firstVisibleIndex then
				return UDim2.fromOffset(size100, size100)
			elseif p3 == var6.firstVisibleIndex + 1 then
				return UDim2.fromOffset(size150, size150)
			elseif var14 then
				return if minValue_1 < p3 then UDim2.fromOffset(0, 0) elseif p3 == minValue_1 then UDim2.fromOffset(size100, size100) elseif p3 == minValue_1 - 1 then UDim2.fromOffset(size150, size150) else UDim2.fromOffset(size200, size200)
			end
		end
	end, {
		p2.numberOfItems, minValue, var6.firstVisibleIndex, var6.currentItemIndex,
		size100, size150, size200, size800
	})
	local var11 = reactModule.useMemo(function()
		-- upvalues: p2 (ref), var9 (ref), var10 (ref), reactModule (copy), var6 (ref), size800 (ref), size200 (ref), getDotAnchorPointAtIndex (copy), getDotPositionAtIndex (copy), muted (ref), emphasis (ref)
		local t = {}
		
		for i = 1, p2.numberOfItems do
			local var16 = var9.current[i]
			local var17 = var10(i)
			t["Indicator" .. i] = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.fromOffset(if i == var6.currentItemIndex then size800 else size200, size200),
				LayoutOrder = i
			}, {
				Dot = reactModule.createElement("Frame", {
					BorderSizePixel = 0,
					AnchorPoint = getDotAnchorPointAtIndex(i, var6.previousItemIndex, var6.currentItemIndex),
					Position = getDotPositionAtIndex(i, var6.previousItemIndex, var6.currentItemIndex),
					Size = var6.animationProgressBinding:map(function(p4)
						-- upvalues: var16 (ref), var17 (ref)
						return if var16 == nil then var17 else var16:Lerp(var17, p4)
					end),
					BackgroundColor3 = muted.Color3,
					BackgroundTransparency = muted.Transparency
				}, {
					UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
					ProgressBar = if i == var6.currentItemIndex and p2.currentItemProgressBinding then reactModule.createElement("Frame", {
						BorderSizePixel = 0,
						Size = p2.currentItemProgressBinding:map(function(p5)
							-- upvalues: size200 (copy), size800 (copy)
							return UDim2.fromOffset(size200 + p5 * (size800 - size200), size200)
						end),
						BackgroundColor3 = emphasis.Color3,
						BackgroundTransparency = emphasis.Transparency
					}, {
						UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
					}) else nil
				})
			})
		end
		return t
	end, {
		p2.numberOfItems, p2.currentItemProgressBinding, var6.previousItemIndex,
		var6.currentItemIndex, var10, size200, size800, muted, emphasis,
		var6.animationProgressBinding
	})
	reactModule.useEffect(function()
		-- upvalues: p2 (ref), var9 (ref), var10 (ref)
		for i = 1, p2.numberOfItems do
			var9.current[i] = var10(i)
		end
	end, { p2.numberOfItems, var10 })
	
	return reactModule.createElement("ScrollingFrame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		ScrollingEnabled = false,
		ScrollBarThickness = 0,
		Selectable = false,
		AnchorPoint = p2.AnchorPoint,
		Position = p2.Position,
		Size = UDim2.fromOffset(var8, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		ZIndex = p2.ZIndex,
		ScrollingDirection = Enum.ScrollingDirection.X,
		CanvasSize = UDim2.fromOffset(0, size200),
		AutomaticCanvasSize = Enum.AutomaticSize.X,
		CanvasPosition = var6.canvasPositionBinding
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			Padding = UDim.new(0, small),
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		Items = reactModule.createElement(reactModule.Fragment, {}, var11)
	})
end)