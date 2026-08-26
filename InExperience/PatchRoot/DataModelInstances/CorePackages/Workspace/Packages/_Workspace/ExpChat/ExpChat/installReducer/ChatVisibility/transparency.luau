local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local expChatSharedModule = require(parent.ExpChatShared)
local roduxModule = require(parent.Rodux)
local dictionary = require(parent.llama).Dictionary
local actions = expChat.Actions
local chatInputBarConfigurationEnabledModule = require(actions.ChatInputBarConfigurationEnabled)
local chatTopBarButtonActivatedModule = require(actions.ChatTopBarButtonActivated)
local setCoreGuiEnabledChangedModule = require(actions.SetCoreGuiEnabledChanged)
local clientAppLoaded = expChatSharedModule.Actions.ClientAppLoaded
local userInteractionModule = require(expChat.Actions.UserInteraction)
local incomingMessageReceivedModule = require(actions.IncomingMessageReceived)
local t = {
	textDurationUntilFadeout = 30,
	backgroundDurationUntilFadeout = 3.5,
	lastGeneralActivityTimestamp = 0,
	lastMessageActivityTimestamp = 0,
	isTextBoxFocused = false
}

local function reset(value)
	-- upvalues: dictionary (ref), t (ref)
	local processTime = os.clock()
	
	return dictionary.join(t, {
		isTextBoxFocused = value.isTextBoxFocused,
		lastGeneralActivityTimestamp = processTime,
		lastMessageActivityTimestamp = processTime
	})
end

local function resetTextOnly(value)
	-- upvalues: dictionary (ref)
	return dictionary.join(value, {
		isTextBoxFocused = value.isTextBoxFocused,
		lastMessageActivityTimestamp = os.clock()
	})
end

return roduxModule.createReducer(t, {
	[chatInputBarConfigurationEnabledModule.name] = function(p1, p2)
		-- upvalues: reset (ref)
		return if p2.enabled then reset(p1) else p1
	end,
	[chatTopBarButtonActivatedModule.name] = function(p1, p2)
		-- upvalues: reset (ref)
		return if p2.isVisible then reset(p1) else p1
	end,
	[setCoreGuiEnabledChangedModule.name] = function(p1, p2)
		-- upvalues: reset (ref)
		return if p2.enabled then reset(p1) else p1
	end,
	[clientAppLoaded.name] = function(p1, _)
		-- upvalues: reset (ref)
		return reset(p1)
	end,
	[userInteractionModule.name] = function(p1, p2)
		-- upvalues: dictionary (ref), t (ref), reset (ref)
		if p2.interaction == "focus" then
			local processTime = os.clock()
			
			return dictionary.join(dictionary.join(t, {
				isTextBoxFocused = p1.isTextBoxFocused,
				lastGeneralActivityTimestamp = processTime,
				lastMessageActivityTimestamp = processTime
			}), { isTextBoxFocused = true })
		elseif p2.interaction == "unfocus" then
			local processTime = os.clock()
			
			return dictionary.join(dictionary.join(t, {
				isTextBoxFocused = p1.isTextBoxFocused,
				lastGeneralActivityTimestamp = processTime,
				lastMessageActivityTimestamp = processTime
			}), { isTextBoxFocused = false })
		end
		return reset(p1)
	end,
	[incomingMessageReceivedModule.name] = function(p1, _)
		-- upvalues: resetTextOnly (ref)
		return resetTextOnly(p1)
	end
})