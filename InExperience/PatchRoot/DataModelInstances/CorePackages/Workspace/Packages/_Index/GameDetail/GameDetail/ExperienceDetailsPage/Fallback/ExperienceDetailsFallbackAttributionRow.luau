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
local fFlagLuaAppSduiEdpFallbackPlayButtonPassUiBlox = sharedFlagsModule.FFlagLuaAppSduiEdpFallbackPlayButtonPassUiBlox
local fFlagLuaAppSduiEdpFallbackPlayButtonUseUiBlox = sharedFlagsModule.FFlagLuaAppSduiEdpFallbackPlayButtonUseUiBlox
local fFlagLuaAppLaunchWhenLoadingEdp = sharedFlagsModule.FFlagLuaAppLaunchWhenLoadingEdp
local fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp = sharedFlagsModule.FFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp
local fFlagLuaAppSduiEdpFallbackAttributionFromCache = sharedFlagsModule.FFlagLuaAppSduiEdpFallbackAttributionFromCache
local fFlagSduiScalePlayButtonAndImageSizes = sharedFlagsModule.FFlagSduiScalePlayButtonAndImageSizes

local function VerifiedBadgeIcon() --[[ line: 46 ]]
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), icon (ref), foundationModule (ref)
	local var6 = useTokens()
	
	return reactModule.createElement(view, { LayoutOrder = 2, tag = "auto-xy" }, {
		Backplate = reactModule.createElement(icon, {
			ZIndex = 1,
			name = foundationModule.Enums.IconName.VerifiedBackplate,
			style = var6.Color.System.Emphasis,
			size = foundationModule.Enums.IconSize.Small
		}),
		Check = reactModule.createElement(icon, {
			ZIndex = 2,
			name = foundationModule.Enums.IconName.VerifiedCheck,
			size = foundationModule.Enums.IconSize.Small,
			variant = foundationModule.Enums.IconVariant.Filled,
			style = var6.Color.Extended.White.White_100
		})
	})
end

