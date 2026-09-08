local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local _ = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local domLocatorsModule = require(appChat.Utils.DomLocators)
local squadsModule = require(parent.Squads)
local fFlagDebugAppChatEnableDomLocatorsModule = require(appChat.Flags.FFlagDebugAppChatEnableDomLocators)
local fFlagAppChatExtendConversationListRowDividersModule = require(appChat.Flags.FFlagAppChatExtendConversationListRowDividers)
local fFlagAppChatRemoveConversationListDividerModule = require(appChat.Flags.FFlagAppChatRemoveConversationListDivider)
local fFlagAppChatUseBindingConversationFacePileModule = require(appChat.Flags.FFlagAppChatUseBindingConversationFacePile)
local conversationFacePileModule = require(appChat.Components.Cells.ConversationFacePile)
local conversationFacePileBindingModule = require(script.Parent.ConversationFacePileBinding)
local useGetOneToOneFriendIdFromConversationIdModule = require(appChat.Hooks.useGetOneToOneFriendIdFromConversationId)
local useIsRobloxSubscriberBinding = require(parent.UserProfiles).Hooks.useIsRobloxSubscriberBinding
local squadButtonSourceEnum = squadsModule.Enums.SquadButtonSourceEnum
local squadComponentAccessWrapper = squadsModule.SquadComponentAccessWrapper
local squadJoinButton = squadsModule.SquadJoinButton
local var1 = reactModule.memo(conversationFacePileModule)

local function SubscriptionBadge(p1)
	-- upvalues: foundationModule (ref), reactModule (ref)
	return reactModule.createElement(foundationModule.View, {
		tag = "size-400-400",
		Name = "subscriptionBadge",
		LayoutOrder = 2,
		testId = "conversation-row-subscription-badge",
		Visible = p1.visible
	}, {
		icon = reactModule.createElement(foundationModule.Icon, {
			name = foundationModule.Enums.IconName.RobloxPlus,
			size = foundationModule.Enums.IconSize.Small,
			style = foundationModule.Hooks.useTokens().Color.Content.Emphasis
		})
	})
end

local function LegacySubscriptionBadgeHost(p1)
	-- upvalues: signalsReactModule (ref), useGetOneToOneFriendIdFromConversationIdModule (ref), useIsRobloxSubscriberBinding (ref), reactModule (ref), SubscriptionBadge (ref)
	return reactModule.createElement(SubscriptionBadge, {
		visible = useIsRobloxSubscriberBinding(useGetOneToOneFriendIdFromConversationIdModule(signalsReactModule.useSignalState(p1.itemSignal).id))
	})
end

local function LegacyConversationFacePileHost(p1)
	-- upvalues: signalsReactModule (ref), reactModule (ref), var1 (ref)
	local var2 = signalsReactModule.useSignalState(p1.itemSignal)
	
	return reactModule.createElement(var1, {
		selectable = false,
		conversationId = var2.id,
		onActivated = p1.onActivated,
		localUserId = signalsReactModule.useSignalState(var2.presentationSignal).localUserId
	})
end

local function SquadButtonHost(p1)
	-- upvalues: signalsReactModule (ref), reactModule (ref), foundationModule (ref), squadComponentAccessWrapper (ref), squadJoinButton (ref), squadButtonSourceEnum (ref), fFlagDebugAppChatEnableDomLocatorsModule (ref), domLocatorsModule (ref)
	local var2 = signalsReactModule.useSignalState(p1.itemSignal)
	
	return reactModule.createElement(foundationModule.View, {
		tag = "row align-x-right align-y-center auto-xy",
		LayoutOrder = 0
	}, {
		wrapper = reactModule.createElement(squadComponentAccessWrapper, { parentChannelId = var2.id }, {
			button = reactModule.createElement(squadJoinButton, {
				isFullWidth = false,
				isInCard = false,
				layoutOrder = 0,
				Selectable = false,
				shouldAnimate = false,
				conversationId = var2.id,
				onActivated = p1.onActivated,
				squadButtonSource = squadButtonSourceEnum.ConversationEntry,
				squadLocation = p1.squadLocation,
				testId = if fFlagDebugAppChatEnableDomLocatorsModule and p1.locatorTitle then domLocatorsModule.chatLandingConversationEntrySquadButton(p1.locatorTitle) else nil
			})
		})
	})
end

