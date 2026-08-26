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
	[appChatNetworkingModule.rodux.GetChatLandingModal.Succeeded.name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { chatLandingModal = p2.responseBody })
	end,
	[appChatNetworkingModule.rodux.GetConversationTopModal.Succeeded.name] = if fFlagAppChatEnableDoubleOptIn then nil else function(p1, p2)
		-- upvalues: conversationChannelsModule (ref), cryoModule (ref)
		local friendId = p2.postBody and p2.postBody.friend_id
		local conversationId = friendId and (p2.postBody and p2.postBody.conversation_id or conversationChannelsModule.getFriendConversationId({ friendId }))
		
		return if conversationId then cryoModule.Dictionary.join(p1, {
			conversationTopModals = cryoModule.Dictionary.join(p1.conversationTopModals, { [conversationId] = p2.responseBody })
		}) else p1
	end,
	[appChatNetworkingModule.rodux.GetModalSequence.Succeeded.name] = function(p1, p2)
		-- upvalues: conversationChannelsModule (ref), modalSequence (ref), cryoModule (ref), fFlagAppChatEnableDoubleOptIn (ref), loggerModule (ref)
		local friendId = p2.postBody and p2.postBody.friend_id
		local conversationId = friendId and (p2.postBody and p2.postBody.conversation_id or conversationChannelsModule.getFriendConversationId({ friendId }))
		
		if p2.postBody.modal_sequence == modalSequence.ConversationOverlay then
			return if conversationId then cryoModule.Dictionary.join(p1, {
				conversationOverlays = cryoModule.Dictionary.join(p1.conversationOverlays, { [conversationId] = p2.responseBody })
			}) else p1
		elseif p2.postBody.modal_sequence == modalSequence.ConversationTopModal and fFlagAppChatEnableDoubleOptIn then
			return if conversationId then cryoModule.Dictionary.join(p1, {
				conversationTopModals = cryoModule.Dictionary.join(p1.conversationTopModals, { [conversationId] = p2.responseBody })
			}) else p1
		elseif p2.postBody.modal_sequence ~= modalSequence.ConversationBottomModal then
			loggerModule:warning(`GetModalSequence.Succeeded with unsupported modal sequence: {p2.postBody.modal_sequence}`)
			
			return p1
		end
		return if conversationId then cryoModule.Dictionary.join(p1, {
			conversationBottomModals = cryoModule.Dictionary.join(p1.conversationBottomModals, { [conversationId] = p2.responseBody })
		}) else p1
	end,
	[dismissedConversationTopModalModule.name] = if fFlagAppChatEnableDoubleOptIn then nil else function(p1, p2)
		-- upvalues: cryoModule (ref)
		local conversationId = p2.conversationId
		local modalVariant = p2.modalVariant
		
		return if conversationId and modalVariant then cryoModule.Dictionary.join(p1, {
			conversationTopModalsDismissed = cryoModule.Dictionary.join(p1.conversationTopModalsDismissed, {
				[conversationId] = cryoModule.Dictionary.join(p1.conversationTopModalsDismissed[conversationId] or {}, { [modalVariant] = true })
			})
		}) else p1
	end,
	[dismissedChatModalModule.name] = function(p1, p2)
		-- upvalues: modalSequence (ref), cryoModule (ref), fFlagAppChatEnableDoubleOptIn (ref)
		local key = p2.key
		local modalSequence_1 = p2.modalSequence
		
		return if modalSequence_1 == modalSequence.ConversationOverlay then if key then cryoModule.Dictionary.join(p1, {
			conversationOverlays = cryoModule.Dictionary.join(p1.conversationOverlays, { [key] = cryoModule.None })
		}) else p1 elseif not (modalSequence_1 ~= modalSequence.ConversationTopModal or not fFlagAppChatEnableDoubleOptIn) then if key then cryoModule.Dictionary.join(p1, {
			conversationTopModals = cryoModule.Dictionary.join(p1.conversationTopModals, { [key] = cryoModule.None })
		}) else p1 else p1
	end,
	[dismissedAllConversationModalsForSequenceModule.name] = function(p1, p2)
		-- upvalues: fFlagEnableAEGIS2AppChatConversationBanner (ref), modalSequence (ref), loggerModule (ref), cryoModule (ref)
		local modalSequence_1 = p2.modalSequence
		
		if not fFlagEnableAEGIS2AppChatConversationBanner or modalSequence_1 ~= modalSequence.ConversationBottomModal then
			loggerModule:warning(`DismissedAllConversationModalsForSequence received unsupported modal sequence: {modalSequence_1} `)
			
			return p1
		end
		loggerModule:debug("Removing all modals of sequence:ConversationBottomModal from the store")
		local t = {}
		
		for i, v in p1.conversationBottomModals do
			t[i] = cryoModule.None
		end
		return cryoModule.Dictionary.join(p1, {
			conversationBottomModals = cryoModule.Dictionary.join(p1.conversationBottomModals, t)
		})
	end,
	[appChatNetworkingModule.rodux.GetPendingStateModal.Succeeded.name] = function(p3, p4)
		-- upvalues: cryoModule (ref)
		local conversationId = p4.postBody and p4.postBody.conversation_id
		
		return if conversationId then cryoModule.Dictionary.join(p3, {
			pendingStateModals = cryoModule.Dictionary.join(p3.pendingStateModals, { [conversationId] = p4.responseBody })
		}) else p3
	end,
	[removedConversationModule.name] = function(p3, p4)
		-- upvalues: cryoModule (ref)
		local conversationId = p4.conversationId
		
		return if conversationId then cryoModule.Dictionary.join(p3, {
			conversationTopModals = cryoModule.Dictionary.join(p3.conversationTopModals, { [conversationId] = cryoModule.None }),
			pendingStateModals = cryoModule.Dictionary.join(p3.pendingStateModals, { [conversationId] = cryoModule.None }),
			conversationBottomModals = cryoModule.Dictionary.join(p3.conversationBottomModals, { [conversationId] = cryoModule.None })
		}) else p3
	end,
	[friendConversationCreatedModule.name] = function(p3, p4)
		-- upvalues: cryoModule (ref), fFlagAppChatEnableDoubleOptIn (ref)
		local oldFriendConversationId = p4.oldFriendConversationId
		local newConversationId = p4.newConversationId
		
		if not oldFriendConversationId or not newConversationId then
			return p3
		end
		local var1 = p3
		
		if p3.conversationTopModals[oldFriendConversationId] then
			var1 = cryoModule.Dictionary.join(var1, {
				conversationTopModals = cryoModule.Dictionary.join(var1.conversationTopModals, {
					[newConversationId] = p3.conversationTopModals[oldFriendConversationId],
					[oldFriendConversationId] = cryoModule.None
				})
			})
		end
		if not fFlagAppChatEnableDoubleOptIn and p3.conversationTopModalsDismissed[oldFriendConversationId] then
			var1 = cryoModule.Dictionary.join(var1, {
				conversationTopModalsDismissed = cryoModule.Dictionary.join(var1.conversationTopModalsDismissed, {
					[newConversationId] = p3.conversationTopModalsDismissed[oldFriendConversationId],
					[oldFriendConversationId] = cryoModule.None
				})
			})
		end
		if p3.conversationOverlays[oldFriendConversationId] then
			var1 = cryoModule.Dictionary.join(var1, {
				conversationOverlays = cryoModule.Dictionary.join(var1.conversationOverlays, {
					[newConversationId] = p3.conversationOverlays[oldFriendConversationId],
					[oldFriendConversationId] = cryoModule.None
				})
			})
		end
		if p3.conversationBottomModals[oldFriendConversationId] then
			var1 = cryoModule.Dictionary.join(var1, {
				conversationBottomModals = cryoModule.Dictionary.join(var1.conversationBottomModals, {
					[newConversationId] = p3.conversationBottomModals[oldFriendConversationId],
					[oldFriendConversationId] = cryoModule.None
				})
			})
		end
		return var1
	end,
	DEBUG_ShowChatLandingAgeVerifiedTimedModal = if fFlagDebugAEGIS1AppChatBannerModule then function(p3)
		-- upvalues: cryoModule (ref), appChatNetworkingModule (ref)
		return cryoModule.Dictionary.union(p3, {
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
	DEBUG_ShowAppChatFaeUpsell = if fFlagDebugAppChatFaeModule then function(p3)
		-- upvalues: cryoModule (ref), appChatNetworkingModule (ref)
		return cryoModule.Dictionary.union(p3, {
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
	DEBUG_ShowNewTCOverlay = if fFlagTCUpsellModalEnabledDEV or fFlagDebugEnableTCDoubleOptInDEV then function(p3, p4)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p3, {
			conversationOverlays = cryoModule.Dictionary.join(p3.conversationOverlays, {
				[p4.conversationId] = {
					modal_variant = p4.modalVariant,
					modal_layout = {
						id = "asdf",
						seen_record_action = "none",
						dismissed_record_action = "none"
					}
				}
			})
		})
	end else nil,
	DEBUG_ShowNewTopModal = if fFlagDebugEnableTCDoubleOptInDEV then function(p3, p4)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p3, {
			conversationTopModals = cryoModule.Dictionary.join(p3.conversationTopModals, {
				[p4.conversationId] = {
					modal_variant = p4.modalVariant,
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
	DEBUG_DismissChatLandingModal = if fFlagDebugAppChatFaeModule or fFlagDebugAEGIS1AppChatBannerModule then function(p3)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p3, { chatLandingModal = cryoModule.None })
	end else nil
})