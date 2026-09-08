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

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: useTokens (ref), useFoundationPresenceModule (ref), useLocalization (ref), fFlagAppChatDisclosureUpdateEnabled (ref), fFlagAppChatDiscloseUpdateSecondVersion (ref), universalAppPolicyModule (ref), fFlagAppChatContextCardNameLoadingShimmerModule (ref), reactModule (ref), foundationModule (ref), skeleton (ref), userTile (ref), layoutMode (ref), fFlagEnableBlackbirdCheck (ref), fFlagAppChatConsoleFocusFixesModule (ref)
	local var1 = useTokens()
	local size = var1.Size
	local var2 = useFoundationPresenceModule(p1.userId)
	local var3 = useLocalization({
		firstInteractionWithThisPersonHeadingText = "Feature.Chat.Heading.FirstInteractionWithThisPerson",
		user = "Feature.Chat.Label.User",
		firstConversationWithThisUserHeadingText = if fFlagAppChatDisclosureUpdateEnabled and not fFlagAppChatDiscloseUpdateSecondVersion then "Feature.Chat.Heading.SafeChattingWithThisUser" else "Feature.Chat.Heading.FirstConversationWithThisUser",
		firstConversationWithHeadingText = if fFlagAppChatDisclosureUpdateEnabled and not fFlagAppChatDiscloseUpdateSecondVersion then {
			"Feature.Chat.Heading.SafeChattingWithUsername",
			displayName = p1.displayName
		} else {
			"Feature.Chat.Heading.FirstConversationWith",
			displayName = p1.displayName
		},
		firstInteractionWithHeadingText = {
			"Feature.Chat.Heading.FirstInteractionWith",
			displayName = p1.displayName
		},
		osaContextCardDescriptionText = if fFlagAppChatDisclosureUpdateEnabled and universalAppPolicyModule.getAppFeaturePolicies().getCanSeeChatTerminology() then "Feature.Chat.Description.InlineContextCardDescription" else "Feature.Chat.Description.OSAContextCardDescription"
	})
	local isChatUserMessagesEnabled = p1.isChatUserMessagesEnabled
	local var4 = if fFlagAppChatDisclosureUpdateEnabled then if universalAppPolicyModule.getAppFeaturePolicies().getCanSeeChatTerminology() then var3.firstConversationWithHeadingText else var3.firstInteractionWithHeadingText elseif isChatUserMessagesEnabled then var3.firstConversationWithHeadingText else var3.firstInteractionWithHeadingText
	local var5 = if fFlagAppChatDisclosureUpdateEnabled then if universalAppPolicyModule.getAppFeaturePolicies().getCanSeeChatTerminology() then var3.firstConversationWithThisUserHeadingText else var3.firstInteractionWithThisPersonHeadingText elseif isChatUserMessagesEnabled then var3.firstConversationWithThisUserHeadingText else var3.firstInteractionWithThisPersonHeadingText
	
	if fFlagAppChatContextCardNameLoadingShimmerModule then
		local var6 = not p1.displayName and not p1.hasError
		local var7 = not p1.username and not p1.hasError
		local var8 = not p1.avatarThumbnail and not p1.hasError
		
		return reactModule.createElement(foundationModule.View, {
			tag = "col align-x-center size-full-0 auto-y padding-xxlarge radius-large bg-shift-100 gap-xlarge",
			sizeConstraint = { MaxSize = Vector2.new(700, 500) }
		}, {
			AvatarContainer = reactModule.createElement(foundationModule.View, {
				tag = "col auto-xy bg-action-subtle align-x-center gap-medium radius-large padding-small",
				LayoutOrder = 1,
				onActivated = if not var6 and (not var7 and not var8) then p1.onAvatarActivated else nil
			}, {
				AvatarCircle = if var8 then reactModule.createElement(skeleton, {
					LayoutOrder = 1,
					Size = UDim2.new(0, size.Size_1200, 0, size.Size_1200),
					radius = foundationModule.Enums.Radius.Circle
				}) else reactModule.createElement(foundationModule.View, { tag = "size-1200-1200", LayoutOrder = 1 }, {
					reactModule.createElement(userTile, {
						dontTruncateTitle = true,
						userId = tostring(p1.userId),
						layoutMode = layoutMode.compact,
						userPresenceType = var2.presence,
						onActivated = p1.onAvatarActivated,
						isRobloxSubscriber = if fFlagEnableBlackbirdCheck then p1.isRobloxSubscriber else nil,
						selectable = if fFlagAppChatConsoleFocusFixesModule then false else nil
					})
				}),
				AvatarTextContainer = reactModule.createElement(foundationModule.View, {
					tag = "col auto-xy align-x-center gap-xxsmall",
					LayoutOrder = 2
				}, {
					DisplayName = if var6 then reactModule.createElement(skeleton, {
						LayoutOrder = 1,
						Size = UDim2.new(0, size.Size_2500, 0, var1.Typography.TitleMedium.FontSize),
						radius = foundationModule.Enums.Radius.Large
					}) elseif fFlagEnableBlackbirdCheck and p1.isRobloxSubscriber and not p1.hasError then reactModule.createElement(foundationModule.View, {
						tag = "row auto-xy align-y-center gap-xsmall",
						LayoutOrder = 1
					}, {
						Name = reactModule.createElement(foundationModule.Text, {
							tag = "auto-xy",
							LayoutOrder = 1,
							Text = p1.displayName,
							fontStyle = var1.Typography.TitleMedium,
							textStyle = var1.Color.Content.Emphasis
						}),
						Badge = reactModule.createElement(foundationModule.Icon, {
							LayoutOrder = 2,
							name = foundationModule.Enums.IconName.RobloxPlus,
							size = foundationModule.Enums.IconSize.Small,
							style = var1.Color.Content.Emphasis
						})
					}) else reactModule.createElement(foundationModule.Text, {
						tag = "auto-xy",
						LayoutOrder = 1,
						Text = if p1.hasError then var3.user else p1.displayName,
						fontStyle = var1.Typography.TitleMedium,
						textStyle = var1.Color.Content.Emphasis
					}),
					Username = if var7 then reactModule.createElement(skeleton, {
						LayoutOrder = 2,
						Size = UDim2.new(0, size.Size_2000, 0, var1.Typography.BodySmall.FontSize),
						radius = foundationModule.Enums.Radius.Large
					}) else reactModule.createElement(foundationModule.Text, {
						tag = "auto-xy",
						LayoutOrder = 2,
						Text = if p1.hasError then var3.user else p1.username,
						fontStyle = var1.Typography.BodySmall,
						textStyle = var1.Color.Content.Muted
					})
				})
			}),
			TextContainer = reactModule.createElement(foundationModule.View, {
				tag = "col align-x-center auto-xy",
				LayoutOrder = 2,
				ref = p2
			}, {
				HeadingText = if var6 then reactModule.createElement(skeleton, {
					LayoutOrder = 1,
					Size = UDim2.new(0, size.Size_3000, 0, var1.Typography.TitleLarge.FontSize + var1.Gap.XXSmall),
					radius = foundationModule.Enums.Radius.Large
				}) else reactModule.createElement(foundationModule.Text, {
					tag = "auto-xy text-wrap",
					LayoutOrder = 1,
					Text = if p1.hasError then var5 else var4,
					fontStyle = var1.Typography.TitleLarge,
					textStyle = var1.Color.Content.Emphasis
				}),
				DescriptionText = reactModule.createElement(foundationModule.Text, {
					tag = "auto-xy text-wrap",
					LayoutOrder = 2,
					Text = var3.osaContextCardDescriptionText,
					fontStyle = var1.Typography.BodyLarge,
					textStyle = var1.Color.Content.Default
				})
			})
		})
	elseif p1.displayName and (p1.username and (not p1.avatarThumbnail and not p1.hasError)) then
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
	local var9
	local createElement = reactModule.createElement
	local view = foundationModule.View
	local t = {
		tag = "col align-x-center size-full-0 auto-y padding-xxlarge radius-large bg-shift-100 gap-xlarge",
		sizeConstraint = { MaxSize = Vector2.new(700, 500) }
	}
	local t_1 = {}
	
	if p1.hasError then
		var9 = nil
	else
		var9 = reactModule.createElement
		var9 = var9(foundationModule.View, {
			tag = "col auto-xy bg-action-subtle align-x-center gap-medium radius-large padding-small",
			LayoutOrder = 1,
			onActivated = p1.onAvatarActivated
		}, {
			AvatarCircle = reactModule.createElement(foundationModule.View, { tag = "size-1200-1200", LayoutOrder = 1 }, {
				reactModule.createElement(userTile, {
					dontTruncateTitle = true,
					userId = tostring(p1.userId),
					layoutMode = layoutMode.compact,
					userPresenceType = var2.presence,
					onActivated = p1.onAvatarActivated,
					isRobloxSubscriber = if fFlagEnableBlackbirdCheck then p1.isRobloxSubscriber else nil,
					selectable = if fFlagAppChatConsoleFocusFixesModule then false else nil
				})
			}),
			AvatarTextContainer = reactModule.createElement(foundationModule.View, { tag = "col auto-xy align-x-center", LayoutOrder = 2 }, {
				DisplayName = if fFlagEnableBlackbirdCheck and p1.isRobloxSubscriber then reactModule.createElement(foundationModule.View, {
					tag = "row auto-xy align-y-center gap-xsmall",
					LayoutOrder = 1
				}, {
					Name = reactModule.createElement(foundationModule.Text, {
						tag = "auto-xy",
						LayoutOrder = 1,
						Text = p1.displayName,
						fontStyle = var1.Typography.TitleMedium,
						textStyle = var1.Color.Content.Emphasis
					}),
					Badge = reactModule.createElement(foundationModule.Icon, {
						LayoutOrder = 2,
						name = foundationModule.Enums.IconName.RobloxPlus,
						size = foundationModule.Enums.IconSize.Small,
						style = var1.Color.Content.Emphasis
					})
				}) else reactModule.createElement(foundationModule.Text, {
					tag = "auto-xy",
					LayoutOrder = 1,
					Text = p1.displayName,
					fontStyle = var1.Typography.TitleMedium,
					textStyle = var1.Color.Content.Emphasis
				}),
				Username = reactModule.createElement(foundationModule.Text, {
					tag = "auto-xy",
					LayoutOrder = 2,
					Text = p1.username,
					fontStyle = var1.Typography.BodySmall,
					textStyle = var1.Color.Content.Muted
				})
			})
		})
	end
	t_1.AvatarContainer = var9
	t_1.TextContainer = reactModule.createElement(foundationModule.View, {
		tag = "col align-x-center auto-xy",
		LayoutOrder = 2,
		ref = p2
	}, {
		HeadingText = reactModule.createElement(foundationModule.Text, {
			tag = "auto-xy text-wrap",
			LayoutOrder = 1,
			Text = if p1.hasError then var5 else var4,
			fontStyle = var1.Typography.TitleLarge,
			textStyle = var1.Color.Content.Emphasis
		}),
		DescriptionText = reactModule.createElement(foundationModule.Text, {
			tag = "auto-xy text-wrap",
			LayoutOrder = 2,
			Text = var3.osaContextCardDescriptionText,
			fontStyle = var1.Typography.BodyLarge,
			textStyle = var1.Color.Content.Default
		})
	})
	
	return createElement(view, t, t_1)
end))