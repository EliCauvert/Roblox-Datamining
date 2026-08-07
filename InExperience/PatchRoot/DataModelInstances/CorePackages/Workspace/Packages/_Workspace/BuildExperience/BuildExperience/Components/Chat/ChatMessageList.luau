local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local _ = require(buildExperience.Chat.chatTypes)
local view = foundationModule.View
local chatMessageItemModule = require(script.Parent.ChatMessageItem)

return function(p0) --[[ line: 22 | named "ChatMessageList" ]]
	-- upvalues: reactModule (ref), view (ref), chatMessageItemModule (ref)
	local t = {}
	
	if #p0.messages == 0 and p0.emptyState ~= nil then
		t.EmptyState = reactModule.createElement(view, {
			LayoutOrder = 0,
			tag = "col align-x-center align-y-center padding-large",
			Size = UDim2.fromScale(1, 1)
		}, p0.emptyState)
		
		return t
	end
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