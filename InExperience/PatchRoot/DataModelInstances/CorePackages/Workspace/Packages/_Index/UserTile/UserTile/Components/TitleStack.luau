local userTile = script:FindFirstAncestor("UserTile")
local parent = userTile.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local llama = require(parent.LuaSocialLibrariesDeps).llama
local useLocalization = require(parent.Localization).Hooks.useLocalization
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
local fFlagUserTileTextTCIndicator = require(parent.SharedFlags).FFlagUserTileTextTCIndicator
local fFlagUserTileShowBadges = require(parent.SharedFlags).FFlagUserTileShowBadges
local fFlagEnableBlackbirdCheck = require(parent.SharedFlags).FFlagEnableBlackbirdCheck
local fFlagHidePremiumIconography = require(parent.SharedFlags).FFlagHidePremiumIconography
local fFlagEnableMobileGameJoinCard = require(parent.SharedFlags).FFlagEnableMobileGameJoinCard
local fFlagUserTileAddContextualInfoIcon = require(parent.SharedFlags).FFlagUserTileAddContextualInfoIcon
local userTileRemoveContextualInfoTag = game:DefineFastFlag("UserTileRemoveContextualInfoTag", false)
local fFlagUserTileTitleStackAddExtraInfo = require(parent.SharedFlags).FFlagUserTileTitleStackAddExtraInfo
local fFlagUserTileUnfilteredChatIndicator = require(parent.SharedFlags).FFlagUserTileUnfilteredChatIndicator
local t = { layoutOrder = 2 }

