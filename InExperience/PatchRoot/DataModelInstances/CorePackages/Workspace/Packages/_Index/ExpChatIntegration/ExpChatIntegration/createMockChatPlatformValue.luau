local signalsModule = require(script:FindFirstAncestor("ExpChatIntegration").Parent.Signals)
local _ = require(script.Parent.ChatPlatformTypes)
local createDefaultChatPlatformValueModule = require(script.Parent.createDefaultChatPlatformValue)

return function(p0)
	-- upvalues: createDefaultChatPlatformValueModule (ref), signalsModule (ref)
	p0 = p0 or {}
	local var3 = createDefaultChatPlatformValueModule()
	local var4 = if p0.chatInputBarSettings ~= nil then signalsModule.createSignal(p0.chatInputBarSettings) else var3.getChatInputBarSettings
	local var5 = if p0.interpolators ~= nil then signalsModule.createSignal(p0.interpolators) else var3.getInterpolators
	local getTransparencyStore = var3.getTransparencyStore
	local transparencyStore = p0.transparencyStore
	
	if transparencyStore ~= nil then
		getTransparencyStore = function(_)
			-- upvalues: transparencyStore (ref)
			return transparencyStore
		end
	end
	return {
		getChatInputBarSettings = var4,
		chatWindowSettings = p0.chatWindowSettings or var3.chatWindowSettings,
		getInterpolators = var5,
		getTransparencyStore = getTransparencyStore
	}
end