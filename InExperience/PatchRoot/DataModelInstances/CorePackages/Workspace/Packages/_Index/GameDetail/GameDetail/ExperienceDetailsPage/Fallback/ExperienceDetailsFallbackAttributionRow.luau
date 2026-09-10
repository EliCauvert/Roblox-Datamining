local edpFallbackActionBarPlayButtonWidth = game:DefineFastInt("EdpFallbackActionBarPlayButtonWidth", 236)
local edpFallbackIconSize = game:DefineFastInt("EdpFallbackIconSize", 140)
local parent = script:FindFirstAncestor("GameDetail").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local image = foundationModule.Image
local text = foundationModule.Text
local icon = foundationModule.Icon
local skeleton = foundationModule.Skeleton
local radius = foundationModule.Enums.Radius
local buttonSize = foundationModule.Enums.ButtonSize
local useTokens = foundationModule.Hooks.useTokens
local playButton = require(parent.GamePlayButton).PlayButton
local useImageLoadFadeModule = require(script.Parent.Parent.useImageLoadFade)
local responsiveModule = require(parent.Responsive)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagLuaAppMediaGalleryGamepadSupport = sharedFlagsModule.FFlagLuaAppMediaGalleryGamepadSupport
local fFlagLuaAppSduiEdpFallbackPlayButtonUseUiBlox = sharedFlagsModule.FFlagLuaAppSduiEdpFallbackPlayButtonUseUiBlox
local fFlagLuaAppLaunchWhenLoadingEdp = sharedFlagsModule.FFlagLuaAppLaunchWhenLoadingEdp
local fFlagLuaAppSduiEdpFallbackAttributionFromCache = sharedFlagsModule.FFlagLuaAppSduiEdpFallbackAttributionFromCache
local fFlagSduiScalePlayButtonAndImageSizes = sharedFlagsModule.FFlagSduiScalePlayButtonAndImageSizes

local function VerifiedBadgeIcon()
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), icon (ref), foundationModule (ref)
	local var1 = useTokens()
	
	return reactModule.createElement(view, { LayoutOrder = 2, tag = "auto-xy" }, {
		Backplate = reactModule.createElement(icon, {
			ZIndex = 1,
			name = foundationModule.Enums.IconName.VerifiedBackplate,
			style = var1.Color.System.Emphasis,
			size = foundationModule.Enums.IconSize.Small
		}),
		Check = reactModule.createElement(icon, {
			ZIndex = 2,
			name = foundationModule.Enums.IconName.VerifiedCheck,
			size = foundationModule.Enums.IconSize.Small,
			variant = foundationModule.Enums.IconVariant.Filled,
			style = var1.Color.Extended.White.White_100
		})
	})
