local userTile = script:FindFirstAncestor("UserTile")
local parent = userTile.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local llama = require(parent.LuaSocialLibrariesDeps).llama
local useLocalization = require(parent.Localization).Hooks.useLocalization
local verifiedBadgeModule = require(parent.VerifiedBadges.VerifiedBadge)
local constantsModule = require(userTile.Constants)
local layoutModeModule = require(script.Parent.Parent.Enums.LayoutMode)
local textKeysModule = require(userTile.TextKeys)
local view = foundationModule.View
local text = foundationModule.Text
local image = foundationModule.Image
local icon = foundationModule.Icon
local skeleton = foundationModule.Skeleton
local enums = foundationModule.Enums
local stateLayerAffordance = enums.StateLayerAffordance
local radius = enums.Radius
local iconSize = enums.IconSize
local fFlagProfilePlatformNewProfileHeader = require(parent.SharedFlags).FFlagProfilePlatformNewProfileHeader
local fFlagUserTileShowShimmerWhenLoadingModule = require(userTile.Flags.FFlagUserTileShowShimmerWhenLoading)
local fFlagUserTileShowBadges = require(parent.SharedFlags).FFlagUserTileShowBadges
local fFlagEnableBlackbirdCheck = require(parent.SharedFlags).FFlagEnableBlackbirdCheck
local fFlagHidePremiumIconography = require(parent.SharedFlags).FFlagHidePremiumIconography
local fFlagEnableMobileGameJoinCard = require(parent.SharedFlags).FFlagEnableMobileGameJoinCard
local fFlagUserTileAddContextualInfoIcon = require(parent.SharedFlags).FFlagUserTileAddContextualInfoIcon
local userTileRemoveContextualInfoTag = game:DefineFastFlag("UserTileRemoveContextualInfoTag", false)
local fFlagUserTileTitleStackAddExtraInfo = require(parent.SharedFlags).FFlagUserTileTitleStackAddExtraInfo
local fFlagUserTileUnfilteredChatIndicator = require(parent.SharedFlags).FFlagUserTileUnfilteredChatIndicator
local fFlagUnifyVerifiedBadgeComponent = require(parent.SharedFlags).FFlagUnifyVerifiedBadgeComponent
local fFlagSocialCarouselInGameTitleMarquee = require(parent.SharedFlags).FFlagSocialCarouselInGameTitleMarquee
local t = { layoutOrder = 2 }

