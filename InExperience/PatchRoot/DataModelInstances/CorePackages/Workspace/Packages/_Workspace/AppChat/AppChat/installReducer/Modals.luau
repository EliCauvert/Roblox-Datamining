local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local CryoModule = require(Parent.Cryo)
local LoggerModule = require(AppChat.Logger)
local ConversationChannelsModule = require(AppChat.Models.ConversationChannels)
local FFlagDebugAppChatFaeModule = require(AppChat.Flags.FFlagDebugAppChatFae)
local FFlagDebugAEGIS1AppChatBannerModule = require(AppChat.Flags.FFlagDebugAEGIS1AppChatBanner)
local FFlagDebugEnableTCDoubleOptInDEV = require(Parent.SharedFlags).FFlagDebugEnableTCDoubleOptIn_DEV
local FFlagAppChatEnableDoubleOptIn = require(Parent.SharedFlags).FFlagAppChatEnableDoubleOptIn
local FFlagEnableAEGIS2AppChatConversationBanner = require(Parent.SharedFlags).FFlagEnableAEGIS2AppChatConversationBanner
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local ModalSequence = AppChatNetworkingModule.Constants.ModalSequence

return require(Parent.Rodux).createReducer({
	chatLandingModal = {},
	conversationTopModals = {},
	conversationTopModalsDismissed = if FFlagAppChatEnableDoubleOptIn then nil else {},
	conversationOverlays = {},
	pendingStateModals = {},
	conversationBottomModals = {}
}, {
	[AppChatNetworkingModule.rodux.GetChatLandingModal.Succeeded.name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { chatLandingModal = p2.responseBody })
	end,
	[AppChatNetworkingModule.rodux.GetConversationTopModal.Succeeded.name] = if FFlagAppChatEnableDoubleOptIn then nil else function(p1, p2)
		-- upvalues: ConversationChannelsModule (copy), CryoModule (copy)
		local ConversationId = p2.postBody and p2.postBody.conversation_id
		local FriendId = p2.postBody and p2.postBody.friend_id
		
		if FriendId and not ConversationId then
			ConversationId = ConversationChannelsModule.getFriendConversationId({ FriendId })
		end
		return if ConversationId then CryoModule.Dictionary.join(p1, {
			conversationTopModals = CryoModule.Dictionary.join(p1.conversationTopModals, { [ConversationId] = p2.responseBody })
		}) else p1
	end,
	[AppChatNetworkingModule.rodux.GetModalSequence.Succeeded.name] = function(p1, p2)
		-- upvalues: ConversationChannelsModule (copy), ModalSequence (copy), CryoModule (copy), FFlagAppChatEnableDoubleOptIn (copy), LoggerModule (copy)
		local ConversationId = p2.postBody and p2.postBody.conversation_id
		local FriendId = p2.postBody and p2.postBody.friend_id
		
		if FriendId and not ConversationId then
			ConversationId = ConversationChannelsModule.getFriendConversationId({ FriendId })
		end
		if p2.postBody.modal_sequence == ModalSequence.ConversationOverlay then
			return if ConversationId then CryoModule.Dictionary.join(p1, {
				conversationOverlays = CryoModule.Dictionary.join(p1.conversationOverlays, { [ConversationId] = p2.responseBody })
			}) else p1
		elseif p2.postBody.modal_sequence == ModalSequence.ConversationTopModal and FFlagAppChatEnableDoubleOptIn then
			return if ConversationId then CryoModule.Dictionary.join(p1, {
				conversationTopModals = CryoModule.Dictionary.join(p1.conversationTopModals, { [ConversationId] = p2.responseBody })
			}) else p1
		elseif p2.postBody.modal_sequence == ModalSequence.ConversationBottomModal then
			return if ConversationId then CryoModule.Dictionary.join(p1, {
				conversationBottomModals = CryoModule.Dictionary.join(p1.conversationBottomModals, { [ConversationId] = p2.responseBody })
			}) else p1
		else
			LoggerModule:warning(`GetModalSequence.Succeeded with unsupported modal sequence: {p2.postBody.modal_sequence}`)
			
			return p1
		end
	end,
	[require(AppChat.Conversations.Actions.DismissedConversationTopModal).name] = if FFlagAppChatEnableDoubleOptIn then nil else function(p1, p2)
		-- upvalues: CryoModule (copy)
		local ConversationId = p2.conversationId
		local ModalVariant = p2.modalVariant
		
		return if ConversationId and ModalVariant then CryoModule.Dictionary.join(p1, {
			conversationTopModalsDismissed = CryoModule.Dictionary.join(p1.conversationTopModalsDismissed, {
				[ConversationId] = CryoModule.Dictionary.join(p1.conversationTopModalsDismissed[ConversationId] or {}, { [ModalVariant] = true })
			})
		}) else p1
	end,
	[require(AppChat.Conversations.Actions.DismissedChatModal).name] = function(p1, p2)
		-- upvalues: ModalSequence (copy), CryoModule (copy), FFlagAppChatEnableDoubleOptIn (copy)
		local Key = p2.key
		local ModalSequence1 = p2.modalSequence
		
		return if ModalSequence1 == ModalSequence.ConversationOverlay then if Key then CryoModule.Dictionary.join(p1, {
			conversationOverlays = CryoModule.Dictionary.join(p1.conversationOverlays, { [Key] = CryoModule.None })
		}) else p1 elseif ModalSequence1 == ModalSequence.ConversationTopModal and FFlagAppChatEnableDoubleOptIn and Key then CryoModule.Dictionary.join(p1, {
			conversationTopModals = CryoModule.Dictionary.join(p1.conversationTopModals, { [Key] = CryoModule.None })
		}) else p1
	end,
	[require(AppChat.Conversations.Actions.DismissedAllConversationModalsForSequence).name] = function(p1, p2)
		-- upvalues: FFlagEnableAEGIS2AppChatConversationBanner (copy), ModalSequence (copy), LoggerModule (copy), CryoModule (copy)
		local ModalSequence1 = p2.modalSequence
		
		if not FFlagEnableAEGIS2AppChatConversationBanner or ModalSequence1 ~= ModalSequence.ConversationBottomModal then
			LoggerModule:warning(`DismissedAllConversationModalsForSequence received unsupported modal sequence: {ModalSequence1} `)
			
			return p1
		end
		LoggerModule:debug("Removing all modals of sequence:ConversationBottomModal from the store")
		local Nones = {}
		
		for i, _ in p1.conversationBottomModals do
			Nones[i] = CryoModule.None
		end
		return CryoModule.Dictionary.join(p1, {
			conversationBottomModals = CryoModule.Dictionary.join(p1.conversationBottomModals, Nones)
		})
	end,
	[AppChatNetworkingModule.rodux.GetPendingStateModal.Succeeded.name] = function(p3, p4)
		-- upvalues: CryoModule (copy)
		local ConversationId = p4.postBody and p4.postBody.conversation_id
		
		return if ConversationId then CryoModule.Dictionary.join(p3, {
			pendingStateModals = CryoModule.Dictionary.join(p3.pendingStateModals, { [ConversationId] = p4.responseBody })
		}) else p3
	end,
	[require(AppChat.Conversations.Actions.RemovedConversation).name] = function(p3, p4)
		-- upvalues: CryoModule (copy)
		local ConversationId = p4.conversationId
		
		return if ConversationId then CryoModule.Dictionary.join(p3, {
			conversationTopModals = CryoModule.Dictionary.join(p3.conversationTopModals, { [ConversationId] = CryoModule.None }),
			pendingStateModals = CryoModule.Dictionary.join(p3.pendingStateModals, { [ConversationId] = CryoModule.None }),
			conversationBottomModals = CryoModule.Dictionary.join(p3.conversationBottomModals, { [ConversationId] = CryoModule.None })
		}) else p3
	end,
	[require(AppChat.Conversations.Actions.FriendConversationCreated).name] = function(JoinResult, p3)
		-- upvalues: CryoModule (copy), FFlagAppChatEnableDoubleOptIn (copy)
		local OldFriendConversationId = p3.oldFriendConversationId
		local NewConversationId = p3.newConversationId
		
		if not OldFriendConversationId or not NewConversationId then
			return JoinResult
		end
		local JoinResult1 = JoinResult
		
		if JoinResult.conversationTopModals[OldFriendConversationId] then
			JoinResult1 = CryoModule.Dictionary.join(JoinResult1, {
				conversationTopModals = CryoModule.Dictionary.join(JoinResult1.conversationTopModals, {
					[NewConversationId] = JoinResult.conversationTopModals[OldFriendConversationId],
					[OldFriendConversationId] = CryoModule.None
				})
			})
		end
		if not FFlagAppChatEnableDoubleOptIn and JoinResult.conversationTopModalsDismissed[OldFriendConversationId] then
			JoinResult1 = CryoModule.Dictionary.join(JoinResult1, {
				conversationTopModalsDismissed = CryoModule.Dictionary.join(JoinResult1.conversationTopModalsDismissed, {
					[NewConversationId] = JoinResult.conversationTopModalsDismissed[OldFriendConversationId],
					[OldFriendConversationId] = CryoModule.None
				})
			})
		end
		if JoinResult.conversationOverlays[OldFriendConversationId] then
			JoinResult1 = CryoModule.Dictionary.join(JoinResult1, {
				conversationOverlays = CryoModule.Dictionary.join(JoinResult1.conversationOverlays, {
					[NewConversationId] = JoinResult.conversationOverlays[OldFriendConversationId],
					[OldFriendConversationId] = CryoModule.None
				})
			})
		end
		if JoinResult.conversationBottomModals[OldFriendConversationId] then
			JoinResult1 = CryoModule.Dictionary.join(JoinResult1, {
				conversationBottomModals = CryoModule.Dictionary.join(JoinResult1.conversationBottomModals, {
					[NewConversationId] = JoinResult.conversationBottomModals[OldFriendConversationId],
					[OldFriendConversationId] = CryoModule.None
				})
			})
		end
		return JoinResult1
	end,
	DEBUG_ShowChatLandingAgeVerifiedTimedModal = if FFlagDebugAEGIS1AppChatBannerModule then function(p3)
		-- upvalues: CryoModule (copy), AppChatNetworkingModule (copy)
		return CryoModule.Dictionary.union(p3, {
			chatLandingModal = {
				modal_variant = AppChatNetworkingModule.Constants.ChatLandingModalVariant.ChatLandingAgeVerifiedCommsTimedModal,
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
								type = AppChatNetworkingModule.Constants.ModalContentType.Countdown
							}
						}
					},
					body = {
						text = "FAE debug Body",
						additional_content = {
							{
								text = "Learn more",
								type = AppChatNetworkingModule.Constants.ModalContentType.Link
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
	DEBUG_ShowAppChatFaeUpsell = if FFlagDebugAppChatFaeModule then function(p3)
		-- upvalues: CryoModule (copy), AppChatNetworkingModule (copy)
		return CryoModule.Dictionary.union(p3, {
			chatLandingModal = {
				modal_variant = AppChatNetworkingModule.Constants.ChatLandingModalVariant.AgeAssuranceUpsell,
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
								type = AppChatNetworkingModule.Constants.ModalContentType.Link
							}
						}
					},
					buttons = { { text = "Continue" } }
				}
			}
		})
	end else nil,
	DEBUG_ShowNewTCOverlay = if require(Parent.SharedFlags).FFlagTCUpsellModalEnabled_DEV or FFlagDebugEnableTCDoubleOptInDEV then function(p3, p4)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p3, {
			conversationOverlays = CryoModule.Dictionary.join(p3.conversationOverlays, {
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
	DEBUG_ShowNewTopModal = if FFlagDebugEnableTCDoubleOptInDEV then function(p3, p4)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p3, {
			conversationTopModals = CryoModule.Dictionary.join(p3.conversationTopModals, {
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
	DEBUG_DismissChatLandingModal = if FFlagDebugAppChatFaeModule or FFlagDebugAEGIS1AppChatBannerModule then function(p3)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p3, { chatLandingModal = CryoModule.None })
	end else nil
})