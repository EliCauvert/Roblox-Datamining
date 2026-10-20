local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local Dictionary = require(Parent.llama).Dictionary
local Actions = ExpChat.Actions
local config = {
	textDurationUntilFadeout = 30,
	backgroundDurationUntilFadeout = 3.5,
	lastGeneralActivityTimestamp = 0,
	lastMessageActivityTimestamp = 0,
	isTextBoxFocused = false
}

local function reset(p1)
	-- upvalues: Dictionary (copy), config (copy)
	local ClockTime = os.clock()
	
	return Dictionary.join(config, {
		isTextBoxFocused = p1.isTextBoxFocused,
		lastGeneralActivityTimestamp = ClockTime,
		lastMessageActivityTimestamp = ClockTime
	})
end

local function resetTextOnly(p1)
	-- upvalues: Dictionary (copy)
	return Dictionary.join(p1, {
		isTextBoxFocused = p1.isTextBoxFocused,
		lastMessageActivityTimestamp = os.clock()
	})
end

return require(Parent.Rodux).createReducer(config, {
	[require(Actions.ChatInputBarConfigurationEnabled).name] = function(p1, p2)
		-- upvalues: reset (copy)
		return if p2.enabled then reset(p1) else p1
	end,
	[require(Actions.ChatTopBarButtonActivated).name] = function(p1, p2)
		-- upvalues: reset (copy)
		return if p2.isVisible then reset(p1) else p1
	end,
	[require(Actions.SetCoreGuiEnabledChanged).name] = function(p1, p2)
		-- upvalues: reset (copy)
		return if p2.enabled then reset(p1) else p1
	end,
	[require(Parent.ExpChatShared).Actions.ClientAppLoaded.name] = function(p1, _)
		-- upvalues: reset (copy)
		return reset(p1)
	end,
	[require(ExpChat.Actions.UserInteraction).name] = function(p1, p2)
		-- upvalues: Dictionary (copy), config (copy), reset (copy)
		if p2.interaction == "focus" then
			local ClockTime = os.clock()
			
			return Dictionary.join(Dictionary.join(config, {
				isTextBoxFocused = p1.isTextBoxFocused,
				lastGeneralActivityTimestamp = ClockTime,
				lastMessageActivityTimestamp = ClockTime
			}), { isTextBoxFocused = true })
		elseif p2.interaction == "unfocus" then
			local ClockTime = os.clock()
			
			return Dictionary.join(Dictionary.join(config, {
				isTextBoxFocused = p1.isTextBoxFocused,
				lastGeneralActivityTimestamp = ClockTime,
				lastMessageActivityTimestamp = ClockTime
			}), { isTextBoxFocused = false })
		else
			return reset(p1)
		end
	end,
	[require(Actions.IncomingMessageReceived).name] = function(p1, _)
		-- upvalues: resetTextOnly (copy)
		return resetTextOnly(p1)
	end
})