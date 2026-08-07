local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local userTile = require(parent.UserTile).UserTile
local layoutMode = require(parent.UserTile).LayoutMode
local skeleton = foundationModule.Skeleton
local useTokens = foundationModule.Hooks.useTokens
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useFoundationPresenceModule = require(appChat.Hooks.useFoundationPresence)
local fFlagAppChatContextCardNameLoadingShimmerModule = require(appChat.Flags.FFlagAppChatContextCardNameLoadingShimmer)
local fFlagEnableBlackbirdCheck = require(parent.SharedFlags).FFlagEnableBlackbirdCheck

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 35 ]]
	-- upvalues: useTokens (ref), useFoundationPresenceModule (ref), useLocalization (ref), fFlagAppChatContextCardNameLoadingShimmerModule (ref), reactModule (ref), foundationModule (ref), skeleton (ref), userTile (ref), layoutMode (ref), fFlagEnableBlackbirdCheck (ref)
	local var5 = useTokens()
	local size = var5.Size
	local var6 = useFoundationPresenceModule(p0.userId)
	local var7 = useLocalization({
		firstConversationWithThisUserHeadingText = "Feature.Chat.Heading.FirstConversationWithThisUser",
		firstInteractionWithThisPersonHeadingText = "Feature.Chat.Heading.FirstInteractionWithThisPerson",
		osaContextCardDescriptionText = "Feature.Chat.Description.OSAContextCardDescription",
		user = "Feature.Chat.Label.User",
		firstConversationWithHeadingText = {
			"Feature.Chat.Heading.FirstConversationWith",
			displayName = p0.displayName
		},
		firstInteractionWithHeadingText = {
			"Feature.Chat.Heading.FirstInteractionWith",
			displayName = p0.displayName
		}
	})
	local isChatUserMessagesEnabled = p0.isChatUserMessagesEnabled
	local var8 = if isChatUserMessagesEnabled then var7.firstConversationWithHeadingText else var7.firstInteractionWithHeadingText
	local var9 = if isChatUserMessagesEnabled then var7.firstConversationWithThisUserHeadingText else var7.firstInteractionWithThisPersonHeadingText
	
	if fFlagAppChatContextCardNameLoadingShimmerModule then
		local var10 = not p0.displayName and not p0.hasError
		local var11 = not p0.username and not p0.hasError
		local var12 = not p0.avatarThumbnail and not p0.hasError
		
		return reactModule.createElement(foundationModule.View, {
			tag = "col align-x-center size-full-0 auto-y padding-xxlarge radius-large bg-shift-100 gap-xlarge",
			sizeConstraint = { MaxSize = Vector2.new(700, 500) }
		}, {
			AvatarContainer = reactModule.createElement(foundationModule.View, {
				tag = "col auto-xy bg-action-subtle align-x-center gap-medium radius-large padding-small",
				LayoutOrder = 1,
				onActivated = if not var10 and (not var11 and not var12) then p0.onAvatarActivated else nil
			}, {
				AvatarCircle = if var12 then reactModule.createElement(skeleton, {
					LayoutOrder = 1,
					Size = UDim2.new(0, size.Size_1200, 0, size.Size_1200),
					radius = foundationModule.Enums.Radius.Circle
				}) else reactModule.createElement(foundationModule.View, { tag = "size-1200-1200", LayoutOrder = 1 }, {
					reactModule.createElement(userTile, {
						dontTruncateTitle = true,
						userId = tostring(p0.userId),
						layoutMode = layoutMode.compact,
						userPresenceType = var6.presence,
						onActivated = p0.onAvatarActivated,
						isRobloxSubscriber = if fFlagEnableBlackbirdCheck then p0.isRobloxSubscriber else nil
					})
				}),
				AvatarTextContainer = reactModule.createElement(foundationModule.View, {
					tag = "col auto-xy align-x-center gap-xxsmall",
					LayoutOrder = 2
				}, {
					DisplayName = if var10 then reactModule.createElement(skeleton, {
						LayoutOrder = 1,
						Size = UDim2.new(0, size.Size_2500, 0, var5.Typography.TitleMedium.FontSize),
						radius = foundationModule.Enums.Radius.Large
					}) elseif fFlagEnableBlackbirdCheck and p0.isRobloxSubscriber and not p0.hasError then reactModule.createElement(foundationModule.View, {
						tag = "row auto-xy align-y-center gap-xsmall",
						LayoutOrder = 1
					}, {
						Name = reactModule.createElement(foundationModule.Text, {
							tag = "auto-xy",
							LayoutOrder = 1,
							Text = p0.displayName,
							fontStyle = var5.Typography.TitleMedium,
							textStyle = var5.Color.Content.Emphasis
						}),
						Badge = reactModule.createElement(foundationModule.Icon, {
							LayoutOrder = 2,
							name = foundationModule.Enums.IconName.RobloxPlus,
							size = foundationModule.Enums.IconSize.Small,
							style = var5.Color.Content.Emphasis
						})
					}) else reactModule.createElement(foundationModule.Text, {
						tag = "auto-xy",
						LayoutOrder = 1,
						Text = if p0.hasError then var7.user else p0.displayName,
						fontStyle = var5.Typography.TitleMedium,
						textStyle = var5.Color.Content.Emphasis
					}),
					Username = if var11 then reactModule.createElement(skeleton, {
						LayoutOrder = 2,
						Size = UDim2.new(0, size.Size_2000, 0, var5.Typography.BodySmall.FontSize),
						radius = foundationModule.Enums.Radius.Large
					}) else reactModule.createElement(foundationModule.Text, {
						tag = "auto-xy",
						LayoutOrder = 2,
						Text = if p0.hasError then var7.user else p0.username,
						fontStyle = var5.Typography.BodySmall,
						textStyle = var5.Color.Content.Muted
					})
				})
			}),
			TextContainer = reactModule.createElement(foundationModule.View, {
				tag = "col align-x-center auto-xy",
				LayoutOrder = 2,
				ref = p1
			}, {
				HeadingText = if var10 then reactModule.createElement(skeleton, {
					LayoutOrder = 1,
					Size = UDim2.new(0, size.Size_3000, 0, var5.Typography.TitleLarge.FontSize + var5.Gap.XXSmall),
					radius = foundationModule.Enums.Radius.Large
				}) else reactModule.createElement(foundationModule.Text, {
					tag = "auto-xy text-wrap",
					LayoutOrder = 1,
					Text = if p0.hasError then var9 else var8,
					fontStyle = var5.Typography.TitleLarge,
					textStyle = var5.Color.Content.Emphasis
				}),
				DescriptionText = reactModule.createElement(foundationModule.Text, {
					tag = "auto-xy text-wrap",
					LayoutOrder = 2,
					Text = var7.osaContextCardDescriptionText,
					fontStyle = var5.Typography.BodyLarge,
					textStyle = var5.Color.Content.Default
				})
			})
		})
	elseif p0.displayName and (p0.username and (not p0.avatarThumbnail and not p0.hasError)) then
		return reactModule.createElement(foundationModule.View, {
			tag = "size-full-0 auto-y",
			sizeConstraint = { MaxSize = Vector2.new(700, 500) }
		}, {
			reactModule.createElement(foundationModule.Skeleton, {
				Size = UDim2.new(1, 0, 0, 270),
				radius = foundationModule.Enums.Radius.Large
			})
		})
	end
	local var15
	local createElement = reactModule.createElement
	local view = foundationModule.View
	local t = {
		tag = "col align-x-center size-full-0 auto-y padding-xxlarge radius-large bg-shift-100 gap-xlarge",
		sizeConstraint = { MaxSize = Vector2.new(700, 500) }
	}
	local t_1 = {}
	
	if p0.hasError then
		var15 = nil
	else
		var15 = reactModule.createElement
		var15 = var15(foundationModule.View, {
			tag = "col auto-xy bg-action-subtle align-x-center gap-medium radius-large padding-small",
			LayoutOrder = 1,
			onActivated = p0.onAvatarActivated
		}, {
			AvatarCircle = reactModule.createElement(foundationModule.View, { tag = "size-1200-1200", LayoutOrder = 1 }, {
				reactModule.createElement(userTile, {
					dontTruncateTitle = true,
					userId = tostring(p0.userId),
					layoutMode = layoutMode.compact,
					userPresenceType = var6.presence,
					onActivated = p0.onAvatarActivated,
					isRobloxSubscriber = if fFlagEnableBlackbirdCheck then p0.isRobloxSubscriber else nil
				})
			}),
			AvatarTextContainer = reactModule.createElement(foundationModule.View, { tag = "col auto-xy align-x-center", LayoutOrder = 2 }, {
				DisplayName = if fFlagEnableBlackbirdCheck and p0.isRobloxSubscriber then reactModule.createElement(foundationModule.View, {
					tag = "row auto-xy align-y-center gap-xsmall",
					LayoutOrder = 1
				}, {
					Name = reactModule.createElement(foundationModule.Text, {
						tag = "auto-xy",
						LayoutOrder = 1,
						Text = p0.displayName,
						fontStyle = var5.Typography.TitleMedium,
						textStyle = var5.Color.Content.Emphasis
					}),
					Badge = reactModule.createElement(foundationModule.Icon, {
						LayoutOrder = 2,
						name = foundationModule.Enums.IconName.RobloxPlus,
						size = foundationModule.Enums.IconSize.Small,
						style = var5.Color.Content.Emphasis
					})
				}) else reactModule.createElement(foundationModule.Text, {
					tag = "auto-xy",
					LayoutOrder = 1,
					Text = p0.displayName,
					fontStyle = var5.Typography.TitleMedium,
					textStyle = var5.Color.Content.Emphasis
				}),
				Username = reactModule.createElement(foundationModule.Text, {
					tag = "auto-xy",
					LayoutOrder = 2,
					Text = p0.username,
					fontStyle = var5.Typography.BodySmall,
					textStyle = var5.Color.Content.Muted
				})
			})
		})
	end
	t_1.AvatarContainer = var15
	t_1.TextContainer = reactModule.createElement(foundationModule.View, {
		tag = "col align-x-center auto-xy",
		LayoutOrder = 2,
		ref = p1
	}, {
		HeadingText = reactModule.createElement(foundationModule.Text, {
			tag = "auto-xy text-wrap",
			LayoutOrder = 1,
			Text = if p0.hasError then var9 else var8,
			fontStyle = var5.Typography.TitleLarge,
			textStyle = var5.Color.Content.Emphasis
		}),
		DescriptionText = reactModule.createElement(foundationModule.Text, {
			tag = "auto-xy text-wrap",
			LayoutOrder = 2,
			Text = var7.osaContextCardDescriptionText,
			fontStyle = var5.Typography.BodyLarge,
			textStyle = var5.Color.Content.Default
		})
	})
	
	return createElement(view, t, t_1)
end))