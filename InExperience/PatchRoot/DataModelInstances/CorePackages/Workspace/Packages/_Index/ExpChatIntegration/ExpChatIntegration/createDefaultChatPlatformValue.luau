local SignalsModule = require(script:FindFirstAncestor("ExpChatIntegration").Parent.Signals)
local _ = require(script.Parent.ChatPlatformTypes)
local ChatWindowSettings = {
	ChatWindowBackgroundTransparency = 0.3,
	ChatWindowMaxWidth = 600,
	ChatWindowMaxHeight = 400,
	ChatWindowBackgroundColor3 = Color3.fromRGB(34, 34, 34)
}
local config = {
	getBackgroundColor = function(Frame) --[[ Line: 33 ]]
		return Frame.BackgroundColor3
	end,
	getBackgroundTransparency = function(Frame) --[[ Line: 36 ]]
		return Frame.BackgroundTransparency
	end
}
local config1 = {
	setTextboxFocus = function() --[[ Line: 42 ]] end,
	clearTextboxFocus = function() --[[ Line: 43 ]] end
}

return function() --[[ Line: 46 | Named "createDefaultChatPlatformValue" ]]
	-- upvalues: SignalsModule (copy), ChatWindowSettings (copy), config (copy), config1 (copy)
	return {
		getChatInputBarSettings = SignalsModule.createSignal({}),
		chatWindowSettings = ChatWindowSettings,
		getInterpolators = SignalsModule.createSignal(config),
		getTransparencyStore = function(_) --[[ Line: 51 ]]
			-- upvalues: config1 (upval)
			return config1
		end
	}
end