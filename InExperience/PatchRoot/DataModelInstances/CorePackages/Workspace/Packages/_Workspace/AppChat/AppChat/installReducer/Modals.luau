local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local cryoModule = require(parent.Cryo)
local roduxModule = require(parent.Rodux)
local loggerModule = require(appChat.Logger)
local dismissedConversationTopModalModule = require(appChat.Conversations.Actions.DismissedConversationTopModal)
local removedConversationModule = require(appChat.Conversations.Actions.RemovedConversation)
local friendConversationCreatedModule = require(appChat.Conversations.Actions.FriendConversationCreated)
local conversationChannelsModule = require(appChat.Models.ConversationChannels)
local dismissedChatModalModule = require(appChat.Conversations.Actions.DismissedChatModal)
local dismissedAllConversationModalsForSequenceModule = require(appChat.Conversations.Actions.DismissedAllConversationModalsForSequence)
local fFlagDebugAppChatFaeModule = require(appChat.Flags.FFlagDebugAppChatFae)
local fFlagDebugAEGIS1AppChatBannerModule = require(appChat.Flags.FFlagDebugAEGIS1AppChatBanner)
local fFlagTCUpsellModalEnabledDEV = require(parent.SharedFlags).FFlagTCUpsellModalEnabled_DEV
local fFlagDebugEnableTCDoubleOptInDEV = require(parent.SharedFlags).FFlagDebugEnableTCDoubleOptIn_DEV
local fFlagAppChatEnableDoubleOptIn = require(parent.SharedFlags).FFlagAppChatEnableDoubleOptIn
local fFlagEnableAEGIS2AppChatConversationBanner = require(parent.SharedFlags).FFlagEnableAEGIS2AppChatConversationBanner
local appChatNetworkingModule = require(parent.AppChatNetworking)
local modalSequence = appChatNetworkingModule.Constants.ModalSequence

