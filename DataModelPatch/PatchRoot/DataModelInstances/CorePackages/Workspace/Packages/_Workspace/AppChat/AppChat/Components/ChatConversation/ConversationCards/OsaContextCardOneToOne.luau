local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UserTile = require(Parent.UserTile).UserTile
local LayoutMode = require(Parent.UserTile).LayoutMode
local Skeleton = FoundationModule.Skeleton
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseFoundationPresenceModule = require(AppChat.Hooks.useFoundationPresence)
local FFlagAppChatContextCardNameLoadingShimmerModule = require(AppChat.Flags.FFlagAppChatContextCardNameLoadingShimmer)
local FFlagEnableBlackbirdCheck = require(Parent.SharedFlags).FFlagEnableBlackbirdCheck

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: UseTokensFunction (copy), UseFoundationPresenceModule (copy), UseLocalizationFunction (copy), FFlagAppChatContextCardNameLoadingShimmerModule (copy), ReactModule (copy), FoundationModule (copy), Skeleton (copy), UserTile (copy), LayoutMode (copy), FFlagEnableBlackbirdCheck (copy)
	local UseTokensResult = UseTokensFunction()
	local Size = UseTokensResult.Size
	local UseFoundationPresenceModuleResult = UseFoundationPresenceModule(p1.userId)
	local UseLocalizationResult = UseLocalizationFunction({
		firstConversationWithThisUserHeadingText = "Feature.Chat.Heading.FirstConversationWithThisUser",
		firstInteractionWithThisPersonHeadingText = "Feature.Chat.Heading.FirstInteractionWithThisPerson",
		osaContextCardDescriptionText = "Feature.Chat.Description.OSAContextCardDescription",
		user = "Feature.Chat.Label.User",
		firstConversationWithHeadingText = {
			"Feature.Chat.Heading.FirstConversationWith",
			displayName = p1.displayName
		},
		firstInteractionWithHeadingText = {
			"Feature.Chat.Heading.FirstInteractionWith",
			displayName = p1.displayName
		}
	})
	local IsChatUserMessagesEnabled = p1.isChatUserMessagesEnabled
	local FirstConversationWithHeadingText = if IsChatUserMessagesEnabled then UseLocalizationResult.firstConversationWithHeadingText else UseLocalizationResult.firstInteractionWithHeadingText
	local FirstConversationWithThisUserHeadingText = if IsChatUserMessagesEnabled then UseLocalizationResult.firstConversationWithThisUserHeadingText else UseLocalizationResult.firstInteractionWithThisPersonHeadingText
	
	if FFlagAppChatContextCardNameLoadingShimmerModule then
		local NoHasError: boolean = not p1.displayName and not p1.hasError
		local NoHasError1: boolean = not p1.username and not p1.hasError
		local NoHasError2: boolean = not p1.avatarThumbnail and not p1.hasError
		local NoNoHasError2: boolean = not NoHasError and (not NoHasError1 and not NoHasError2)
		
		return ReactModule.createElement(FoundationModule.View, {
			tag = "col align-x-center size-full-0 auto-y padding-xxlarge radius-large bg-shift-100 gap-xlarge",
			sizeConstraint = { MaxSize = Vector2.new(700, 500) }
		}, {
			AvatarContainer = ReactModule.createElement(FoundationModule.View, {
				tag = "col auto-xy bg-action-subtle align-x-center gap-medium radius-large padding-small",
				LayoutOrder = 1,
				onActivated = if NoNoHasError2 then p1.onAvatarActivated else nil
			}, {
				AvatarCircle = if NoHasError2 then ReactModule.createElement(Skeleton, {
					LayoutOrder = 1,
					Size = UDim2.new(0, Size.Size_1200, 0, Size.Size_1200),
					radius = FoundationModule.Enums.Radius.Circle
				}) else ReactModule.createElement(FoundationModule.View, { tag = "size-1200-1200", LayoutOrder = 1 }, {
					ReactModule.createElement(UserTile, {
						dontTruncateTitle = true,
						userId = tostring(p1.userId),
						layoutMode = LayoutMode.compact,
						userPresenceType = UseFoundationPresenceModuleResult.presence,
						onActivated = p1.onAvatarActivated,
						isRobloxSubscriber = if FFlagEnableBlackbirdCheck then p1.isRobloxSubscriber else nil
					})
				}),
				AvatarTextContainer = ReactModule.createElement(FoundationModule.View, {
					tag = "col auto-xy align-x-center gap-xxsmall",
					LayoutOrder = 2
				}, {
					DisplayName = if NoHasError then ReactModule.createElement(Skeleton, {
						LayoutOrder = 1,
						Size = UDim2.new(0, Size.Size_2500, 0, UseTokensResult.Typography.TitleMedium.FontSize),
						radius = FoundationModule.Enums.Radius.Large
					}) elseif FFlagEnableBlackbirdCheck and p1.isRobloxSubscriber and not p1.hasError then ReactModule.createElement(FoundationModule.View, {
						tag = "row auto-xy align-y-center gap-xsmall",
						LayoutOrder = 1
					}, {
						Name = ReactModule.createElement(FoundationModule.Text, {
							tag = "auto-xy",
							LayoutOrder = 1,
							Text = p1.displayName,
							fontStyle = UseTokensResult.Typography.TitleMedium,
							textStyle = UseTokensResult.Color.Content.Emphasis
						}),
						Badge = ReactModule.createElement(FoundationModule.Icon, {
							LayoutOrder = 2,
							name = FoundationModule.Enums.IconName.RobloxPlus,
							size = FoundationModule.Enums.IconSize.Small,
							style = UseTokensResult.Color.Content.Emphasis
						})
					}) else ReactModule.createElement(FoundationModule.Text, {
						tag = "auto-xy",
						LayoutOrder = 1,
						Text = if p1.hasError then UseLocalizationResult.user else p1.displayName,
						fontStyle = UseTokensResult.Typography.TitleMedium,
						textStyle = UseTokensResult.Color.Content.Emphasis
					}),
					Username = if NoHasError1 then ReactModule.createElement(Skeleton, {
						LayoutOrder = 2,
						Size = UDim2.new(0, Size.Size_2000, 0, UseTokensResult.Typography.BodySmall.FontSize),
						radius = FoundationModule.Enums.Radius.Large
					}) else ReactModule.createElement(FoundationModule.Text, {
						tag = "auto-xy",
						LayoutOrder = 2,
						Text = if p1.hasError then UseLocalizationResult.user else p1.username,
						fontStyle = UseTokensResult.Typography.BodySmall,
						textStyle = UseTokensResult.Color.Content.Muted
					})
				})
			}),
			TextContainer = ReactModule.createElement(FoundationModule.View, {
				tag = "col align-x-center auto-xy",
				LayoutOrder = 2,
				ref = Ref
			}, {
				HeadingText = if NoHasError then ReactModule.createElement(Skeleton, {
					LayoutOrder = 1,
					Size = UDim2.new(0, Size.Size_3000, 0, UseTokensResult.Typography.TitleLarge.FontSize + UseTokensResult.Gap.XXSmall),
					radius = FoundationModule.Enums.Radius.Large
				}) else ReactModule.createElement(FoundationModule.Text, {
					tag = "auto-xy text-wrap",
					LayoutOrder = 1,
					Text = if p1.hasError then FirstConversationWithThisUserHeadingText else FirstConversationWithHeadingText,
					fontStyle = UseTokensResult.Typography.TitleLarge,
					textStyle = UseTokensResult.Color.Content.Emphasis
				}),
				DescriptionText = ReactModule.createElement(FoundationModule.Text, {
					tag = "auto-xy text-wrap",
					LayoutOrder = 2,
					Text = UseLocalizationResult.osaContextCardDescriptionText,
					fontStyle = UseTokensResult.Typography.BodyLarge,
					textStyle = UseTokensResult.Color.Content.Default
				})
			})
		})
	else
		return if if p1.displayName and p1.username then not p1.avatarThumbnail and not p1.hasError else not p1.hasError then ReactModule.createElement(FoundationModule.View, {
			tag = "size-full-0 auto-y",
			sizeConstraint = { MaxSize = Vector2.new(700, 500) }
		}, {
			ReactModule.createElement(FoundationModule.Skeleton, {
				Size = UDim2.new(1, 0, 0, 270),
				radius = FoundationModule.Enums.Radius.Large
			})
		}) else ReactModule.createElement(FoundationModule.View, {
			tag = "col align-x-center size-full-0 auto-y padding-xxlarge radius-large bg-shift-100 gap-xlarge",
			sizeConstraint = { MaxSize = Vector2.new(700, 500) }
		}, {
			AvatarContainer = if p1.hasError then nil else ReactModule.createElement(FoundationModule.View, {
				tag = "col auto-xy bg-action-subtle align-x-center gap-medium radius-large padding-small",
				LayoutOrder = 1,
				onActivated = p1.onAvatarActivated
			}, {
				AvatarCircle = ReactModule.createElement(FoundationModule.View, { tag = "size-1200-1200", LayoutOrder = 1 }, {
					ReactModule.createElement(UserTile, {
						dontTruncateTitle = true,
						userId = tostring(p1.userId),
						layoutMode = LayoutMode.compact,
						userPresenceType = UseFoundationPresenceModuleResult.presence,
						onActivated = p1.onAvatarActivated,
						isRobloxSubscriber = if FFlagEnableBlackbirdCheck then p1.isRobloxSubscriber else nil
					})
				}),
				AvatarTextContainer = ReactModule.createElement(FoundationModule.View, { tag = "col auto-xy align-x-center", LayoutOrder = 2 }, {
					DisplayName = if FFlagEnableBlackbirdCheck and p1.isRobloxSubscriber then ReactModule.createElement(FoundationModule.View, {
						tag = "row auto-xy align-y-center gap-xsmall",
						LayoutOrder = 1
					}, {
						Name = ReactModule.createElement(FoundationModule.Text, {
							tag = "auto-xy",
							LayoutOrder = 1,
							Text = p1.displayName,
							fontStyle = UseTokensResult.Typography.TitleMedium,
							textStyle = UseTokensResult.Color.Content.Emphasis
						}),
						Badge = ReactModule.createElement(FoundationModule.Icon, {
							LayoutOrder = 2,
							name = FoundationModule.Enums.IconName.RobloxPlus,
							size = FoundationModule.Enums.IconSize.Small,
							style = UseTokensResult.Color.Content.Emphasis
						})
					}) else ReactModule.createElement(FoundationModule.Text, {
						tag = "auto-xy",
						LayoutOrder = 1,
						Text = p1.displayName,
						fontStyle = UseTokensResult.Typography.TitleMedium,
						textStyle = UseTokensResult.Color.Content.Emphasis
					}),
					Username = ReactModule.createElement(FoundationModule.Text, {
						tag = "auto-xy",
						LayoutOrder = 2,
						Text = p1.username,
						fontStyle = UseTokensResult.Typography.BodySmall,
						textStyle = UseTokensResult.Color.Content.Muted
					})
				})
			}),
			TextContainer = ReactModule.createElement(FoundationModule.View, {
				tag = "col align-x-center auto-xy",
				LayoutOrder = 2,
				ref = Ref
			}, {
				HeadingText = ReactModule.createElement(FoundationModule.Text, {
					tag = "auto-xy text-wrap",
					LayoutOrder = 1,
					Text = if p1.hasError then FirstConversationWithThisUserHeadingText else FirstConversationWithHeadingText,
					fontStyle = UseTokensResult.Typography.TitleLarge,
					textStyle = UseTokensResult.Color.Content.Emphasis
				}),
				DescriptionText = ReactModule.createElement(FoundationModule.Text, {
					tag = "auto-xy text-wrap",
					LayoutOrder = 2,
					Text = UseLocalizationResult.osaContextCardDescriptionText,
					fontStyle = UseTokensResult.Typography.BodyLarge,
					textStyle = UseTokensResult.Color.Content.Default
				})
			})
		})
	end
end))