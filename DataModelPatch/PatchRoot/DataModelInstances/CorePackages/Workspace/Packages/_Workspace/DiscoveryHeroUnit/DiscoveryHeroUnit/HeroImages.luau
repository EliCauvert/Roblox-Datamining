local DiscoveryHeroUnit = script:FindFirstAncestor("DiscoveryHeroUnit")
local Parent = DiscoveryHeroUnit.Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.Foundation)
local ArgCheckModule = require(Parent.ArgCheck)
local FFlagLuaAppHeroUnitParallaxUpdates = require(Parent.SharedFlags).FFlagLuaAppHeroUnitParallaxUpdates
local FFlagLuaAppHomePageFirstImageLoadObserver = require(Parent.SharedFlags).FFlagLuaAppHomePageFirstImageLoadObserver
local ParallaxUtilsModule = require(DiscoveryHeroUnit.ParallaxUtils)
local UseNormalizedVerticalProgressFunction = ParallaxUtilsModule.useNormalizedVerticalProgress
local GetYPositionOffsetForMotionFunction = ParallaxUtilsModule.getYPositionOffsetForMotion
local GetNormalizedCenterPositionFunction = ParallaxUtilsModule.getNormalizedCenterPosition
local GetNormalizedTopPosition = if FFlagLuaAppHeroUnitParallaxUpdates then ParallaxUtilsModule.getNormalizedTopPosition else nil
local _ = require(DiscoveryHeroUnit.HeroUnitTypes)

local function _(p1: number, p2: number, p3: number): number
	-- upvalues: FFlagLuaAppHeroUnitParallaxUpdates (copy)
	return if FFlagLuaAppHeroUnitParallaxUpdates and p1 < 0 and p3 and p3 > 0 then math.clamp(p1 / p3, -1, 0) elseif p2 == nil or p2 <= 0 or p2 >= 1 then p1 else math.clamp(p1 / p2, 0, 1)
end

local _ = function(p1, p2)
	if p1 == nil then
		return nil
	else
		local Y: number = p1.AbsoluteWindowSize.Y
		
		return if Y <= 0 then nil else p2 / Y
	end
end

