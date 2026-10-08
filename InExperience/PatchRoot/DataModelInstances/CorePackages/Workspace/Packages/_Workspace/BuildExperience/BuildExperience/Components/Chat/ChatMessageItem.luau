local buildExperience = script:FindFirstAncestor("BuildExperience")
local reactModule = require(buildExperience.Parent.React)
local chatTypesModule = require(buildExperience.Chat.chatTypes)
local adCampaignEligibilityToolModule = require(buildExperience.Chat.adCampaignEligibilityTool)
local fFlagBuildAgentAdCampaignCardModule = require(buildExperience.Flags.FFlagBuildAgentAdCampaignCard)
local fFlagBuildExperienceSinglePlaytestCardModule = require(buildExperience.Flags.FFlagBuildExperienceSinglePlaytestCard)
local chatTurnBlockModule = require(script.Parent.ChatTurnBlock)
local chatUserMessageModule = require(script.Parent.ChatUserMessage)

local function ChatMessageItem(p1)
	-- upvalues: reactModule (ref), chatUserMessageModule (ref), chatTurnBlockModule (ref), fFlagBuildAgentAdCampaignCardModule (ref)
	local message = p1.message
	
	return if message.kind == "user_message" then reactModule.createElement(chatUserMessageModule, { message = message, LayoutOrder = p1.LayoutOrder }) else reactModule.createElement(chatTurnBlockModule, {
		turn = message,
		LayoutOrder = p1.LayoutOrder,
		clockBinding = p1.clockBinding,
		localToolActions = p1.localToolActions,
		onPlaytest = p1.onPlaytest,
		onPublish = p1.onPublish,
		isPlaytestLoading = p1.isPlaytestLoading,
		onAgentAdCampaignOfferSelected = if fFlagBuildAgentAdCampaignCardModule then p1.onAgentAdCampaignOfferSelected else nil,
		isPageVisible = p1.isPageVisible,
		scrollingFrameRef = p1.scrollingFrameRef,
		isAgentAdCampaignCreateDisabled = p1.isAgentAdCampaignCreateDisabled,
		getAgentAdCampaignCardState = if fFlagBuildAgentAdCampaignCardModule then p1.getAgentAdCampaignCardState else nil,
		onAgentAdCampaignActive = if fFlagBuildAgentAdCampaignCardModule then p1.onAgentAdCampaignActive else nil
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

local function areResourceAttachmentsEqual(p3, p4)
	-- upvalues: chatTypesModule (ref)
	p3 = p3 or {}
	p4 = p4 or {}
	
	if #p3 ~= #p4 then
		return false
	end
	for i, v in p3 do
		local var2 = p4[i]
		
		if var2 ~= nil and v.type == var2.type and chatTypesModule.getResourceAttachmentUri(v) == chatTypesModule.getResourceAttachmentUri(var2) then
			if v.type == "resource_link" and var2.type == "resource_link" and v.name ~= var2.name then
				return false
			end
		end
		return false
	end
	return true
end

local function hasCampaignCard(p5)
	-- upvalues: adCampaignEligibilityToolModule (ref)
	if p5.turnState ~= nil and p5.turnState.toolCalls ~= nil then
		for i, v in p5.turnState.toolCalls do
			if adCampaignEligibilityToolModule.isCompletedEligibilityToolCall(v) then
				return true
			end
		end
	end
	return false
end

return reactModule.memo(ChatMessageItem, function(p6, p7)
	-- upvalues: areUserImagesEqual (ref), areResourceAttachmentsEqual (ref), fFlagBuildAgentAdCampaignCardModule (ref), hasCampaignCard (ref), fFlagBuildExperienceSinglePlaytestCardModule (ref)
	local message = p6.message
	local message_1 = p7.message
	
	return if message.id == nil or message.id ~= message_1.id then false else message.kind == message_1.kind and (p6.LayoutOrder == p7.LayoutOrder and (if message_1.kind == "user_message" then message.text == message_1.text and (areUserImagesEqual(message.images, message_1.images) and areResourceAttachmentsEqual(message.resourceAttachments, message_1.resourceAttachments)) else p6.isPlaytestLoading == p7.isPlaytestLoading and (if fFlagBuildAgentAdCampaignCardModule and (hasCampaignCard(message) or hasCampaignCard(message_1)) and (p6.onAgentAdCampaignOfferSelected ~= p7.onAgentAdCampaignOfferSelected or p6.getAgentAdCampaignCardState ~= p7.getAgentAdCampaignCardState or (p6.onAgentAdCampaignActive ~= p7.onAgentAdCampaignActive or p6.isPageVisible ~= p7.isPageVisible) or (p6.scrollingFrameRef ~= p7.scrollingFrameRef or p6.isAgentAdCampaignCreateDisabled ~= p7.isAgentAdCampaignCreateDisabled)) then false elseif fFlagBuildExperienceSinglePlaytestCardModule and message.isLatestPublishTurn ~= message_1.isLatestPublishTurn then false else message.isDone == true and message_1.isDone == true)))
end)