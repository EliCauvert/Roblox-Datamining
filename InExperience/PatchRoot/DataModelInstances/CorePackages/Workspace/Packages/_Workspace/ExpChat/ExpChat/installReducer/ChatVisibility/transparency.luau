local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ExpChatSharedModule = require(Parent.ExpChatShared)
local RoduxModule = require(Parent.Rodux)
local Dictionary = require(Parent.llama).Dictionary
local Actions = ExpChat.Actions
local ChatInputBarConfigurationEnabledModule = require(Actions.ChatInputBarConfigurationEnabled)
local ChatTopBarButtonActivatedModule = require(Actions.ChatTopBarButtonActivated)
local SetCoreGuiEnabledChangedModule = require(Actions.SetCoreGuiEnabledChanged)
local ClientAppLoaded = ExpChatSharedModule.Actions.ClientAppLoaded
local UserInteractionModule = require(ExpChat.Actions.UserInteraction)
local IncomingMessageReceivedModule = require(Actions.IncomingMessageReceived)
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

return RoduxModule.createReducer(config, {
	[ChatInputBarConfigurationEnabledModule.name] = function(p1, p2)
		-- upvalues: reset (copy)
		return if p2.enabled then reset(p1) else p1
	end,
	[ChatTopBarButtonActivatedModule.name] = function(p1, p2)
		-- upvalues: reset (copy)
		return if p2.isVisible then reset(p1) else p1
	end,
	[SetCoreGuiEnabledChangedModule.name] = function(p1, p2)
		-- upvalues: reset (copy)
		return if p2.enabled then reset(p1) else p1
	end,
	[ClientAppLoaded.name] = function(p1, _)
		-- upvalues: reset (copy)
		return reset(p1)
	end,
	[UserInteractionModule.name] = function(p1, p2)
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
	[IncomingMessageReceivedModule.name] = function(p1, _)
		-- upvalues: resetTextOnly (copy)
		return resetTextOnly(p1)
	end
})