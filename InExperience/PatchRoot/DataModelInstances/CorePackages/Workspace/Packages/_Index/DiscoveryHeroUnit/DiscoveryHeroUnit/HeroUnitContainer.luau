local DiscoveryHeroUnit = script:FindFirstAncestor("DiscoveryHeroUnit")
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local Parent = DiscoveryHeroUnit.Parent
local ArgCheckModule = require(Parent.ArgCheck)
local CryoModule = require(Parent.Cryo)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local Image = FoundationModule.Image
local ReactModule = require(Parent.React)
local ResponsiveModule = require(Parent.Responsive)
local HeroImagesModule = require(DiscoveryHeroUnit.HeroImages)
local HeroNarrowLayout = require(DiscoveryHeroUnit.HeroUnitTypes).HeroNarrowLayout
local CollectionViewsModule = require(Parent.CollectionViews)
local CollectionHeader = CollectionViewsModule.CollectionHeader
local MaybeForceDarkThemeFunction = CollectionViewsModule.maybeForceDarkTheme
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagLuaAppEnableHeroUnitV2 = SharedFlagsModule.FFlagLuaAppEnableHeroUnitV2
local FFlagLuaAppHomePageFirstImageLoadObserver = SharedFlagsModule.FFlagLuaAppHomePageFirstImageLoadObserver
local config = { Compact = 0.5625, Square = 1, Tall = 1.25 }
local SubtitleColor = { Transparency = 0, Color3 = Color3.new(1, 1, 1) }

local function _(p1, p2)
	return p1 * p2.Stroke.Standard
end

local function useHeroConfiguration(p1, Tokens)
	-- upvalues: ResponsiveModule (copy), HeroNarrowLayout (copy), config (copy), FFlagLuaAppEnableHeroUnitV2 (copy), CryoModule (copy), UserGameSettings (copy)
	local UseResponsiveResult = ResponsiveModule.useResponsive({
		{ Key = "Small", maxWidth = 413 },
		{ Key = "Medium", maxWidth = 600 }
	})
	local AspectRatio = nil
	local ScaledStandard = nil
	local HeadingMedium = nil
	local BodyMedium = nil
	local IsNarrowLayoutMatch = nil
	local Large = nil
	local Large1 = nil
	local TitleImageHeightPercentage = nil
	
	if UseResponsiveResult == "Small" or UseResponsiveResult == "Medium" then
		local NarrowLayout = p1.narrowLayout or HeroNarrowLayout.Compact
		AspectRatio = config[NarrowLayout] or config[HeroNarrowLayout.Compact]
		HeadingMedium = if UseResponsiveResult == "Small" then Tokens.Typography.HeadingMedium else Tokens.Typography.HeadingLarge
		BodyMedium = Tokens.Typography.BodyMedium
		IsNarrowLayoutMatch = p1.titleImage == nil and NarrowLayout == HeroNarrowLayout.Compact or p1.subtitle == nil
		Large = Tokens.Padding.Large
		Large1 = Tokens.Gap.Large
		TitleImageHeightPercentage = if FFlagLuaAppEnableHeroUnitV2 then if p1.titleImageAspectRatio == 1 then 0.26 else 0.16 else 0.25
	else
		ScaledStandard = 336 * Tokens.Stroke.Standard
		HeadingMedium = Tokens.Typography.DisplaySmall
		BodyMedium = Tokens.Typography.BodyLarge
		IsNarrowLayoutMatch = p1.subtitle == nil
		Large = Tokens.Padding.XLarge
		Large1 = Tokens.Gap.XXLarge
		TitleImageHeightPercentage = if FFlagLuaAppEnableHeroUnitV2 then if p1.titleImageAspectRatio == 1 then 0.3 else 0.2 else 0.3
	end
	local GradientHeightPercent = nil
	local GradientWidthPercent = nil
	if p1.gradient == nil then
		GradientHeightPercent = 0.5
		GradientWidthPercent = 1
	elseif p1.gradient.degree == 270 then
		GradientHeightPercent = 0.5
		GradientWidthPercent = 1
	elseif p1.gradient.degree == 0 then
		GradientHeightPercent = 1
		GradientWidthPercent = 0.5
	else
		GradientHeightPercent = 0.5
		GradientWidthPercent = 1
	end
	return CryoModule.Dictionary.join({
		foregroundAspectRatio = 1,
		sideMargin = 0,
		titleImageAspectRatio = 3,
		cornerRadius = Tokens.Radius.Medium,
		titleTypography = HeadingMedium,
		subtitleTypography = BodyMedium,
		aspectRatio = AspectRatio,
		backgroundImageFrameHeight = ScaledStandard,
		hideSubtitle = IsNarrowLayoutMatch,
		foregroundOverflow = Large1,
		backgroundOverflow = 50 * Tokens.Stroke.Standard,
		gradientWidthPercent = GradientWidthPercent,
		gradientHeightPercent = GradientHeightPercent,
		contentPadding = Large,
		enableBackgroundAnimation = not UserGameSettings.ReducedMotion,
		enableForegroundAnimation = not UserGameSettings.ReducedMotion,
		titleImageHeightPercentage = TitleImageHeightPercentage,
		minCardHeight = 262 * Tokens.Stroke.Standard
	}, p1)
