local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local _ = require(buildExperience.Chat.chatTypes)
local fFlagBuildExperienceChatHistoryLoadingSkeletonModule = require(buildExperience.Flags.FFlagBuildExperienceChatHistoryLoadingSkeleton)
local view = foundationModule.View
local chatHistoryLoadingStateModule = require(script.Parent.ChatHistoryLoadingState)
local chatMessageItemModule = require(script.Parent.ChatMessageItem)

return function(p0)
	-- upvalues: fFlagBuildExperienceChatHistoryLoadingSkeletonModule (ref), reactModule (ref), chatHistoryLoadingStateModule (ref), view (ref), chatMessageItemModule (ref)
	local t = {}
	
	if #p0.messages == 0 then
		local var7 = if fFlagBuildExperienceChatHistoryLoadingSkeletonModule and p0.isHistoryLoading then reactModule.createElement(chatHistoryLoadingStateModule) else p0.emptyState
		
		if var7 ~= nil then
			t.EmptyState = reactModule.createElement(view, {
				LayoutOrder = 0,
				tag = "col align-x-center align-y-center padding-large",
				Size = UDim2.fromScale(1, 1)
			}, var7)
		end
		return t
	else
		for i, v in p0.messages do
			t[v.id or `Message{i}`] = reactModule.createElement(chatMessageItemModule, {
				message = v,
				LayoutOrder = i,
				clockBinding = p0.clockBinding,
				localToolActions = p0.localToolActions,
				onPlaytest = p0.onPlaytest,
				isPlaytestLoading = p0.isPlaytestLoading
			})
		end
		return t
	end
end