local BuildExperience = script:FindFirstAncestor("BuildExperience")
local ReactModule = require(BuildExperience.Parent.React)
local _ = require(BuildExperience.Chat.chatTypes)
local ChatTurnBlockModule = require(script.Parent.ChatTurnBlock)
local ChatUserMessageModule = require(script.Parent.ChatUserMessage)

return ReactModule.memo(function(Frame: Frame)
	-- upvalues: ReactModule (copy), ChatUserMessageModule (copy), ChatTurnBlockModule (copy)
	local Message = Frame.message
	
	return if Message.kind == "user_message" then ReactModule.createElement(ChatUserMessageModule, { message = Message, LayoutOrder = Frame.LayoutOrder }) else ReactModule.createElement(ChatTurnBlockModule, {
		turn = Message,
		LayoutOrder = Frame.LayoutOrder,
		clockBinding = Frame.clockBinding,
		localToolActions = Frame.localToolActions,
		onPlaytest = Frame.onPlaytest,
		isPlaytestLoading = Frame.isPlaytestLoading
	})
end, function(Frame, Frame1): boolean
	local Message = Frame.message
	local Message1 = Frame1.message
	
	if Message.id == nil or Message.id ~= Message1.id then
		return false
	elseif Message.kind ~= Message1.kind then
		return false
	elseif Frame.LayoutOrder ~= Frame1.LayoutOrder then
		return false
	elseif Message1.kind == "user_message" then
		return Message.text == Message1.text
	elseif Frame.isPlaytestLoading == Frame1.isPlaytestLoading then
		local IsIsDone = Message1.isDone == true
		
		return Message.isDone == true and IsIsDone
	else
		return false
	end
end)