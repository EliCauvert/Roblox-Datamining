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

local function _(p1, p2)
	return p1 * p2.Stroke.Standard
end

local function useHeroConfiguration(p1, p2)
	-- upvalues: responsiveModule (ref), heroNarrowLayout (ref), t (ref), fFlagLuaAppEnableHeroUnitV2 (ref), cryoModule (ref), userGameSettingsService (ref)
	local displaySmall, bodyLarge, var1, xLarge, XXLarge, var2
	local _ = nil
	local var3 = responsiveModule.useResponsive({
		{ Key = "Small", maxWidth = 413 },
		{ Key = "Medium", maxWidth = 600 }
	})
	local var4 = if var3 ~= "Small" then var3 == "Medium" else true
	var4 = nil
	local var5 = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	
	if var4 then
		var4 = t[p1.narrowLayout or heroNarrowLayout.Compact] or t[heroNarrowLayout.Compact]
		displaySmall = if var3 == "Small" then p2.Typography.HeadingMedium else p2.Typography.HeadingLarge
		bodyLarge = p2.Typography.BodyMedium
		var1 = p1.titleImage == nil or p1.subtitle == nil
		xLarge = p2.Padding.Large
		XXLarge = p2.Gap.Large
		var2 = if fFlagLuaAppEnableHeroUnitV2 then if p1.titleImageAspectRatio == 1 then 0.26 else 0.16 else 0.25
	else
		var5 = 336 * p2.Stroke.Standard
		displaySmall = p2.Typography.DisplaySmall
		bodyLarge = p2.Typography.BodyLarge
		var1 = p1.subtitle == nil
		xLarge = p2.Padding.XLarge
		XXLarge = p2.Gap.XXLarge
		var2 = if fFlagLuaAppEnableHeroUnitV2 then if p1.titleImageAspectRatio == 1 then 0.3 else 0.2 else 0.3
	end
	local var6, var7
	local _ = nil
	local _ = nil
	
	if p1.gradient == nil then
		var6 = 0.5
		var7 = 1
	elseif p1.gradient.degree == 270 then
		var6 = 0.5
		var7 = 1
	elseif p1.gradient.degree == 0 then
		var6 = 1
		var7 = 0.5
	else
		var6 = 0.5
		var7 = 1
	end
	return cryoModule.Dictionary.join({
		foregroundAspectRatio = 1,
		sideMargin = 0,
		titleImageAspectRatio = 3,
		cornerRadius = p2.Radius.Medium,
		titleTypography = displaySmall,
		subtitleTypography = bodyLarge,
		aspectRatio = var4,
		backgroundImageFrameHeight = var5,
		hideSubtitle = var1,
		foregroundOverflow = XXLarge,
		backgroundOverflow = 50 * p2.Stroke.Standard,
		gradientWidthPercent = var7,
		gradientHeightPercent = var6,
		contentPadding = xLarge,
		enableBackgroundAnimation = not userGameSettingsService.ReducedMotion,
		enableForegroundAnimation = not userGameSettingsService.ReducedMotion,
		titleImageHeightPercentage = var2,
		minCardHeight = 262 * p2.Stroke.Standard
	}, p1)