return reactModule.memo(function(p0) --[[ line: 68 | named "FallbackAttributionRow" ]]
	-- upvalues: useTokens (ref), fFlagSduiScalePlayButtonAndImageSizes (ref), useImageLoadFadeModule (ref), reactModule (ref), view (ref), image (ref), skeleton (ref), text (ref), radius (ref), VerifiedBadgeIcon (ref), fFlagLuaAppSduiEdpFallbackAttributionFromCache (ref), playButton (ref), fFlagLuaAppSduiEdpFallbackPlayButtonPassUiBlox (ref), fFlagLuaAppSduiEdpFallbackPlayButtonUseUiBlox (ref), buttonSize (ref), edpFallbackActionBarPlayButtonWidth (ref), fFlagLuaAppLaunchWhenLoadingEdp (ref), fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp (ref)
	local var7 = useTokens()
	local isSmallScreen = p0.isSmallScreen
	local var8 = p0.isLoading == true
	local var9 = if isSmallScreen then var7.Size.Size_1400 else var7.Size.Size_2500 * 2
	local _ = nil
	local var10 = if isSmallScreen then 150 elseif fFlagSduiScalePlayButtonAndImageSizes and var9 > 256 then 512 else 256
	local var11 = useImageLoadFadeModule()
	local var12 = reactModule.createElement(view, { LayoutOrder = 1, Size = UDim2.fromOffset(var9, var9) }, {
		GameIcon = reactModule.createElement(image, {
			tag = "radius-medium",
			Image = string.format("rbxthumb://type=GameIcon&id=%s&w=%d&h=%d", p0.universeId, var10, var10),
			Size = UDim2.fromScale(1, 1),
			onLoaded = var11.onLoaded
		}),
		SkeletonOverlay = if var11.skeletonVisible then reactModule.createElement(view, {
			tag = "radius-medium",
			ZIndex = 2,
			ClipsDescendants = true,
			Size = UDim2.fromScale(1, 1),
			GroupTransparency = var11.overlayTransparency
		}, {
			Skeleton = reactModule.createElement(skeleton, { Size = UDim2.fromScale(1, 1) })
		}) else nil
	})
	local var13 = if isSmallScreen then var7.Typography.CaptionLarge.LineHeight * var7.Typography.CaptionLarge.FontSize else var7.Typography.BodyMedium.LineHeight * var7.Typography.BodyMedium.FontSize
	local var14 = nil
	
	if p0.gameName then
		var14 = reactModule.createElement(text, {
			LayoutOrder = 1,
			testId = "--edp-fallback-attribution-title",
			tag = {
				["auto-xy text-wrap text-align-x-left text-truncate-none"] = true,
				["text-heading-small"] = isSmallScreen,
				["text-heading-large"] = not isSmallScreen
			},
			Text = p0.gameName
		})
	elseif var8 then
		var14 = reactModule.createElement(skeleton, {
			LayoutOrder = 1,
			Size = UDim2.fromOffset(var7.Size.Size_2800 * 2, if isSmallScreen then var13 else var7.Typography.HeadingMedium.LineHeight * var7.Typography.HeadingMedium.FontSize),
			radius = radius.Small
		})
	end
	local var15 = nil
	
	if p0.creatorName then
		var15 = reactModule.createElement(view, {
			tag = "row align-y-center gap-xsmall auto-xy",
			LayoutOrder = 2
		}, {
			CreatorName = reactModule.createElement(text, {
				tag = "auto-xy text-body-medium content-default",
				LayoutOrder = 1,
				testId = "--edp-fallback-attribution-creator",
				Text = p0.creatorName,
				TextTruncate = Enum.TextTruncate.None
			}),
			Badge = if p0.hasVerifiedBadge then reactModule.createElement(VerifiedBadgeIcon) else nil
		})
	elseif var8 then
		var15 = reactModule.createElement(skeleton, {
			LayoutOrder = 2,
			testId = "--edp-fallback-attribution-creator-skeleton",
			Size = UDim2.fromOffset(var7.Size.Size_2800 * 2, if fFlagLuaAppSduiEdpFallbackAttributionFromCache then var7.Typography.BodyLarge.FontSize * var7.Typography.BodyLarge.LineHeight else var13),
			radius = radius.Small
		})
	end
	local var16 = nil
	
	if p0.ageRecDisplayName then
		var16 = reactModule.createElement(text, {
			tag = "auto-xy text-body-medium content-default",
			LayoutOrder = 3,
			testId = "--edp-fallback-attribution-age-rating",
			Text = p0.ageRecDisplayName
		})
	elseif var8 then
		local fontSize
		local _ = nil
		
		if fFlagLuaAppSduiEdpFallbackAttributionFromCache then
			fontSize = var7.Typography.BodyMedium.FontSize
			
			if not isSmallScreen then
				fontSize += var7.Padding.XSmall
			end
		else
			fontSize = var13
		end
		var16 = reactModule.createElement(skeleton, {
			LayoutOrder = 3,
			testId = "--edp-fallback-attribution-age-rating-skeleton",
			Size = UDim2.fromOffset(if isSmallScreen then var7.Size.Size_2400 else var7.Size.Size_2800, fontSize),
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
		Icon = var12,
		ContentColumn = reactModule.createElement(view, {
			LayoutOrder = 2,
			testId = "--edp-fallback-attribution-content-column",
			tag = {
				["col fill gap-xsmall auto-xy"] = fFlagLuaAppSduiEdpFallbackAttributionFromCache,
				["col fill gap-small auto-xy"] = not fFlagLuaAppSduiEdpFallbackAttributionFromCache
			}
		}, {
			Title = var14,
			Creator = var15,
			AgeRating = var16,
			ActionRow = if not isSmallScreen then reactModule.createElement(view, {
				tag = "row align-y-center gap-small auto-xy",
				LayoutOrder = 4
			}, {
				PlayBtn = reactModule.createElement(playButton, {
					expandWidthForSecondaryPlayButton = true,
					LayoutOrder = 1,
					testId = "--edp-fallback-feed-play-button",
					universeId = p0.universeId,
					referralSource = p0.referralSource,
					launchSource = p0.launchSource,
					experienceJoinData = p0.experienceJoinData,
					placeId = p0.placeIdOverride,
					useUIBloxButton = if fFlagLuaAppSduiEdpFallbackPlayButtonPassUiBlox then fFlagLuaAppSduiEdpFallbackPlayButtonUseUiBlox else true,
					buttonSize = buttonSize.Large,
					width = UDim.new(0, if fFlagSduiScalePlayButtonAndImageSizes then edpFallbackActionBarPlayButtonWidth * var7.Config.UI.Scale else edpFallbackActionBarPlayButtonWidth),
					launchWhenLoading = if fFlagLuaAppLaunchWhenLoadingEdp then true else nil,
					launchOnReleaseAfterUnmount = if fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp then true else nil
				}),
				OverflowSkeleton1 = if var8 then reactModule.createElement(skeleton, {
					LayoutOrder = 2,
					Size = UDim2.fromOffset(var7.Size.Size_1200, var7.Size.Size_1200),
					radius = radius.Medium
				}) else nil,
				OverflowSkeleton2 = if var8 then reactModule.createElement(skeleton, {
					LayoutOrder = 3,
					Size = UDim2.fromOffset(var7.Size.Size_1200, var7.Size.Size_1200),
					radius = radius.Medium
				}) else nil
			}) else nil
		})
	})
end)