local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local _ = require(buildExperience.Chat.chatTypes)
local view = foundationModule.View
local chatMessageItemModule = require(script.Parent.ChatMessageItem)

local function _(p0, p1) --[[ line: 23 | named "hasInlineFooterAfter" ]]
	local var4 = p0[p1 + 1]
	
	return var4 ~= nil and var4.inlineKind ~= nil
end

return function(p2) --[[ line: 28 | named "ChatMessageList" ]]
	-- upvalues: reactModule (ref), view (ref), chatMessageItemModule (ref)
	local t = {}
	
	if #p2.messages == 0 and p2.emptyState ~= nil then
		t.EmptyState = reactModule.createElement(view, {
			LayoutOrder = 0,
			tag = "col align-x-center align-y-center padding-large",
			Size = UDim2.fromScale(1, 1)
		}, p2.emptyState)
		
		return t
	end
	for i, v in p2.messages do
		local id = v.id or `Message{i}`
		local createElement = reactModule.createElement
		local var7 = chatMessageItemModule
		local t_1 = {
			message = v,
			LayoutOrder = i,
			clockBinding = p2.clockBinding,
			onPlaytest = p2.onPlaytest,
			isPlaytestLoading = p2.isPlaytestLoading
		}
		local var9 = p2.messages[i + 1]
		t_1.hideFeedback = var9 ~= nil and var9.inlineKind ~= nil
		t[id] = createElement(var7, t_1)
	end
	return t
end