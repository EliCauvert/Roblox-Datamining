local buildExperience = script:FindFirstAncestor("BuildExperience")
local reactModule = require(buildExperience.Parent.React)
local _ = require(buildExperience.Chat.chatTypes)
local chatTurnBlockModule = require(script.Parent.ChatTurnBlock)
local chatUserMessageModule = require(script.Parent.ChatUserMessage)

return reactModule.memo(function(p0) --[[ line: 20 | named "ChatMessageItem" ]]
	-- upvalues: reactModule (ref), chatUserMessageModule (ref), chatTurnBlockModule (ref)
	local message = p0.message
	
	return if message.kind == "user_message" then reactModule.createElement(chatUserMessageModule, { message = message, LayoutOrder = p0.LayoutOrder }) else reactModule.createElement(chatTurnBlockModule, {
		turn = message,
		LayoutOrder = p0.LayoutOrder,
		clockBinding = p0.clockBinding,
		localToolActions = p0.localToolActions,
		onPlaytest = p0.onPlaytest,
		isPlaytestLoading = p0.isPlaytestLoading
	})
end, function(p1, p2) --[[ line: 43 | named "arePropsEqual" ]]
	local message = p1.message
	local message_1 = p2.message
	
	return if message.id == nil or message.id ~= message_1.id then false else message.kind == message_1.kind and (p1.LayoutOrder == p2.LayoutOrder and (if message_1.kind == "user_message" then message.text == message_1.text else p1.isPlaytestLoading == p2.isPlaytestLoading and (message.isDone == true and message_1.isDone == true)))
end)