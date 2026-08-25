local discoveryHeroUnit = script:FindFirstAncestor("DiscoveryHeroUnit")
local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local parent = discoveryHeroUnit.Parent
local argCheckModule = require(parent.ArgCheck)
local cryoModule = require(parent.Cryo)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local image = foundationModule.Image
local reactModule = require(parent.React)
local responsiveModule = require(parent.Responsive)
local heroImagesModule = require(discoveryHeroUnit.HeroImages)
local heroNarrowLayout = require(discoveryHeroUnit.HeroUnitTypes).HeroNarrowLayout
local collectionViewsModule = require(parent.CollectionViews)
local collectionHeader = collectionViewsModule.CollectionHeader
local maybeForceDarkTheme = collectionViewsModule.maybeForceDarkTheme
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagLuaAppEnableHeroUnitV2 = sharedFlagsModule.FFlagLuaAppEnableHeroUnitV2
local fFlagLuaAppHomePageFirstImageLoadObserver = sharedFlagsModule.FFlagLuaAppHomePageFirstImageLoadObserver
local t = { Compact = 0.5625, Square = 1, Tall = 1.25 }
local t_1 = { Transparency = 0, Color3 = Color3.new(1, 1, 1) }

local function _(p0, p1)
	return p0 * p1.Stroke.Standard
end

local function useHeroConfiguration(p2, p3)
	-- upvalues: responsiveModule (ref), heroNarrowLayout (ref), t (ref), fFlagLuaAppEnableHeroUnitV2 (ref), cryoModule (ref), userGameSettingsService (ref)
	local displaySmall, bodyLarge, var16, xLarge, XXLarge, var17
	local _ = nil
	local var13 = responsiveModule.useResponsive({
		{ Key = "Small", maxWidth = 413 },
		{ Key = "Medium", maxWidth = 600 }
	})
	local var14 = if var13 ~= "Small" then var13 == "Medium" else true
	var14 = nil
	local var15 = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	
	if var14 then
		var14 = t[p2.narrowLayout or heroNarrowLayout.Compact] or t[heroNarrowLayout.Compact]
		displaySmall = if var13 == "Small" then p3.Typography.HeadingMedium else p3.Typography.HeadingLarge
		bodyLarge = p3.Typography.BodyMedium
		var16 = p2.titleImage == nil or p2.subtitle == nil
		xLarge = p3.Padding.Large
		XXLarge = p3.Gap.Large
		var17 = if fFlagLuaAppEnableHeroUnitV2 then if p2.titleImageAspectRatio == 1 then 0.26 else 0.16 else 0.25
	else
		var15 = 336 * p3.Stroke.Standard
		displaySmall = p3.Typography.DisplaySmall
		bodyLarge = p3.Typography.BodyLarge
		var16 = p2.subtitle == nil
		xLarge = p3.Padding.XLarge
		XXLarge = p3.Gap.XXLarge
		var17 = if fFlagLuaAppEnableHeroUnitV2 then if p2.titleImageAspectRatio == 1 then 0.3 else 0.2 else 0.3
	end
	local var18, var19
	local _ = nil
	local _ = nil
	
	if p2.gradient == nil then
		var18 = 0.5
		var19 = 1
	elseif p2.gradient.degree == 270 then
		var18 = 0.5
		var19 = 1
	elseif p2.gradient.degree == 0 then
		var18 = 1
		var19 = 0.5
	else
		var18 = 0.5
		var19 = 1
	end
	return cryoModule.Dictionary.join({
		foregroundAspectRatio = 1,
		sideMargin = 0,
		titleImageAspectRatio = 3,
		cornerRadius = p3.Radius.Medium,
		titleTypography = displaySmall,
		subtitleTypography = bodyLarge,
		aspectRatio = var14,
		backgroundImageFrameHeight = var15,
		hideSubtitle = var16,
		foregroundOverflow = XXLarge,
		backgroundOverflow = 50 * p3.Stroke.Standard,
		gradientWidthPercent = var19,
		gradientHeightPercent = var18,
		contentPadding = xLarge,
		enableBackgroundAnimation = not userGameSettingsService.ReducedMotion,
		enableForegroundAnimation = not userGameSettingsService.ReducedMotion,
		titleImageHeightPercentage = var17,
		minCardHeight = 262 * p3.Stroke.Standard
	}, p2)
end

