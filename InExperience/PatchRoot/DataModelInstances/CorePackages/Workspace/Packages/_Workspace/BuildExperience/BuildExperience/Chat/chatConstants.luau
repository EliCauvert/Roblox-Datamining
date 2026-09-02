local buildExperience = script:FindFirstAncestor("BuildExperience")
local localizationStringsModule = require(buildExperience.LocalizationStrings)

return {
	CAS_RPC_TIMEOUT_SECONDS = 30,
	THINKING_GRADIENT_ANIMATION_SPEED = 1.4,
	THINKING_GRADIENT_OFFSET = 3,
	BOTTOM_SCROLL_THRESHOLD = 24,
	BUILD_CHAT_PAGE_TITLE = localizationStringsModule.CHAT_BUILD_CHAT_PAGE_TITLE,
	ASSISTANT_LOADING_TEXT = localizationStringsModule.CHAT_ASSISTANT_LOADING,
	ASSISTANT_STILL_WORKING_TEXT = localizationStringsModule.CHAT_ASSISTANT_STILL_WORKING,
	formatAssistantLoadingText = localizationStringsModule.formatChatThinkingDuration,
	ASSISTANT_STATUS_SWAP_INTERVAL_SECONDS = game:DefineFastInt("BuildExperienceAssistantStatusSwapIntervalSeconds", 10),
	ASSISTANT_THINKING_DURATION_SUFFIX_DELAY_SECONDS = game:DefineFastInt("BuildExperienceAssistantThinkingDurationSuffixDelaySeconds", 10),
	MESSAGE_LAYOUT_ORDER_STRIDE = if require(buildExperience.Flags.FFlagBuildAdUpsell) then 10 else 1,
	PUBLISH_PLACE_TOOL_IDENTIFIERS = { "studio_save_and_publish", "cas_save_and_publish" }
}