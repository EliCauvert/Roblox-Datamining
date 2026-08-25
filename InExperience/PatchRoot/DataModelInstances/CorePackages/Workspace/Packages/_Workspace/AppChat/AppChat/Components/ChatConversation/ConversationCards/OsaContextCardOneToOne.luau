local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local universalAppPolicyModule = require(parent.UniversalAppPolicy)
local userTile = require(parent.UserTile).UserTile
local layoutMode = require(parent.UserTile).LayoutMode
local skeleton = foundationModule.Skeleton
local useTokens = foundationModule.Hooks.useTokens
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useFoundationPresenceModule = require(appChat.Hooks.useFoundationPresence)
local fFlagAppChatContextCardNameLoadingShimmerModule = require(appChat.Flags.FFlagAppChatContextCardNameLoadingShimmer)
local fFlagAppChatConsoleFocusFixesModule = require(appChat.Flags.FFlagAppChatConsoleFocusFixes)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagEnableBlackbirdCheck = sharedFlagsModule.FFlagEnableBlackbirdCheck
local fFlagAppChatDisclosureUpdateEnabled = sharedFlagsModule.FFlagAppChatDisclosureUpdateEnabled
local fFlagAppChatDiscloseUpdateSecondVersion = sharedFlagsModule.FFlagAppChatDiscloseUpdateSecondVersion

