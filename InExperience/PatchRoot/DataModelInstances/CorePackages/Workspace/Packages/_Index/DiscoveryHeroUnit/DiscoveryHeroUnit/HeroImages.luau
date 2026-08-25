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

local function _(p0, p1, p2)
	return if p0 < 0 and p2 and p2 > 0 then math.clamp(p0 / p2, -1, 0) elseif p1 == nil or p1 <= 0 or p1 >= 1 then p0 else math.clamp(p0 / p1, 0, 1)
end

local _ = function(p3, p4)
	if p3 == nil then
		return nil
	end
	local y = p3.AbsoluteWindowSize.Y
	
	return if y <= 0 then nil else p4 / y
end

return reactModule.memo(function(p5)
	-- upvalues: argCheckModule (ref), reactModule (ref), getNormalizedTopPosition (ref), useNormalizedVerticalProgress (ref), fFlagLuaAppHomePageFirstImageLoadObserver (ref), getYPositionOffsetForMotion (ref)
	argCheckModule.assert(p5.foregroundAspectRatio > 0, "HeroImages: foregroundAspectRatio must be > 0")
	local var4 = reactModule.useRef(nil)
	local var5 = reactModule.useRef(nil)
	local var6, var7 = reactModule.useBinding(Vector2.new(0, 0))
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), var7 (ref)
		if var4 and var4.current then
			var7(var4.current.AbsoluteSize)
		end
	end, {})
	local var8 = reactModule.useCallback(function(p6)
		-- upvalues: var5 (ref), getNormalizedTopPosition (copy), p5 (ref), var7 (ref)
		if p6 then
			var5.current = getNormalizedTopPosition(p5.verticalScrollingFrameRef.current, p6)
			var7(p6.AbsoluteSize)
		end
	end, { p5.verticalScrollingFrameRef })
	local var9 = useNormalizedVerticalProgress(p5.verticalScrollingFrameRef, var4)
	local var10, var11 = reactModule.useBinding(Vector2.new(0, 0))
	local var12 = reactModule.useCallback(function(p7, p8, p9, p10, p11)
		-- upvalues: argCheckModule (copy)
		argCheckModule.assert(p10 > 0)
		argCheckModule.assert(p11 > 0)
		local var15 = p7 - p8 + p9 * 2
		
		return Vector2.new(p10 / p11 * var15, var15)
	end, {})
	local var13 = if p5.foregroundAspectRatio == 1 then p5.foregroundOverflow + p5.tokens.Padding.Small else p5.foregroundOverflow - p5.tokens.Padding.Small
	local var14 = p5.backgroundOverflow * 2
	local backgroundOverflow = p5.backgroundOverflow
	
	return reactModule.createElement("Frame", {
		[reactModule.Change.AbsoluteSize] = var8,
		ref = var4,
		BackgroundTransparency = 1,
		Size = p5.Size,
		ZIndex = p5.ZIndex,
		Position = p5.Position,
		AnchorPoint = p5.AnchorPoint,
		LayoutOrder = p5.LayoutOrder,
		ClipsDescendants = true
	}, {
		BackgroundImage = reactModule.createElement("ImageLabel", {
			AnchorPoint = Vector2.new(0.5, 1),
			Size = UDim2.new(1, 0, 1, -p5.foregroundOverflow),
			Position = UDim2.new(0.5, 0, 1, 0),
			BackgroundTransparency = 0,
			BackgroundColor3 = p5.tokens.Color.Surface.Surface_100.Color3,
			ZIndex = 0,
			Image = p5.backgroundImage,
			ScaleType = Enum.ScaleType.Crop,
			[reactModule.Tag] = if fFlagLuaAppHomePageFirstImageLoadObserver then "observed-image data-testid=--hero-unit-background-image" else "data-testid=--hero-unit-background-image",
			ImageRectOffset = if p5.enableBackgroundAnimation then reactModule.joinBindings({
				normalizedPosition = var9,
				imageSize = var10,
				frameSize = var6
			}):map(function(p12)
				-- upvalues: var5 (ref), getNormalizedTopPosition (copy), p5 (ref), var4 (ref), getYPositionOffsetForMotion (copy), var14 (ref), backgroundOverflow (ref), var12 (ref)
				if var5.current == nil then
					var5.current = getNormalizedTopPosition(p5.verticalScrollingFrameRef.current, var4.current)
				end
				local var16
				local current = p5.verticalScrollingFrameRef.current
				local y = p12.frameSize.Y
				
				if current == nil then
					var16 = nil
				else
					local y_1 = current.AbsoluteWindowSize.Y
					var16 = if y_1 <= 0 then nil else y / y_1
				end
				local normalizedPosition = p12.normalizedPosition
				local current_1 = var5.current
				normalizedPosition = getYPositionOffsetForMotion(if normalizedPosition < 0 and var16 and var16 > 0 then math.clamp(normalizedPosition / var16, -1, 0) elseif current_1 == nil or current_1 <= 0 or current_1 >= 1 then normalizedPosition else math.clamp(normalizedPosition / current_1, 0, 1), 0, var14, backgroundOverflow)
				current_1 = p12.imageSize
				
				if current_1.X > 0 and current_1.Y > 0 and (var4 and var4.current) then
					local frameSize = p12.frameSize
					local var17 = var12(frameSize.Y, p5.foregroundOverflow, p5.backgroundOverflow, current_1.X, current_1.Y)
					
					return Vector2.new((1 - frameSize.X / var17.X) * current_1.X * 0.5, normalizedPosition * (current_1.Y / var17.Y))
				end
				return Vector2.new(0, 0)
			end) else nil,
			ImageRectSize = if p5.enableBackgroundAnimation then reactModule.joinBindings({ imageSize = var10, frameSize = var6 }):map(function(p13)
				-- upvalues: var4 (ref), var12 (ref), p5 (ref)
				local imageSize = p13.imageSize
				
				if imageSize.X > 0 and imageSize.Y > 0 and (var4 and var4.current) then
					local frameSize = p13.frameSize
					local var18 = var12(frameSize.Y, p5.foregroundOverflow, p5.backgroundOverflow, imageSize.X, imageSize.Y)
					
					return Vector2.new(frameSize.X / var18.X * imageSize.X, imageSize.Y - p5.backgroundOverflow * 2 / var18.Y * imageSize.Y)
				end
				return Vector2.new(0, 0)
			end) else nil,
			[reactModule.Change.ContentImageSize] = function(p14)
				-- upvalues: var11 (ref)
				if p14 then
					var11(p14.ContentImageSize)
				end
			end
		}, {
			CornerRadius = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, p5.cornerRadius) })
		}),
		ForegroundImage = reactModule.createElement("ImageLabel", {
			AnchorPoint = Vector2.new(0.5, 0),
			Size = UDim2.new(1, -p5.foregroundOverflow, 1 / p5.foregroundAspectRatio, -p5.foregroundOverflow / p5.foregroundAspectRatio),
			SizeConstraint = Enum.SizeConstraint.RelativeYY,
			Position = if p5.enableForegroundAnimation then reactModule.joinBindings({ normalizedPosition = var9, frameSize = var6 }):map(function(p15)
				-- upvalues: var5 (ref), getNormalizedTopPosition (copy), p5 (ref), var4 (ref), getYPositionOffsetForMotion (copy), var13 (ref)
				if var5.current == nil then
					var5.current = getNormalizedTopPosition(p5.verticalScrollingFrameRef.current, var4.current)
				end
				local var19
				local current = p5.verticalScrollingFrameRef.current
				local y = p15.frameSize.Y
				
				if current == nil then
					var19 = nil
				else
					local y_1 = current.AbsoluteWindowSize.Y
					var19 = if y_1 <= 0 then nil else y / y_1
				end
				local normalizedPosition = p15.normalizedPosition
				local current_1 = var5.current
				local var20 = if normalizedPosition < 0 and var19 and var19 > 0 then math.clamp(normalizedPosition / var19, -1, 0) elseif current_1 == nil or current_1 <= 0 or current_1 >= 1 then normalizedPosition else math.clamp(normalizedPosition / current_1, 0, 1)
				normalizedPosition = p15.frameSize.Y
				local var21 = -((normalizedPosition - p5.foregroundOverflow) / p5.foregroundAspectRatio - normalizedPosition)
				
				if p5.foregroundAspectRatio == 1 then
					var21 -= p5.tokens.Size.Size_1500
				end
				return UDim2.new(0.5, 0, 0, getYPositionOffsetForMotion(var20, var21, var13, 0))
			end) else UDim2.new(0.5, 0, 0, 0),
			Image = p5.foregroundImage,
			ZIndex = 1,
			BackgroundTransparency = 1,
			[reactModule.Tag] = if fFlagLuaAppHomePageFirstImageLoadObserver then "observed-image data-testid=--hero-unit-foreground-image" else "data-testid=--hero-unit-foreground-image"
		}),
		HeroGradientFrame = p5.gradient and reactModule.createElement("Frame", {
			ZIndex = 2,
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.new(0, 0, 1, 1),
			Size = UDim2.new(p5.gradientWidthPercent, 0, p5.gradientHeightPercent, -p5.foregroundOverflow * (if p5.gradientHeightPercent and p5.gradientHeightPercent > 0 then p5.gradientHeightPercent else 1) + (if p5.gradientHeightPercent >= 0.9 then 1 else 0)),
			BackgroundColor3 = Color3.new(1, 1, 1)
		}, {
			HeroGradient = reactModule.createElement("UIGradient", {
				Rotation = p5.gradient.degree,
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, p5.gradient.startOpacity),
					NumberSequenceKeypoint.new(1, p5.gradient.endOpacity)
				}),
				Color = ColorSequence.new({
					ColorSequenceKeypoint.new(0, p5.gradient.startColor),
					ColorSequenceKeypoint.new(1, p5.gradient.endColor)
				})
			}),
			CornerRadius = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, p5.cornerRadius) })
		}) or nil
	})
end)