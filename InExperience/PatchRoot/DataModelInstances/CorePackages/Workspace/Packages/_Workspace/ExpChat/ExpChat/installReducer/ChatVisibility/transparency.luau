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

local function reset(value) --[[ line: 31 ]]
	-- upvalues: dictionary (ref), t (ref)
	local processTime = os.clock()
	
	return dictionary.join(t, {
		isTextBoxFocused = value.isTextBoxFocused,
		lastGeneralActivityTimestamp = processTime,
		lastMessageActivityTimestamp = processTime
	})
end

local function resetTextOnly(value) --[[ line: 41 ]]
	-- upvalues: dictionary (ref)
	return dictionary.join(value, {
		isTextBoxFocused = value.isTextBoxFocused,
		lastMessageActivityTimestamp = os.clock()
	})
end

return roduxModule.createReducer(t, {
	[chatInputBarConfigurationEnabledModule.name] = function(p0, p1) --[[ line: 51 ]]
		-- upvalues: reset (ref)
		return if p1.enabled then reset(p0) else p0
	end,
	[chatTopBarButtonActivatedModule.name] = function(p2, p3) --[[ line: 59 ]]
		-- upvalues: reset (ref)
		return if p3.isVisible then reset(p2) else p2
	end,
	[setCoreGuiEnabledChangedModule.name] = function(p4, p5) --[[ line: 67 ]]
		-- upvalues: reset (ref)
		return if p5.enabled then reset(p4) else p4
	end,
	[clientAppLoaded.name] = function(p6, _) --[[ line: 75 ]]
		-- upvalues: reset (ref)
		return reset(p6)
	end,
	[userInteractionModule.name] = function(p7, p8) --[[ line: 79 ]]
		-- upvalues: dictionary (ref), t (ref), reset (ref)
		if p8.interaction == "focus" then
			local processTime = os.clock()
			
			return dictionary.join(dictionary.join(t, {
				isTextBoxFocused = p7.isTextBoxFocused,
				lastGeneralActivityTimestamp = processTime,
				lastMessageActivityTimestamp = processTime
			}), { isTextBoxFocused = true })
		elseif p8.interaction == "unfocus" then
			local processTime = os.clock()
			
			return dictionary.join(dictionary.join(t, {
				isTextBoxFocused = p7.isTextBoxFocused,
				lastGeneralActivityTimestamp = processTime,
				lastMessageActivityTimestamp = processTime
			}), { isTextBoxFocused = false })
		end
		return reset(p7)
	end,
	[incomingMessageReceivedModule.name] = function(p9, _) --[[ line: 93 ]]
		-- upvalues: resetTextOnly (ref)
		return resetTextOnly(p9)
	end
})