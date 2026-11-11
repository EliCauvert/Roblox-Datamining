local SignalsModule = require(script:FindFirstAncestor("ExpChatIntegration").Parent.Signals)
local _ = require(script.Parent.ChatPlatformTypes)
local CreateDefaultChatPlatformValueModule = require(script.Parent.createDefaultChatPlatformValue)

return function(p1)
	-- upvalues: CreateDefaultChatPlatformValueModule (copy), SignalsModule (copy)
	local P0 = p1 or {}
	local DefaultChatPlatformValueModule = CreateDefaultChatPlatformValueModule()
	local GetChatInputBarSettings = if P0.chatInputBarSettings == nil then DefaultChatPlatformValueModule.getChatInputBarSettings else SignalsModule.createSignal(P0.chatInputBarSettings)
	local GetInterpolators = if P0.interpolators == nil then DefaultChatPlatformValueModule.getInterpolators else SignalsModule.createSignal(P0.interpolators)
	local GetTransparencyStore: (any) -> any = DefaultChatPlatformValueModule.getTransparencyStore
	local TransparencyStore = P0.transparencyStore
	
	if TransparencyStore ~= nil then
		GetTransparencyStore = function(_)
			-- upvalues: TransparencyStore (copy)
			return TransparencyStore
		end
	end
	return {
		getChatInputBarSettings = GetChatInputBarSettings,
		chatWindowSettings = P0.chatWindowSettings or DefaultChatPlatformValueModule.chatWindowSettings,
		getInterpolators = GetInterpolators,
		getTransparencyStore = GetTransparencyStore
	}
end