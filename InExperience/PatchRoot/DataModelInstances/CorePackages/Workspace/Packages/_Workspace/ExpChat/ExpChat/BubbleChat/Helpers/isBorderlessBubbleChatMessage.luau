local expChat = script:FindFirstAncestor("ExpChat")
local messageEffectModule = require(expChat.MessageEffects.MessageEffect)
local getMessageEffectsModule = require(expChat.MessageEffects.getMessageEffects)
local getBubbleChatDisplayTextModule = require(script.Parent.getBubbleChatDisplayText)

return function(p1)
	-- upvalues: getMessageEffectsModule (ref), getBubbleChatDisplayTextModule (ref), messageEffectModule (ref)
	return table.find(getMessageEffectsModule(getBubbleChatDisplayTextModule(p1)), messageEffectModule.BorderlessBubbleChat) ~= nil
end