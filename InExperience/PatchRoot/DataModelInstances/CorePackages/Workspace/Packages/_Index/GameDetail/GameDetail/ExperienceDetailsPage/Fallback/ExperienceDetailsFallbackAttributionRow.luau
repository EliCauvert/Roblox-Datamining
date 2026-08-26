local edpFallbackActionBarPlayButtonWidth = game:DefineFastInt("EdpFallbackActionBarPlayButtonWidth", 236)
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
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagLuaAppSduiEdpFallbackPlayButtonUseUiBlox = sharedFlagsModule.FFlagLuaAppSduiEdpFallbackPlayButtonUseUiBlox
local fFlagLuaAppLaunchWhenLoadingEdp = sharedFlagsModule.FFlagLuaAppLaunchWhenLoadingEdp
local fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp = sharedFlagsModule.FFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp
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
	-- upvalues: useTokens (ref), fFlagSduiScalePlayButtonAndImageSizes (ref), useImageLoadFadeModule (ref), reactModule (ref), view (ref), image (ref), skeleton (ref), text (ref), radius (ref), VerifiedBadgeIcon (ref), fFlagLuaAppSduiEdpFallbackAttributionFromCache (ref), playButton (ref), fFlagLuaAppSduiEdpFallbackPlayButtonUseUiBlox (ref), buttonSize (ref), edpFallbackActionBarPlayButtonWidth (ref), fFlagLuaAppLaunchWhenLoadingEdp (ref), fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp (ref)
	local var1 = useTokens()
	local isSmallScreen = p1.isSmallScreen
	local var2 = p1.isLoading == true
	local var3 = if isSmallScreen then var1.Size.Size_1400 else var1.Size.Size_2500 * 2
	local _ = nil
	local var4 = if isSmallScreen then 150 elseif fFlagSduiScalePlayButtonAndImageSizes and var3 > 256 then 512 else 256
	local var5 = useImageLoadFadeModule()
	local var6 = reactModule.createElement(view, { LayoutOrder = 1, Size = UDim2.fromOffset(var3, var3) }, {
		GameIcon = reactModule.createElement(image, {
			tag = "radius-medium",
			Image = string.format("rbxthumb://type=GameIcon&id=%s&w=%d&h=%d", p1.universeId, var4, var4),
			Size = UDim2.fromScale(1, 1),
			onLoaded = var5.onLoaded
		}),
		SkeletonOverlay = if var5.skeletonVisible then reactModule.createElement(view, {
			tag = "radius-medium",
			ZIndex = 2,
			ClipsDescendants = true,
			Size = UDim2.fromScale(1, 1),
			GroupTransparency = var5.overlayTransparency
		}, {
			Skeleton = reactModule.createElement(skeleton, { Size = UDim2.fromScale(1, 1) })
		}) else nil
	})
	local var7 = if isSmallScreen then var1.Typography.CaptionLarge.LineHeight * var1.Typography.CaptionLarge.FontSize else var1.Typography.BodyMedium.LineHeight * var1.Typography.BodyMedium.FontSize
	local var8 = nil
	
	if p1.gameName then
		var8 = reactModule.createElement(text, {
			LayoutOrder = 1,
			testId = "--edp-fallback-attribution-title",
			tag = {
				["auto-xy text-wrap text-align-x-left text-truncate-none"] = true,
				["text-heading-small"] = isSmallScreen,
				["text-heading-large"] = not isSmallScreen
			},
			Text = p1.gameName
		})
	elseif var2 then
		var8 = reactModule.createElement(skeleton, {
			LayoutOrder = 1,
			Size = UDim2.fromOffset(var1.Size.Size_2800 * 2, if isSmallScreen then var7 else var1.Typography.HeadingMedium.LineHeight * var1.Typography.HeadingMedium.FontSize),
			radius = radius.Small
		})
	end
	local var9 = nil
	
	if p1.creatorName then
		var9 = reactModule.createElement(view, {
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
	elseif var2 then
		var9 = reactModule.createElement(skeleton, {
			LayoutOrder = 2,
			testId = "--edp-fallback-attribution-creator-skeleton",
			Size = UDim2.fromOffset(var1.Size.Size_2800 * 2, if fFlagLuaAppSduiEdpFallbackAttributionFromCache then var1.Typography.BodyLarge.FontSize * var1.Typography.BodyLarge.LineHeight else var7),
			radius = radius.Small
		})
	end
	local var10 = nil
	
	if p1.ageRecDisplayName then
		var10 = reactModule.createElement(text, {
			tag = "auto-xy text-body-medium content-default",
			LayoutOrder = 3,
			testId = "--edp-fallback-attribution-age-rating",
			Text = p1.ageRecDisplayName
		})
	elseif var2 then
		local fontSize
		local _ = nil
		
		if fFlagLuaAppSduiEdpFallbackAttributionFromCache then
			fontSize = var1.Typography.BodyMedium.FontSize
			
			if not isSmallScreen then
				fontSize += var1.Padding.XSmall
			end
		else
			fontSize = var7
		end
		var10 = reactModule.createElement(skeleton, {
			LayoutOrder = 3,
			testId = "--edp-fallback-attribution-age-rating-skeleton",
			Size = UDim2.fromOffset(if isSmallScreen then var1.Size.Size_2400 else var1.Size.Size_2800, fontSize),
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
		Icon = var6,
		ContentColumn = reactModule.createElement(view, {
			LayoutOrder = 2,
			testId = "--edp-fallback-attribution-content-column",
			tag = {
				["col fill gap-xsmall auto-xy"] = fFlagLuaAppSduiEdpFallbackAttributionFromCache,
				["col fill gap-small auto-xy"] = not fFlagLuaAppSduiEdpFallbackAttributionFromCache
			}
		}, {
			Title = var8,
			Creator = var9,
			AgeRating = var10,
			ActionRow = if not isSmallScreen then reactModule.createElement(view, {
				tag = "row align-y-center gap-small auto-xy",
				LayoutOrder = 4
			}, {
				PlayBtn = reactModule.createElement(playButton, {
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
					width = UDim.new(0, if fFlagSduiScalePlayButtonAndImageSizes then edpFallbackActionBarPlayButtonWidth * var1.Config.UI.Scale else edpFallbackActionBarPlayButtonWidth),
					launchWhenLoading = if fFlagLuaAppLaunchWhenLoadingEdp then true else nil,
					launchOnReleaseAfterUnmount = if fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp then true else nil
				}),
				OverflowSkeleton1 = if var2 then reactModule.createElement(skeleton, {
					LayoutOrder = 2,
					Size = UDim2.fromOffset(var1.Size.Size_1200, var1.Size.Size_1200),
					radius = radius.Medium
				}) else nil,
				OverflowSkeleton2 = if var2 then reactModule.createElement(skeleton, {
					LayoutOrder = 3,
					Size = UDim2.fromOffset(var1.Size.Size_1200, var1.Size.Size_1200),
					radius = radius.Medium
				}) else nil
			}) else nil
		})
	})
end)