return reactModule.memo(reactModule.forwardRef(function(p0, p1)
	-- upvalues: useTokens (ref), useFoundationPresenceModule (ref), useLocalization (ref), fFlagAppChatDisclosureUpdateEnabled (ref), fFlagAppChatDiscloseUpdateSecondVersion (ref), universalAppPolicyModule (ref), fFlagAppChatContextCardNameLoadingShimmerModule (ref), reactModule (ref), foundationModule (ref), skeleton (ref), userTile (ref), layoutMode (ref), fFlagEnableBlackbirdCheck (ref), fFlagAppChatConsoleFocusFixesModule (ref)
	local var8 = useTokens()
	local size = var8.Size
	local var9 = useFoundationPresenceModule(p0.userId)
	local var10 = useLocalization({
		firstInteractionWithThisPersonHeadingText = "Feature.Chat.Heading.FirstInteractionWithThisPerson",
		user = "Feature.Chat.Label.User",
		firstConversationWithThisUserHeadingText = if fFlagAppChatDisclosureUpdateEnabled and not fFlagAppChatDiscloseUpdateSecondVersion then "Feature.Chat.Heading.SafeChattingWithThisUser" else "Feature.Chat.Heading.FirstConversationWithThisUser",
		firstConversationWithHeadingText = if fFlagAppChatDisclosureUpdateEnabled and not fFlagAppChatDiscloseUpdateSecondVersion then {
			"Feature.Chat.Heading.SafeChattingWithUsername",
			displayName = p0.displayName
		} else {
			"Feature.Chat.Heading.FirstConversationWith",
			displayName = p0.displayName
		},
		firstInteractionWithHeadingText = {
			"Feature.Chat.Heading.FirstInteractionWith",
			displayName = p0.displayName
		},
		osaContextCardDescriptionText = if fFlagAppChatDisclosureUpdateEnabled and universalAppPolicyModule.getAppFeaturePolicies().getCanSeeChatTerminology() then "Feature.Chat.Description.InlineContextCardDescription" else "Feature.Chat.Description.OSAContextCardDescription"
	})
	local isChatUserMessagesEnabled = p0.isChatUserMessagesEnabled
	local var11 = if fFlagAppChatDisclosureUpdateEnabled then if universalAppPolicyModule.getAppFeaturePolicies().getCanSeeChatTerminology() then var10.firstConversationWithHeadingText else var10.firstInteractionWithHeadingText elseif isChatUserMessagesEnabled then var10.firstConversationWithHeadingText else var10.firstInteractionWithHeadingText
	local var12 = if fFlagAppChatDisclosureUpdateEnabled then if universalAppPolicyModule.getAppFeaturePolicies().getCanSeeChatTerminology() then var10.firstConversationWithThisUserHeadingText else var10.firstInteractionWithThisPersonHeadingText elseif isChatUserMessagesEnabled then var10.firstConversationWithThisUserHeadingText else var10.firstInteractionWithThisPersonHeadingText
	
	if fFlagAppChatContextCardNameLoadingShimmerModule then
		local var13 = not p0.displayName and not p0.hasError
		local var14 = not p0.username and not p0.hasError
		local var15 = not p0.avatarThumbnail and not p0.hasError
		
		return reactModule.createElement(foundationModule.View, {
			tag = "col align-x-center size-full-0 auto-y padding-xxlarge radius-large bg-shift-100 gap-xlarge",
			sizeConstraint = { MaxSize = Vector2.new(700, 500) }
		}, {
			AvatarContainer = reactModule.createElement(foundationModule.View, {
				tag = "col auto-xy bg-action-subtle align-x-center gap-medium radius-large padding-small",
				LayoutOrder = 1,
				onActivated = if not var13 and (not var14 and not var15) then p0.onAvatarActivated else nil
			}, {
				AvatarCircle = if var15 then reactModule.createElement(skeleton, {
					LayoutOrder = 1,
					Size = UDim2.new(0, size.Size_1200, 0, size.Size_1200),
					radius = foundationModule.Enums.Radius.Circle
				}) else reactModule.createElement(foundationModule.View, { tag = "size-1200-1200", LayoutOrder = 1 }, {
					reactModule.createElement(userTile, {
						dontTruncateTitle = true,
						userId = tostring(p0.userId),
						layoutMode = layoutMode.compact,
						userPresenceType = var9.presence,
						onActivated = p0.onAvatarActivated,
						isRobloxSubscriber = if fFlagEnableBlackbirdCheck then p0.isRobloxSubscriber else nil,
						selectable = if fFlagAppChatConsoleFocusFixesModule then false else nil
					})
				}),
				AvatarTextContainer = reactModule.createElement(foundationModule.View, {
					tag = "col auto-xy align-x-center gap-xxsmall",
					LayoutOrder = 2
				}, {
					DisplayName = if var13 then reactModule.createElement(skeleton, {
						LayoutOrder = 1,
						Size = UDim2.new(0, size.Size_2500, 0, var8.Typography.TitleMedium.FontSize),
						radius = foundationModule.Enums.Radius.Large
					}) elseif fFlagEnableBlackbirdCheck and p0.isRobloxSubscriber and not p0.hasError then reactModule.createElement(foundationModule.View, {
						tag = "row auto-xy align-y-center gap-xsmall",
						LayoutOrder = 1
					}, {
						Name = reactModule.createElement(foundationModule.Text, {
							tag = "auto-xy",
							LayoutOrder = 1,
							Text = p0.displayName,
							fontStyle = var8.Typography.TitleMedium,
							textStyle = var8.Color.Content.Emphasis
						}),
						Badge = reactModule.createElement(foundationModule.Icon, {
							LayoutOrder = 2,
							name = foundationModule.Enums.IconName.RobloxPlus,
							size = foundationModule.Enums.IconSize.Small,
							style = var8.Color.Content.Emphasis
						})
					}) else reactModule.createElement(foundationModule.Text, {
						tag = "auto-xy",
						LayoutOrder = 1,
						Text = if p0.hasError then var10.user else p0.displayName,
						fontStyle = var8.Typography.TitleMedium,
						textStyle = var8.Color.Content.Emphasis
					}),
					Username = if var14 then reactModule.createElement(skeleton, {
						LayoutOrder = 2,
						Size = UDim2.new(0, size.Size_2000, 0, var8.Typography.BodySmall.FontSize),
						radius = foundationModule.Enums.Radius.Large
					}) else reactModule.createElement(foundationModule.Text, {
						tag = "auto-xy",
						LayoutOrder = 2,
						Text = if p0.hasError then var10.user else p0.username,
						fontStyle = var8.Typography.BodySmall,
						textStyle = var8.Color.Content.Muted
					})
				})
			}),
			TextContainer = reactModule.createElement(foundationModule.View, {
				tag = "col align-x-center auto-xy",
				LayoutOrder = 2,
				ref = p1
			}, {
				HeadingText = if var13 then reactModule.createElement(skeleton, {
					LayoutOrder = 1,
					Size = UDim2.new(0, size.Size_3000, 0, var8.Typography.TitleLarge.FontSize + var8.Gap.XXSmall),
					radius = foundationModule.Enums.Radius.Large
				}) else reactModule.createElement(foundationModule.Text, {
					tag = "auto-xy text-wrap",
					LayoutOrder = 1,
					Text = if p0.hasError then var12 else var11,
					fontStyle = var8.Typography.TitleLarge,
					textStyle = var8.Color.Content.Emphasis
				}),
				DescriptionText = reactModule.createElement(foundationModule.Text, {
					tag = "auto-xy text-wrap",
					LayoutOrder = 2,
					Text = var10.osaContextCardDescriptionText,
					fontStyle = var8.Typography.BodyLarge,
					textStyle = var8.Color.Content.Default
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
	local var18
	local createElement = reactModule.createElement
	local view = foundationModule.View
	local t = {
		tag = "col align-x-center size-full-0 auto-y padding-xxlarge radius-large bg-shift-100 gap-xlarge",
		sizeConstraint = { MaxSize = Vector2.new(700, 500) }
	}
	local t_1 = {}
	
	if p0.hasError then
		var18 = nil
	else
		var18 = reactModule.createElement
		var18 = var18(foundationModule.View, {
			tag = "col auto-xy bg-action-subtle align-x-center gap-medium radius-large padding-small",
			LayoutOrder = 1,
			onActivated = p0.onAvatarActivated
		}, {
			AvatarCircle = reactModule.createElement(foundationModule.View, { tag = "size-1200-1200", LayoutOrder = 1 }, {
				reactModule.createElement(userTile, {
					dontTruncateTitle = true,
					userId = tostring(p0.userId),
					layoutMode = layoutMode.compact,
					userPresenceType = var9.presence,
					onActivated = p0.onAvatarActivated,
					isRobloxSubscriber = if fFlagEnableBlackbirdCheck then p0.isRobloxSubscriber else nil,
					selectable = if fFlagAppChatConsoleFocusFixesModule then false else nil
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
						fontStyle = var8.Typography.TitleMedium,
						textStyle = var8.Color.Content.Emphasis
					}),
					Badge = reactModule.createElement(foundationModule.Icon, {
						LayoutOrder = 2,
						name = foundationModule.Enums.IconName.RobloxPlus,
						size = foundationModule.Enums.IconSize.Small,
						style = var8.Color.Content.Emphasis
					})
				}) else reactModule.createElement(foundationModule.Text, {
					tag = "auto-xy",
					LayoutOrder = 1,
					Text = p0.displayName,
					fontStyle = var8.Typography.TitleMedium,
					textStyle = var8.Color.Content.Emphasis
				}),
				Username = reactModule.createElement(foundationModule.Text, {
					tag = "auto-xy",
					LayoutOrder = 2,
					Text = p0.username,
					fontStyle = var8.Typography.BodySmall,
					textStyle = var8.Color.Content.Muted
				})
			})
		})
	end
	t_1.AvatarContainer = var18
	t_1.TextContainer = reactModule.createElement(foundationModule.View, {
		tag = "col align-x-center auto-xy",
		LayoutOrder = 2,
		ref = p1
	}, {
		HeadingText = reactModule.createElement(foundationModule.Text, {
			tag = "auto-xy text-wrap",
			LayoutOrder = 1,
			Text = if p0.hasError then var12 else var11,
			fontStyle = var8.Typography.TitleLarge,
			textStyle = var8.Color.Content.Emphasis
		}),
		DescriptionText = reactModule.createElement(foundationModule.Text, {
			tag = "auto-xy text-wrap",
			LayoutOrder = 2,
			Text = var10.osaContextCardDescriptionText,
			fontStyle = var8.Typography.BodyLarge,
			textStyle = var8.Color.Content.Default
		})
	})
	
	return createElement(view, t, t_1)
end))