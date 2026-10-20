local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local _ = require(BuildExperience.Chat.chatTypes)
local View = require(Parent.Foundation).View
local ChatMessageItemModule = require(script.Parent.ChatMessageItem)

return function(p1)
	-- upvalues: ReactModule (copy), View (copy), ChatMessageItemModule (copy)
	local Elements = {}
	
	if #p1.messages == 0 and p1.emptyState ~= nil then
		Elements.EmptyState = ReactModule.createElement(View, {
			LayoutOrder = 0,
			tag = "col align-x-center align-y-center padding-large",
			Size = UDim2.fromScale(1, 1)
		}, p1.emptyState)
		
		return Elements
	end
	for LayoutOrder, message in p1.messages do
		Elements[message.id or `Message{LayoutOrder}`] = ReactModule.createElement(ChatMessageItemModule, {
			message = message,
			LayoutOrder = LayoutOrder,
			clockBinding = p1.clockBinding,
			localToolActions = p1.localToolActions,
			onPlaytest = p1.onPlaytest,
			isPlaytestLoading = p1.isPlaytestLoading
		})
	end
	return Elements
end