return reactModule.memo(function(p1)
	-- upvalues: foundationModule (ref), reactModule (ref), fFlagDebugAppChatEnableDomLocatorsModule (ref), fFlagAppChatExtendConversationListRowDividersModule (ref), fFlagAppChatUseBindingConversationFacePileModule (ref), conversationFacePileBindingModule (ref), LegacyConversationFacePileHost (ref), SubscriptionBadge (ref), LegacySubscriptionBadgeHost (ref), SquadButtonHost (ref), fFlagAppChatRemoveConversationListDividerModule (ref)
	local var2 = foundationModule.Hooks.useTokens()
	local uDim = UDim.new(0, p1.pagePaddingLeft)
	local uDim_1 = UDim.new(0, p1.pagePaddingRight)
	local var3 = p1.showBackground ~= false
	
	return reactModule.createElement(foundationModule.View, {
		BorderSizePixel = 0,
		backgroundStyle = var2.Color.None,
		Size = UDim2.new(1, 0, 0, p1.entryHeight),
		testId = if fFlagDebugAppChatEnableDomLocatorsModule then p1.testId else nil
	}, {
		cell = reactModule.createElement(foundationModule.View, {
			Name = "cell",
			tag = { ["size-full"] = true, ["bg-surface-0"] = var3 },
			backgroundStyle = if var3 then nil else var2.Color.None,
			selection = { Selectable = true },
			onActivated = p1.onRowActivated,
			stateLayer = if var3 then {
				affordance = foundationModule.Enums.StateLayerAffordance.Background
			} else nil,
			ref = p1.rowRef
		}, {
			debugCellContainer = if p1.debugCellValue then reactModule.createElement("Folder", {}, {
				debugCell = reactModule.createElement("StringValue", { Value = p1.debugCellValue })
			}) else nil,
			content = reactModule.createElement(foundationModule.View, {
				tag = "row align-y-center gap-small size-full",
				padding = {
					left = uDim,
					right = if fFlagAppChatExtendConversationListRowDividersModule then nil else uDim_1
				}
			}, {
				avatar = reactModule.createElement(foundationModule.View, { tag = "size-1000-1000", LayoutOrder = 0 }, {
					facePile = if fFlagAppChatUseBindingConversationFacePileModule then reactModule.createElement(conversationFacePileBindingModule, { itemSignal = p1.itemSignal }) else reactModule.createElement(LegacyConversationFacePileHost, {
						itemSignal = p1.itemSignal,
						onActivated = p1.onRowActivated
					})
				}),
				body = reactModule.createElement(foundationModule.View, {
					tag = "col fill size-0-full clip",
					Name = "body",
					LayoutOrder = 1
				}, {
					mainContent = reactModule.createElement(foundationModule.View, {
						tag = "row align-y-center fill gap-small size-full-0 clip",
						Name = "mainContent",
						LayoutOrder = 1,
						padding = if fFlagAppChatExtendConversationListRowDividersModule then { right = uDim_1 } else nil
					}, {
						info = reactModule.createElement(foundationModule.View, {
							tag = "col align-y-center fill gap-xxsmall size-0-full clip",
							LayoutOrder = 1
						}, {
							titleContainer = reactModule.createElement(foundationModule.View, {
								tag = "row align-y-center gap-xxsmall size-full-0 auto-y clip",
								Name = "titleContainer",
								LayoutOrder = 1
							}, {
								title = reactModule.createElement(foundationModule.Text, {
									tag = "shrink auto-xy text-title-large text-align-x-left text-truncate-split content-default",
									Name = "title",
									LayoutOrder = 1,
									Text = p1.title
								}),
								subscriptionBadge = if fFlagAppChatUseBindingConversationFacePileModule then reactModule.createElement(SubscriptionBadge, { visible = p1.showSubscriptionBadge }) else reactModule.createElement(LegacySubscriptionBadgeHost, { itemSignal = p1.itemSignal })
							}),
							subtitle = reactModule.createElement(foundationModule.Text, {
								tag = "size-full-0 auto-y text-body-small text-align-x-left text-truncate-end content-default",
								LayoutOrder = 2,
								Text = p1.subtitleText
							})
						}),
						rightContent = reactModule.createElement(foundationModule.View, {
							tag = "row align-y-center size-0-full auto-x",
							LayoutOrder = 2
						}, {
							squadButton = if p1.showSquadButton then reactModule.createElement(SquadButtonHost, {
								itemSignal = p1.itemSignal,
								locatorTitle = p1.locatorTitle,
								onActivated = p1.onSquadActivated,
								squadLocation = p1.squadLocation
							}) else nil,
							timestampCluster = reactModule.createElement(foundationModule.View, {
								tag = "row align-y-center gap-xsmall auto-xy",
								Name = "timestampCluster",
								LayoutOrder = 1,
								Visible = p1.showTimestamp
							}, {
								timestamp = reactModule.createElement(foundationModule.Text, {
									tag = "auto-xy text-body-small content-default",
									Name = "timeStamp",
									LayoutOrder = 1,
									testId = "conversation-row-timestamp",
									Text = p1.timestampText
								}),
								unreadDot = reactModule.createElement(foundationModule.View, {
									tag = "size-200-200 radius-circle bg-action-emphasis",
									Name = "unreadDot",
									LayoutOrder = 2,
									Visible = p1.showUnread
								})
							})
						})
					}),
					divider = if not fFlagAppChatRemoveConversationListDividerModule then reactModule.createElement(foundationModule.View, {
						tag = "size-full-0 auto-y",
						Name = "divider",
						LayoutOrder = 2
					}, {
						line = reactModule.createElement(foundationModule.Divider)
					}) else nil
				})
			})
		})
	})
end)