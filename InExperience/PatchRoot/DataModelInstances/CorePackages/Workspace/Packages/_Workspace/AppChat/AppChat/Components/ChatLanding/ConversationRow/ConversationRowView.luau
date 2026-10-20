local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local _ = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local DomLocatorsModule = require(AppChat.Utils.DomLocators)
local SquadsModule = require(Parent.Squads)
local FFlagDebugAppChatEnableDomLocatorsModule = require(AppChat.Flags.FFlagDebugAppChatEnableDomLocators)
local FFlagAppChatExtendConversationListRowDividersModule = require(AppChat.Flags.FFlagAppChatExtendConversationListRowDividers)
local FFlagAppChatRemoveConversationListDividerModule = require(AppChat.Flags.FFlagAppChatRemoveConversationListDivider)
local FFlagAppChatUseBindingConversationFacePileModule = require(AppChat.Flags.FFlagAppChatUseBindingConversationFacePile)
local FFlagAppChatTimestampInSubtitleConversationRowModule = require(AppChat.Flags.FFlagAppChatTimestampInSubtitleConversationRow)
local ConversationFacePileBindingModule = require(script.Parent.ConversationFacePileBinding)
local ConversationRowSubtitleModule = require(script.Parent.ConversationRowSubtitle)
local UseGetOneToOneFriendIdFromConversationIdModule = require(AppChat.Hooks.useGetOneToOneFriendIdFromConversationId)
local UseIsRobloxSubscriberBindingFunction = require(Parent.UserProfiles).Hooks.useIsRobloxSubscriberBinding
local SquadButtonSourceEnum = SquadsModule.Enums.SquadButtonSourceEnum
local SquadComponentAccessWrapper = SquadsModule.SquadComponentAccessWrapper
local SquadJoinButton = SquadsModule.SquadJoinButton
local MemoResult = ReactModule.memo((require(AppChat.Components.Cells.ConversationFacePile)))

local function SubscriptionBadge(p1)
	-- upvalues: FoundationModule (copy), ReactModule (copy)
	return ReactModule.createElement(FoundationModule.View, {
		tag = "size-400-400",
		Name = "subscriptionBadge",
		LayoutOrder = 2,
		testId = "conversation-row-subscription-badge",
		Visible = p1.visible
	}, {
		icon = ReactModule.createElement(FoundationModule.Icon, {
			name = FoundationModule.Enums.IconName.RobloxPlus,
			size = FoundationModule.Enums.IconSize.Small,
			style = FoundationModule.Hooks.useTokens().Color.Content.Emphasis
		})
	})
end

local function LegacySubscriptionBadgeHost(p1)
	-- upvalues: SignalsReactModule (copy), UseGetOneToOneFriendIdFromConversationIdModule (copy), UseIsRobloxSubscriberBindingFunction (copy), ReactModule (copy), SubscriptionBadge (copy)
	return ReactModule.createElement(SubscriptionBadge, {
		visible = UseIsRobloxSubscriberBindingFunction((UseGetOneToOneFriendIdFromConversationIdModule(SignalsReactModule.useSignalState(p1.itemSignal).id)))
	})
end

local function LegacyConversationFacePileHost(p1)
	-- upvalues: SignalsReactModule (copy), ReactModule (copy), MemoResult (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(p1.itemSignal)
	
	return ReactModule.createElement(MemoResult, {
		selectable = false,
		conversationId = UseSignalStateResult.id,
		onActivated = p1.onActivated,
		localUserId = SignalsReactModule.useSignalState(UseSignalStateResult.presentationSignal).localUserId
	})
end

local function SquadButtonHost(p1)
	-- upvalues: SignalsReactModule (copy), ReactModule (copy), FoundationModule (copy), SquadComponentAccessWrapper (copy), SquadJoinButton (copy), SquadButtonSourceEnum (copy), FFlagDebugAppChatEnableDomLocatorsModule (copy), DomLocatorsModule (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(p1.itemSignal)
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "row align-x-right align-y-center auto-xy",
		LayoutOrder = 0
	}, {
		wrapper = ReactModule.createElement(SquadComponentAccessWrapper, { parentChannelId = UseSignalStateResult.id }, {
			button = ReactModule.createElement(SquadJoinButton, {
				isFullWidth = false,
				isInCard = false,
				layoutOrder = 0,
				Selectable = false,
				shouldAnimate = false,
				conversationId = UseSignalStateResult.id,
				onActivated = p1.onActivated,
				squadButtonSource = SquadButtonSourceEnum.ConversationEntry,
				squadLocation = p1.squadLocation,
				testId = if FFlagDebugAppChatEnableDomLocatorsModule and p1.locatorTitle then DomLocatorsModule.chatLandingConversationEntrySquadButton(p1.locatorTitle) else nil
			})
		})
	})
end

