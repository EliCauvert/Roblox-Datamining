local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local DomLocatorsModule = require(AppChat.Utils.DomLocators)
local SquadsModule = require(Parent.Squads)
local FFlagDebugAppChatEnableDomLocatorsModule = require(AppChat.Flags.FFlagDebugAppChatEnableDomLocators)
local FFlagAppChatExtendConversationListRowDividersModule = require(AppChat.Flags.FFlagAppChatExtendConversationListRowDividers)
local FFlagAppChatRemoveConversationListDividerModule = require(AppChat.Flags.FFlagAppChatRemoveConversationListDivider)
local FFlagAppChatTimestampInSubtitleConversationRowModule = require(AppChat.Flags.FFlagAppChatTimestampInSubtitleConversationRow)
local ConversationRowSubtitleModule = require(script.Parent.ConversationRowSubtitle)
local UseConversationRowPresentationModule = require(script.Parent.useConversationRowPresentation)
local SquadButtonSourceEnum = SquadsModule.Enums.SquadButtonSourceEnum
local SquadComponentAccessWrapper = SquadsModule.SquadComponentAccessWrapper
local SquadJoinButton = SquadsModule.SquadJoinButton
local MemoResult = ReactModule.memo((require(AppChat.Components.Cells.ConversationFacePile)))

