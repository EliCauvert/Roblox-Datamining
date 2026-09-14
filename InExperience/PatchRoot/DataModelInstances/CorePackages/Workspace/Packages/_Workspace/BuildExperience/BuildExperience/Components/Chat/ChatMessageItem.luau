local buildExperience = script:FindFirstAncestor("BuildExperience")
local reactModule = require(buildExperience.Parent.React)
local _ = require(buildExperience.Chat.chatTypes)
local fFlagBuildExperienceSinglePlaytestCardModule = require(buildExperience.Flags.FFlagBuildExperienceSinglePlaytestCard)
local chatTurnBlockModule = require(script.Parent.ChatTurnBlock)
local chatUserMessageModule = require(script.Parent.ChatUserMessage)

local function ChatMessageItem(p1)
	-- upvalues: reactModule (ref), chatUserMessageModule (ref), chatTurnBlockModule (ref)
	local message = p1.message
	
	return if message.kind == "user_message" then reactModule.createElement(chatUserMessageModule, { message = message, LayoutOrder = p1.LayoutOrder }) else reactModule.createElement(chatTurnBlockModule, {
		turn = message,
		LayoutOrder = p1.LayoutOrder,
		clockBinding = p1.clockBinding,
		localToolActions = p1.localToolActions,
		onPlaytest = p1.onPlaytest,
		isPlaytestLoading = p1.isPlaytestLoading
	})
end

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

local function areUserReferencesEqual(p3, p4)
	p3 = p3 or {}
	p4 = p4 or {}
	
	if #p3 ~= #p4 then
		return false
	end
	for i, v in p3 do
		local var2 = p4[i]
		
		if var2 == nil or v.path ~= var2.path or (v.displayName ~= var2.displayName or v.className ~= var2.className) then
			return false
		end
	end
	return true
end

return reactModule.memo(ChatMessageItem, function(p5, p6)
	-- upvalues: areUserImagesEqual (ref), areUserReferencesEqual (ref), fFlagBuildExperienceSinglePlaytestCardModule (ref)
	local message = p5.message
	local message_1 = p6.message
	
	return if message.id == nil or message.id ~= message_1.id then false else message.kind == message_1.kind and (p5.LayoutOrder == p6.LayoutOrder and (if message_1.kind == "user_message" then message.text == message_1.text and (areUserImagesEqual(message.images, message_1.images) and areUserReferencesEqual(message.references, message_1.references)) else p5.isPlaytestLoading == p6.isPlaytestLoading and (if fFlagBuildExperienceSinglePlaytestCardModule and message.isLatestPublishTurn ~= message_1.isLatestPublishTurn then false else message.isDone == true and message_1.isDone == true)))
end)