return function(p1)
	-- upvalues: llama (ref), t (ref), useTokens (ref), layoutModeModule (ref), reactModule (ref), image (ref), fFlagSocialCarouselInGameTitleMarquee (ref), fFlagUserTileTitleStackAddExtraInfo (ref), fFlagUserTileShowShimmerWhenLoadingModule (ref), constantsModule (ref), fFlagEnableBlackbirdCheck (ref), fFlagHidePremiumIconography (ref), useLocalization (ref), textKeysModule (ref), fFlagUserTileUnfilteredChatIndicator (ref), view (ref), skeleton (ref), radius (ref), fFlagProfilePlatformNewProfileHeader (ref), text (ref), fFlagUserTileShowBadges (ref), fFlagUnifyVerifiedBadgeComponent (ref), verifiedBadgeModule (ref), iconSize (ref), foundationModule (ref), fFlagEnableMobileGameJoinCard (ref), stateLayerAffordance (ref), fFlagUserTileAddContextualInfoIcon (ref), icon (ref), userTileRemoveContextualInfoTag (ref)
	local var1
	p1 = llama.Dictionary.join(t, p1 or {})
	local var2 = useTokens()
	local var3 = if p1.layoutMode == layoutModeModule.compact then "align-x-center" else "align-x-left"
	local var4 = if p1.titleIcon then reactModule.createElement(image, {
		tag = "size-300-300 radius-circle",
		LayoutOrder = 1,
		Image = p1.titleIcon
	}) else nil
	local var5 = if typeof(p1.subtitle) == "string" then p1.subtitle else nil
	local var6 = if fFlagSocialCarouselInGameTitleMarquee and typeof(p1.subtitle) == "table" then p1.subtitle else nil
	local var7 = if p1.contextualInfo and not var5 then false elseif p1.layoutMode ~= layoutModeModule.compact then var5 ~= nil else true
	local var8 = (p1.titleStyle or var2.Typography.TitleMedium).FontSize - var2.Padding.XSmall * 2
	local var9 = (p1.subtitleStyle or var2.Typography.BodyMedium).FontSize - var2.Padding.XSmall * 2
	local var10 = (p1.contextualInfoStyle or var2.Typography.BodySmall).FontSize - var2.Padding.XSmall * 2
	local var11 = if fFlagUserTileTitleStackAddExtraInfo then (p1.extraInfoStyle or var2.Typography.BodySmall).FontSize - var2.Padding.XSmall * 2 else 0
	
	if fFlagUserTileShowShimmerWhenLoadingModule then
		var1 = p1.layoutMode == layoutModeModule.compact
		var1 = nil
	else
		var1 = nil
	end
	local TITLE_SHIMMER_WIDTH_SCALE_WIDE = nil
	local SUBTITLE_SHIMMER_WIDTH_SCALE_WIDE = nil
	local CONTEXTUAL_INFO_SHIMMER_WIDTH_SCALE_WIDE = nil
	local EXTRA_INFO_SHIMMER_WIDTH_SCALE_WIDE = nil
	
	if fFlagUserTileShowShimmerWhenLoadingModule then
		if var1 then
			TITLE_SHIMMER_WIDTH_SCALE_WIDE = constantsModule.TITLE_SHIMMER_WIDTH_SCALE_COMPACT
			SUBTITLE_SHIMMER_WIDTH_SCALE_WIDE = constantsModule.SUBTITLE_SHIMMER_WIDTH_SCALE_COMPACT
			CONTEXTUAL_INFO_SHIMMER_WIDTH_SCALE_WIDE = constantsModule.CONTEXTUAL_INFO_SHIMMER_WIDTH_SCALE_COMPACT
			EXTRA_INFO_SHIMMER_WIDTH_SCALE_WIDE = constantsModule.EXTRA_INFO_SHIMMER_WIDTH_SCALE_COMPACT
		else
			TITLE_SHIMMER_WIDTH_SCALE_WIDE = constantsModule.TITLE_SHIMMER_WIDTH_SCALE_WIDE
			SUBTITLE_SHIMMER_WIDTH_SCALE_WIDE = constantsModule.SUBTITLE_SHIMMER_WIDTH_SCALE_WIDE
			CONTEXTUAL_INFO_SHIMMER_WIDTH_SCALE_WIDE = constantsModule.CONTEXTUAL_INFO_SHIMMER_WIDTH_SCALE_WIDE
			EXTRA_INFO_SHIMMER_WIDTH_SCALE_WIDE = constantsModule.EXTRA_INFO_SHIMMER_WIDTH_SCALE_WIDE
		end
	end
	local var12
	local var13 = if fFlagUserTileShowShimmerWhenLoadingModule and p1.layoutMode == layoutModeModule.compact then "align-x-center" else "align-x-left"
	local var14 = if p1.layoutMode == layoutModeModule.compact then "size-full-0" else "grow"
	local customTextTruncation = p1.customTextTruncation or Enum.TextTruncate.AtEnd
	
	if fFlagEnableBlackbirdCheck then
		var12 = p1.isRobloxSubscriber == true
		var12 = nil
	else
		var12 = nil
	end
	local var15
	local var16 = if fFlagHidePremiumIconography then false else p1.isPremium and not var12
	local var17 = useLocalization({
		trustedLabel = textKeysModule.trustedLabel,
		unfilteredChatLabel = textKeysModule.unfilteredChatLabel
	})
	local var18 = fFlagUserTileUnfilteredChatIndicator and p1.shouldShowUnfilteredChatIndicator == true
	local var19 = (p1.trustedConnectionIndicatorEnabled and p1.isTrustedConnection) == true
	local var20 = var5 ~= nil and var5 ~= ""
	local createElement = reactModule.createElement
	local t_1 = { tag = `{var14} auto-y col`, LayoutOrder = p1.layoutOrder }
	local t_2 = {
		Title = if fFlagUserTileShowShimmerWhenLoadingModule and p1.isTitleLoading then reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = `size-full-0 auto-y padding-xsmall {var13}`
		}, {
			TitleSkeleton = reactModule.createElement(skeleton, {
				Size = UDim2.new(TITLE_SHIMMER_WIDTH_SCALE_WIDE, 0, 0, var8),
				radius = radius.Small
			})
		}) else reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = `size-full-0 row auto-y gap-xxsmall align-y-center {var3}`
		}, {
			TitleIcon = var4,
			TitleText = if fFlagProfilePlatformNewProfileHeader then p1.title and reactModule.createElement(view, {
				LayoutOrder = 2,
				tag = {
					["row align-y-center gap-xsmall content-emphasis"] = true,
					["auto-xy text-align-x-center"] = p1.layoutMode == layoutModeModule.compact,
					["auto-y size-full-0 text-align-x-left"] = p1.layoutMode == layoutModeModule.wide
				}
			}, {
				Title = reactModule.createElement(text, {
					LayoutOrder = 1,
					RichText = true,
					tag = {
						["shrink content-default auto-xy"] = true,
						["text-align-x-left"] = p1.layoutMode == layoutModeModule.wide,
						["text-align-x-center"] = p1.layoutMode == layoutModeModule.compact
					},
					fontStyle = p1.titleStyle or var2.Typography.TitleMedium,
					Text = p1.title,
					TextTruncate = customTextTruncation
				}),
				BadgesRow = if fFlagUserTileShowBadges then reactModule.createElement(view, {
					tag = "row align-y-center auto-xy content-default gap-xxsmall",
					["text-align-x-left"] = p1.layoutMode == layoutModeModule.wide,
					["text-align-x-center"] = p1.layoutMode == layoutModeModule.compact,
					LayoutOrder = 2
				}, {
					VerifiedBadge = p1.isVerified and (if fFlagUnifyVerifiedBadgeComponent then reactModule.createElement(verifiedBadgeModule, { LayoutOrder = 2, size = iconSize.Large }) else reactModule.createElement(view, { tag = "auto-xy content-default", LayoutOrder = 2 }, {
						VerifiedBackplateIcon = reactModule.createElement(foundationModule.Icon, {
							ZIndex = 1,
							name = foundationModule.Enums.IconName.VerifiedBackplate,
							size = foundationModule.Enums.IconSize.Large,
							style = var2.Color.System.Emphasis,
							AnchorPoint = Vector2.new(0, 0),
							Position = UDim2.fromScale(0, 0)
						}),
						VerifiedCheckIcon = reactModule.createElement(foundationModule.Icon, {
							ZIndex = 2,
							name = foundationModule.Enums.IconName.VerifiedCheck,
							size = foundationModule.Enums.IconSize.Large,
							style = { Transparency = 0, Color3 = Color3.fromRGB(255, 255, 255) },
							AnchorPoint = Vector2.new(0, 0),
							Position = UDim2.fromScale(0, 0)
						})
					})),
					SubscriptionBadge = if var12 then reactModule.createElement(foundationModule.Icon, {
						LayoutOrder = 3,
						name = foundationModule.Enums.IconName.RobloxPlus,
						size = foundationModule.Enums.IconSize.Small,
						style = var2.Color.Content.Emphasis
					}) else nil,
					PremiumBadge = if var16 then reactModule.createElement(foundationModule.Icon, {
						LayoutOrder = 4,
						name = foundationModule.Enums.IconName.Premium,
						size = foundationModule.Enums.IconSize.Large
					}) else nil,
					AdminBadge = p1.isRobloxAdmin and reactModule.createElement(foundationModule.Icon, {
						LayoutOrder = 5,
						name = foundationModule.Enums.IconName.Tilt,
						size = foundationModule.Enums.IconSize.Large
					})
				}) else nil
			}) else p1.title and reactModule.createElement(text, {
				LayoutOrder = 2,
				RichText = true,
				tag = {
					["content-emphasis"] = true,
					["auto-xy text-align-x-center"] = p1.layoutMode == layoutModeModule.compact,
					["auto-y size-full-0 text-align-x-left"] = p1.layoutMode == layoutModeModule.wide
				},
				fontStyle = p1.titleStyle or var2.Typography.TitleMedium,
				Text = p1.title,
				TextTruncate = customTextTruncation
			}) or nil
		})
	}
	
	if var6 then
		var15 = var6
	elseif fFlagUserTileShowShimmerWhenLoadingModule and p1.isSubtitleLoading then
		var15 = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = `size-full-0 auto-y padding-xsmall {var13}`
		}, {
			SubtitleSkeleton = reactModule.createElement(skeleton, {
				Size = UDim2.new(SUBTITLE_SHIMMER_WIDTH_SCALE_WIDE, 0, 0, var9),
				radius = radius.Small
			})
		})
	elseif var7 or var18 then
		local var21
		var15 = reactModule.createElement
		local var22 = view
		local t_3 = {
			LayoutOrder = 2,
			tag = {
				["row auto-y size-full-0 align-y-center"] = true,
				["align-x-center"] = p1.layoutMode == layoutModeModule.compact,
				["align-x-left"] = p1.layoutMode == layoutModeModule.wide
			},
			onActivated = if (fFlagProfilePlatformNewProfileHeader or fFlagEnableMobileGameJoinCard) and p1.onSubtitleClicked then function()
				-- upvalues: p1 (write)
				p1.onSubtitleClicked()
			end else nil,
			stateLayer = if (fFlagProfilePlatformNewProfileHeader or fFlagEnableMobileGameJoinCard) and p1.onSubtitleClicked then { affordance = stateLayerAffordance.None } else nil
		}
		local t_4 = {
			SubtitleText = reactModule.createElement(text, {
				LayoutOrder = 1,
				RichText = true,
				tag = {
					["auto-xy shrink content-default"] = true,
					["text-align-x-center"] = p1.layoutMode == layoutModeModule.compact,
					["text-align-x-left"] = p1.layoutMode == layoutModeModule.wide
				},
				fontStyle = p1.subtitleStyle or var2.Typography.BodyMedium,
				Text = var5 or "",
				TextTruncate = customTextTruncation
			})
		}
		
		if p1.trustedConnectionIndicatorEnabled and p1.isTrustedConnection then
			var21 = reactModule.createElement
			var21 = var21(text, {
				LayoutOrder = 2,
				RichText = true,
				tag = {
					["auto-xy content-default"] = true,
					["text-align-x-center"] = p1.layoutMode == layoutModeModule.compact,
					["text-align-x-left"] = p1.layoutMode == layoutModeModule.wide
				},
				fontStyle = p1.subtitleStyle or var2.Typography.BodyMedium,
				Text = (if fFlagUserTileUnfilteredChatIndicator and not var20 then "" else " \226\128\162 ") .. var26.trustedLabel,
				TextTruncate = customTextTruncation
			})
		else
			var21 = nil
		end
		local createElement_1
		t_4.TCTextLabel = var21
		
		if var18 then
			createElement_1 = reactModule.createElement
			createElement_1 = createElement_1(text, {
				LayoutOrder = 3,
				RichText = true,
				tag = {
					["auto-xy content-default"] = true,
					["text-align-x-center"] = p1.layoutMode == layoutModeModule.compact,
					["text-align-x-left"] = p1.layoutMode == layoutModeModule.wide
				},
				fontStyle = p1.subtitleStyle or var2.Typography.BodyMedium,
				Text = (if var20 or var19 then " \226\128\162 " else "") .. var26.unfilteredChatLabel,
				TextTruncate = customTextTruncation
			})
		else
			createElement_1 = nil
		end
		t_4.UnfilteredChatLabel = createElement_1
		var15 = var15(var22, t_3, t_4)
	else
		var15 = nil
	end
	local var23
	t_2.Subtitle = var15
	
	if fFlagUserTileShowShimmerWhenLoadingModule and p1.isContextualInfoLoading then
		var23 = reactModule.createElement(view, {
			LayoutOrder = 3,
			tag = `size-full-0 auto-y padding-xsmall {var13}`
		}, {
			ContextualInfoSkeleton = reactModule.createElement(skeleton, {
				Size = UDim2.new(CONTEXTUAL_INFO_SHIMMER_WIDTH_SCALE_WIDE, 0, 0, var10),
				radius = radius.Small
			})
		})
	elseif p1.contextualInfo then
		var23 = if fFlagUserTileAddContextualInfoIcon and p1.contextualInfoIcon then reactModule.createElement(view, {
			LayoutOrder = 3,
			tag = {
				["row align-y-center gap-xsmall size-full-0 auto-y"] = true,
				["align-x-center"] = p1.layoutMode == layoutModeModule.compact,
				["align-x-left"] = p1.layoutMode == layoutModeModule.wide
			}
		}, {
			ContextualInfoIcon = reactModule.createElement(icon, {
				LayoutOrder = 1,
				name = p1.contextualInfoIcon,
				size = iconSize.XSmall
			}),
			ContextualInfoText = reactModule.createElement(text, {
				LayoutOrder = 2,
				RichText = true,
				tag = {
					["content-secondary shrink auto-xy"] = not userTileRemoveContextualInfoTag,
					["shrink auto-xy"] = userTileRemoveContextualInfoTag
				},
				fontStyle = p1.contextualInfoStyle or var2.Typography.BodySmall,
				TextTruncate = customTextTruncation,
				Text = p1.contextualInfo
			})
		}) else reactModule.createElement(text, {
			LayoutOrder = 3,
			RichText = true,
			tag = {
				["auto-y size-full-0 content-secondary"] = not userTileRemoveContextualInfoTag,
				["size-full-0 auto-y"] = userTileRemoveContextualInfoTag,
				["text-align-x-center"] = p1.layoutMode == layoutModeModule.compact,
				["text-align-x-left"] = p1.layoutMode == layoutModeModule.wide
			},
			fontStyle = p1.contextualInfoStyle or var2.Typography.BodySmall,
			TextTruncate = customTextTruncation,
			Text = p1.contextualInfo
		})
		var23 = var23 or nil
	end
	t_2.ContextualInfo = var23
	t_2.ExtraInfo = if fFlagUserTileTitleStackAddExtraInfo and p1.isExtraInfoLoading then reactModule.createElement(view, {
		LayoutOrder = 4,
		tag = `size-full-0 auto-y padding-xsmall {var13}`
	}, {
		ExtraInfoSkeleton = reactModule.createElement(skeleton, {
			Size = UDim2.new(EXTRA_INFO_SHIMMER_WIDTH_SCALE_WIDE, 0, 0, var11),
			radius = radius.Small
		})
	}) elseif fFlagUserTileTitleStackAddExtraInfo and p1.extraInfo then reactModule.createElement(text, {
		LayoutOrder = 4,
		RichText = true,
		tag = {
			["size-full-0 auto-y"] = true,
			["text-align-x-center"] = p1.layoutMode == layoutModeModule.compact,
			["text-align-x-left"] = p1.layoutMode == layoutModeModule.wide
		},
		fontStyle = p1.extraInfoStyle or var2.Typography.BodySmall,
		TextTruncate = customTextTruncation,
		Text = p1.extraInfo,
		onActivated = p1.onExtraInfoClicked,
		stateLayer = if p1.onExtraInfoClicked then { affordance = stateLayerAffordance.None } else nil
	}) else nil
	
	return createElement(view, t_1, t_2)
end