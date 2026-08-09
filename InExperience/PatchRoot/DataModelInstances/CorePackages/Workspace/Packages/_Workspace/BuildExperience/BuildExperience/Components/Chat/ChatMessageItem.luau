local buildExperience = script:FindFirstAncestor("BuildExperience")
local reactModule = require(buildExperience.Parent.React)
local _ = require(buildExperience.Chat.chatTypes)
local chatAssistantMessageModule = require(script.Parent.ChatAssistantMessage)
local chatInlineTurnFooterModule = require(script.Parent.ChatInlineTurnFooter)
local chatUserMessageModule = require(script.Parent.ChatUserMessage)

local function _(p0) --[[ line: 23 | named "getInlineTurnFeedbackIds" ]]
	local turnFeedbackIds = p0.turnFeedbackIds
	
	return if typeof(turnFeedbackIds) == "table" then turnFeedbackIds else nil
end

return function(p1) --[[ line: 31 | named "ChatMessageItem" ]]
	-- upvalues: reactModule (ref), chatInlineTurnFooterModule (ref), chatUserMessageModule (ref), chatAssistantMessageModule (ref)
	local message = p1.message
	
	if message.inlineKind == nil or message.stepCount == nil then
		return if message.isUser == true then reactModule.createElement(chatUserMessageModule, { message = p1.message, LayoutOrder = p1.LayoutOrder }) else reactModule.createElement(chatAssistantMessageModule, {
			message = p1.message,
			LayoutOrder = p1.LayoutOrder,
			clockBinding = p1.clockBinding,
			hideFeedback = p1.hideFeedback
		})
	end
	local createElement = reactModule.createElement
	local var5 = chatInlineTurnFooterModule
	local t = {
		inlineKind = message.inlineKind,
		stepCount = message.stepCount,
		LayoutOrder = p1.LayoutOrder,
		onPlaytest = if message.inlineKind == "playtestCard" then p1.onPlaytest else nil,
		isPlaytestLoading = p1.isPlaytestLoading
	}
	local turnFeedbackIds = message.turnFeedbackIds
	t.turnFeedbackIds = if typeof(turnFeedbackIds) ~= "table" then turnFeedbackIds else nil
	
	return createElement(var5, t)
end