return reactModule.memo(function(p4)
	-- upvalues: reactModule (ref), useTokens (ref), useHeroConfiguration (ref), fFlagLuaAppEnableHeroUnitV2 (ref), argCheckModule (ref), image (ref), fFlagLuaAppHomePageFirstImageLoadObserver (ref), collectionHeader (ref), t_1 (ref), heroImagesModule (ref), userGameSettingsService (ref), maybeForceDarkTheme (ref)
	local var20, var21 = reactModule.useBinding(0)
	local var22 = reactModule.useCallback(function(p5)
		-- upvalues: var21 (ref)
		if p5 then
			var21(p5.AbsoluteSize.X)
		end
	end, {})
	local var23 = useTokens()
	local var24 = useHeroConfiguration(p4, var23)
	local _ = nil
	local var25 = if var24.backgroundImageFrameHeight and var24.foregroundOverflow then var24.backgroundImageFrameHeight + var24.foregroundOverflow else var24.backgroundImageFrameHeight
	
	if fFlagLuaAppEnableHeroUnitV2 then
		assert(var24.minCardHeight ~= nil, "minCardHeight is required")
		assert(var24.titleImageAspectRatio ~= nil, "titleImageAspectRatio is required")
	end
	return reactModule.createElement("TextButton", {
		ref = var22,
		[reactModule.Change.AbsoluteSize] = var22,
		Position = UDim2.new(0, var24.sideMargin, 0, 0),
		Size = if var24.aspectRatio then var20:map(function(p6)
			-- upvalues: var24 (ref)
			return UDim2.new(1, -2 * var24.sideMargin, 0, math.max(var24.minCardHeight, p6 * var24.aspectRatio + var24.foregroundOverflow))
		end) else UDim2.new(1, -2 * var24.sideMargin, 0, var25),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Text = "",
		[reactModule.Event.Activated] = p4.onActivated,
		SelectionOrder = p4.SelectionOrder,
		[reactModule.Tag] = if p4.testId then `data-testid={p4.testId}` else nil
	}, {
		HeroBackground = p4.backgroundComponent or reactModule.createElement(heroImagesModule, {
			ZIndex = 0,
			Size = UDim2.new(1, 0, 1, 0),
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.new(0, 0, 1, 0),
			verticalScrollingFrameRef = p4.verticalScrollingFrameRef,
			foregroundImage = p4.foregroundImage,
			backgroundImage = p4.backgroundImage,
			foregroundAspectRatio = var24.foregroundAspectRatio,
			foregroundOverflow = var24.foregroundOverflow,
			backgroundOverflow = var24.backgroundOverflow,
			cornerRadius = var24.cornerRadius,
			enableBackgroundAnimation = var24.enableBackgroundAnimation and not userGameSettingsService.ReducedMotion,
			enableForegroundAnimation = var24.enableForegroundAnimation and not userGameSettingsService.ReducedMotion,
			gradient = var24.gradient,
			gradientHeightPercent = var24.gradientHeightPercent,
			gradientWidthPercent = var24.gradientWidthPercent,
			tokens = var23
		}),
		HeroForeground = maybeForceDarkTheme(reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 2,
			Size = UDim2.new(1, 0, 1, -var24.foregroundOverflow),
			Position = UDim2.new(0, 0, 0, var24.foregroundOverflow)
		}, {
			UIPadding = reactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, var24.contentPadding),
				PaddingRight = UDim.new(0, var24.contentPadding),
				PaddingTop = UDim.new(0, var24.contentPadding),
				PaddingBottom = UDim.new(0, var24.contentPadding)
			}),
			HeroLogo = if fFlagLuaAppEnableHeroUnitV2 and p4.titleImage then reactModule.createElement(image, {
				Image = p4.titleImage,
				Size = var20:map(function(p7)
					-- upvalues: var25 (write), var24 (ref)
					return UDim2.new(0, p7, 0, (if var24.aspectRatio then math.max(var24.minCardHeight, p7 * var24.aspectRatio + var24.foregroundOverflow) else var25 or 0) * var24.titleImageHeightPercentage)
				end),
				aspectRatio = var24.titleImageAspectRatio,
				Position = UDim2.new(1, 0, 0, 0),
				AnchorPoint = Vector2.new(1, 0)
			}) else nil,
			HeroHeaderFrame = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Position = UDim2.new(0, 0, 0.5, 0),
				AnchorPoint = Vector2.new(0, 0.5)
			}, {
				HeroHeader = p4.headerComponent or reactModule.createElement(collectionHeader, {
					LayoutOrder = 0,
					hideButton = true,
					forceUpdatedHeader = true,
					AutomaticSize = Enum.AutomaticSize.Y,
					title = if fFlagLuaAppEnableHeroUnitV2 then p4.title elseif p4.titleImage then reactModule.useCallback(function()
						-- upvalues: p4 (ref), argCheckModule (copy), reactModule (copy), image (copy), var20 (ref), var25 (write), var24 (ref), fFlagLuaAppHomePageFirstImageLoadObserver (copy)
						if p4.titleImage then
							return reactModule.createElement(image, {
								ZIndex = 0,
								Image = p4.titleImage,
								Size = var20:map(function(p8)
									-- upvalues: var25 (copy), var24 (copy)
									return UDim2.new(0, p8, 0, (if var24.aspectRatio then math.max(var24.minCardHeight, p8 * var24.aspectRatio + var24.foregroundOverflow) else var25) * var24.titleImageHeightPercentage)
								end),
								aspectRatio = var24.titleImageAspectRatio,
								Position = UDim2.new(0, 0, 0.5, 0),
								AnchorPoint = Vector2.new(0, 0.5),
								tag = if fFlagLuaAppHomePageFirstImageLoadObserver then "observed-image" else nil
							})
						end
						argCheckModule.assert(false, "The path should never be called")
						
						return reactModule.createElement(reactModule.Fragment)
					end, {
						var20, var25, p4.titleImage, var24.titleImageAspectRatio, var24.minCardHeight,
						var24.aspectRatio, var24.foregroundOverflow, var24.titleImageHeightPercentage
					}) else p4.title,
					AnchorPoint = Vector2.new(0, 0.5),
					subtitle = if var24.hideSubtitle then nil else p4.subtitle,
					titleColor = t_1,
					subtitleColor = t_1,
					titleTypography = var24.titleTypography,
					subtitleTypography = var24.subtitleTypography,
					Position = UDim2.new(0, 0, 0.5, 0)
				})
			}),
			HeroBottomRowFrame = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Position = UDim2.new(0, 0, 1, 0),
				AnchorPoint = Vector2.new(0, 1)
			}, { HeroBottomRow = p4.bottomRowComponent }),
			HeroOverlay = p4.overlayComponent
		}), true)
	})
end)