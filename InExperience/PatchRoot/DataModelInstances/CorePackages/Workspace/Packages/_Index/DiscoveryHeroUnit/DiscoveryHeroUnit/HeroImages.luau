local discoveryHeroUnit = script:FindFirstAncestor("DiscoveryHeroUnit")
local parent = discoveryHeroUnit.Parent
local reactModule = require(parent.React)
local _ = require(parent.Foundation)
local argCheckModule = require(parent.ArgCheck)
local fFlagLuaAppHeroUnitParallaxUpdates = require(parent.SharedFlags).FFlagLuaAppHeroUnitParallaxUpdates
local fFlagLuaAppHomePageFirstImageLoadObserver = require(parent.SharedFlags).FFlagLuaAppHomePageFirstImageLoadObserver
local parallaxUtilsModule = require(discoveryHeroUnit.ParallaxUtils)
local useNormalizedVerticalProgress = parallaxUtilsModule.useNormalizedVerticalProgress
local getYPositionOffsetForMotion = parallaxUtilsModule.getYPositionOffsetForMotion
local getNormalizedCenterPosition = parallaxUtilsModule.getNormalizedCenterPosition
local var4 = if fFlagLuaAppHeroUnitParallaxUpdates then parallaxUtilsModule.getNormalizedTopPosition else nil
local _ = require(discoveryHeroUnit.HeroUnitTypes)

local function _(p0, p1, p2) --[[ line: 75 | named "calculateModifiedNormalizedPosition" ]]
	-- upvalues: fFlagLuaAppHeroUnitParallaxUpdates (ref)
	return if fFlagLuaAppHeroUnitParallaxUpdates and p0 < 0 and (p2 and p2 > 0) then math.clamp(p0 / p2, -1, 0) elseif p1 == nil or p1 <= 0 or p1 >= 1 then p0 else math.clamp(p0 / p1, 0, 1)
end

local _ = function(p3, p4) --[[ line: 93 | named "computeNormalizedHeroUnitHeight" ]]
	if p3 == nil then
		return nil
	end
	local y = p3.AbsoluteWindowSize.Y
	
	return if y <= 0 then nil else p4 / y
end

