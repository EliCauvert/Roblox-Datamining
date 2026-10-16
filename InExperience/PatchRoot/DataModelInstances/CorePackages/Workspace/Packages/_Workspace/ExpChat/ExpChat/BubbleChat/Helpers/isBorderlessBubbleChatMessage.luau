local ExpChat = script:FindFirstAncestor("ExpChat")
local MessageEffectModule = require(ExpChat.MessageEffects.MessageEffect)
local GetMessageEffectsModule = require(ExpChat.MessageEffects.getMessageEffects)
local GetBubbleChatDisplayTextModule = require(script.Parent.getBubbleChatDisplayText)

return function(p1): boolean --[[ Line: 7 | Named "isBorderlessBubbleChatMessage" ]]
	-- upvalues: GetMessageEffectsModule (copy), GetBubbleChatDisplayTextModule (copy), MessageEffectModule (copy)
	return table.find(GetMessageEffectsModule(GetBubbleChatDisplayTextModule(p1)), MessageEffectModule.BorderlessBubbleChat) ~= nil
end