return ReactModule.memo(function(Frame: Frame)
	-- upvalues: ArgCheckModule (copy), ReactModule (copy), FFlagLuaAppHeroUnitParallaxUpdates (copy), GetNormalizedTopPosition (copy), GetNormalizedCenterPositionFunction (copy), UseNormalizedVerticalProgressFunction (copy), FFlagLuaAppHomePageFirstImageLoadObserver (copy), GetYPositionOffsetForMotionFunction (copy)
	ArgCheckModule.assert(Frame.foregroundAspectRatio > 0, "HeroImages: foregroundAspectRatio must be > 0")
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(Vector2.new(0, 0))
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), UseBindingResult2 (copy)
		if UseRefResult and UseRefResult.current then
			UseBindingResult2(UseRefResult.current.AbsoluteSize)
		end
	end, {})
	local UseResult = ReactModule.useCallback(function(Frame1)
		-- upvalues: UseRefResult1 (copy), FFlagLuaAppHeroUnitParallaxUpdates (upval), GetNormalizedTopPosition (upval), Frame (copy), GetNormalizedCenterPositionFunction (upval), UseBindingResult2 (copy)
		if Frame1 then
			UseRefResult1.current = if FFlagLuaAppHeroUnitParallaxUpdates then GetNormalizedTopPosition(Frame.verticalScrollingFrameRef.current, Frame1) else GetNormalizedCenterPositionFunction(Frame.verticalScrollingFrameRef.current, Frame1)
			UseBindingResult2(Frame1.AbsoluteSize)
		end
	end, { Frame.verticalScrollingFrameRef })
	local UseNormalizedVerticalProgressResult = UseNormalizedVerticalProgressFunction(Frame.verticalScrollingFrameRef, UseRefResult)
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(Vector2.new(0, 0))
	local UseResult1 = ReactModule.useCallback(function(p1, p2, p3: number, p4: number, p5: number): Vector2
		-- upvalues: ArgCheckModule (upval)
		ArgCheckModule.assert(p4 > 0)
		ArgCheckModule.assert(p5 > 0)
		local Y = p1 - p2 + p3 * 2
		
		return Vector2.new(p4 / p5 * Y, Y)
	end, {})
	local ScaledForegroundOverflow = Frame.foregroundOverflow * 2
	local ScaledBackgroundOverflow = Frame.backgroundOverflow * 2
	local NewForegroundOverflow = 0
	local v1 = 0
	local v2 = 0
	local ScaledBackgroundOverflow1 = 0
	local BackgroundOverflow = 0
	
	if FFlagLuaAppHeroUnitParallaxUpdates then
		NewForegroundOverflow = if Frame.foregroundAspectRatio == 1 then Frame.foregroundOverflow + Frame.tokens.Padding.Small else Frame.foregroundOverflow - Frame.tokens.Padding.Small
		v1 = 0
		v2 = 0
		ScaledBackgroundOverflow1 = Frame.backgroundOverflow * 2
		BackgroundOverflow = Frame.backgroundOverflow
	end
	local YOffset = -Frame.foregroundOverflow * (if Frame.gradientHeightPercent and Frame.gradientHeightPercent > 0 then Frame.gradientHeightPercent else 1) + (if Frame.gradientHeightPercent >= 0.9 then 1 else 0)
	
	return ReactModule.createElement("Frame", {
		[ReactModule.Change.AbsoluteSize] = UseResult,
		ref = UseRefResult,
		BackgroundTransparency = 1,
		Size = Frame.Size,
		ZIndex = Frame.ZIndex,
		Position = Frame.Position,
		AnchorPoint = Frame.AnchorPoint,
		LayoutOrder = Frame.LayoutOrder,
		ClipsDescendants = true
	}, {
		BackgroundImage = ReactModule.createElement("ImageLabel", {
			AnchorPoint = Vector2.new(0.5, 1),
			Size = UDim2.new(1, 0, 1, -Frame.foregroundOverflow),
			Position = UDim2.new(0.5, 0, 1, 0),
			BackgroundTransparency = 0,
			BackgroundColor3 = Frame.tokens.Color.Surface.Surface_100.Color3,
			ZIndex = 0,
			Image = Frame.backgroundImage,
			ScaleType = Enum.ScaleType.Crop,
			[ReactModule.Tag] = if FFlagLuaAppHomePageFirstImageLoadObserver then "observed-image data-testid=--hero-unit-background-image" else "data-testid=--hero-unit-background-image",
			ImageRectOffset = if Frame.enableBackgroundAnimation then ReactModule.joinBindings({
				normalizedPosition = UseNormalizedVerticalProgressResult,
				imageSize = UseBindingResult1,
				frameSize = UseBindingResult
			}):map(function(p1): Vector2
				-- upvalues: UseRefResult1 (copy), FFlagLuaAppHeroUnitParallaxUpdates (upval), GetNormalizedTopPosition (upval), Frame (copy), UseRefResult (copy), GetNormalizedCenterPositionFunction (upval), GetYPositionOffsetForMotionFunction (upval), v2 (ref), ScaledBackgroundOverflow (copy), ScaledBackgroundOverflow1 (ref), BackgroundOverflow (ref), UseResult1 (copy)
				if UseRefResult1.current == nil then
					UseRefResult1.current = if FFlagLuaAppHeroUnitParallaxUpdates then GetNormalizedTopPosition(Frame.verticalScrollingFrameRef.current, UseRefResult.current) else GetNormalizedCenterPositionFunction(Frame.verticalScrollingFrameRef.current, UseRefResult.current)
				end
				local v3 = nil
				
				if FFlagLuaAppHeroUnitParallaxUpdates then
					local Current = Frame.verticalScrollingFrameRef.current
					local Y = p1.frameSize.Y
					
					if Current == nil then
						v3 = nil
					else
						local Y1: number = Current.AbsoluteWindowSize.Y
						v3 = if Y1 <= 0 then nil else Y / Y1
					end
				end
				local NormalizedPosition: number = p1.normalizedPosition
				local Current1: number = UseRefResult1.current
				local v4 = if FFlagLuaAppHeroUnitParallaxUpdates then v3 else nil
				local YPositionOffsetForMotion = GetYPositionOffsetForMotionFunction(if FFlagLuaAppHeroUnitParallaxUpdates and NormalizedPosition < 0 and v4 and v4 > 0 then math.clamp(NormalizedPosition / v4, -1, 0) elseif Current1 == nil or Current1 <= 0 or Current1 >= 1 then NormalizedPosition else math.clamp(NormalizedPosition / Current1, 0, 1), if FFlagLuaAppHeroUnitParallaxUpdates then v2 else ScaledBackgroundOverflow, if FFlagLuaAppHeroUnitParallaxUpdates then ScaledBackgroundOverflow1 else 0, if FFlagLuaAppHeroUnitParallaxUpdates then BackgroundOverflow else nil)
				local ImageSize = p1.imageSize
				
				if ImageSize.X > 0 and ImageSize.Y > 0 and UseRefResult and UseRefResult.current then
					local FrameSize = p1.frameSize
					local UseResultResult = UseResult1(FrameSize.Y, Frame.foregroundOverflow, Frame.backgroundOverflow, ImageSize.X, ImageSize.Y)
					
					return Vector2.new((1 - FrameSize.X / UseResultResult.X) * ImageSize.X * 0.5, if FFlagLuaAppHeroUnitParallaxUpdates then YPositionOffsetForMotion * (ImageSize.Y / UseResultResult.Y) else (ScaledBackgroundOverflow - YPositionOffsetForMotion) * (ImageSize.Y / UseResultResult.Y))
				else
					return Vector2.new(0, 0)
				end
			end) else nil,
			ImageRectSize = if Frame.enableBackgroundAnimation then ReactModule.joinBindings({
				imageSize = UseBindingResult1,
				frameSize = UseBindingResult
			}):map(function(p1): Vector2
				-- upvalues: UseRefResult (copy), UseResult1 (copy), Frame (copy)
				local ImageSize = p1.imageSize
				
				if ImageSize.X > 0 and ImageSize.Y > 0 and UseRefResult and UseRefResult.current then
					local FrameSize = p1.frameSize
					local UseResultResult = UseResult1(FrameSize.Y, Frame.foregroundOverflow, Frame.backgroundOverflow, ImageSize.X, ImageSize.Y)
					
					return Vector2.new(FrameSize.X / UseResultResult.X * ImageSize.X, ImageSize.Y - Frame.backgroundOverflow * 2 / UseResultResult.Y * ImageSize.Y)
				else
					return Vector2.new(0, 0)
				end
			end) else nil,
			[ReactModule.Change.ContentImageSize] = function(p1)
				-- upvalues: UseBindingResult2_1 (copy)
				if p1 then
					UseBindingResult2_1(p1.ContentImageSize)
				end
			end
		}, {
			CornerRadius = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, Frame.cornerRadius) })
		}),
		ForegroundImage = if FFlagLuaAppHeroUnitParallaxUpdates then ReactModule.createElement("ImageLabel", {
			AnchorPoint = Vector2.new(0.5, 0),
			Size = UDim2.new(1, -Frame.foregroundOverflow, 1 / Frame.foregroundAspectRatio, -Frame.foregroundOverflow / Frame.foregroundAspectRatio),
			SizeConstraint = Enum.SizeConstraint.RelativeYY,
			Position = if Frame.enableForegroundAnimation then ReactModule.joinBindings({
				normalizedPosition = UseNormalizedVerticalProgressResult,
				frameSize = UseBindingResult
			}):map(function(p1): UDim2
				-- upvalues: UseRefResult1 (copy), GetNormalizedTopPosition (upval), Frame (copy), UseRefResult (copy), FFlagLuaAppHeroUnitParallaxUpdates (upval), GetYPositionOffsetForMotionFunction (upval), NewForegroundOverflow (ref), v1 (ref)
				if UseRefResult1.current == nil then
					UseRefResult1.current = GetNormalizedTopPosition(Frame.verticalScrollingFrameRef.current, UseRefResult.current)
				end
				local Current = Frame.verticalScrollingFrameRef.current
				local Y = p1.frameSize.Y
				local v3 = nil
				
				if Current == nil then
					v3 = nil
				else
					local Y1: number = Current.AbsoluteWindowSize.Y
					v3 = if Y1 <= 0 then nil else Y / Y1
				end
				local NormalizedPosition: number = p1.normalizedPosition
				local Current1: number = UseRefResult1.current
				local ClampedValue = if FFlagLuaAppHeroUnitParallaxUpdates and NormalizedPosition < 0 and v3 and v3 > 0 then math.clamp(NormalizedPosition / v3, -1, 0) elseif Current1 == nil or Current1 <= 0 or Current1 >= 1 then NormalizedPosition else math.clamp(NormalizedPosition / Current1, 0, 1)
				local Y2 = p1.frameSize.Y
				local Negated = -((Y2 - Frame.foregroundOverflow) / Frame.foregroundAspectRatio - Y2)
				
				if Frame.foregroundAspectRatio == 1 then
					Negated -= Frame.tokens.Size.Size_1500
				end
				return UDim2.new(0.5, 0, 0, (GetYPositionOffsetForMotionFunction(ClampedValue, Negated, NewForegroundOverflow, v1)))
			end) else UDim2.new(0.5, 0, 0, 0),
			Image = Frame.foregroundImage,
			ZIndex = 1,
			BackgroundTransparency = 1,
			[ReactModule.Tag] = if FFlagLuaAppHomePageFirstImageLoadObserver then "observed-image data-testid=--hero-unit-foreground-image" else "data-testid=--hero-unit-foreground-image"
		}) else ReactModule.createElement("ImageLabel", {
			AnchorPoint = Vector2.new(0.5, 0),
			Size = Frame.foregroundHeightPercent:map(function(YScale): UDim2
				-- upvalues: Frame (copy)
				return UDim2.new(1, 0, YScale, -Frame.foregroundOverflow * YScale)
			end),
			SizeConstraint = Enum.SizeConstraint.RelativeYY,
			Position = if Frame.enableForegroundAnimation then UseNormalizedVerticalProgressResult:map(function(p1: number): UDim2
				-- upvalues: UseRefResult1 (copy), GetNormalizedCenterPositionFunction (upval), Frame (copy), UseRefResult (copy), FFlagLuaAppHeroUnitParallaxUpdates (upval), GetYPositionOffsetForMotionFunction (upval), ScaledForegroundOverflow (copy)
				if UseRefResult1.current == nil then
					UseRefResult1.current = GetNormalizedCenterPositionFunction(Frame.verticalScrollingFrameRef.current, UseRefResult.current)
				end
				local Current: number = UseRefResult1.current
				
				return UDim2.new(0.5, 0, 0, (GetYPositionOffsetForMotionFunction(if FFlagLuaAppHeroUnitParallaxUpdates and p1 < 0 then if Current == nil or Current <= 0 or Current >= 1 then p1 else math.clamp(p1 / Current, 0, 1) elseif Current == nil or Current <= 0 or Current >= 1 then p1 else math.clamp(p1 / Current, 0, 1), 0, ScaledForegroundOverflow, nil)))
			end) else UDim2.new(0.5, 0, 0, 0),
			Image = Frame.foregroundImage,
			ZIndex = 1,
			BackgroundTransparency = 1,
			[ReactModule.Tag] = if FFlagLuaAppHomePageFirstImageLoadObserver then "observed-image data-testid=--hero-unit-foreground-image" else "data-testid=--hero-unit-foreground-image"
		}, {
			UIAspectRatioConstraint = ReactModule.createElement("UIAspectRatioConstraint", {
				AspectRatio = Frame.foregroundAspectRatio,
				AspectType = Enum.AspectType.ScaleWithParentSize,
				DominantAxis = Enum.DominantAxis.Height
			})
		}),
		HeroGradientFrame = Frame.gradient and ReactModule.createElement("Frame", {
			ZIndex = 2,
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.new(0, 0, 1, 1),
			Size = UDim2.new(Frame.gradientWidthPercent, 0, Frame.gradientHeightPercent, YOffset),
			BackgroundColor3 = Color3.new(1, 1, 1)
		}, {
			HeroGradient = ReactModule.createElement("UIGradient", {
				Rotation = Frame.gradient.degree,
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, Frame.gradient.startOpacity),
					NumberSequenceKeypoint.new(1, Frame.gradient.endOpacity)
				}),
				Color = ColorSequence.new({
					ColorSequenceKeypoint.new(0, Frame.gradient.startColor),
					ColorSequenceKeypoint.new(1, Frame.gradient.endColor)
				})
			}),
			CornerRadius = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, Frame.cornerRadius) })
		}) or nil
	})
end)