return reactModule.memo(function(p5) --[[ line: 105 | named "HeroImages" ]]
	-- upvalues: argCheckModule (ref), reactModule (ref), fFlagLuaAppHeroUnitParallaxUpdates (ref), var4 (ref), getNormalizedCenterPosition (ref), useNormalizedVerticalProgress (ref), fFlagLuaAppHomePageFirstImageLoadObserver (ref), getYPositionOffsetForMotion (ref)
	argCheckModule.assert(p5.foregroundAspectRatio > 0, "HeroImages: foregroundAspectRatio must be > 0")
	local var5 = reactModule.useRef(nil)
	local var6 = reactModule.useRef(nil)
	local var7, var8 = reactModule.useBinding(Vector2.new(0, 0))
	reactModule.useEffect(function() --[[ line: 113 ]]
		-- upvalues: var5 (ref), var8 (ref)
		if var5 and var5.current then
			var8(var5.current.AbsoluteSize)
		end
	end, {})
	local var9 = reactModule.useCallback(function(p6) --[[ line: 119 ]]
		-- upvalues: var6 (ref), fFlagLuaAppHeroUnitParallaxUpdates (copy), var4 (copy), p5 (ref), getNormalizedCenterPosition (copy), var8 (ref)
		if p6 then
			var6.current = if fFlagLuaAppHeroUnitParallaxUpdates then var4(p5.verticalScrollingFrameRef.current, p6) else getNormalizedCenterPosition(p5.verticalScrollingFrameRef.current, p6)
			var8(p6.AbsoluteSize)
		end
	end, { p5.verticalScrollingFrameRef })
	local var10 = useNormalizedVerticalProgress(p5.verticalScrollingFrameRef, var5)
	local var11, var12 = reactModule.useBinding(Vector2.new(0, 0))
	local var13 = reactModule.useCallback(function(p7, p8, p9, p10, p11) --[[ line: 132 ]]
		-- upvalues: argCheckModule (copy)
		argCheckModule.assert(p10 > 0)
		argCheckModule.assert(p11 > 0)
		local var21 = p7 - p8 + p9 * 2
		
		return Vector2.new(p10 / p11 * var21, var21)
	end, {})
	local var14 = p5.foregroundOverflow * 2
	local var15 = p5.backgroundOverflow * 2
	local var16 = 0
	local var17 = 0
	local var18 = 0
	local var19 = 0
	local var20 = 0
	
	if fFlagLuaAppHeroUnitParallaxUpdates then
		var16 = if p5.foregroundAspectRatio == 1 then p5.foregroundOverflow + p5.tokens.Padding.Small else p5.foregroundOverflow - p5.tokens.Padding.Small
		var17 = 0
		var18 = 0
		var19 = p5.backgroundOverflow * 2
		var20 = p5.backgroundOverflow
	end
	return reactModule.createElement("Frame", {
		[reactModule.Change.AbsoluteSize] = var9,
		ref = var5,
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
				normalizedPosition = var10,
				imageSize = var11,
				frameSize = var7
			}):map(function(p12) --[[ line: 212 ]]
				-- upvalues: var6 (ref), fFlagLuaAppHeroUnitParallaxUpdates (copy), var4 (copy), p5 (ref), var5 (ref), getNormalizedCenterPosition (copy), getYPositionOffsetForMotion (copy), var18 (write), var15 (ref), var19 (write), var20 (write), var13 (ref)
				if var6.current == nil then
					var6.current = if fFlagLuaAppHeroUnitParallaxUpdates then var4(p5.verticalScrollingFrameRef.current, var5.current) else getNormalizedCenterPosition(p5.verticalScrollingFrameRef.current, var5.current)
				end
				local var22 = nil
				
				if fFlagLuaAppHeroUnitParallaxUpdates then
					local current = p5.verticalScrollingFrameRef.current
					local y = p12.frameSize.Y
					
					if current == nil then
						var22 = nil
					else
						local y_1 = current.AbsoluteWindowSize.Y
						var22 = if y_1 <= 0 then nil else y / y_1
					end
				end
				local normalizedPosition = p12.normalizedPosition
				local current = var6.current
				local var23 = if fFlagLuaAppHeroUnitParallaxUpdates then var22 else nil
				normalizedPosition = getYPositionOffsetForMotion(if fFlagLuaAppHeroUnitParallaxUpdates and normalizedPosition < 0 and (var23 and var23 > 0) then math.clamp(normalizedPosition / var23, -1, 0) elseif current == nil or current <= 0 or current >= 1 then normalizedPosition else math.clamp(normalizedPosition / current, 0, 1), if fFlagLuaAppHeroUnitParallaxUpdates then var18 else var15, if fFlagLuaAppHeroUnitParallaxUpdates then var19 else 0, if fFlagLuaAppHeroUnitParallaxUpdates then var20 else nil)
				current = p12.imageSize
				
				if current.X > 0 and current.Y > 0 and (var5 and var5.current) then
					var23 = p12.frameSize
					local var24 = var13(var23.Y, p5.foregroundOverflow, p5.backgroundOverflow, current.X, current.Y)
					
					return Vector2.new((1 - var23.X / var24.X) * current.X * 0.5, if fFlagLuaAppHeroUnitParallaxUpdates then normalizedPosition * (current.Y / var24.Y) else (var15 - normalizedPosition) * (current.Y / var24.Y))
				end
				return Vector2.new(0, 0)
			end) else nil,
			ImageRectSize = if p5.enableBackgroundAnimation then reactModule.joinBindings({ imageSize = var11, frameSize = var7 }):map(function(p13) --[[ line: 267 ]]
				-- upvalues: var5 (ref), var13 (ref), p5 (ref)
				local imageSize = p13.imageSize
				
				if imageSize.X > 0 and imageSize.Y > 0 and (var5 and var5.current) then
					local frameSize = p13.frameSize
					local var25 = var13(frameSize.Y, p5.foregroundOverflow, p5.backgroundOverflow, imageSize.X, imageSize.Y)
					
					return Vector2.new(frameSize.X / var25.X * imageSize.X, imageSize.Y - p5.backgroundOverflow * 2 / var25.Y * imageSize.Y)
				end
				return Vector2.new(0, 0)
			end) else nil,
			[reactModule.Change.ContentImageSize] = function(p14) --[[ line: 296 ]]
				-- upvalues: var12 (ref)
				if p14 then
					var12(p14.ContentImageSize)
				end
			end
		}, {
			CornerRadius = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, p5.cornerRadius) })
		}),
		ForegroundImage = if fFlagLuaAppHeroUnitParallaxUpdates then reactModule.createElement("ImageLabel", {
			AnchorPoint = Vector2.new(0.5, 0),
			Size = UDim2.new(1, -p5.foregroundOverflow, 1 / p5.foregroundAspectRatio, -p5.foregroundOverflow / p5.foregroundAspectRatio),
			SizeConstraint = Enum.SizeConstraint.RelativeYY,
			Position = if p5.enableForegroundAnimation then reactModule.joinBindings({ normalizedPosition = var10, frameSize = var7 }):map(function(p17) --[[ line: 322 ]]
				-- upvalues: var6 (ref), var4 (copy), p5 (ref), var5 (ref), fFlagLuaAppHeroUnitParallaxUpdates (copy), getYPositionOffsetForMotion (copy), var16 (write), var17 (write)
				if var6.current == nil then
					var6.current = var4(p5.verticalScrollingFrameRef.current, var5.current)
				end
				local var30
				local current = p5.verticalScrollingFrameRef.current
				local y = p17.frameSize.Y
				
				if current == nil then
					var30 = nil
				else
					local y_1 = current.AbsoluteWindowSize.Y
					var30 = if y_1 <= 0 then nil else y / y_1
				end
				local normalizedPosition = p17.normalizedPosition
				local current_1 = var6.current
				local var31 = if fFlagLuaAppHeroUnitParallaxUpdates and normalizedPosition < 0 and (var30 and var30 > 0) then math.clamp(normalizedPosition / var30, -1, 0) elseif current_1 == nil or current_1 <= 0 or current_1 >= 1 then normalizedPosition else math.clamp(normalizedPosition / current_1, 0, 1)
				normalizedPosition = p17.frameSize.Y
				local var32 = -((normalizedPosition - p5.foregroundOverflow) / p5.foregroundAspectRatio - normalizedPosition)
				
				if p5.foregroundAspectRatio == 1 then
					var32 -= p5.tokens.Size.Size_1500
				end
				return UDim2.new(0.5, 0, 0, getYPositionOffsetForMotion(var31, var32, var16, var17))
			end) else UDim2.new(0.5, 0, 0, 0),
			Image = p5.foregroundImage,
			ZIndex = 1,
			BackgroundTransparency = 1,
			[reactModule.Tag] = if fFlagLuaAppHomePageFirstImageLoadObserver then "observed-image data-testid=--hero-unit-foreground-image" else "data-testid=--hero-unit-foreground-image"
		}) else reactModule.createElement("ImageLabel", {
			AnchorPoint = Vector2.new(0.5, 0),
			Size = p5.foregroundHeightPercent:map(function(p15) --[[ line: 370 ]]
				-- upvalues: p5 (ref)
				return UDim2.new(1, 0, p15, -p5.foregroundOverflow * p15)
			end),
			SizeConstraint = Enum.SizeConstraint.RelativeYY,
			Position = if p5.enableForegroundAnimation then var10:map(function(p16) --[[ line: 381 ]]
				-- upvalues: var6 (ref), getNormalizedCenterPosition (copy), p5 (ref), var5 (ref), fFlagLuaAppHeroUnitParallaxUpdates (copy), getYPositionOffsetForMotion (copy), var14 (ref)
				if var6.current == nil then
					var6.current = getNormalizedCenterPosition(p5.verticalScrollingFrameRef.current, var5.current)
				end
				local current = var6.current
				
				if fFlagLuaAppHeroUnitParallaxUpdates then
					local var26 = if current == nil or current <= 0 or current >= 1 then p16 else math.clamp(p16 / current, 0, 1)
					return UDim2.new(0.5, 0, 0, getYPositionOffsetForMotion(var26, 0, var14, nil))
				end
			end) else UDim2.new(0.5, 0, 0, 0),
			Image = p5.foregroundImage,
			ZIndex = 1,
			BackgroundTransparency = 1,
			[reactModule.Tag] = if fFlagLuaAppHomePageFirstImageLoadObserver then "observed-image data-testid=--hero-unit-foreground-image" else "data-testid=--hero-unit-foreground-image"
		}, {
			UIAspectRatioConstraint = reactModule.createElement("UIAspectRatioConstraint", {
				AspectRatio = p5.foregroundAspectRatio,
				AspectType = Enum.AspectType.ScaleWithParentSize,
				DominantAxis = Enum.DominantAxis.Height
			})
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