if require(script:FindFirstAncestor("AppChat").Parent.SharedFlags).FFlagChatAiAgentToggle then
	print("[ChatAiAgent] ChatAiAgentToggle is ON \226\128\148 Assistant tab naming, @roblox agent send prefix, and @ai agent response display transforms are active")
end
local function _(p0) --[[ line: 17 | named "trimWhitespace" ]]
	return string.gsub(string.gsub(p0, "^%s+", ""), "%s+$", "")
end

return {
	AI_RESPONSE_MARKER = "@ai agent response",
	USER_SEND_PREFIX = "@roblox agent ",
	ASSISTANT_DISPLAY_NAME = "Assistant",
	DUMP_GAME_CONTEXT_COMMAND = "dump game context",
	containsAiResponseMarker = function(p1) --[[ line: 21 ]]
		return string.find(p1, "@ai agent response", 1, true) ~= nil
	end,
	stripAiResponseMarker = function(p2) --[[ line: 25 ]]
		return string.gsub(string.gsub(string.gsub(string.gsub(p2, "@ai agent response", ""), "%s+", " "), "^%s+", ""), "%s+$", "")
	end,
	stripUserSendPrefixForDisplay = function(p3) --[[ line: 32 ]]
		return if string.sub(p3, 1, 14) == "@roblox agent " then string.sub(p3, 15) else p3
	end,
	prependUserSendPrefixForApi = function(p4) --[[ line: 39 ]]
		local text = "@roblox agent " .. p4
		print(`[ChatAiAgent] Prepending send prefix for platform-chat-api: "{text}"`)
		
		return text
	end,
	isDumpGameContextCommand = function(p5) --[[ line: 47 ]]
		return type(p5) == "string" and string.find(p5, "@ai agent response", 1, true) ~= nil and string.sub(string.lower(string.gsub(string.gsub(string.gsub(string.gsub(p5, "@ai agent response", ""), "%s+", " "), "^%s+", ""), "%s+$", "")), -17) == "dump game context"
	end
}