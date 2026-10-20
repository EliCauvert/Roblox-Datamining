local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseChatPagePaddingModule = require(AppChat.Contexts.ChatPagePadding.useChatPagePadding)
local FFlagAppChatExtendConversationListRowDividersModule = require(AppChat.Flags.FFlagAppChatExtendConversationListRowDividers)
local FFlagAppChatRemoveConversationListDividerModule = require(AppChat.Flags.FFlagAppChatRemoveConversationListDivider)
local View = FoundationModule.View
local Skeleton = FoundationModule.Skeleton
local Radius = FoundationModule.Enums.Radius
local UseTokensFunction = FoundationModule.Hooks.useTokens
local _UDim2 = UDim2.fromOffset(94, 12)
local _UDim2_1 = UDim2.fromOffset(169, 12)

return function(p1)
	-- upvalues: UseChatPagePaddingModule (copy), UseTokensFunction (copy), ReactModule (copy), View (copy), FFlagAppChatExtendConversationListRowDividersModule (copy), Skeleton (copy), Radius (copy), _UDim2 (copy), _UDim2_1 (copy), FFlagAppChatRemoveConversationListDividerModule (copy), FoundationModule (copy)
	local UseChatPagePaddingModuleResult = UseChatPagePaddingModule()
	local UseTokensResult = UseTokensFunction()
	local Elements = {}
	
	for i = 1, 3 do
		Elements[`PlaceholderRow{i}`] = ReactModule.createElement(View, {
			tag = "row align-y-center gap-small",
			Size = UDim2.new(1, 0, 0, p1.entryHeight),
			LayoutOrder = i,
			padding = {
				left = UDim.new(0, UseChatPagePaddingModuleResult.left),
				right = if FFlagAppChatExtendConversationListRowDividersModule then nil else UDim.new(0, UseChatPagePaddingModuleResult.right)
			}
		}, {
			Avatar = ReactModule.createElement(Skeleton, {
				LayoutOrder = 1,
				Size = UDim2.fromOffset(UseTokensResult.Size.Size_1000, UseTokensResult.Size.Size_1000),
				radius = Radius.Circle
			}),
			Body = ReactModule.createElement(View, { tag = "col fill size-0-full", LayoutOrder = 2 }, {
				Lines = ReactModule.createElement(View, {
					tag = "col align-y-center fill gap-small size-full-0",
					LayoutOrder = 1,
					padding = if FFlagAppChatExtendConversationListRowDividersModule then {
						right = UDim.new(0, UseChatPagePaddingModuleResult.right)
					} else nil
				}, {
					Title = ReactModule.createElement(Skeleton, { LayoutOrder = 1, Size = _UDim2 }),
					Subtitle = ReactModule.createElement(Skeleton, { LayoutOrder = 2, Size = _UDim2_1 })
				}),
				Divider = if i < 3 and not FFlagAppChatRemoveConversationListDividerModule then ReactModule.createElement(View, { tag = "size-full-0 auto-y", LayoutOrder = 2 }, {
					Line = ReactModule.createElement(FoundationModule.Divider)
				}) else nil
			})
		})
	end
	return ReactModule.createElement(View, {
		tag = "col size-full",
		padding = { top = UDim.new(0, p1.topPadding or 0) }
	}, {
		ChatLoadingFrame = ReactModule.createElement(View, { tag = "col size-full-0 auto-y" }, Elements)
	})
end