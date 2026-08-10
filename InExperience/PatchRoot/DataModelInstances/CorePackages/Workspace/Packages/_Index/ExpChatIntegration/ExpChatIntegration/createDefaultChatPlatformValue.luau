local signalsModule = require(script:FindFirstAncestor("ExpChatIntegration").Parent.Signals)
local _ = require(script.Parent.ChatPlatformTypes)
local t = {
	ChatWindowBackgroundTransparency = 0.3,
	ChatWindowMaxWidth = 600,
	ChatWindowMaxHeight = 400,
	ChatWindowBackgroundColor3 = Color3.fromRGB(34, 34, 34)
}
local t_1 = {
	getBackgroundColor = function(value) --[[ line: 33 ]]
		return value.BackgroundColor3
	end,
	getBackgroundTransparency = function(value) --[[ line: 36 ]]
		return value.BackgroundTransparency
	end
}
local t_2 = {
	setTextboxFocus = function() --[[ line: 42 ]] end,
	clearTextboxFocus = function() --[[ line: 43 ]] end
}

return function() --[[ line: 46 | named "createDefaultChatPlatformValue" ]]
	-- upvalues: signalsModule (ref), t (ref), t_1 (ref), t_2 (ref)
	return {
		getChatInputBarSettings = signalsModule.createSignal({}),
		chatWindowSettings = t,
		getInterpolators = signalsModule.createSignal(t_1),
		getTransparencyStore = function(_) --[[ line: 51 ]]
			-- upvalues: t_2 (copy)
			return t_2
		end
	}
end