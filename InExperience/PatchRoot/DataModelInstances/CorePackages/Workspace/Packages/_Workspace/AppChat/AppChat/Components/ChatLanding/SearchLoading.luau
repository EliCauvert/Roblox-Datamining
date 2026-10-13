local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useChatPagePaddingModule = require(appChat.Contexts.ChatPagePadding.useChatPagePadding)
local fFlagAppChatExtendConversationListRowDividersModule = require(appChat.Flags.FFlagAppChatExtendConversationListRowDividers)
local fFlagAppChatRemoveConversationListDividerModule = require(appChat.Flags.FFlagAppChatRemoveConversationListDivider)
local view = foundationModule.View
local skeleton = foundationModule.Skeleton
local radius = foundationModule.Enums.Radius
local useTokens = foundationModule.Hooks.useTokens
local uDim2 = UDim2.fromOffset(94, 12)
local uDim2_1 = UDim2.fromOffset(169, 12)

return function(p1)
	-- upvalues: useChatPagePaddingModule (ref), useTokens (ref), reactModule (ref), view (ref), fFlagAppChatExtendConversationListRowDividersModule (ref), skeleton (ref), radius (ref), uDim2 (ref), uDim2_1 (ref), fFlagAppChatRemoveConversationListDividerModule (ref), foundationModule (ref)
	local var1 = useChatPagePaddingModule()
	local var2 = useTokens()
	local t = {}
	
	for i = 1, 3 do
		t[`PlaceholderRow{i}`] = reactModule.createElement(view, {
			tag = "row align-y-center gap-small",
			Size = UDim2.new(1, 0, 0, p1.entryHeight),
			LayoutOrder = i,
			padding = {
				left = UDim.new(0, var1.left),
				right = if fFlagAppChatExtendConversationListRowDividersModule then nil else UDim.new(0, var1.right)
			}
		}, {
			Avatar = reactModule.createElement(skeleton, {
				LayoutOrder = 1,
				Size = UDim2.fromOffset(var2.Size.Size_1000, var2.Size.Size_1000),
				radius = radius.Circle
			}),
			Body = reactModule.createElement(view, { tag = "col fill size-0-full", LayoutOrder = 2 }, {
				Lines = reactModule.createElement(view, {
					tag = "col align-y-center fill gap-small size-full-0",
					LayoutOrder = 1,
					padding = if fFlagAppChatExtendConversationListRowDividersModule then { right = UDim.new(0, var1.right) } else nil
				}, {
					Title = reactModule.createElement(skeleton, { LayoutOrder = 1, Size = uDim2 }),
					Subtitle = reactModule.createElement(skeleton, { LayoutOrder = 2, Size = uDim2_1 })
				}),
				Divider = if i < 3 and not fFlagAppChatRemoveConversationListDividerModule then reactModule.createElement(view, { tag = "size-full-0 auto-y", LayoutOrder = 2 }, {
					Line = reactModule.createElement(foundationModule.Divider)
				}) else nil
			})
		})
	end
	return reactModule.createElement(view, {
		tag = "col size-full",
		padding = { top = UDim.new(0, p1.topPadding or 0) }
	}, {
		ChatLoadingFrame = reactModule.createElement(view, { tag = "col size-full-0 auto-y" }, t)
	})
end