end

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), UseTokensFunction (copy), useHeroConfiguration (copy), FFlagLuaAppEnableHeroUnitV2 (copy), ArgCheckModule (copy), Image (copy), FFlagLuaAppHomePageFirstImageLoadObserver (copy), CollectionHeader (copy), SubtitleColor (copy), HeroImagesModule (copy), UserGameSettings (copy), MaybeForceDarkThemeFunction (copy)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	local UseResult = ReactModule.useCallback(function(Frame)
		-- upvalues: UseBindingResult2 (copy)
		if Frame then
			UseBindingResult2(Frame.AbsoluteSize.X)
		end
	end, {})
	local UseTokensResult = UseTokensFunction()
	local UseHeroConfigurationResult = useHeroConfiguration(p1, UseTokensResult)
	local NewBackgroundImageFrameHeight = nil
	NewBackgroundImageFrameHeight = if UseHeroConfigurationResult.backgroundImageFrameHeight and UseHeroConfigurationResult.foregroundOverflow then UseHeroConfigurationResult.backgroundImageFrameHeight + UseHeroConfigurationResult.foregroundOverflow else UseHeroConfigurationResult.backgroundImageFrameHeight
	
	if FFlagLuaAppEnableHeroUnitV2 then
		assert(UseHeroConfigurationResult.minCardHeight ~= nil, "minCardHeight is required")
		assert(UseHeroConfigurationResult.titleImageAspectRatio ~= nil, "titleImageAspectRatio is required")
	end
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), ArgCheckModule (upval), ReactModule (upval), Image (upval), UseBindingResult (copy), NewBackgroundImageFrameHeight (ref), UseHeroConfigurationResult (copy), FFlagLuaAppHomePageFirstImageLoadObserver (upval)
		if p1.titleImage then
			return ReactModule.createElement(Image, {
				ZIndex = 0,
				Image = p1.titleImage,
				Size = UseBindingResult:map(function(XOffset): UDim2
					-- upvalues: NewBackgroundImageFrameHeight (upval), UseHeroConfigurationResult (upval)
					return UDim2.new(0, XOffset, 0, (if UseHeroConfigurationResult.aspectRatio then math.max(UseHeroConfigurationResult.minCardHeight, XOffset * UseHeroConfigurationResult.aspectRatio + UseHeroConfigurationResult.foregroundOverflow) else NewBackgroundImageFrameHeight) * UseHeroConfigurationResult.titleImageHeightPercentage)
				end),
				aspectRatio = UseHeroConfigurationResult.titleImageAspectRatio,
				Position = UDim2.new(0, 0, 0.5, 0),
				AnchorPoint = Vector2.new(0, 0.5),
				tag = if FFlagLuaAppHomePageFirstImageLoadObserver then "observed-image" else nil
			})
		else
			ArgCheckModule.assert(false, "The path should never be called")
			
			return ReactModule.createElement(ReactModule.Fragment)
		end
	end, {
		UseBindingResult, NewBackgroundImageFrameHeight, p1.titleImage,
		UseHeroConfigurationResult.titleImageAspectRatio,
		UseHeroConfigurationResult.minCardHeight,
		UseHeroConfigurationResult.aspectRatio,
		UseHeroConfigurationResult.foregroundOverflow,
		UseHeroConfigurationResult.titleImageHeightPercentage
	})
	
	return ReactModule.createElement("TextButton", {
		ref = UseResult,
		[ReactModule.Change.AbsoluteSize] = UseResult,
		Position = UDim2.new(0, UseHeroConfigurationResult.sideMargin, 0, 0),
		Size = if UseHeroConfigurationResult.aspectRatio then UseBindingResult:map(function(p2): UDim2
			-- upvalues: UseHeroConfigurationResult (copy)
			return UDim2.new(1, -2 * UseHeroConfigurationResult.sideMargin, 0, (math.max(UseHeroConfigurationResult.minCardHeight, p2 * UseHeroConfigurationResult.aspectRatio + UseHeroConfigurationResult.foregroundOverflow)))
		end) else UDim2.new(1, -2 * UseHeroConfigurationResult.sideMargin, 0, NewBackgroundImageFrameHeight),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Text = "",
		[ReactModule.Event.Activated] = p1.onActivated,
		SelectionOrder = p1.SelectionOrder,
		[ReactModule.Tag] = if p1.testId then `data-testid={p1.testId}` else nil
	}, {
		HeroBackground = p1.backgroundComponent or ReactModule.createElement(HeroImagesModule, {
			ZIndex = 0,
			Size = UDim2.new(1, 0, 1, 0),
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.new(0, 0, 1, 0),
			verticalScrollingFrameRef = p1.verticalScrollingFrameRef,
			foregroundImage = p1.foregroundImage,
			backgroundImage = p1.backgroundImage,
			foregroundAspectRatio = UseHeroConfigurationResult.foregroundAspectRatio,
			foregroundOverflow = UseHeroConfigurationResult.foregroundOverflow,
			backgroundOverflow = UseHeroConfigurationResult.backgroundOverflow,
			cornerRadius = UseHeroConfigurationResult.cornerRadius,
			enableBackgroundAnimation = UseHeroConfigurationResult.enableBackgroundAnimation and not UserGameSettings.ReducedMotion,
			enableForegroundAnimation = UseHeroConfigurationResult.enableForegroundAnimation and not UserGameSettings.ReducedMotion,
			gradient = UseHeroConfigurationResult.gradient,
			gradientHeightPercent = UseHeroConfigurationResult.gradientHeightPercent,
			gradientWidthPercent = UseHeroConfigurationResult.gradientWidthPercent,
			tokens = UseTokensResult
		}),
		HeroForeground = MaybeForceDarkThemeFunction(ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 2,
			Size = UDim2.new(1, 0, 1, -UseHeroConfigurationResult.foregroundOverflow),
			Position = UDim2.new(0, 0, 0, UseHeroConfigurationResult.foregroundOverflow)
		}, {
			UIPadding = ReactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, UseHeroConfigurationResult.contentPadding),
				PaddingRight = UDim.new(0, UseHeroConfigurationResult.contentPadding),
				PaddingTop = UDim.new(0, UseHeroConfigurationResult.contentPadding),
				PaddingBottom = UDim.new(0, UseHeroConfigurationResult.contentPadding)
			}),
			HeroLogo = if FFlagLuaAppEnableHeroUnitV2 and p1.titleImage then ReactModule.createElement(Image, {
				Image = p1.titleImage,
				Size = UseBindingResult:map(function(XOffset): UDim2
					-- upvalues: NewBackgroundImageFrameHeight (ref), UseHeroConfigurationResult (copy)
					return UDim2.new(0, XOffset, 0, (if UseHeroConfigurationResult.aspectRatio then math.max(UseHeroConfigurationResult.minCardHeight, XOffset * UseHeroConfigurationResult.aspectRatio + UseHeroConfigurationResult.foregroundOverflow) else NewBackgroundImageFrameHeight or 0) * UseHeroConfigurationResult.titleImageHeightPercentage)
				end),
				aspectRatio = UseHeroConfigurationResult.titleImageAspectRatio,
				Position = UDim2.new(1, 0, 0, 0),
				AnchorPoint = Vector2.new(1, 0)
			}) else nil,
			HeroHeaderFrame = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Position = UDim2.new(0, 0, 0.5, 0),
				AnchorPoint = Vector2.new(0, 0.5)
			}, {
				HeroHeader = p1.headerComponent or ReactModule.createElement(CollectionHeader, {
					LayoutOrder = 0,
					hideButton = true,
					forceUpdatedHeader = true,
					AutomaticSize = Enum.AutomaticSize.Y,
					title = if FFlagLuaAppEnableHeroUnitV2 then p1.title elseif p1.titleImage then UseResult1 else p1.title,
					AnchorPoint = Vector2.new(0, 0.5),
					subtitle = if UseHeroConfigurationResult.hideSubtitle then nil else p1.subtitle,
					titleColor = SubtitleColor,
					subtitleColor = SubtitleColor,
					titleTypography = UseHeroConfigurationResult.titleTypography,
					subtitleTypography = UseHeroConfigurationResult.subtitleTypography,
					Position = UDim2.new(0, 0, 0.5, 0)
				})
			}),
			HeroBottomRowFrame = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Position = UDim2.new(0, 0, 1, 0),
				AnchorPoint = Vector2.new(0, 1)
			}, { HeroBottomRow = p1.bottomRowComponent }),
			HeroOverlay = p1.overlayComponent
		}), true)
	})
end)