return function(p0)
	-- upvalues: llama (ref), t (ref), useTokens (ref), layoutModeModule (ref), reactModule (ref), image (ref), fFlagUserTileTitleStackAddExtraInfo (ref), fFlagUserTileShowShimmerWhenLoadingModule (ref), constantsModule (ref), fFlagEnableBlackbirdCheck (ref), fFlagHidePremiumIconography (ref), fFlagUserTileTextTCIndicator (ref), useLocalization (ref), textKeysModule (ref), fFlagUserTileUnfilteredChatIndicator (ref), view (ref), skeleton (ref), radius (ref), fFlagProfilePlatformNewProfileHeader (ref), text (ref), fFlagUserTileShowBadges (ref), foundationModule (ref), fFlagEnableMobileGameJoinCard (ref), stateLayerAffordance (ref), fFlagUserTileAddContextualInfoIcon (ref), icon (ref), iconSize (ref), userTileRemoveContextualInfoTag (ref)
	local var17
	p0 = llama.Dictionary.join(t, p0 or {})
	local var9 = useTokens()
	local var10 = if p0.layoutMode == layoutModeModule.compact then "align-x-center" else "align-x-left"
	local var11 = if p0.titleIcon then reactModule.createElement(image, {
		tag = "size-300-300 radius-circle",
		LayoutOrder = 1,
		Image = p0.titleIcon
	}) else nil
	local var12 = if p0.contextualInfo and not p0.subtitle then false elseif p0.layoutMode ~= layoutModeModule.compact then p0.subtitle ~= nil else true
	local var13 = (p0.titleStyle or var9.Typography.TitleMedium).FontSize - var9.Padding.XSmall * 2
	local var14 = (p0.subtitleStyle or var9.Typography.BodyMedium).FontSize - var9.Padding.XSmall * 2
	local var15 = (p0.contextualInfoStyle or var9.Typography.BodySmall).FontSize - var9.Padding.XSmall * 2
	local var16 = if fFlagUserTileTitleStackAddExtraInfo then (p0.extraInfoStyle or var9.Typography.BodySmall).FontSize - var9.Padding.XSmall * 2 else 0
	
	if fFlagUserTileShowShimmerWhenLoadingModule then
		var17 = p0.layoutMode == layoutModeModule.compact
		var17 = nil
	else
		var17 = nil
	end
	local TITLE_SHIMMER_WIDTH_SCALE_WIDE = nil
	local SUBTITLE_SHIMMER_WIDTH_SCALE_WIDE = nil
	local CONTEXTUAL_INFO_SHIMMER_WIDTH_SCALE_WIDE = nil
	local EXTRA_INFO_SHIMMER_WIDTH_SCALE_WIDE = nil
	
	if fFlagUserTileShowShimmerWhenLoadingModule then
		if var17 then
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
	local var21
	local var18 = if fFlagUserTileShowShimmerWhenLoadingModule and p0.layoutMode == layoutModeModule.compact then "align-x-center" else "align-x-left"
	local var19 = if p0.layoutMode == layoutModeModule.compact then "size-full-0" else "grow"
	local customTextTruncation = p0.customTextTruncation or Enum.TextTruncate.AtEnd
	
	if fFlagEnableBlackbirdCheck then
		var21 = p0.isRobloxSubscriber == true
		var21 = nil
	else
		var21 = nil
	end
	local createElement_1
	local var22 = if fFlagHidePremiumIconography then false else p0.isPremium and not var21
	local var23 = if fFlagUserTileTextTCIndicator then useLocalization({
		trustedLabel = textKeysModule.trustedLabel,
		unfilteredChatLabel = textKeysModule.unfilteredChatLabel
	}) else nil
	local var24 = fFlagUserTileUnfilteredChatIndicator and p0.shouldShowUnfilteredChatIndicator == true
	local var25 = (p0.trustedConnectionIndicatorEnabled and p0.isTrustedConnection) == true
	local var26 = p0.subtitle ~= nil and p0.subtitle ~= ""
	local createElement = reactModule.createElement
	local t_1 = { tag = `{var19} auto-y col`, LayoutOrder = p0.layoutOrder }
	local t_2 = {
		Title = if fFlagUserTileShowShimmerWhenLoadingModule and p0.isTitleLoading then reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = `size-full-0 auto-y padding-xsmall {var18}`
		}, {
			TitleSkeleton = reactModule.createElement(skeleton, {
				Size = UDim2.new(TITLE_SHIMMER_WIDTH_SCALE_WIDE, 0, 0, var13),
				radius = radius.Small
			})
		}) else reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = `size-full-0 row auto-y gap-xxsmall align-y-center {var10}`
		}, {
			TitleIcon = var11,
			TitleText = if fFlagProfilePlatformNewProfileHeader then p0.title and reactModule.createElement(view, {
				LayoutOrder = 2,
				tag = {
					["row align-y-center gap-xsmall content-emphasis"] = true,
					["auto-xy text-align-x-center"] = p0.layoutMode == layoutModeModule.compact,
					["auto-y size-full-0 text-align-x-left"] = p0.layoutMode == layoutModeModule.wide
				}
			}, {
				Title = reactModule.createElement(text, {
					LayoutOrder = 1,
					RichText = true,
					tag = {
						["shrink content-default auto-xy"] = true,
						["text-align-x-left"] = p0.layoutMode == layoutModeModule.wide,
						["text-align-x-center"] = p0.layoutMode == layoutModeModule.compact
					},
					fontStyle = p0.titleStyle or var9.Typography.TitleMedium,
					Text = p0.title,
					TextTruncate = customTextTruncation
				}),
				BadgesRow = if fFlagUserTileShowBadges then reactModule.createElement(view, {
					tag = "row align-y-center auto-xy content-default gap-xxsmall",
					["text-align-x-left"] = p0.layoutMode == layoutModeModule.wide,
					["text-align-x-center"] = p0.layoutMode == layoutModeModule.compact,
					LayoutOrder = 2
				}, {
					VerifiedBadge = p0.isVerified and reactModule.createElement(view, { tag = "auto-xy content-default", LayoutOrder = 2 }, {
						VerifiedBackplateIcon = reactModule.createElement(foundationModule.Icon, {
							ZIndex = 1,
							name = foundationModule.Enums.IconName.VerifiedBackplate,
							size = foundationModule.Enums.IconSize.Large,
							style = var9.Color.System.Emphasis,
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
					}),
					SubscriptionBadge = if var21 then reactModule.createElement(foundationModule.Icon, {
						LayoutOrder = 3,
						name = foundationModule.Enums.IconName.RobloxPlus,
						size = foundationModule.Enums.IconSize.Small,
						style = var9.Color.Content.Emphasis
					}) else nil,
					PremiumBadge = if var22 then reactModule.createElement(foundationModule.Icon, {
						LayoutOrder = 4,
						name = foundationModule.Enums.IconName.Premium,
						size = foundationModule.Enums.IconSize.Large
					}) else nil,
					AdminBadge = p0.isRobloxAdmin and reactModule.createElement(foundationModule.Icon, {
						LayoutOrder = 5,
						name = foundationModule.Enums.IconName.Tilt,
						size = foundationModule.Enums.IconSize.Large
					})
				}) else nil
			}) else p0.title and reactModule.createElement(text, {
				LayoutOrder = 2,
				RichText = true,
				tag = {
					["content-emphasis"] = true,
					["auto-xy text-align-x-center"] = p0.layoutMode == layoutModeModule.compact,
					["auto-y size-full-0 text-align-x-left"] = p0.layoutMode == layoutModeModule.wide
				},
				fontStyle = p0.titleStyle or var9.Typography.TitleMedium,
				Text = p0.title,
				TextTruncate = customTextTruncation
			}) or nil
		})
	}
	
	if fFlagUserTileShowShimmerWhenLoadingModule and p0.isSubtitleLoading then
		createElement_1 = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = `size-full-0 auto-y padding-xsmall {var18}`
		}, {
			SubtitleSkeleton = reactModule.createElement(skeleton, {
				Size = UDim2.new(SUBTITLE_SHIMMER_WIDTH_SCALE_WIDE, 0, 0, var14),
				radius = radius.Small
			})
		})
	elseif not fFlagUserTileTextTCIndicator and var12 then
		createElement_1 = reactModule.createElement
		createElement_1 = createElement_1(text, {
			LayoutOrder = 2,
			RichText = true,
			tag = {
				["auto-y size-full-0 content-default"] = true,
				["text-align-x-center"] = p0.layoutMode == layoutModeModule.compact,
				["text-align-x-left"] = p0.layoutMode == layoutModeModule.wide
			},
			fontStyle = p0.subtitleStyle or var9.Typography.BodyMedium,
			Text = p0.subtitle or "",
			TextTruncate = customTextTruncation,
			onActivated = if (fFlagProfilePlatformNewProfileHeader or fFlagEnableMobileGameJoinCard) and p0.onSubtitleClicked then function()
				-- upvalues: p0 (write)
				p0.onSubtitleClicked()
			end else nil,
			stateLayer = if (fFlagProfilePlatformNewProfileHeader or fFlagEnableMobileGameJoinCard) and p0.onSubtitleClicked then { affordance = stateLayerAffordance.None } else nil
		})
	elseif fFlagUserTileTextTCIndicator and (var12 or var24) then
		local var32
		createElement_1 = reactModule.createElement
		local var29 = view
		local t_3 = {
			LayoutOrder = 2,
			tag = {
				["row auto-y size-full-0 align-y-center"] = true,
				["align-x-center"] = p0.layoutMode == layoutModeModule.compact,
				["align-x-left"] = p0.layoutMode == layoutModeModule.wide
			},
			onActivated = if (fFlagProfilePlatformNewProfileHeader or fFlagEnableMobileGameJoinCard) and p0.onSubtitleClicked then function()
				-- upvalues: p0 (write)
				p0.onSubtitleClicked()
			end else nil,
			stateLayer = if (fFlagProfilePlatformNewProfileHeader or fFlagEnableMobileGameJoinCard) and p0.onSubtitleClicked then { affordance = stateLayerAffordance.None } else nil
		}
		local t_4 = {
			SubtitleText = reactModule.createElement(text, {
				LayoutOrder = 1,
				RichText = true,
				tag = {
					["auto-xy shrink content-default"] = true,
					["text-align-x-center"] = p0.layoutMode == layoutModeModule.compact,
					["text-align-x-left"] = p0.layoutMode == layoutModeModule.wide
				},
				fontStyle = p0.subtitleStyle or var9.Typography.BodyMedium,
				Text = p0.subtitle or "",
				TextTruncate = customTextTruncation
			})
		}
		
		if p0.trustedConnectionIndicatorEnabled and p0.isTrustedConnection then
			var32 = reactModule.createElement
			var32 = var32(text, {
				LayoutOrder = 2,
				RichText = true,
				tag = {
					["auto-xy content-default"] = true,
					["text-align-x-center"] = p0.layoutMode == layoutModeModule.compact,
					["text-align-x-left"] = p0.layoutMode == layoutModeModule.wide
				},
				fontStyle = p0.subtitleStyle or var9.Typography.BodyMedium,
				Text = (if fFlagUserTileUnfilteredChatIndicator and not var26 then "" else " \226\128\162 ") .. var23.trustedLabel,
				TextTruncate = customTextTruncation
			})
		else
			var32 = nil
		end
		local createElement_2
		t_4.TCTextLabel = var32
		
		if var24 then
			createElement_2 = reactModule.createElement
			createElement_2 = createElement_2(text, {
				LayoutOrder = 3,
				RichText = true,
				tag = {
					["auto-xy content-default"] = true,
					["text-align-x-center"] = p0.layoutMode == layoutModeModule.compact,
					["text-align-x-left"] = p0.layoutMode == layoutModeModule.wide
				},
				fontStyle = p0.subtitleStyle or var9.Typography.BodyMedium,
				Text = (if var26 or var25 then " \226\128\162 " else "") .. var23.unfilteredChatLabel,
				TextTruncate = customTextTruncation
			})
		else
			createElement_2 = nil
		end
		t_4.UnfilteredChatLabel = createElement_2
		createElement_1 = createElement_1(var29, t_3, t_4)
	else
		createElement_1 = nil
	end
	local var33
	t_2.Subtitle = createElement_1
	
	if fFlagUserTileShowShimmerWhenLoadingModule and p0.isContextualInfoLoading then
		var33 = reactModule.createElement(view, {
			LayoutOrder = 3,
			tag = `size-full-0 auto-y padding-xsmall {var18}`
		}, {
			ContextualInfoSkeleton = reactModule.createElement(skeleton, {
				Size = UDim2.new(CONTEXTUAL_INFO_SHIMMER_WIDTH_SCALE_WIDE, 0, 0, var15),
				radius = radius.Small
			})
		})
	elseif p0.contextualInfo then
		var33 = if fFlagUserTileAddContextualInfoIcon and p0.contextualInfoIcon then reactModule.createElement(view, {
			LayoutOrder = 3,
			tag = {
				["row align-y-center gap-xsmall size-full-0 auto-y"] = true,
				["align-x-center"] = p0.layoutMode == layoutModeModule.compact,
				["align-x-left"] = p0.layoutMode == layoutModeModule.wide
			}
		}, {
			ContextualInfoIcon = reactModule.createElement(icon, {
				LayoutOrder = 1,
				name = p0.contextualInfoIcon,
				size = iconSize.XSmall
			}),
			ContextualInfoText = reactModule.createElement(text, {
				LayoutOrder = 2,
				RichText = true,
				tag = {
					["content-secondary shrink auto-xy"] = not userTileRemoveContextualInfoTag,
					["shrink auto-xy"] = userTileRemoveContextualInfoTag
				},
				fontStyle = p0.contextualInfoStyle or var9.Typography.BodySmall,
				TextTruncate = customTextTruncation,
				Text = p0.contextualInfo
			})
		}) else reactModule.createElement(text, {
			LayoutOrder = 3,
			RichText = true,
			tag = {
				["auto-y size-full-0 content-secondary"] = not userTileRemoveContextualInfoTag,
				["size-full-0 auto-y"] = userTileRemoveContextualInfoTag,
				["text-align-x-center"] = p0.layoutMode == layoutModeModule.compact,
				["text-align-x-left"] = p0.layoutMode == layoutModeModule.wide
			},
			fontStyle = p0.contextualInfoStyle or var9.Typography.BodySmall,
			TextTruncate = customTextTruncation,
			Text = p0.contextualInfo
		})
		var33 = var33 or nil
	end
	t_2.ContextualInfo = var33
	t_2.ExtraInfo = if fFlagUserTileTitleStackAddExtraInfo and p0.isExtraInfoLoading then reactModule.createElement(view, {
		LayoutOrder = 4,
		tag = `size-full-0 auto-y padding-xsmall {var18}`
	}, {
		ExtraInfoSkeleton = reactModule.createElement(skeleton, {
			Size = UDim2.new(EXTRA_INFO_SHIMMER_WIDTH_SCALE_WIDE, 0, 0, var16),
			radius = radius.Small
		})
	}) elseif fFlagUserTileTitleStackAddExtraInfo and p0.extraInfo then reactModule.createElement(text, {
		LayoutOrder = 4,
		RichText = true,
		tag = {
			["size-full-0 auto-y"] = true,
			["text-align-x-center"] = p0.layoutMode == layoutModeModule.compact,
			["text-align-x-left"] = p0.layoutMode == layoutModeModule.wide
		},
		fontStyle = p0.extraInfoStyle or var9.Typography.BodySmall,
		TextTruncate = customTextTruncation,
		Text = p0.extraInfo,
		onActivated = p0.onExtraInfoClicked,
		stateLayer = if p0.onExtraInfoClicked then { affordance = stateLayerAffordance.None } else nil
	}) else nil
	
	return createElement(view, t_1, t_2)
end