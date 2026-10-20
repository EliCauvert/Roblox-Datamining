local EdpFallbackActionBarPlayButtonWidth = game:DefineFastInt("EdpFallbackActionBarPlayButtonWidth", 236)
local EdpFallbackIconSize = game:DefineFastInt("EdpFallbackIconSize", 140)
local Parent = script:FindFirstAncestor("GameDetail").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Image = FoundationModule.Image
local Text = FoundationModule.Text
local Icon = FoundationModule.Icon
local Skeleton = FoundationModule.Skeleton
local Radius = FoundationModule.Enums.Radius
local ButtonSize = FoundationModule.Enums.ButtonSize
local UseTokensFunction = FoundationModule.Hooks.useTokens
local PlayButton = require(Parent.GamePlayButton).PlayButton
local UseImageLoadFadeModule = require(script.Parent.Parent.useImageLoadFade)
local ResponsiveModule = require(Parent.Responsive)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagLuaAppMediaGalleryGamepadSupport = SharedFlagsModule.FFlagLuaAppMediaGalleryGamepadSupport
local FFlagLuaAppLaunchWhenLoadingEdp = SharedFlagsModule.FFlagLuaAppLaunchWhenLoadingEdp
local FFlagLuaAppSduiEdpFallbackAttributionFromCache = SharedFlagsModule.FFlagLuaAppSduiEdpFallbackAttributionFromCache
local FFlagSduiScalePlayButtonAndImageSizes = SharedFlagsModule.FFlagSduiScalePlayButtonAndImageSizes
local FFlagEnableGameJoinEarlyAccess = SharedFlagsModule.FFlagEnableGameJoinEarlyAccess

local function VerifiedBadgeIcon()
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), Icon (copy), FoundationModule (copy)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(View, { LayoutOrder = 2, tag = "auto-xy" }, {
		Backplate = ReactModule.createElement(Icon, {
			ZIndex = 1,
			name = FoundationModule.Enums.IconName.VerifiedBackplate,
			style = UseTokensResult.Color.System.Emphasis,
			size = FoundationModule.Enums.IconSize.Small
		}),
		Check = ReactModule.createElement(Icon, {
			ZIndex = 2,
			name = FoundationModule.Enums.IconName.VerifiedCheck,
			size = FoundationModule.Enums.IconSize.Small,
			variant = FoundationModule.Enums.IconVariant.Filled,
			style = UseTokensResult.Color.Extended.White.White_100
		})
	})
