local signalsModule = require(script:FindFirstAncestor("ExpChatIntegration").Parent.Signals)
local _ = require(script.Parent.ChatPlatformTypes)
local t = {
	ChatWindowBackgroundTransparency = 0.3,
	ChatWindowMaxWidth = 600,
	ChatWindowMaxHeight = 400,
	ChatWindowBackgroundColor3 = Color3.fromRGB(34, 34, 34)
}
local t_1 = {
	getBackgroundColor = function(value)
		return value.BackgroundColor3
	end,
	getBackgroundTransparency = function(value)
		return value.BackgroundTransparency
	end
}
local t_2 = {
	setTextboxFocus = function() end,
	clearTextboxFocus = function() end
}

return function()
	-- upvalues: signalsModule (ref), t (ref), t_1 (ref), t_2 (ref)
	return {
		getChatInputBarSettings = signalsModule.createSignal({}),
		chatWindowSettings = t,
		getInterpolators = signalsModule.createSignal(t_1),
		getTransparencyStore = function(_)
			-- upvalues: t_2 (copy)
			return t_2
		end
	}
end