return roduxModule.createReducer({
	chatLandingModal = {},
	conversationTopModals = {},
	conversationTopModalsDismissed = if fFlagAppChatEnableDoubleOptIn then nil else {},
	conversationOverlays = {},
	pendingStateModals = {},
	conversationBottomModals = {}
}, {
	[appChatNetworkingModule.rodux.GetChatLandingModal.Succeeded.name] = function(p0, p1) --[[ line: 45 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p0, { chatLandingModal = p1.responseBody })
	end,
	[appChatNetworkingModule.rodux.GetConversationTopModal.Succeeded.name] = if fFlagAppChatEnableDoubleOptIn then nil else function(p2, p3) --[[ line: 59 ]]
		-- upvalues: conversationChannelsModule (ref), cryoModule (ref)
		local friendId = p3.postBody and p3.postBody.friend_id
		local conversationId = friendId and (p3.postBody and p3.postBody.conversation_id or conversationChannelsModule.getFriendConversationId({ friendId }))
		
		return if conversationId then cryoModule.Dictionary.join(p2, {
			conversationTopModals = cryoModule.Dictionary.join(p2.conversationTopModals, { [conversationId] = p3.responseBody })
		}) else p2
	end,
	[appChatNetworkingModule.rodux.GetModalSequence.Succeeded.name] = function(p4, p5) --[[ line: 83 ]]
		-- upvalues: conversationChannelsModule (ref), modalSequence (ref), cryoModule (ref), fFlagAppChatEnableDoubleOptIn (ref), loggerModule (ref)
		local friendId = p5.postBody and p5.postBody.friend_id
		local conversationId = friendId and (p5.postBody and p5.postBody.conversation_id or conversationChannelsModule.getFriendConversationId({ friendId }))
		
		if p5.postBody.modal_sequence == modalSequence.ConversationOverlay then
			return if conversationId then cryoModule.Dictionary.join(p4, {
				conversationOverlays = cryoModule.Dictionary.join(p4.conversationOverlays, { [conversationId] = p5.responseBody })
			}) else p4
		elseif p5.postBody.modal_sequence == modalSequence.ConversationTopModal and fFlagAppChatEnableDoubleOptIn then
			return if conversationId then cryoModule.Dictionary.join(p4, {
				conversationTopModals = cryoModule.Dictionary.join(p4.conversationTopModals, { [conversationId] = p5.responseBody })
			}) else p4
		elseif p5.postBody.modal_sequence ~= modalSequence.ConversationBottomModal then
			loggerModule:warning(`GetModalSequence.Succeeded with unsupported modal sequence: {p5.postBody.modal_sequence}`)
			
			return p4
		end
		return if conversationId then cryoModule.Dictionary.join(p4, {
			conversationBottomModals = cryoModule.Dictionary.join(p4.conversationBottomModals, { [conversationId] = p5.responseBody })
		}) else p4
	end,
	[dismissedConversationTopModalModule.name] = if fFlagAppChatEnableDoubleOptIn then nil else function(p6, p7) --[[ line: 138 ]]
		-- upvalues: cryoModule (ref)
		local conversationId = p7.conversationId
		local modalVariant = p7.modalVariant
		
		return if conversationId and modalVariant then cryoModule.Dictionary.join(p6, {
			conversationTopModalsDismissed = cryoModule.Dictionary.join(p6.conversationTopModalsDismissed, {
				[conversationId] = cryoModule.Dictionary.join(p6.conversationTopModalsDismissed[conversationId] or {}, { [modalVariant] = true })
			})
		}) else p6
	end,
	[dismissedChatModalModule.name] = function(p8, p9) --[[ line: 156 ]]
		-- upvalues: modalSequence (ref), cryoModule (ref), fFlagAppChatEnableDoubleOptIn (ref)
		local key = p9.key
		local modalSequence_1 = p9.modalSequence
		
		return if modalSequence_1 == modalSequence.ConversationOverlay then if key then cryoModule.Dictionary.join(p8, {
			conversationOverlays = cryoModule.Dictionary.join(p8.conversationOverlays, { [key] = cryoModule.None })
		}) else p8 elseif not (modalSequence_1 ~= modalSequence.ConversationTopModal or not fFlagAppChatEnableDoubleOptIn) then if key then cryoModule.Dictionary.join(p8, {
			conversationTopModals = cryoModule.Dictionary.join(p8.conversationTopModals, { [key] = cryoModule.None })
		}) else p8 else p8
	end,
	[dismissedAllConversationModalsForSequenceModule.name] = function(p10, p11) --[[ line: 181 ]]
		-- upvalues: fFlagEnableAEGIS2AppChatConversationBanner (ref), modalSequence (ref), loggerModule (ref), cryoModule (ref)
		local modalSequence_1 = p11.modalSequence
		
		if not fFlagEnableAEGIS2AppChatConversationBanner or modalSequence_1 ~= modalSequence.ConversationBottomModal then
			loggerModule:warning(`DismissedAllConversationModalsForSequence received unsupported modal sequence: {modalSequence_1} `)
			
			return p10
		end
		loggerModule:debug("Removing all modals of sequence:ConversationBottomModal from the store")
		local t = {}
		
		for i, v in p10.conversationBottomModals do
			t[i] = cryoModule.None
		end
		return cryoModule.Dictionary.join(p10, {
			conversationBottomModals = cryoModule.Dictionary.join(p10.conversationBottomModals, t)
		})
	end,
	[appChatNetworkingModule.rodux.GetPendingStateModal.Succeeded.name] = function(p12, p13) --[[ line: 202 ]]
		-- upvalues: cryoModule (ref)
		local conversationId = p13.postBody and p13.postBody.conversation_id
		
		return if conversationId then cryoModule.Dictionary.join(p12, {
			pendingStateModals = cryoModule.Dictionary.join(p12.pendingStateModals, { [conversationId] = p13.responseBody })
		}) else p12
	end,
	[removedConversationModule.name] = function(p14, p15) --[[ line: 221 ]]
		-- upvalues: cryoModule (ref)
		local conversationId = p15.conversationId
		
		return if conversationId then cryoModule.Dictionary.join(p14, {
			conversationTopModals = cryoModule.Dictionary.join(p14.conversationTopModals, { [conversationId] = cryoModule.None }),
			pendingStateModals = cryoModule.Dictionary.join(p14.pendingStateModals, { [conversationId] = cryoModule.None }),
			conversationBottomModals = cryoModule.Dictionary.join(p14.conversationBottomModals, { [conversationId] = cryoModule.None })
		}) else p14
	end,
	[friendConversationCreatedModule.name] = function(p16, p17) --[[ line: 239 ]]
		-- upvalues: cryoModule (ref), fFlagAppChatEnableDoubleOptIn (ref)
		local oldFriendConversationId = p17.oldFriendConversationId
		local newConversationId = p17.newConversationId
		
		if not oldFriendConversationId or not newConversationId then
			return p16
		end
		local var19 = p16
		
		if p16.conversationTopModals[oldFriendConversationId] then
			var19 = cryoModule.Dictionary.join(var19, {
				conversationTopModals = cryoModule.Dictionary.join(var19.conversationTopModals, {
					[newConversationId] = p16.conversationTopModals[oldFriendConversationId],
					[oldFriendConversationId] = cryoModule.None
				})
			})
		end
		if not fFlagAppChatEnableDoubleOptIn and p16.conversationTopModalsDismissed[oldFriendConversationId] then
			var19 = cryoModule.Dictionary.join(var19, {
				conversationTopModalsDismissed = cryoModule.Dictionary.join(var19.conversationTopModalsDismissed, {
					[newConversationId] = p16.conversationTopModalsDismissed[oldFriendConversationId],
					[oldFriendConversationId] = cryoModule.None
				})
			})
		end
		if p16.conversationOverlays[oldFriendConversationId] then
			var19 = cryoModule.Dictionary.join(var19, {
				conversationOverlays = cryoModule.Dictionary.join(var19.conversationOverlays, {
					[newConversationId] = p16.conversationOverlays[oldFriendConversationId],
					[oldFriendConversationId] = cryoModule.None
				})
			})
		end
		if p16.conversationBottomModals[oldFriendConversationId] then
			var19 = cryoModule.Dictionary.join(var19, {
				conversationBottomModals = cryoModule.Dictionary.join(var19.conversationBottomModals, {
					[newConversationId] = p16.conversationBottomModals[oldFriendConversationId],
					[oldFriendConversationId] = cryoModule.None
				})
			})
		end
		return var19
	end,
	DEBUG_ShowChatLandingAgeVerifiedTimedModal = if fFlagDebugAEGIS1AppChatBannerModule then function(p18) --[[ line: 288 ]]
		-- upvalues: cryoModule (ref), appChatNetworkingModule (ref)
		return cryoModule.Dictionary.union(p18, {
			chatLandingModal = {
				modal_variant = appChatNetworkingModule.Constants.ChatLandingModalVariant.ChatLandingAgeVerifiedCommsTimedModal,
				modal_layout = {
					id = "asdf",
					dismissible = true,
					seen_record_action = "none",
					dismissed_record_action = "none",
					header = {
						text = "FAE Title",
						additional_content = {
							{
								text = "14 days left",
								type = appChatNetworkingModule.Constants.ModalContentType.Countdown
							}
						}
					},
					body = {
						text = "FAE debug Body",
						additional_content = {
							{
								text = "Learn more",
								type = appChatNetworkingModule.Constants.ModalContentType.Link
							}
						}
					},
					buttons = {
						{ text = "Continue", action = { type = "open_fae_upsell" } },
						{
							text = "View Details",
							action = { type = "open_fae_view_details" }
						}
					}
				}
			}
		})
	end else nil,
	DEBUG_ShowAppChatFaeUpsell = if fFlagDebugAppChatFaeModule then function(p19) --[[ line: 336 ]]
		-- upvalues: cryoModule (ref), appChatNetworkingModule (ref)
		return cryoModule.Dictionary.union(p19, {
			chatLandingModal = {
				modal_variant = appChatNetworkingModule.Constants.ChatLandingModalVariant.AgeAssuranceUpsell,
				modal_layout = {
					id = "asdf",
					seen_record_action = "none",
					dismissed_record_action = "none",
					label = { text = "New" },
					header = { text = "FAE Title" },
					body = {
						text = "FAE debug Body",
						additional_content = {
							{
								text = "Learn more",
								type = appChatNetworkingModule.Constants.ModalContentType.Link
							}
						}
					},
					buttons = { { text = "Continue" } }
				}
			}
		})
	end else nil,
	DEBUG_ShowNewTCOverlay = if fFlagTCUpsellModalEnabledDEV or fFlagDebugEnableTCDoubleOptInDEV then function(p20, p21) --[[ line: 370 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p20, {
			conversationOverlays = cryoModule.Dictionary.join(p20.conversationOverlays, {
				[p21.conversationId] = {
					modal_variant = p21.modalVariant,
					modal_layout = {
						id = "asdf",
						seen_record_action = "none",
						dismissed_record_action = "none"
					}
				}
			})
		})
	end else nil,
	DEBUG_ShowNewTopModal = if fFlagDebugEnableTCDoubleOptInDEV then function(p22, p23) --[[ line: 386 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p22, {
			conversationTopModals = cryoModule.Dictionary.join(p22.conversationTopModals, {
				[p23.conversationId] = {
					modal_variant = p23.modalVariant,
					modal_layout = {
						id = "",
						seen_record_action = "none",
						dismissed_record_action = "none",
						body = { text = "Add Trusted Connection" },
						buttons = { { text = "Add" } }
					}
				}
			})
		})
	end else nil,
	DEBUG_DismissChatLandingModal = if fFlagDebugAppChatFaeModule or fFlagDebugAEGIS1AppChatBannerModule then function(p24) --[[ line: 410 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p24, { chatLandingModal = cryoModule.None })
	end else nil
})