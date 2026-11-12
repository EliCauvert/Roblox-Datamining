local _ = require(script:FindFirstAncestor("GenericChallenges").Types.ChallengeMetadata)

return {
	getPrompt = function(p1)
		local PromptUser = p1.promptUser
		local Prompt = if typeof(PromptUser) == "table" then PromptUser.prompt else nil
		
		return if typeof(Prompt) == "string" then Prompt else nil
	end,
	DeniedReason = { PromptUser = "DENIED_REASON_PROMPT_USER" },
	DeniedPrompt = {
		WasmGameJoinRedirect = "DENIED_PROMPT_WASM_GAME_JOIN_REDIRECT",
		WasmInExpDeny = "DENIED_PROMPT_WASM_IN_EXP_DENY"
	}
}