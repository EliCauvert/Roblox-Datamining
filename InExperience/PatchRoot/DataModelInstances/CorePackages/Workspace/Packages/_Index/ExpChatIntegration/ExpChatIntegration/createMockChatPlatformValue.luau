local signalsModule = require(script:FindFirstAncestor("ExpChatIntegration").Parent.Signals)
local _ = require(script.Parent.ChatPlatformTypes)
local createDefaultChatPlatformValueModule = require(script.Parent.createDefaultChatPlatformValue)

return function(p1)
	-- upvalues: createDefaultChatPlatformValueModule (ref), signalsModule (ref)
	p1 = p1 or {}
	local var1 = createDefaultChatPlatformValueModule()
	local var2 = if p1.chatInputBarSettings ~= nil then signalsModule.createSignal(p1.chatInputBarSettings) else var1.getChatInputBarSettings
	local var3 = if p1.interpolators ~= nil then signalsModule.createSignal(p1.interpolators) else var1.getInterpolators
	local getTransparencyStore = var1.getTransparencyStore
	local transparencyStore = p1.transparencyStore
	
	if transparencyStore ~= nil then
		getTransparencyStore = function(_)
			-- upvalues: transparencyStore (ref)
			return transparencyStore
		end
	end
	return {
		getChatInputBarSettings = var2,
		chatWindowSettings = p1.chatWindowSettings or var1.chatWindowSettings,
		getInterpolators = var3,
		getTransparencyStore = getTransparencyStore
	}
end