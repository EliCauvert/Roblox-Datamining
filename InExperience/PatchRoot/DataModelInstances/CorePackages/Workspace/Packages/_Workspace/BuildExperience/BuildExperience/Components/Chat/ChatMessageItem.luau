local BuildExperience = script:FindFirstAncestor("BuildExperience")
local ReactModule = require(BuildExperience.Parent.React)
local ChatTypesModule = require(BuildExperience.Chat.chatTypes)
local AdCampaignEligibilityToolModule = require(BuildExperience.Chat.adCampaignEligibilityTool)
local FFlagBuildAgentAdCampaignCardModule = require(BuildExperience.Flags.FFlagBuildAgentAdCampaignCard)
local FFlagBuildExperienceSinglePlaytestCardModule = require(BuildExperience.Flags.FFlagBuildExperienceSinglePlaytestCard)
local ChatTurnBlockModule = require(script.Parent.ChatTurnBlock)
local ChatUserMessageModule = require(script.Parent.ChatUserMessage)

local function areUserImagesEqual(Images, Images1): boolean --[[ Line: 58 ]]
	local Images2 = Images or {}
	local Images1_1 = Images1 or {}
	
	if #Images2 ~= #Images1_1 then
		return false
	end
	for i, value in Images2 do
		local Image = Images1_1[i]
		
		if Image == nil or value.capture ~= Image.capture or value.uri ~= Image.uri then
			return false
		end
	end
	return true
end

local function areResourceAttachmentsEqual(ResourceAttachments, ResourceAttachments1): boolean --[[ Line: 73 ]]
	-- upvalues: ChatTypesModule (copy)
	local ResourceAttachments2 = ResourceAttachments or {}
	local ResourceAttachments1_1 = ResourceAttachments1 or {}
	
	if #ResourceAttachments2 ~= #ResourceAttachments1_1 then
		return false
	end
	for i, value in ResourceAttachments2 do
		local ResourceAttachment = ResourceAttachments1_1[i]
		
		if ResourceAttachment == nil or value.type ~= ResourceAttachment.type or ChatTypesModule.getResourceAttachmentUri(value) ~= ChatTypesModule.getResourceAttachmentUri(ResourceAttachment) then
			return false
		elseif value.type == "resource_link" and ResourceAttachment.type == "resource_link" and value.name ~= ResourceAttachment.name then
			return false
		end
	end
	return true
end

local function hasCampaignCard(Message): boolean --[[ Line: 104 ]]
	-- upvalues: AdCampaignEligibilityToolModule (copy)
	if Message.turnState ~= nil and Message.turnState.toolCalls ~= nil then
		for _, toolCall in Message.turnState.toolCalls do
			if AdCampaignEligibilityToolModule.isCompletedEligibilityToolCall(toolCall) then
				return true
			end
		end
	end
	return false
end

return ReactModule.memo(function(Frame: Frame) --[[ Line: 30 | Named "ChatMessageItem" ]]
	-- upvalues: ReactModule (copy), ChatUserMessageModule (copy), ChatTurnBlockModule (copy), FFlagBuildAgentAdCampaignCardModule (copy)
	local Message = Frame.message
	
	return if Message.kind == "user_message" then ReactModule.createElement(ChatUserMessageModule, { message = Message, LayoutOrder = Frame.LayoutOrder }) else ReactModule.createElement(ChatTurnBlockModule, {
		turn = Message,
		LayoutOrder = Frame.LayoutOrder,
		clockBinding = Frame.clockBinding,
		localToolActions = Frame.localToolActions,
		onPlaytest = Frame.onPlaytest,
		onPublish = Frame.onPublish,
		isPlaytestLoading = Frame.isPlaytestLoading,
		onAgentAdCampaignOfferSelected = if FFlagBuildAgentAdCampaignCardModule then Frame.onAgentAdCampaignOfferSelected else nil,
		isPageVisible = Frame.isPageVisible,
		scrollingFrameRef = Frame.scrollingFrameRef,
		isAgentAdCampaignCreateDisabled = Frame.isAgentAdCampaignCreateDisabled,
		getAgentAdCampaignCardState = if FFlagBuildAgentAdCampaignCardModule then Frame.getAgentAdCampaignCardState else nil,
		onAgentAdCampaignActive = if FFlagBuildAgentAdCampaignCardModule then Frame.onAgentAdCampaignActive else nil
	})
end, function(Frame, Frame1) --[[ Line: 115 | Named "arePropsEqual" ]]
	-- upvalues: areUserImagesEqual (copy), areResourceAttachmentsEqual (copy), FFlagBuildAgentAdCampaignCardModule (copy), hasCampaignCard (copy), FFlagBuildExperienceSinglePlaytestCardModule (copy)
	local Message = Frame.message
	local Message1 = Frame1.message
	
	if Message.id == nil or Message.id ~= Message1.id then
		return false
	elseif Message.kind ~= Message1.kind then
		return false
	elseif Frame.LayoutOrder ~= Frame1.LayoutOrder then
		return false
	elseif Message1.kind == "user_message" then
		return Message.text == Message1.text and (areUserImagesEqual(Message.images, Message1.images) and areResourceAttachmentsEqual(Message.resourceAttachments, Message1.resourceAttachments))
	elseif Frame.isPlaytestLoading ~= Frame1.isPlaytestLoading then
		return false
	elseif FFlagBuildAgentAdCampaignCardModule and (hasCampaignCard(Message) or hasCampaignCard(Message1)) and (Frame.onAgentAdCampaignOfferSelected ~= Frame1.onAgentAdCampaignOfferSelected or Frame.getAgentAdCampaignCardState ~= Frame1.getAgentAdCampaignCardState or Frame.onAgentAdCampaignActive ~= Frame1.onAgentAdCampaignActive or Frame.isPageVisible ~= Frame1.isPageVisible or Frame.scrollingFrameRef ~= Frame1.scrollingFrameRef or Frame.isAgentAdCampaignCreateDisabled ~= Frame1.isAgentAdCampaignCreateDisabled) then
		return false
	elseif FFlagBuildExperienceSinglePlaytestCardModule and Message.isLatestPublishTurn ~= Message1.isLatestPublishTurn then
		return false
	else
		local IsIsDone = Message1.isDone == true
		
		return Message.isDone == true and IsIsDone
	end
end)