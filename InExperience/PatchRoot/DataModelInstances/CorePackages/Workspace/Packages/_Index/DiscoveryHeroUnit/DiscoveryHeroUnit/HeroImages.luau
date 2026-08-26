local discoveryHeroUnit = script:FindFirstAncestor("DiscoveryHeroUnit")
local parent = discoveryHeroUnit.Parent
local reactModule = require(parent.React)
local _ = require(parent.Foundation)
local argCheckModule = require(parent.ArgCheck)
local fFlagLuaAppHomePageFirstImageLoadObserver = require(parent.SharedFlags).FFlagLuaAppHomePageFirstImageLoadObserver
local parallaxUtilsModule = require(discoveryHeroUnit.ParallaxUtils)
local useNormalizedVerticalProgress = parallaxUtilsModule.useNormalizedVerticalProgress
local getYPositionOffsetForMotion = parallaxUtilsModule.getYPositionOffsetForMotion
local getNormalizedTopPosition = parallaxUtilsModule.getNormalizedTopPosition
local _ = require(discoveryHeroUnit.HeroUnitTypes)

local function _(p1, p2, p3)
	return if p1 < 0 and p3 and p3 > 0 then math.clamp(p1 / p3, -1, 0) elseif p2 == nil or p2 <= 0 or p2 >= 1 then p1 else math.clamp(p1 / p2, 0, 1)
end

local _ = function(p1, p2)
	if p1 == nil then
		return nil
	end
	local y = p1.AbsoluteWindowSize.Y
	
	return if y <= 0 then nil else p2 / y
end

