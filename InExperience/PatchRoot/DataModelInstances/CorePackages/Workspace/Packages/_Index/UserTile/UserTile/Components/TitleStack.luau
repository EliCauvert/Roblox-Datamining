local UserTile = script:FindFirstAncestor("UserTile")
local Parent = UserTile.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local Llama = require(Parent.LuaSocialLibrariesDeps).llama
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local VerifiedBadgeModule = require(Parent.VerifiedBadges.VerifiedBadge)
local ConstantsModule = require(UserTile.Constants)
local LayoutModeModule = require(script.Parent.Parent.Enums.LayoutMode)
local TextKeysModule = require(UserTile.TextKeys)
local View = FoundationModule.View
local Text = FoundationModule.Text
local Image = FoundationModule.Image
local Icon = FoundationModule.Icon
local Skeleton = FoundationModule.Skeleton
local Enums = FoundationModule.Enums
local StateLayerAffordance = Enums.StateLayerAffordance
local Radius = Enums.Radius
local IconSize = Enums.IconSize
local FFlagProfilePlatformNewProfileHeader = require(Parent.SharedFlags).FFlagProfilePlatformNewProfileHeader
local FFlagUserTileShowShimmerWhenLoadingModule = require(UserTile.Flags.FFlagUserTileShowShimmerWhenLoading)
local FFlagUserTileShowBadges = require(Parent.SharedFlags).FFlagUserTileShowBadges
local FFlagEnableBlackbirdCheck = require(Parent.SharedFlags).FFlagEnableBlackbirdCheck
local FFlagHidePremiumIconography = require(Parent.SharedFlags).FFlagHidePremiumIconography
local FFlagEnableMobileGameJoinCard = require(Parent.SharedFlags).FFlagEnableMobileGameJoinCard
local FFlagUserTileAddContextualInfoIcon = require(Parent.SharedFlags).FFlagUserTileAddContextualInfoIcon
local UserTileRemoveContextualInfoTag = game:DefineFastFlag("UserTileRemoveContextualInfoTag", false)
local FFlagUserTileTitleStackAddExtraInfo = require(Parent.SharedFlags).FFlagUserTileTitleStackAddExtraInfo
local FFlagUserTileUnfilteredChatIndicator = require(Parent.SharedFlags).FFlagUserTileUnfilteredChatIndicator
local FFlagUnifyVerifiedBadgeComponent = require(Parent.SharedFlags).FFlagUnifyVerifiedBadgeComponent
local FFlagSocialCarouselInGameTitleMarquee = require(Parent.SharedFlags).FFlagSocialCarouselInGameTitleMarquee
local config = { layoutOrder = 2 }