end

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), FFlagLuaAppMediaGalleryGamepadSupport (copy), ResponsiveModule (copy), EdpFallbackIconSize (copy), FFlagSduiScalePlayButtonAndImageSizes (copy), UseImageLoadFadeModule (copy), ReactModule (copy), View (copy), Image (copy), Skeleton (copy), Text (copy), Radius (copy), VerifiedBadgeIcon (copy), FFlagLuaAppSduiEdpFallbackAttributionFromCache (copy), PlayButton (copy), ButtonSize (copy), EdpFallbackActionBarPlayButtonWidth (copy), FFlagLuaAppLaunchWhenLoadingEdp (copy), FFlagEnableGameJoinEarlyAccess (copy)
	local UseTokensResult = UseTokensFunction()
	local IsSmallScreen = p1.isSmallScreen
	local IsIsLoading = p1.isLoading == true
	local IsUseLastInputResultMatch: boolean = if FFlagLuaAppMediaGalleryGamepadSupport then ResponsiveModule.useLastInput() == ResponsiveModule.Input.Directional else false
	local Size1400 = if IsSmallScreen then UseTokensResult.Size.Size_1400 elseif FFlagLuaAppMediaGalleryGamepadSupport and IsUseLastInputResultMatch and EdpFallbackIconSize > 0 then if FFlagSduiScalePlayButtonAndImageSizes then EdpFallbackIconSize * UseTokensResult.Config.UI.Scale else EdpFallbackIconSize else UseTokensResult.Size.Size_2500 * 2
	local v1: number = if IsSmallScreen then 150 elseif FFlagSduiScalePlayButtonAndImageSizes and Size1400 > 256 then 512 else 256
	local Formatted = string.format("rbxthumb://type=GameIcon&id=%s&w=%d&h=%d", p1.universeId, v1, v1)
	local UseImageLoadFadeModuleResult = UseImageLoadFadeModule()
	local Element = ReactModule.createElement(View, {
		LayoutOrder = 1,
		testId = "--edp-fallback-attribution-icon",
		Size = UDim2.fromOffset(Size1400, Size1400)
	}, {
		GameIcon = ReactModule.createElement(Image, {
			tag = "radius-medium",
			Image = Formatted,
			Size = UDim2.fromScale(1, 1),
			onLoaded = UseImageLoadFadeModuleResult.onLoaded
		}),
		SkeletonOverlay = if UseImageLoadFadeModuleResult.skeletonVisible then ReactModule.createElement(View, {
			tag = "radius-medium",
			ZIndex = 2,
			ClipsDescendants = true,
			Size = UDim2.fromScale(1, 1),
			GroupTransparency = UseImageLoadFadeModuleResult.overlayTransparency
		}, {
			Skeleton = ReactModule.createElement(Skeleton, { Size = UDim2.fromScale(1, 1) })
		}) else nil
	})
	local ScaledLineHeight = if IsSmallScreen then UseTokensResult.Typography.CaptionLarge.LineHeight * UseTokensResult.Typography.CaptionLarge.FontSize else UseTokensResult.Typography.BodyMedium.LineHeight * UseTokensResult.Typography.BodyMedium.FontSize
	local Element1 = if p1.gameName then ReactModule.createElement(Text, {
		LayoutOrder = 1,
		testId = "--edp-fallback-attribution-title",
		tag = {
			["auto-xy text-wrap text-align-x-left text-truncate-none"] = true,
			["text-heading-small"] = IsSmallScreen,
			["text-heading-large"] = not IsSmallScreen
		},
		Text = p1.gameName
	}) elseif IsIsLoading then ReactModule.createElement(Skeleton, {
		LayoutOrder = 1,
		Size = UDim2.fromOffset(UseTokensResult.Size.Size_2800 * 2, if IsSmallScreen then ScaledLineHeight else UseTokensResult.Typography.HeadingMedium.LineHeight * UseTokensResult.Typography.HeadingMedium.FontSize),
		radius = Radius.Small
	}) else nil
	local Element2 = if p1.creatorName then ReactModule.createElement(View, {
		tag = "row align-y-center gap-xsmall auto-xy",
		LayoutOrder = 2
	}, {
		CreatorName = ReactModule.createElement(Text, {
			tag = "auto-xy text-body-medium content-default",
			LayoutOrder = 1,
			testId = "--edp-fallback-attribution-creator",
			Text = p1.creatorName,
			TextTruncate = Enum.TextTruncate.None
		}),
		Badge = if p1.hasVerifiedBadge then ReactModule.createElement(VerifiedBadgeIcon) else nil
	}) elseif IsIsLoading then ReactModule.createElement(Skeleton, {
		LayoutOrder = 2,
		testId = "--edp-fallback-attribution-creator-skeleton",
		Size = UDim2.fromOffset(UseTokensResult.Size.Size_2800 * 2, if FFlagLuaAppSduiEdpFallbackAttributionFromCache then UseTokensResult.Typography.BodyLarge.FontSize * UseTokensResult.Typography.BodyLarge.LineHeight else ScaledLineHeight),
		radius = Radius.Small
	}) else nil
	local Element3 = nil
	
	if p1.ageRecDisplayName then
		Element3 = ReactModule.createElement(Text, {
			tag = "auto-xy text-body-medium content-default",
			LayoutOrder = 3,
			testId = "--edp-fallback-attribution-age-rating",
			Text = p1.ageRecDisplayName
		})
	elseif IsIsLoading then
		local FontSize = nil
		if FFlagLuaAppSduiEdpFallbackAttributionFromCache then
			FontSize = UseTokensResult.Typography.BodyMedium.FontSize
			
			if not IsSmallScreen then
				FontSize += UseTokensResult.Padding.XSmall
			end
		else
			FontSize = ScaledLineHeight
		end
		Element3 = ReactModule.createElement(Skeleton, {
			LayoutOrder = 3,
			testId = "--edp-fallback-attribution-age-rating-skeleton",
			Size = UDim2.fromOffset(if IsSmallScreen then UseTokensResult.Size.Size_2400 else UseTokensResult.Size.Size_2800, FontSize),
			radius = Radius.Small
		})
	end
	return ReactModule.createElement(View, {
		LayoutOrder = 1,
		tag = {
			["row size-full-0 auto-y"] = true,
			["gap-medium"] = IsSmallScreen,
			["gap-xlarge"] = not IsSmallScreen,
			["align-y-center"] = IsSmallScreen,
			["align-y-bottom"] = not IsSmallScreen
		}
	}, {
		Icon = Element,
		ContentColumn = ReactModule.createElement(View, {
			LayoutOrder = 2,
			testId = "--edp-fallback-attribution-content-column",
			tag = {
				["col fill gap-xsmall auto-xy"] = FFlagLuaAppSduiEdpFallbackAttributionFromCache,
				["col fill gap-small auto-xy"] = not FFlagLuaAppSduiEdpFallbackAttributionFromCache
			}
		}, {
			Title = Element1,
			Creator = Element2,
			AgeRating = Element3,
			ActionRow = if IsSmallScreen then nil else ReactModule.createElement(View, {
				tag = "row align-y-center gap-small auto-xy",
				LayoutOrder = 4
			}, {
				PlayBtn = ReactModule.createElement(PlayButton, {
					useUIBloxButton = true,
					launchOnReleaseAfterUnmount = true,
					expandWidthForSecondaryPlayButton = true,
					LayoutOrder = 1,
					testId = "--edp-fallback-feed-play-button",
					universeId = p1.universeId,
					referralSource = p1.referralSource,
					launchSource = p1.launchSource,
					experienceJoinData = p1.experienceJoinData,
					placeId = p1.placeIdOverride,
					buttonSize = ButtonSize.Large,
					width = UDim.new(0, if FFlagSduiScalePlayButtonAndImageSizes then EdpFallbackActionBarPlayButtonWidth * UseTokensResult.Config.UI.Scale else EdpFallbackActionBarPlayButtonWidth),
					launchWhenLoading = if FFlagLuaAppLaunchWhenLoadingEdp then true else nil,
					enableEarlyAccessPlusTooltip = if FFlagEnableGameJoinEarlyAccess then true else nil
				}),
				OverflowSkeleton1 = if IsIsLoading then ReactModule.createElement(Skeleton, {
					LayoutOrder = 2,
					Size = UDim2.fromOffset(UseTokensResult.Size.Size_1200, UseTokensResult.Size.Size_1200),
					radius = Radius.Medium
				}) else nil,
				OverflowSkeleton2 = if IsIsLoading then ReactModule.createElement(Skeleton, {
					LayoutOrder = 3,
					Size = UDim2.fromOffset(UseTokensResult.Size.Size_1200, UseTokensResult.Size.Size_1200),
					radius = Radius.Medium
				}) else nil
			})
		})
	})
end)