return reactModule.memo(function(p1)
	-- upvalues: argCheckModule (ref), reactModule (ref), getNormalizedTopPosition (ref), useNormalizedVerticalProgress (ref), fFlagLuaAppHomePageFirstImageLoadObserver (ref), getYPositionOffsetForMotion (ref)
	argCheckModule.assert(p1.foregroundAspectRatio > 0, "HeroImages: foregroundAspectRatio must be > 0")
	local var1 = reactModule.useRef(nil)
	local var2 = reactModule.useRef(nil)
	local var3, var4 = reactModule.useBinding(Vector2.new(0, 0))
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var4 (ref)
		if var1 and var1.current then
			var4(var1.current.AbsoluteSize)
		end
	end, {})
	local var5 = reactModule.useCallback(function(p2)
		-- upvalues: var2 (ref), getNormalizedTopPosition (copy), p1 (ref), var4 (ref)
		if p2 then
			var2.current = getNormalizedTopPosition(p1.verticalScrollingFrameRef.current, p2)
			var4(p2.AbsoluteSize)
		end
	end, { p1.verticalScrollingFrameRef })
	local var6 = useNormalizedVerticalProgress(p1.verticalScrollingFrameRef, var1)
	local var7, var8 = reactModule.useBinding(Vector2.new(0, 0))
	local var9 = reactModule.useCallback(function(p2, p3, p4, p5, p6)
		-- upvalues: argCheckModule (copy)
		argCheckModule.assert(p5 > 0)
		argCheckModule.assert(p6 > 0)
		local var10 = p2 - p3 + p4 * 2
		
		return Vector2.new(p5 / p6 * var10, var10)
	end, {})
	local var10 = if p1.foregroundAspectRatio == 1 then p1.foregroundOverflow + p1.tokens.Padding.Small else p1.foregroundOverflow - p1.tokens.Padding.Small
	local var11 = p1.backgroundOverflow * 2
	local backgroundOverflow = p1.backgroundOverflow
	
	return reactModule.createElement("Frame", {
		[reactModule.Change.AbsoluteSize] = var5,
		ref = var1,
		BackgroundTransparency = 1,
		Size = p1.Size,
		ZIndex = p1.ZIndex,
		Position = p1.Position,
		AnchorPoint = p1.AnchorPoint,
		LayoutOrder = p1.LayoutOrder,
		ClipsDescendants = true
	}, {
		BackgroundImage = reactModule.createElement("ImageLabel", {
			AnchorPoint = Vector2.new(0.5, 1),
			Size = UDim2.new(1, 0, 1, -p1.foregroundOverflow),
			Position = UDim2.new(0.5, 0, 1, 0),
			BackgroundTransparency = 0,
			BackgroundColor3 = p1.tokens.Color.Surface.Surface_100.Color3,
			ZIndex = 0,
			Image = p1.backgroundImage,
			ScaleType = Enum.ScaleType.Crop,
			[reactModule.Tag] = if fFlagLuaAppHomePageFirstImageLoadObserver then "observed-image data-testid=--hero-unit-background-image" else "data-testid=--hero-unit-background-image",
			ImageRectOffset = if p1.enableBackgroundAnimation then reactModule.joinBindings({
				normalizedPosition = var6,
				imageSize = var7,
				frameSize = var3
			}):map(function(p2)
				-- upvalues: var2 (ref), getNormalizedTopPosition (copy), p1 (ref), var1 (ref), getYPositionOffsetForMotion (copy), var11 (ref), backgroundOverflow (ref), var9 (ref)
				if var2.current == nil then
					var2.current = getNormalizedTopPosition(p1.verticalScrollingFrameRef.current, var1.current)
				end
				local var12
				local current = p1.verticalScrollingFrameRef.current
				local y = p2.frameSize.Y
				
				if current == nil then
					var12 = nil
				else
					local y_1 = current.AbsoluteWindowSize.Y
					var12 = if y_1 <= 0 then nil else y / y_1
				end
				local normalizedPosition = p2.normalizedPosition
				local current_1 = var2.current
				normalizedPosition = getYPositionOffsetForMotion(if normalizedPosition < 0 and var12 and var12 > 0 then math.clamp(normalizedPosition / var12, -1, 0) elseif current_1 == nil or current_1 <= 0 or current_1 >= 1 then normalizedPosition else math.clamp(normalizedPosition / current_1, 0, 1), 0, var11, backgroundOverflow)
				current_1 = p2.imageSize
				
				if current_1.X > 0 and current_1.Y > 0 and (var1 and var1.current) then
					local frameSize = p2.frameSize
					local var13 = var9(frameSize.Y, p1.foregroundOverflow, p1.backgroundOverflow, current_1.X, current_1.Y)
					
					return Vector2.new((1 - frameSize.X / var13.X) * current_1.X * 0.5, normalizedPosition * (current_1.Y / var13.Y))
				end
				return Vector2.new(0, 0)
			end) else nil,
			ImageRectSize = if p1.enableBackgroundAnimation then reactModule.joinBindings({ imageSize = var7, frameSize = var3 }):map(function(p2)
				-- upvalues: var1 (ref), var9 (ref), p1 (ref)
				local imageSize = p2.imageSize
				
				if imageSize.X > 0 and imageSize.Y > 0 and (var1 and var1.current) then
					local frameSize = p2.frameSize
					local var12 = var9(frameSize.Y, p1.foregroundOverflow, p1.backgroundOverflow, imageSize.X, imageSize.Y)
					
					return Vector2.new(frameSize.X / var12.X * imageSize.X, imageSize.Y - p1.backgroundOverflow * 2 / var12.Y * imageSize.Y)
				end
				return Vector2.new(0, 0)
			end) else nil,
			[reactModule.Change.ContentImageSize] = function(p2)
				-- upvalues: var8 (ref)
				if p2 then
					var8(p2.ContentImageSize)
				end
			end
		}, {
			CornerRadius = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, p1.cornerRadius) })
		}),
		ForegroundImage = reactModule.createElement("ImageLabel", {
			AnchorPoint = Vector2.new(0.5, 0),
			Size = UDim2.new(1, -p1.foregroundOverflow, 1 / p1.foregroundAspectRatio, -p1.foregroundOverflow / p1.foregroundAspectRatio),
			SizeConstraint = Enum.SizeConstraint.RelativeYY,
			Position = if p1.enableForegroundAnimation then reactModule.joinBindings({ normalizedPosition = var6, frameSize = var3 }):map(function(p2)
				-- upvalues: var2 (ref), getNormalizedTopPosition (copy), p1 (ref), var1 (ref), getYPositionOffsetForMotion (copy), var10 (ref)
				if var2.current == nil then
					var2.current = getNormalizedTopPosition(p1.verticalScrollingFrameRef.current, var1.current)
				end
				local var12
				local current = p1.verticalScrollingFrameRef.current
				local y = p2.frameSize.Y
				
				if current == nil then
					var12 = nil
				else
					local y_1 = current.AbsoluteWindowSize.Y
					var12 = if y_1 <= 0 then nil else y / y_1
				end
				local normalizedPosition = p2.normalizedPosition
				local current_1 = var2.current
				local var13 = if normalizedPosition < 0 and var12 and var12 > 0 then math.clamp(normalizedPosition / var12, -1, 0) elseif current_1 == nil or current_1 <= 0 or current_1 >= 1 then normalizedPosition else math.clamp(normalizedPosition / current_1, 0, 1)
				normalizedPosition = p2.frameSize.Y
				local var14 = -((normalizedPosition - p1.foregroundOverflow) / p1.foregroundAspectRatio - normalizedPosition)
				
				if p1.foregroundAspectRatio == 1 then
					var14 -= p1.tokens.Size.Size_1500
				end
				return UDim2.new(0.5, 0, 0, getYPositionOffsetForMotion(var13, var14, var10, 0))
			end) else UDim2.new(0.5, 0, 0, 0),
			Image = p1.foregroundImage,
			ZIndex = 1,
			BackgroundTransparency = 1,
			[reactModule.Tag] = if fFlagLuaAppHomePageFirstImageLoadObserver then "observed-image data-testid=--hero-unit-foreground-image" else "data-testid=--hero-unit-foreground-image"
		}),
		HeroGradientFrame = p1.gradient and reactModule.createElement("Frame", {
			ZIndex = 2,
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.new(0, 0, 1, 1),
			Size = UDim2.new(p1.gradientWidthPercent, 0, p1.gradientHeightPercent, -p1.foregroundOverflow * (if p1.gradientHeightPercent and p1.gradientHeightPercent > 0 then p1.gradientHeightPercent else 1) + (if p1.gradientHeightPercent >= 0.9 then 1 else 0)),
			BackgroundColor3 = Color3.new(1, 1, 1)
		}, {
			HeroGradient = reactModule.createElement("UIGradient", {
				Rotation = p1.gradient.degree,
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, p1.gradient.startOpacity),
					NumberSequenceKeypoint.new(1, p1.gradient.endOpacity)
				}),
				Color = ColorSequence.new({
					ColorSequenceKeypoint.new(0, p1.gradient.startColor),
					ColorSequenceKeypoint.new(1, p1.gradient.endColor)
				})
			}),
			CornerRadius = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, p1.cornerRadius) })
		}) or nil
	})
end)