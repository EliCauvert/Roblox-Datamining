local buildExperience = script:FindFirstAncestor("BuildExperience")
local reactModule = require(buildExperience.Parent.React)
local _ = require(buildExperience.Chat.chatTypes)
local fFlagBuildExperienceSinglePlaytestCardModule = require(buildExperience.Flags.FFlagBuildExperienceSinglePlaytestCard)
local chatTurnBlockModule = require(script.Parent.ChatTurnBlock)
local chatUserMessageModule = require(script.Parent.ChatUserMessage)

local function areUserImagesEqual(p1, p2)
	p1 = p1 or {}
	p2 = p2 or {}
	
	if #p1 ~= #p2 then
		return false
	end
	for i, v in p1 do
		local var1 = p2[i]
		
		if var1 == nil or v.capture ~= var1.capture or v.uri ~= var1.uri then
			return false
		end
	end
	return true
end

return reactModule.memo(function(p3)
	-- upvalues: reactModule (ref), chatUserMessageModule (ref), chatTurnBlockModule (ref)
	local message = p3.message
	
	return if message.kind == "user_message" then reactModule.createElement(chatUserMessageModule, { message = message, LayoutOrder = p3.LayoutOrder }) else reactModule.createElement(chatTurnBlockModule, {
		turn = message,
		LayoutOrder = p3.LayoutOrder,
		clockBinding = p3.clockBinding,
		localToolActions = p3.localToolActions,
		onPlaytest = p3.onPlaytest,
		isPlaytestLoading = p3.isPlaytestLoading
	})
end, function(p3, p4)
	-- upvalues: areUserImagesEqual (ref), fFlagBuildExperienceSinglePlaytestCardModule (ref)
	local message = p3.message
	local message_1 = p4.message
	
	return if message.id == nil or message.id ~= message_1.id then false else message.kind == message_1.kind and (p3.LayoutOrder == p4.LayoutOrder and (if message_1.kind == "user_message" then message.text == message_1.text and areUserImagesEqual(message.images, message_1.images) else p3.isPlaytestLoading == p4.isPlaytestLoading and (if fFlagBuildExperienceSinglePlaytestCardModule and message.isLatestPublishTurn ~= message_1.isLatestPublishTurn then false else message.isDone == true and message_1.isDone == true)))
end)