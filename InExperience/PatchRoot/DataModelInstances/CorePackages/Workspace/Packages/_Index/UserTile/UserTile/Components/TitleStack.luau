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
local t = { layoutOrder = 2 }

return function(p0) --[[ line: 63 | named "TitleStack" ]]
	-- upvalues: llama (ref), t (ref), useTokens (ref), layoutModeModule (ref), reactModule (ref), image (ref), fFlagUserTileShowShimmerWhenLoadingModule (ref), constantsModule (ref), fFlagEnableBlackbirdCheck (ref), fFlagHidePremiumIconography (ref), fFlagUserTileTextTCIndicator (ref), useLocalization (ref), textKeysModule (ref), view (ref), skeleton (ref), radius (ref), fFlagProfilePlatformNewProfileHeader (ref), text (ref), fFlagUserTileShowBadges (ref), foundationModule (ref), fFlagEnableMobileGameJoinCard (ref), stateLayerAffordance (ref), fFlagUserTileAddContextualInfoIcon (ref), icon (ref), iconSize (ref), userTileRemoveContextualInfoTag (ref)
	local var16
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
	
	if fFlagUserTileShowShimmerWhenLoadingModule then
		var16 = p0.layoutMode == layoutModeModule.compact
		var16 = nil
	else
		var16 = nil
	end
	local TITLE_SHIMMER_WIDTH_SCALE_WIDE = nil
	local SUBTITLE_SHIMMER_WIDTH_SCALE_WIDE = nil
	local CONTEXTUAL_INFO_SHIMMER_WIDTH_SCALE_WIDE = nil
	
	if fFlagUserTileShowShimmerWhenLoadingModule then
		if var16 then
			TITLE_SHIMMER_WIDTH_SCALE_WIDE = constantsModule.TITLE_SHIMMER_WIDTH_SCALE_COMPACT
			SUBTITLE_SHIMMER_WIDTH_SCALE_WIDE = constantsModule.SUBTITLE_SHIMMER_WIDTH_SCALE_COMPACT
			CONTEXTUAL_INFO_SHIMMER_WIDTH_SCALE_WIDE = constantsModule.CONTEXTUAL_INFO_SHIMMER_WIDTH_SCALE_COMPACT
		else
			TITLE_SHIMMER_WIDTH_SCALE_WIDE = constantsModule.TITLE_SHIMMER_WIDTH_SCALE_WIDE
			SUBTITLE_SHIMMER_WIDTH_SCALE_WIDE = constantsModule.SUBTITLE_SHIMMER_WIDTH_SCALE_WIDE
			CONTEXTUAL_INFO_SHIMMER_WIDTH_SCALE_WIDE = constantsModule.CONTEXTUAL_INFO_SHIMMER_WIDTH_SCALE_WIDE
		end
	end
	local var20
	local var17 = if fFlagUserTileShowShimmerWhenLoadingModule and p0.layoutMode == layoutModeModule.compact then "align-x-center" else "align-x-left"
	local var18 = if p0.layoutMode == layoutModeModule.compact then "size-full-0" else "grow"
	local customTextTruncation = p0.customTextTruncation or Enum.TextTruncate.AtEnd
	
	if fFlagEnableBlackbirdCheck then
		var20 = p0.isRobloxSubscriber == true
		var20 = nil
	else
		var20 = nil
	end
	local createElement_1
	local var21 = if fFlagHidePremiumIconography then false else p0.isPremium and not var20
	local var22 = if fFlagUserTileTextTCIndicator then useLocalization({ trustedLabel = textKeysModule.trustedLabel }) else nil
	local createElement = reactModule.createElement
	local t_1 = { tag = `{var18} auto-y col`, LayoutOrder = p0.layoutOrder }
	local t_2 = {
		Title = if fFlagUserTileShowShimmerWhenLoadingModule and p0.isTitleLoading then reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = `size-full-0 auto-y padding-xsmall {var17}`
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
					SubscriptionBadge = if var20 then reactModule.createElement(foundationModule.Icon, {
						LayoutOrder = 3,
						name = foundationModule.Enums.IconName.RobloxPlus,
						size = foundationModule.Enums.IconSize.Small,
						style = var9.Color.Content.Emphasis
					}) else nil,
					PremiumBadge = if var21 then reactModule.createElement(foundationModule.Icon, {
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
			tag = `size-full-0 auto-y padding-xsmall {var17}`
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
			onActivated = if (fFlagProfilePlatformNewProfileHeader or fFlagEnableMobileGameJoinCard) and p0.onSubtitleClicked then function() --[[ line: 256 ]]
				-- upvalues: p0 (write)
				p0.onSubtitleClicked()
			end else nil,
			stateLayer = if (fFlagProfilePlatformNewProfileHeader or fFlagEnableMobileGameJoinCard) and p0.onSubtitleClicked then { affordance = stateLayerAffordance.None } else nil
		})
	elseif fFlagUserTileTextTCIndicator and var12 then
		createElement_1 = reactModule.createElement
		createElement_1 = createElement_1(view, {
			LayoutOrder = 2,
			tag = {
				["row auto-y size-full-0 align-y-center"] = true,
				["align-x-center"] = p0.layoutMode == layoutModeModule.compact,
				["align-x-left"] = p0.layoutMode == layoutModeModule.wide
			},
			onActivated = if (fFlagProfilePlatformNewProfileHeader or fFlagEnableMobileGameJoinCard) and p0.onSubtitleClicked then function() --[[ line: 277 ]]
				-- upvalues: p0 (write)
				p0.onSubtitleClicked()
			end else nil,
			stateLayer = if (fFlagProfilePlatformNewProfileHeader or fFlagEnableMobileGameJoinCard) and p0.onSubtitleClicked then { affordance = stateLayerAffordance.None } else nil
		}, {
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
			}),
			TCTextLabel = if p0.trustedConnectionIndicatorEnabled and p0.isTrustedConnection then reactModule.createElement(text, {
				LayoutOrder = 2,
				RichText = true,
				tag = {
					["auto-xy content-default"] = true,
					["text-align-x-center"] = p0.layoutMode == layoutModeModule.compact,
					["text-align-x-left"] = p0.layoutMode == layoutModeModule.wide
				},
				fontStyle = p0.subtitleStyle or var9.Typography.BodyMedium,
				Text = " \226\128\162 " .. var22.trustedLabel,
				TextTruncate = customTextTruncation
			}) else nil
		})
	else
		createElement_1 = nil
	end
	local var25
	t_2.Subtitle = createElement_1
	
	if fFlagUserTileShowShimmerWhenLoadingModule and p0.isContextualInfoLoading then
		var25 = reactModule.createElement(view, {
			LayoutOrder = 3,
			tag = `size-full-0 auto-y padding-xsmall {var17}`
		}, {
			ContextualInfoSkeleton = reactModule.createElement(skeleton, {
				Size = UDim2.new(CONTEXTUAL_INFO_SHIMMER_WIDTH_SCALE_WIDE, 0, 0, var15),
				radius = radius.Small
			})
		})
	elseif p0.contextualInfo then
		var25 = if fFlagUserTileAddContextualInfoIcon and p0.contextualInfoIcon then reactModule.createElement(view, {
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
		var25 = var25 or nil
	end
	t_2.ContextualInfo = var25
	
	return createElement(view, t_1, t_2)
end