return ReactModule.memo(ReactModule.forwardRef(function(p1, Callback)
	-- upvalues: UseConversationRowPresentationModule (copy), FoundationModule (copy), ReactModule (copy), FFlagDebugAppChatEnableDomLocatorsModule (copy), FFlagAppChatExtendConversationListRowDividersModule (copy), MemoResult (copy), FFlagAppChatTimestampInSubtitleConversationRowModule (copy), ConversationRowSubtitleModule (copy), SquadComponentAccessWrapper (copy), SquadJoinButton (copy), SquadButtonSourceEnum (copy), DomLocatorsModule (copy), FFlagAppChatRemoveConversationListDividerModule (copy)
	local UseConversationRowPresentationModuleResult = UseConversationRowPresentationModule({
		conversationId = p1.conversationId,
		entryHeight = p1.entryHeight,
		isSquadEnabled = p1.isSquadEnabled,
		isWideMode = p1.isWideMode,
		showBackground = p1.showBackground,
		onActivated = p1.onActivated,
		onSquadJoinButtonActivated = p1.onSquadJoinButtonActivated,
		fireImpressionEvent = p1.fireImpressionEvent,
		fireClickEvent = p1.fireClickEvent
	})
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local RowRef = UseConversationRowPresentationModuleResult.rowRef
	local UseResult = ReactModule.useCallback(function(Current)
		-- upvalues: RowRef (copy), Callback (copy)
		RowRef.current = Current
		
		if type(Callback) == "function" then
			Callback(Current)
			
			return
		end
		if Callback ~= nil then
			Callback.current = Current
		end
	end, { Callback, RowRef })
	
	if UseConversationRowPresentationModuleResult.hasConversation then
		local _UDim = UDim.new(0, UseConversationRowPresentationModuleResult.pagePaddingRight)
		local ShowBackground = UseConversationRowPresentationModuleResult.showBackground
		
		return ReactModule.createElement(FoundationModule.View, {
			BorderSizePixel = 0,
			backgroundStyle = UseTokensResult.Color.None,
			Size = UDim2.new(1, 0, 0, UseConversationRowPresentationModuleResult.entryHeight),
			testId = if FFlagDebugAppChatEnableDomLocatorsModule then UseConversationRowPresentationModuleResult.testId else nil
		}, {
			cell = ReactModule.createElement(FoundationModule.View, {
				Name = "cell",
				Size = if FFlagAppChatExtendConversationListRowDividersModule then nil else UDim2.fromScale(1, 1),
				tag = { ["size-full"] = true, ["bg-surface-0"] = ShowBackground },
				backgroundStyle = if ShowBackground then nil else UseTokensResult.Color.None,
				selection = { Selectable = true },
				onActivated = UseConversationRowPresentationModuleResult.onRowActivated,
				stateLayer = if ShowBackground then {
					affordance = FoundationModule.Enums.StateLayerAffordance.Background
				} else nil,
				ref = UseResult
			}, {
				debugCellContainer = if p1.debugCellValue then ReactModule.createElement("Folder", {}, {
					debugCell = ReactModule.createElement("StringValue", { Value = p1.debugCellValue })
				}) else nil,
				content = ReactModule.createElement(FoundationModule.View, {
					tag = "row align-y-center gap-small size-full",
					Size = if FFlagAppChatExtendConversationListRowDividersModule then nil else UDim2.fromScale(1, 1),
					padding = {
						left = UDim.new(0, UseConversationRowPresentationModuleResult.pagePaddingLeft),
						right = if FFlagAppChatExtendConversationListRowDividersModule then nil else _UDim
					}
				}, {
					avatar = ReactModule.createElement(FoundationModule.View, { tag = "size-1000-1000", LayoutOrder = 0 }, {
						facePile = ReactModule.createElement(MemoResult, {
							selectable = false,
							conversationId = UseConversationRowPresentationModuleResult.conversationId,
							onActivated = UseConversationRowPresentationModuleResult.onRowActivated,
							participants = UseConversationRowPresentationModuleResult.participants,
							localUserId = p1.localUserId
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
										Text = UseConversationRowPresentationModuleResult.title
									}),
									subscriptionBadge = ReactModule.createElement(FoundationModule.View, {
										tag = "size-400-400",
										Name = "subscriptionBadge",
										LayoutOrder = 2,
										Visible = UseConversationRowPresentationModuleResult.showSubscriptionBadge
									}, {
										icon = ReactModule.createElement(FoundationModule.Icon, {
											name = FoundationModule.Enums.IconName.RobloxPlus,
											size = FoundationModule.Enums.IconSize.Small,
											style = UseTokensResult.Color.Content.Emphasis
										})
									})
								}),
								subtitle = if FFlagAppChatTimestampInSubtitleConversationRowModule then nil else ReactModule.createElement(FoundationModule.Text, {
									tag = "size-full-0 auto-y text-body-small text-align-x-left text-truncate-end content-default",
									LayoutOrder = 2,
									Text = UseConversationRowPresentationModuleResult.subtitleText
								}),
								subtitleRow = if FFlagAppChatTimestampInSubtitleConversationRowModule then ReactModule.createElement(ConversationRowSubtitleModule, {
									LayoutOrder = 2,
									subtitleText = UseConversationRowPresentationModuleResult.subtitleText,
									timestampText = UseConversationRowPresentationModuleResult.timestampText
								}) else nil
							}),
							rightContent = ReactModule.createElement(FoundationModule.View, {
								tag = "row align-y-center size-0-full auto-x",
								LayoutOrder = 2,
								AutomaticSize = Enum.AutomaticSize.X
							}, {
								squadButton = if UseConversationRowPresentationModuleResult.showSquadButton then ReactModule.createElement(FoundationModule.View, {
									tag = "row align-x-right align-y-center auto-xy",
									LayoutOrder = 0
								}, {
									wrapper = ReactModule.createElement(SquadComponentAccessWrapper, {
										parentChannelId = UseConversationRowPresentationModuleResult.conversationId
									}, {
										button = ReactModule.createElement(SquadJoinButton, {
											isFullWidth = false,
											isInCard = false,
											layoutOrder = 0,
											Selectable = false,
											shouldAnimate = false,
											conversationId = UseConversationRowPresentationModuleResult.conversationId,
											onActivated = UseConversationRowPresentationModuleResult.onSquadActivated,
											squadButtonSource = SquadButtonSourceEnum.ConversationEntry,
											squadLocation = UseConversationRowPresentationModuleResult.squadLocation,
											testId = if FFlagDebugAppChatEnableDomLocatorsModule and UseConversationRowPresentationModuleResult.locatorTitle then DomLocatorsModule.chatLandingConversationEntrySquadButton(UseConversationRowPresentationModuleResult.locatorTitle) else nil
										})
									})
								}) else nil,
								timestampCluster = ReactModule.createElement(FoundationModule.View, {
									tag = "row align-y-center gap-xsmall auto-xy",
									Name = "timestampCluster",
									LayoutOrder = 1,
									Visible = UseConversationRowPresentationModuleResult.showTimestamp
								}, {
									timestamp = if FFlagAppChatTimestampInSubtitleConversationRowModule then nil else ReactModule.createElement(FoundationModule.Text, {
										tag = "auto-xy text-body-small content-default",
										Name = "timeStamp",
										LayoutOrder = 1,
										Text = UseConversationRowPresentationModuleResult.timestampText
									}),
									unreadDot = ReactModule.createElement(FoundationModule.View, {
										tag = "size-200-200 radius-circle bg-action-emphasis",
										Name = "unreadDot",
										LayoutOrder = 2,
										Visible = UseConversationRowPresentationModuleResult.showUnread
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
	else
		return nil
	end
end))