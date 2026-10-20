local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local ChatConstantsModule = require(BuildExperience.Chat.chatConstants)
local _ = require(BuildExperience.Chat.chatTypes)
local FFlagBuildAgentAdCampaignCardModule = require(BuildExperience.Flags.FFlagBuildAgentAdCampaignCard)
local FFlagBuildExperienceChatHistoryLoadingSkeletonModule = require(BuildExperience.Flags.FFlagBuildExperienceChatHistoryLoadingSkeleton)
local View = require(Parent.Foundation).View
local ChatHistoryLoadingStateModule = require(script.Parent.ChatHistoryLoadingState)
local ChatMessageItemModule = require(script.Parent.ChatMessageItem)

return function(p1)
	-- upvalues: FFlagBuildExperienceChatHistoryLoadingSkeletonModule (copy), ReactModule (copy), ChatHistoryLoadingStateModule (copy), View (copy), ChatMessageItemModule (copy), ChatConstantsModule (copy), FFlagBuildAgentAdCampaignCardModule (copy)
	local Elements = {}
	
	if #p1.messages == 0 then
		local Element = if FFlagBuildExperienceChatHistoryLoadingSkeletonModule and p1.isHistoryLoading then ReactModule.createElement(ChatHistoryLoadingStateModule) else p1.emptyState
		
		if Element ~= nil then
			Elements.EmptyState = ReactModule.createElement(View, {
				LayoutOrder = 0,
				tag = "col align-x-center align-y-center padding-large",
				Size = UDim2.fromScale(1, 1)
			}, Element)
		end
		return Elements
	else
		for i, message in p1.messages do
			Elements[message.id or `Message{i}`] = ReactModule.createElement(ChatMessageItemModule, {
				message = message,
				LayoutOrder = i * ChatConstantsModule.MESSAGE_LAYOUT_ORDER_STRIDE,
				clockBinding = p1.clockBinding,
				localToolActions = p1.localToolActions,
				onPlaytest = p1.onPlaytest,
				onPublish = p1.onPublish,
				isPlaytestLoading = p1.isPlaytestLoading,
				onAgentAdCampaignOfferSelected = if FFlagBuildAgentAdCampaignCardModule then p1.onAgentAdCampaignOfferSelected else nil,
				isPageVisible = p1.isPageVisible,
				scrollingFrameRef = p1.scrollingFrameRef,
				isAgentAdCampaignCreateDisabled = p1.isAgentAdCampaignCreateDisabled,
				getAgentAdCampaignCardState = if FFlagBuildAgentAdCampaignCardModule then p1.getAgentAdCampaignCardState else nil,
				onAgentAdCampaignActive = if FFlagBuildAgentAdCampaignCardModule then p1.onAgentAdCampaignActive else nil
			})
		end
		return Elements
	end
end