end

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), fFlagLuaAppMediaGalleryGamepadSupport (ref), responsiveModule (ref), edpFallbackIconSize (ref), fFlagSduiScalePlayButtonAndImageSizes (ref), useImageLoadFadeModule (ref), reactModule (ref), view (ref), image (ref), skeleton (ref), text (ref), radius (ref), VerifiedBadgeIcon (ref), fFlagLuaAppSduiEdpFallbackAttributionFromCache (ref), playButton (ref), fFlagLuaAppSduiEdpFallbackPlayButtonUseUiBlox (ref), buttonSize (ref), edpFallbackActionBarPlayButtonWidth (ref), fFlagLuaAppLaunchWhenLoadingEdp (ref)
	local var1
	local var2 = useTokens()
	local isSmallScreen = p1.isSmallScreen
	local var3 = p1.isLoading == true
	
	if fFlagLuaAppMediaGalleryGamepadSupport then
		var1 = responsiveModule.useLastInput() == responsiveModule.Input.Directional
		var1 = nil
	else
		var1 = false
	end
	local _ = nil
	local var4 = if isSmallScreen then var2.Size.Size_1400 elseif fFlagLuaAppMediaGalleryGamepadSupport and var1 and edpFallbackIconSize > 0 then if fFlagSduiScalePlayButtonAndImageSizes then edpFallbackIconSize * var2.Config.UI.Scale else edpFallbackIconSize else var2.Size.Size_2500 * 2
	local _ = nil
	local var5 = if isSmallScreen then 150 elseif fFlagSduiScalePlayButtonAndImageSizes and var4 > 256 then 512 else 256
	local var6 = useImageLoadFadeModule()
	local var7 = reactModule.createElement(view, {
		LayoutOrder = 1,
		testId = "--edp-fallback-attribution-icon",
		Size = UDim2.fromOffset(var4, var4)
	}, {
		GameIcon = reactModule.createElement(image, {
			tag = "radius-medium",
			Image = string.format("rbxthumb://type=GameIcon&id=%s&w=%d&h=%d", p1.universeId, var5, var5),
			Size = UDim2.fromScale(1, 1),
			onLoaded = var6.onLoaded
		}),
		SkeletonOverlay = if var6.skeletonVisible then reactModule.createElement(view, {
			tag = "radius-medium",
			ZIndex = 2,
			ClipsDescendants = true,
			Size = UDim2.fromScale(1, 1),
			GroupTransparency = var6.overlayTransparency
		}, {
			Skeleton = reactModule.createElement(skeleton, { Size = UDim2.fromScale(1, 1) })
		}) else nil
	})
	local var8 = if isSmallScreen then var2.Typography.CaptionLarge.LineHeight * var2.Typography.CaptionLarge.FontSize else var2.Typography.BodyMedium.LineHeight * var2.Typography.BodyMedium.FontSize
	local var9 = nil
	
	if p1.gameName then
		var9 = reactModule.createElement(text, {
			LayoutOrder = 1,
			testId = "--edp-fallback-attribution-title",
			tag = {
				["auto-xy text-wrap text-align-x-left text-truncate-none"] = true,
				["text-heading-small"] = isSmallScreen,
				["text-heading-large"] = not isSmallScreen
			},
			Text = p1.gameName
		})
	elseif var3 then
		var9 = reactModule.createElement(skeleton, {
			LayoutOrder = 1,
			Size = UDim2.fromOffset(var2.Size.Size_2800 * 2, if isSmallScreen then var8 else var2.Typography.HeadingMedium.LineHeight * var2.Typography.HeadingMedium.FontSize),
			radius = radius.Small
		})
	end
	local var10 = nil
	
	if p1.creatorName then
		var10 = reactModule.createElement(view, {
			tag = "row align-y-center gap-xsmall auto-xy",
			LayoutOrder = 2
		}, {
			CreatorName = reactModule.createElement(text, {
				tag = "auto-xy text-body-medium content-default",
				LayoutOrder = 1,
				testId = "--edp-fallback-attribution-creator",
				Text = p1.creatorName,
				TextTruncate = Enum.TextTruncate.None
			}),
			Badge = if p1.hasVerifiedBadge then reactModule.createElement(VerifiedBadgeIcon) else nil
		})
	elseif var3 then
		var10 = reactModule.createElement(skeleton, {
			LayoutOrder = 2,
			testId = "--edp-fallback-attribution-creator-skeleton",
			Size = UDim2.fromOffset(var2.Size.Size_2800 * 2, if fFlagLuaAppSduiEdpFallbackAttributionFromCache then var2.Typography.BodyLarge.FontSize * var2.Typography.BodyLarge.LineHeight else var8),
			radius = radius.Small
		})
	end
	local var11 = nil
	
	if p1.ageRecDisplayName then
		var11 = reactModule.createElement(text, {
			tag = "auto-xy text-body-medium content-default",
			LayoutOrder = 3,
			testId = "--edp-fallback-attribution-age-rating",
			Text = p1.ageRecDisplayName
		})
	elseif var3 then
		local fontSize
		local _ = nil
		
		if fFlagLuaAppSduiEdpFallbackAttributionFromCache then
			fontSize = var2.Typography.BodyMedium.FontSize
			
			if not isSmallScreen then
				fontSize += var2.Padding.XSmall
			end
		else
			fontSize = var8
		end
		var11 = reactModule.createElement(skeleton, {
			LayoutOrder = 3,
			testId = "--edp-fallback-attribution-age-rating-skeleton",
			Size = UDim2.fromOffset(if isSmallScreen then var2.Size.Size_2400 else var2.Size.Size_2800, fontSize),
			radius = radius.Small
		})
	end
	return reactModule.createElement(view, {
		LayoutOrder = 1,
		tag = {
			["row size-full-0 auto-y"] = true,
			["gap-medium"] = isSmallScreen,
			["gap-xlarge"] = not isSmallScreen,
			["align-y-center"] = isSmallScreen,
			["align-y-bottom"] = not isSmallScreen
		}
	}, {
		Icon = var7,
		ContentColumn = reactModule.createElement(view, {
			LayoutOrder = 2,
			testId = "--edp-fallback-attribution-content-column",
			tag = {
				["col fill gap-xsmall auto-xy"] = fFlagLuaAppSduiEdpFallbackAttributionFromCache,
				["col fill gap-small auto-xy"] = not fFlagLuaAppSduiEdpFallbackAttributionFromCache
			}
		}, {
			Title = var9,
			Creator = var10,
			AgeRating = var11,
			ActionRow = if not isSmallScreen then reactModule.createElement(view, {
				tag = "row align-y-center gap-small auto-xy",
				LayoutOrder = 4
			}, {
				PlayBtn = reactModule.createElement(playButton, {
					launchOnReleaseAfterUnmount = true,
					expandWidthForSecondaryPlayButton = true,
					LayoutOrder = 1,
					testId = "--edp-fallback-feed-play-button",
					universeId = p1.universeId,
					referralSource = p1.referralSource,
					launchSource = p1.launchSource,
					experienceJoinData = p1.experienceJoinData,
					placeId = p1.placeIdOverride,
					useUIBloxButton = fFlagLuaAppSduiEdpFallbackPlayButtonUseUiBlox,
					buttonSize = buttonSize.Large,
					width = UDim.new(0, if fFlagSduiScalePlayButtonAndImageSizes then edpFallbackActionBarPlayButtonWidth * var2.Config.UI.Scale else edpFallbackActionBarPlayButtonWidth),
					launchWhenLoading = if fFlagLuaAppLaunchWhenLoadingEdp then true else nil
				}),
				OverflowSkeleton1 = if var3 then reactModule.createElement(skeleton, {
					LayoutOrder = 2,
					Size = UDim2.fromOffset(var2.Size.Size_1200, var2.Size.Size_1200),
					radius = radius.Medium
				}) else nil,
				OverflowSkeleton2 = if var3 then reactModule.createElement(skeleton, {
					LayoutOrder = 3,
					Size = UDim2.fromOffset(var2.Size.Size_1200, var2.Size.Size_1200),
					radius = radius.Medium
				}) else nil
			}) else nil
		})
	})
end)