end

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), useTokens (ref), useHeroConfiguration (ref), fFlagLuaAppEnableHeroUnitV2 (ref), argCheckModule (ref), image (ref), fFlagLuaAppHomePageFirstImageLoadObserver (ref), collectionHeader (ref), t_1 (ref), heroImagesModule (ref), userGameSettingsService (ref), maybeForceDarkTheme (ref)
	local var1, var2 = reactModule.useBinding(0)
	local var3 = reactModule.useCallback(function(p2)
		-- upvalues: var2 (ref)
		if p2 then
			var2(p2.AbsoluteSize.X)
		end
	end, {})
	local var4 = useTokens()
	local var5 = useHeroConfiguration(p1, var4)
	local _ = nil
	local var6 = if var5.backgroundImageFrameHeight and var5.foregroundOverflow then var5.backgroundImageFrameHeight + var5.foregroundOverflow else var5.backgroundImageFrameHeight
	
	if fFlagLuaAppEnableHeroUnitV2 then
		assert(var5.minCardHeight ~= nil, "minCardHeight is required")
		assert(var5.titleImageAspectRatio ~= nil, "titleImageAspectRatio is required")
	end
	return reactModule.createElement("TextButton", {
		ref = var3,
		[reactModule.Change.AbsoluteSize] = var3,
		Position = UDim2.new(0, var5.sideMargin, 0, 0),
		Size = if var5.aspectRatio then var1:map(function(p2)
			-- upvalues: var5 (ref)
			return UDim2.new(1, -2 * var5.sideMargin, 0, math.max(var5.minCardHeight, p2 * var5.aspectRatio + var5.foregroundOverflow))
		end) else UDim2.new(1, -2 * var5.sideMargin, 0, var6),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Text = "",
		[reactModule.Event.Activated] = p1.onActivated,
		SelectionOrder = p1.SelectionOrder,
		[reactModule.Tag] = if p1.testId then `data-testid={p1.testId}` else nil
	}, {
		HeroBackground = p1.backgroundComponent or reactModule.createElement(heroImagesModule, {
			ZIndex = 0,
			Size = UDim2.new(1, 0, 1, 0),
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.new(0, 0, 1, 0),
			verticalScrollingFrameRef = p1.verticalScrollingFrameRef,
			foregroundImage = p1.foregroundImage,
			backgroundImage = p1.backgroundImage,
			foregroundAspectRatio = var5.foregroundAspectRatio,
			foregroundOverflow = var5.foregroundOverflow,
			backgroundOverflow = var5.backgroundOverflow,
			cornerRadius = var5.cornerRadius,
			enableBackgroundAnimation = var5.enableBackgroundAnimation and not userGameSettingsService.ReducedMotion,
			enableForegroundAnimation = var5.enableForegroundAnimation and not userGameSettingsService.ReducedMotion,
			gradient = var5.gradient,
			gradientHeightPercent = var5.gradientHeightPercent,
			gradientWidthPercent = var5.gradientWidthPercent,
			tokens = var4
		}),
		HeroForeground = maybeForceDarkTheme(reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 2,
			Size = UDim2.new(1, 0, 1, -var5.foregroundOverflow),
			Position = UDim2.new(0, 0, 0, var5.foregroundOverflow)
		}, {
			UIPadding = reactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, var5.contentPadding),
				PaddingRight = UDim.new(0, var5.contentPadding),
				PaddingTop = UDim.new(0, var5.contentPadding),
				PaddingBottom = UDim.new(0, var5.contentPadding)
			}),
			HeroLogo = if fFlagLuaAppEnableHeroUnitV2 and p1.titleImage then reactModule.createElement(image, {
				Image = p1.titleImage,
				Size = var1:map(function(p2)
					-- upvalues: var6 (write), var5 (ref)
					return UDim2.new(0, p2, 0, (if var5.aspectRatio then math.max(var5.minCardHeight, p2 * var5.aspectRatio + var5.foregroundOverflow) else var6 or 0) * var5.titleImageHeightPercentage)
				end),
				aspectRatio = var5.titleImageAspectRatio,
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
				HeroHeader = p1.headerComponent or reactModule.createElement(collectionHeader, {
					LayoutOrder = 0,
					hideButton = true,
					forceUpdatedHeader = true,
					AutomaticSize = Enum.AutomaticSize.Y,
					title = if fFlagLuaAppEnableHeroUnitV2 then p1.title elseif p1.titleImage then reactModule.useCallback(function()
						-- upvalues: p1 (ref), argCheckModule (copy), reactModule (copy), image (copy), var1 (ref), var6 (write), var5 (ref), fFlagLuaAppHomePageFirstImageLoadObserver (copy)
						if p1.titleImage then
							return reactModule.createElement(image, {
								ZIndex = 0,
								Image = p1.titleImage,
								Size = var1:map(function(p2)
									-- upvalues: var6 (copy), var5 (copy)
									return UDim2.new(0, p2, 0, (if var5.aspectRatio then math.max(var5.minCardHeight, p2 * var5.aspectRatio + var5.foregroundOverflow) else var6) * var5.titleImageHeightPercentage)
								end),
								aspectRatio = var5.titleImageAspectRatio,
								Position = UDim2.new(0, 0, 0.5, 0),
								AnchorPoint = Vector2.new(0, 0.5),
								tag = if fFlagLuaAppHomePageFirstImageLoadObserver then "observed-image" else nil
							})
						end
						argCheckModule.assert(false, "The path should never be called")
						
						return reactModule.createElement(reactModule.Fragment)
					end, {
						var1, var6, p1.titleImage, var5.titleImageAspectRatio, var5.minCardHeight,
						var5.aspectRatio, var5.foregroundOverflow, var5.titleImageHeightPercentage
					}) else p1.title,
					AnchorPoint = Vector2.new(0, 0.5),
					subtitle = if var5.hideSubtitle then nil else p1.subtitle,
					titleColor = t_1,
					subtitleColor = t_1,
					titleTypography = var5.titleTypography,
					subtitleTypography = var5.subtitleTypography,
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
			}, { HeroBottomRow = p1.bottomRowComponent }),
			HeroOverlay = p1.overlayComponent
		}), true)
	})
end)