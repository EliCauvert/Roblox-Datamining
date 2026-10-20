return {
	PageSize = {
		GET_NEW_MESSAGES = 4,
		GET_CONVERSATIONS = game:DefineFastInt("ChatGetConversationsPageSize", 20)
	},
	ResponseStatus = { SUCCESS = "success", MODERATED = "moderated" },
	OsaAcknowledgementStatusResponse = {
		NotApplicable = "not_applicable",
		Unacknowledged = "unacknowledged",
		Acknowledged = "acknowledged"
	},
	UserOptedIntoChatMessagesStatusResponse = {
		NotApplicable = "not_applicable",
		NotOptedIn = "not_opted_in",
		OptedIn = "opted_in"
	},
	ModalSequence = {
		ChatLandingModal = "chat_landing_modal",
		ConversationTopModal = "conversation_top_modal",
		PendingStateModal = "pending_state_modal",
		ConversationInlineTopModal = "conversation_inline_top_modal",
		ConversationOverlay = "conversation_overlay",
		ConversationBottomModal = "conversation_bottom_modal"
	},
	ModalContentType = { Link = "link", Text = "text", Countdown = "countdown" },
	ChatLandingModalVariant = {
		PhoneVerify = "phone_verify",
		PartyOnlyFtux = "party_only_ftux",
		FullyEligibleFtux = "fully_eligible_ftux",
		AgeAssuranceUpsell = "chat_landing_age_assurance_upsell",
		ChatLandingAgeVerifiedCommsTimedModal = "chat_landing_age_verified_comms_timed_modal",
		ChatLandingAgeVerifiedCommsUpsellModal = "chat_landing_age_verified_comms_upsell",
		None = "none"
	},
	ConversationOverlay = {
		AddTrustedConnectionO18 = "conversation_add_trusted_connection18_plus",
		AddTrustedConnectionU18 = "conversation_add_trusted_connection_non18_plus",
		TrustedConnectionRequestU18 = "conversation_trusted_connection_request_non18_plus",
		TrustedConnectionCreated = "conversation_trusted_connection_created",
		None = "none"
	},
	ConversationTopModal = {
		AddTrustedConnection = "conversation_top_modal_add_trusted_connection",
		TrustedConnectionRequest = "conversation_top_modal_trusted_connection_request",
		None = "none"
	},
	ConversationBottomModal = {
		ConversationBottomAgeVerificationRequiredModal = "conversation_bottom_age_verification_required_modal",
		NudgeToBottomChatUpsell = "conversation_bottom_nudge_to_chat_upsell",
		None = "none"
	}
}