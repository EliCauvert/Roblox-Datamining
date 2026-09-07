local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local _ = require(buildExperience.Chat.chatTypes)
local fFlagBuildExperienceChatHistoryLoadingSkeletonModule = require(buildExperience.Flags.FFlagBuildExperienceChatHistoryLoadingSkeleton)
local view = foundationModule.View
local chatHistoryLoadingStateModule = require(script.Parent.ChatHistoryLoadingState)
local chatMessageItemModule = require(script.Parent.ChatMessageItem)

return function(p1)
	-- upvalues: fFlagBuildExperienceChatHistoryLoadingSkeletonModule (ref), reactModule (ref), chatHistoryLoadingStateModule (ref), view (ref), chatMessageItemModule (ref)
	local t = {}
	
	if #p1.messages == 0 then
		local var1 = if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and p1.isHistoryLoading then reactModule.createElement(chatHistoryLoadingStateModule) else p1.emptyState
		
		if var1 ~= nil then
			t.EmptyState = reactModule.createElement(view, {
				LayoutOrder = 0,
				tag = "col align-x-center align-y-center padding-large",
				Size = UDim2.fromScale(1, 1)
			}, var1)
		end
		return t
	else
		for i, v in p1.messages do
			t[v.id or `Message{i}`] = reactModule.createElement(chatMessageItemModule, {
				message = v,
				LayoutOrder = i,
				clockBinding = p1.clockBinding,
				localToolActions = p1.localToolActions,
				onPlaytest = p1.onPlaytest,
				isPlaytestLoading = p1.isPlaytestLoading
			})
		end
		return t
	end
end