return ReactModule.memo(function(p1)
	-- upvalues: FoundationModule (copy), ReactModule (copy), FFlagDebugAppChatEnableDomLocatorsModule (copy), FFlagAppChatExtendConversationListRowDividersModule (copy), FFlagAppChatUseBindingConversationFacePileModule (copy), ConversationFacePileBindingModule (copy), LegacyConversationFacePileHost (copy), SubscriptionBadge (copy), LegacySubscriptionBadgeHost (copy), FFlagAppChatTimestampInSubtitleConversationRowModule (copy), ConversationRowSubtitleModule (copy), SquadButtonHost (copy), FFlagAppChatRemoveConversationListDividerModule (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local _UDim = UDim.new(0, p1.pagePaddingRight)
	local IsShowBackground = p1.showBackground ~= false
	
	return ReactModule.createElement(FoundationModule.View, {
		BorderSizePixel = 0,
		backgroundStyle = UseTokensResult.Color.None,
		Size = UDim2.new(1, 0, 0, p1.entryHeight),
		testId = if FFlagDebugAppChatEnableDomLocatorsModule then p1.testId else nil
	}, {
		cell = ReactModule.createElement(FoundationModule.View, {
			Name = "cell",
			tag = {
				["size-full"] = true,
				["bg-surface-0"] = IsShowBackground
			},
			backgroundStyle = if IsShowBackground then nil else UseTokensResult.Color.None,
			selection = { Selectable = true },
			onActivated = p1.onRowActivated,
			stateLayer = if IsShowBackground then {
				affordance = FoundationModule.Enums.StateLayerAffordance.Background
			} else nil,
			ref = p1.rowRef
		}, {
			debugCellContainer = if p1.debugCellValue then ReactModule.createElement("Folder", {}, {
				debugCell = ReactModule.createElement("StringValue", { Value = p1.debugCellValue })
			}) else nil,
			content = ReactModule.createElement(FoundationModule.View, {
				tag = "row align-y-center gap-small size-full",
				padding = {
					left = UDim.new(0, p1.pagePaddingLeft),
					right = if FFlagAppChatExtendConversationListRowDividersModule then nil else _UDim
				}
			}, {
				avatar = ReactModule.createElement(FoundationModule.View, { tag = "size-1000-1000", LayoutOrder = 0 }, {
					facePile = if FFlagAppChatUseBindingConversationFacePileModule then ReactModule.createElement(ConversationFacePileBindingModule, { itemSignal = p1.itemSignal }) else ReactModule.createElement(LegacyConversationFacePileHost, {
						itemSignal = p1.itemSignal,
						onActivated = p1.onRowActivated
					})
				}),
				body = ReactModule.createElement(FoundationModule.View, {
					tag = "col fill size-0-full clip",
					Name = "body",
					LayoutOrder = 1
				}, {
					mainContent = ReactModule.createElement(FoundationModule.View, {
						tag = "row align-y-center fill gap-small size-full-0 clip",
						Name = "mainContent",
						LayoutOrder = 1,
						padding = if FFlagAppChatExtendConversationListRowDividersModule then { right = _UDim } else nil
					}, {
						info = ReactModule.createElement(FoundationModule.View, {
							tag = "col align-y-center fill gap-xxsmall size-0-full clip",
							LayoutOrder = 1
						}, {
							titleContainer = ReactModule.createElement(FoundationModule.View, {
								tag = "row align-y-center gap-xxsmall size-full-0 auto-y clip",
								Name = "titleContainer",
								LayoutOrder = 1
							}, {
								title = ReactModule.createElement(FoundationModule.Text, {
									tag = "shrink auto-xy text-title-large text-align-x-left text-truncate-split content-default",
									Name = "title",
									LayoutOrder = 1,
									Text = p1.title
								}),
								subscriptionBadge = if FFlagAppChatUseBindingConversationFacePileModule then ReactModule.createElement(SubscriptionBadge, { visible = p1.showSubscriptionBadge }) else ReactModule.createElement(LegacySubscriptionBadgeHost, { itemSignal = p1.itemSignal })
							}),
							subtitle = if FFlagAppChatTimestampInSubtitleConversationRowModule then nil else ReactModule.createElement(FoundationModule.Text, {
								tag = "size-full-0 auto-y text-body-small text-align-x-left text-truncate-end content-default",
								LayoutOrder = 2,
								Text = p1.subtitleText
							}),
							subtitleRow = if FFlagAppChatTimestampInSubtitleConversationRowModule then ReactModule.createElement(ConversationRowSubtitleModule, {
								LayoutOrder = 2,
								subtitleText = p1.subtitleText,
								timestampText = p1.timestampText
							}) else nil
						}),
						rightContent = ReactModule.createElement(FoundationModule.View, {
							tag = "row align-y-center size-0-full auto-x",
							LayoutOrder = 2
						}, {
							squadButton = if p1.showSquadButton then ReactModule.createElement(SquadButtonHost, {
								itemSignal = p1.itemSignal,
								locatorTitle = p1.locatorTitle,
								onActivated = p1.onSquadActivated,
								squadLocation = p1.squadLocation
							}) else nil,
							timestampCluster = ReactModule.createElement(FoundationModule.View, {
								tag = "row align-y-center gap-xsmall auto-xy",
								Name = "timestampCluster",
								LayoutOrder = 1,
								Visible = p1.showTimestamp
							}, {
								timestamp = if FFlagAppChatTimestampInSubtitleConversationRowModule then nil else ReactModule.createElement(FoundationModule.Text, {
									tag = "auto-xy text-body-small content-default",
									Name = "timeStamp",
									LayoutOrder = 1,
									testId = "conversation-row-timestamp",
									Text = p1.timestampText
								}),
								unreadDot = ReactModule.createElement(FoundationModule.View, {
									tag = "size-200-200 radius-circle bg-action-emphasis",
									Name = "unreadDot",
									LayoutOrder = 2,
									Visible = p1.showUnread
								})
							})
						})
					}),
					divider = if FFlagAppChatRemoveConversationListDividerModule then nil else ReactModule.createElement(FoundationModule.View, {
						tag = "size-full-0 auto-y",
						Name = "divider",
						LayoutOrder = 2
					}, {
						line = ReactModule.createElement(FoundationModule.Divider)
					})
				})
			})
		})
	})
end)