return function(p1)
	-- upvalues: Llama (copy), config (copy), UseTokensFunction (copy), LayoutModeModule (copy), ReactModule (copy), Image (copy), FFlagSocialCarouselInGameTitleMarquee (copy), FFlagUserTileTitleStackAddExtraInfo (copy), FFlagUserTileShowShimmerWhenLoadingModule (copy), ConstantsModule (copy), FFlagEnableBlackbirdCheck (copy), FFlagHidePremiumIconography (copy), UseLocalizationFunction (copy), TextKeysModule (copy), FFlagUserTileUnfilteredChatIndicator (copy), View (copy), Skeleton (copy), Radius (copy), FFlagProfilePlatformNewProfileHeader (copy), Text (copy), FFlagUserTileShowBadges (copy), FFlagUnifyVerifiedBadgeComponent (copy), VerifiedBadgeModule (copy), IconSize (copy), FoundationModule (copy), FFlagEnableMobileGameJoinCard (copy), StateLayerAffordance (copy), FFlagUserTileAddContextualInfoIcon (copy), Icon (copy), UserTileRemoveContextualInfoTag (copy)
	local JoinResult = Llama.Dictionary.join(config, p1 or {})
	local UseTokensResult = UseTokensFunction()
	local AlignXCenter: string = if JoinResult.layoutMode == LayoutModeModule.compact then "align-x-center" else "align-x-left"
	local Element = if JoinResult.titleIcon then ReactModule.createElement(Image, {
		tag = "size-300-300 radius-circle",
		LayoutOrder = 1,
		Image = JoinResult.titleIcon
	}) else nil
	local Subtitle = if typeof(JoinResult.subtitle) == "string" then JoinResult.subtitle else nil
	local Subtitle1 = if FFlagSocialCarouselInGameTitleMarquee and typeof(JoinResult.subtitle) == "table" then JoinResult.subtitle else nil
	local IsLayoutModeMatch: boolean = (not JoinResult.contextualInfo or Subtitle) and (JoinResult.layoutMode == LayoutModeModule.compact or Subtitle ~= nil)
	local FontSizeDelta = (JoinResult.titleStyle or UseTokensResult.Typography.TitleMedium).FontSize - UseTokensResult.Padding.XSmall * 2
	local FontSizeDelta1 = (JoinResult.subtitleStyle or UseTokensResult.Typography.BodyMedium).FontSize - UseTokensResult.Padding.XSmall * 2
	local FontSizeDelta2 = (JoinResult.contextualInfoStyle or UseTokensResult.Typography.BodySmall).FontSize - UseTokensResult.Padding.XSmall * 2
	local FontSizeDelta3 = if FFlagUserTileTitleStackAddExtraInfo then (JoinResult.extraInfoStyle or UseTokensResult.Typography.BodySmall).FontSize - UseTokensResult.Padding.XSmall * 2 else 0
	local IsLayoutModeMatch1 = if FFlagUserTileShowShimmerWhenLoadingModule then JoinResult.layoutMode == LayoutModeModule.compact else nil
	local XScale = nil
	local XScale1 = nil
	local XScale2 = nil
	local XScale3 = nil
	
	if FFlagUserTileShowShimmerWhenLoadingModule then
		if IsLayoutModeMatch1 then
			XScale = ConstantsModule.TITLE_SHIMMER_WIDTH_SCALE_COMPACT
			XScale1 = ConstantsModule.SUBTITLE_SHIMMER_WIDTH_SCALE_COMPACT
			XScale2 = ConstantsModule.CONTEXTUAL_INFO_SHIMMER_WIDTH_SCALE_COMPACT
			XScale3 = ConstantsModule.EXTRA_INFO_SHIMMER_WIDTH_SCALE_COMPACT
		else
			XScale = ConstantsModule.TITLE_SHIMMER_WIDTH_SCALE_WIDE
			XScale1 = ConstantsModule.SUBTITLE_SHIMMER_WIDTH_SCALE_WIDE
			XScale2 = ConstantsModule.CONTEXTUAL_INFO_SHIMMER_WIDTH_SCALE_WIDE
			XScale3 = ConstantsModule.EXTRA_INFO_SHIMMER_WIDTH_SCALE_WIDE
		end
	end
	local AlignXCenter1: string = if FFlagUserTileShowShimmerWhenLoadingModule and JoinResult.layoutMode == LayoutModeModule.compact then "align-x-center" else "align-x-left"
	local CustomTextTruncation = JoinResult.customTextTruncation or Enum.TextTruncate.AtEnd
	local IsIsRobloxSubscriber = if FFlagEnableBlackbirdCheck then JoinResult.isRobloxSubscriber == true else nil
	local NoIsIsRobloxSubscriber: boolean = not FFlagHidePremiumIconography and (JoinResult.isPremium and not IsIsRobloxSubscriber)
	local UseLocalizationResult = UseLocalizationFunction({
		trustedLabel = TextKeysModule.trustedLabel,
		unfilteredChatLabel = TextKeysModule.unfilteredChatLabel
	})
	local IsShouldShowUnfilteredChatIndicator: boolean = FFlagUserTileUnfilteredChatIndicator and JoinResult.shouldShowUnfilteredChatIndicator == true
	local v1 = (JoinResult.trustedConnectionIndicatorEnabled and JoinResult.isTrustedConnection) == true
	local IsNotSubtitleMatch: boolean = Subtitle ~= nil and Subtitle ~= ""
	
	return ReactModule.createElement(View, {
		tag = `{if JoinResult.layoutMode == LayoutModeModule.compact then "size-full-0" else "grow"} auto-y col`,
		LayoutOrder = JoinResult.layoutOrder
	}, {
		Title = if FFlagUserTileShowShimmerWhenLoadingModule and JoinResult.isTitleLoading then ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = `size-full-0 auto-y padding-xsmall {AlignXCenter1}`
		}, {
			TitleSkeleton = ReactModule.createElement(Skeleton, {
				Size = UDim2.new(XScale, 0, 0, FontSizeDelta),
				radius = Radius.Small
			})
		}) else ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = `size-full-0 row auto-y gap-xxsmall align-y-center {AlignXCenter}`
		}, {
			TitleIcon = Element,
			TitleText = if FFlagProfilePlatformNewProfileHeader then JoinResult.title and ReactModule.createElement(View, {
				LayoutOrder = 2,
				tag = {
					["row align-y-center gap-xsmall content-emphasis"] = true,
					["auto-xy text-align-x-center"] = JoinResult.layoutMode == LayoutModeModule.compact,
					["auto-y size-full-0 text-align-x-left"] = JoinResult.layoutMode == LayoutModeModule.wide
				}
			}, {
				Title = ReactModule.createElement(Text, {
					LayoutOrder = 1,
					RichText = true,
					tag = {
						["shrink content-default auto-xy"] = true,
						["text-align-x-left"] = JoinResult.layoutMode == LayoutModeModule.wide,
						["text-align-x-center"] = JoinResult.layoutMode == LayoutModeModule.compact
					},
					fontStyle = JoinResult.titleStyle or UseTokensResult.Typography.TitleMedium,
					Text = JoinResult.title,
					TextTruncate = CustomTextTruncation
				}),
				BadgesRow = if FFlagUserTileShowBadges then ReactModule.createElement(View, {
					tag = "row align-y-center auto-xy content-default gap-xxsmall",
					["text-align-x-left"] = JoinResult.layoutMode == LayoutModeModule.wide,
					["text-align-x-center"] = JoinResult.layoutMode == LayoutModeModule.compact,
					LayoutOrder = 2
				}, {
					VerifiedBadge = JoinResult.isVerified and (if FFlagUnifyVerifiedBadgeComponent then ReactModule.createElement(VerifiedBadgeModule, { LayoutOrder = 2, size = IconSize.Large }) else ReactModule.createElement(View, { tag = "auto-xy content-default", LayoutOrder = 2 }, {
						VerifiedBackplateIcon = ReactModule.createElement(FoundationModule.Icon, {
							ZIndex = 1,
							name = FoundationModule.Enums.IconName.VerifiedBackplate,
							size = FoundationModule.Enums.IconSize.Large,
							style = UseTokensResult.Color.System.Emphasis,
							AnchorPoint = Vector2.new(0, 0),
							Position = UDim2.fromScale(0, 0)
						}),
						VerifiedCheckIcon = ReactModule.createElement(FoundationModule.Icon, {
							ZIndex = 2,
							name = FoundationModule.Enums.IconName.VerifiedCheck,
							size = FoundationModule.Enums.IconSize.Large,
							style = { Transparency = 0, Color3 = Color3.fromRGB(255, 255, 255) },
							AnchorPoint = Vector2.new(0, 0),
							Position = UDim2.fromScale(0, 0)
						})
					})),
					SubscriptionBadge = if IsIsRobloxSubscriber then ReactModule.createElement(FoundationModule.Icon, {
						LayoutOrder = 3,
						name = FoundationModule.Enums.IconName.RobloxPlus,
						size = FoundationModule.Enums.IconSize.Small,
						style = UseTokensResult.Color.Content.Emphasis
					}) else nil,
					PremiumBadge = if NoIsIsRobloxSubscriber then ReactModule.createElement(FoundationModule.Icon, {
						LayoutOrder = 4,
						name = FoundationModule.Enums.IconName.Premium,
						size = FoundationModule.Enums.IconSize.Large
					}) else nil,
					AdminBadge = JoinResult.isRobloxAdmin and ReactModule.createElement(FoundationModule.Icon, {
						LayoutOrder = 5,
						name = FoundationModule.Enums.IconName.Tilt,
						size = FoundationModule.Enums.IconSize.Large
					})
				}) else nil
			}) else JoinResult.title and ReactModule.createElement(Text, {
				LayoutOrder = 2,
				RichText = true,
				tag = {
					["content-emphasis"] = true,
					["auto-xy text-align-x-center"] = JoinResult.layoutMode == LayoutModeModule.compact,
					["auto-y size-full-0 text-align-x-left"] = JoinResult.layoutMode == LayoutModeModule.wide
				},
				fontStyle = JoinResult.titleStyle or UseTokensResult.Typography.TitleMedium,
				Text = JoinResult.title,
				TextTruncate = CustomTextTruncation
			}) or nil
		}),
		Subtitle = if Subtitle1 then Subtitle1 elseif FFlagUserTileShowShimmerWhenLoadingModule and JoinResult.isSubtitleLoading then ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = `size-full-0 auto-y padding-xsmall {AlignXCenter1}`
		}, {
			SubtitleSkeleton = ReactModule.createElement(Skeleton, {
				Size = UDim2.new(XScale1, 0, 0, FontSizeDelta1),
				radius = Radius.Small
			})
		}) elseif IsLayoutModeMatch or IsShouldShowUnfilteredChatIndicator then ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = {
				["row auto-y size-full-0 align-y-center"] = true,
				["align-x-center"] = JoinResult.layoutMode == LayoutModeModule.compact,
				["align-x-left"] = JoinResult.layoutMode == LayoutModeModule.wide
			},
			onActivated = if (FFlagProfilePlatformNewProfileHeader or FFlagEnableMobileGameJoinCard) and JoinResult.onSubtitleClicked then function()
				-- upvalues: JoinResult (ref)
				JoinResult.onSubtitleClicked()
			end else nil,
			stateLayer = if (FFlagProfilePlatformNewProfileHeader or FFlagEnableMobileGameJoinCard) and JoinResult.onSubtitleClicked then { affordance = StateLayerAffordance.None } else nil
		}, {
			SubtitleText = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				RichText = true,
				tag = {
					["auto-xy shrink content-default"] = true,
					["text-align-x-center"] = JoinResult.layoutMode == LayoutModeModule.compact,
					["text-align-x-left"] = JoinResult.layoutMode == LayoutModeModule.wide
				},
				fontStyle = JoinResult.subtitleStyle or UseTokensResult.Typography.BodyMedium,
				Text = Subtitle or "",
				TextTruncate = CustomTextTruncation
			}),
			TCTextLabel = if JoinResult.trustedConnectionIndicatorEnabled and JoinResult.isTrustedConnection then ReactModule.createElement(Text, {
				LayoutOrder = 2,
				RichText = true,
				tag = {
					["auto-xy content-default"] = true,
					["text-align-x-center"] = JoinResult.layoutMode == LayoutModeModule.compact,
					["text-align-x-left"] = JoinResult.layoutMode == LayoutModeModule.wide
				},
				fontStyle = JoinResult.subtitleStyle or UseTokensResult.Typography.BodyMedium,
				Text = (if FFlagUserTileUnfilteredChatIndicator and not IsNotSubtitleMatch then "" else " • ") .. UseLocalizationResult.trustedLabel,
				TextTruncate = CustomTextTruncation
			}) else nil,
			UnfilteredChatLabel = if IsShouldShowUnfilteredChatIndicator then ReactModule.createElement(Text, {
				LayoutOrder = 3,
				RichText = true,
				tag = {
					["auto-xy content-default"] = true,
					["text-align-x-center"] = JoinResult.layoutMode == LayoutModeModule.compact,
					["text-align-x-left"] = JoinResult.layoutMode == LayoutModeModule.wide
				},
				fontStyle = JoinResult.subtitleStyle or UseTokensResult.Typography.BodyMedium,
				Text = (if IsNotSubtitleMatch or v1 then " • " else "") .. UseLocalizationResult.unfilteredChatLabel,
				TextTruncate = CustomTextTruncation
			}) else nil
		}) else nil,
		ContextualInfo = if FFlagUserTileShowShimmerWhenLoadingModule and JoinResult.isContextualInfoLoading then ReactModule.createElement(View, {
			LayoutOrder = 3,
			tag = `size-full-0 auto-y padding-xsmall {AlignXCenter1}`
		}, {
			ContextualInfoSkeleton = ReactModule.createElement(Skeleton, {
				Size = UDim2.new(XScale2, 0, 0, FontSizeDelta2),
				radius = Radius.Small
			})
		}) else JoinResult.contextualInfo and (if FFlagUserTileAddContextualInfoIcon and JoinResult.contextualInfoIcon then ReactModule.createElement(View, {
			LayoutOrder = 3,
			tag = {
				["row align-y-center gap-xsmall size-full-0 auto-y"] = true,
				["align-x-center"] = JoinResult.layoutMode == LayoutModeModule.compact,
				["align-x-left"] = JoinResult.layoutMode == LayoutModeModule.wide
			}
		}, {
			ContextualInfoIcon = ReactModule.createElement(Icon, {
				LayoutOrder = 1,
				name = JoinResult.contextualInfoIcon,
				size = IconSize.XSmall
			}),
			ContextualInfoText = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				RichText = true,
				tag = {
					["content-secondary shrink auto-xy"] = not UserTileRemoveContextualInfoTag,
					["shrink auto-xy"] = UserTileRemoveContextualInfoTag
				},
				fontStyle = JoinResult.contextualInfoStyle or UseTokensResult.Typography.BodySmall,
				TextTruncate = CustomTextTruncation,
				Text = JoinResult.contextualInfo
			})
		}) else ReactModule.createElement(Text, {
			LayoutOrder = 3,
			RichText = true,
			tag = {
				["auto-y size-full-0 content-secondary"] = not UserTileRemoveContextualInfoTag,
				["size-full-0 auto-y"] = UserTileRemoveContextualInfoTag,
				["text-align-x-center"] = JoinResult.layoutMode == LayoutModeModule.compact,
				["text-align-x-left"] = JoinResult.layoutMode == LayoutModeModule.wide
			},
			fontStyle = JoinResult.contextualInfoStyle or UseTokensResult.Typography.BodySmall,
			TextTruncate = CustomTextTruncation,
			Text = JoinResult.contextualInfo
		})) or nil,
		ExtraInfo = if FFlagUserTileTitleStackAddExtraInfo and JoinResult.isExtraInfoLoading then ReactModule.createElement(View, {
			LayoutOrder = 4,
			tag = `size-full-0 auto-y padding-xsmall {AlignXCenter1}`
		}, {
			ExtraInfoSkeleton = ReactModule.createElement(Skeleton, {
				Size = UDim2.new(XScale3, 0, 0, FontSizeDelta3),
				radius = Radius.Small
			})
		}) elseif FFlagUserTileTitleStackAddExtraInfo and JoinResult.extraInfo then ReactModule.createElement(Text, {
			LayoutOrder = 4,
			RichText = true,
			tag = {
				["size-full-0 auto-y"] = true,
				["text-align-x-center"] = JoinResult.layoutMode == LayoutModeModule.compact,
				["text-align-x-left"] = JoinResult.layoutMode == LayoutModeModule.wide
			},
			fontStyle = JoinResult.extraInfoStyle or UseTokensResult.Typography.BodySmall,
			TextTruncate = CustomTextTruncation,
			Text = JoinResult.extraInfo,
			onActivated = JoinResult.onExtraInfoClicked,
			stateLayer = if JoinResult.onExtraInfoClicked then { affordance = StateLayerAffordance.None } else nil
		}) else nil
	})
end