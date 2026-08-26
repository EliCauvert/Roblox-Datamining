local mediaGallery = script:FindFirstAncestor("MediaGallery")
local parent = mediaGallery.Parent
local reactModule = require(parent.React)
local _ = require(parent.ReactOtter)
local _ = require(parent.AppCommonLib)
local useTokens = require(parent.Foundation).Hooks.useTokens
local useIndicatorScrollAnimationModule = require(mediaGallery.Hooks.useIndicatorScrollAnimation)
local MAX_VISIBLE_INDICATORS = require(mediaGallery.MediaGalleryConstants).MAX_VISIBLE_INDICATORS

local function getDotAnchorPointAtIndex(vectorA, vectorB, p1)
	if p1 < vectorB then
		if vectorA == vectorB then
			return Vector2.new(1, 0.5)
		elseif vectorA == p1 then
			return Vector2.new(0, 0.5)
		end
	elseif vectorB < p1 then
		return if vectorA == vectorB then Vector2.new(0, 0.5) elseif vectorA == p1 then Vector2.new(1, 0.5) else Vector2.new(0.5, 0.5)
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

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), useIndicatorScrollAnimationModule (ref), MAX_VISIBLE_INDICATORS (ref), reactModule (ref), getDotAnchorPointAtIndex (ref), getDotPositionAtIndex (ref)
	local var1 = useTokens()
	local size100 = var1.Size.Size_100
	local size150 = var1.Size.Size_150
	local size200 = var1.Size.Size_200
	local size800 = var1.Size.Size_800
	local small = var1.Padding.Small
	local muted = var1.DarkMode.Content.Muted
	local emphasis = var1.DarkMode.Content.Emphasis
	local var2 = useIndicatorScrollAnimationModule({
		numberOfItems = p1.numberOfItems,
		startIndex = p1.startIndex,
		scrolledSignal = p1.mediaGalleryScrolledSignal,
		useSpring = p1.useSpring,
		springConfig = p1.springConfig,
		indicatorSize = size200,
		indicatorPadding = small
	})
	local minValue = math.min(p1.numberOfItems, MAX_VISIBLE_INDICATORS)
	local var3 = reactModule.useMemo(function()
		-- upvalues: minValue (ref), size200 (ref), small (ref), size800 (ref)
		return (minValue - 1) * (size200 + small) + size800
	end, { minValue, size200, small, size800 })
	local var4 = reactModule.useRef({})
	local var5 = reactModule.useCallback(function(p2)
		-- upvalues: var2 (ref), minValue (ref), p1 (ref), size800 (ref), size200 (ref), size100 (ref), size150 (ref)
		local minValue_1 = math.min(var2.firstVisibleIndex + minValue - 1, p1.numberOfItems)
		local var6 = var2.firstVisibleIndex > 1
		local var7 = minValue_1 < p1.numberOfItems
		
		if p2 == var2.currentItemIndex then
			return UDim2.fromOffset(size800, size200)
		elseif var6 then
			if p2 < var2.firstVisibleIndex then
				return UDim2.fromOffset(0, 0)
			elseif p2 == var2.firstVisibleIndex then
				return UDim2.fromOffset(size100, size100)
			elseif p2 == var2.firstVisibleIndex + 1 then
				return UDim2.fromOffset(size150, size150)
			elseif var7 then
				return if minValue_1 < p2 then UDim2.fromOffset(0, 0) elseif p2 == minValue_1 then UDim2.fromOffset(size100, size100) elseif p2 == minValue_1 - 1 then UDim2.fromOffset(size150, size150) else UDim2.fromOffset(size200, size200)
			end
		end
	end, {
		p1.numberOfItems, minValue, var2.firstVisibleIndex, var2.currentItemIndex,
		size100, size150, size200, size800
	})
	local var6 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), var4 (ref), var5 (ref), reactModule (copy), var2 (ref), size800 (ref), size200 (ref), getDotAnchorPointAtIndex (copy), getDotPositionAtIndex (copy), muted (ref), emphasis (ref)
		local t = {}
		
		for i = 1, p1.numberOfItems do
			local var7 = var4.current[i]
			local var8 = var5(i)
			t["Indicator" .. i] = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.fromOffset(if i == var2.currentItemIndex then size800 else size200, size200),
				LayoutOrder = i
			}, {
				Dot = reactModule.createElement("Frame", {
					BorderSizePixel = 0,
					AnchorPoint = getDotAnchorPointAtIndex(i, var2.previousItemIndex, var2.currentItemIndex),
					Position = getDotPositionAtIndex(i, var2.previousItemIndex, var2.currentItemIndex),
					Size = var2.animationProgressBinding:map(function(p2)
						-- upvalues: var7 (ref), var8 (ref)
						return if var7 == nil then var8 else var7:Lerp(var8, p2)
					end),
					BackgroundColor3 = muted.Color3,
					BackgroundTransparency = muted.Transparency
				}, {
					UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
					ProgressBar = if i == var2.currentItemIndex and p1.currentItemProgressBinding then reactModule.createElement("Frame", {
						BorderSizePixel = 0,
						Size = p1.currentItemProgressBinding:map(function(p2)
							-- upvalues: size200 (copy), size800 (copy)
							return UDim2.fromOffset(size200 + p2 * (size800 - size200), size200)
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
		p1.numberOfItems, p1.currentItemProgressBinding, var2.previousItemIndex,
		var2.currentItemIndex, var5, size200, size800, muted, emphasis,
		var2.animationProgressBinding
	})
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var4 (ref), var5 (ref)
		for i = 1, p1.numberOfItems do
			var4.current[i] = var5(i)
		end
	end, { p1.numberOfItems, var5 })
	
	return reactModule.createElement("ScrollingFrame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		ScrollingEnabled = false,
		ScrollBarThickness = 0,
		Selectable = false,
		AnchorPoint = p1.AnchorPoint,
		Position = p1.Position,
		Size = UDim2.fromOffset(var3, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		ZIndex = p1.ZIndex,
		ScrollingDirection = Enum.ScrollingDirection.X,
		CanvasSize = UDim2.fromOffset(0, size200),
		AutomaticCanvasSize = Enum.AutomaticSize.X,
		CanvasPosition = var2.canvasPositionBinding
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			Padding = UDim.new(0, small),
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		Items = reactModule.createElement(reactModule.Fragment, {}, var6)
	})
end)