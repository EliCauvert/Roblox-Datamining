local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local CryoModule = require(Parent.Cryo)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local _ = require(AppChat.types)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseChatPagePaddingModule = require(AppChat.Contexts.ChatPagePadding.useChatPagePadding)
local config = {
	actionText = "PLACEHOLDER Action",
	bodyText = "PLACEHOLDER Body",
	onActivated = function() --[[ Line: 24 ]] end,
	onDismissed = function() --[[ Line: 25 ]] end
}

return ReactModule.memo(function(p1) --[[ Line: 28 | Named "ConversationBanner" ]]
	-- upvalues: CryoModule (copy), config (copy), UseTokensFunction (copy), UseChatPagePaddingModule (copy), ReactModule (copy), FoundationModule (copy)
	local UnionResult = CryoModule.Dictionary.union(config, p1)
	local Medium = UseTokensFunction().Padding.Medium
	local UseChatPagePaddingModuleResult = UseChatPagePaddingModule()
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "row gap-medium align-y-center size-full-0 auto-y bg-shift-200",
		padding = {
			left = UDim.new(0, UseChatPagePaddingModuleResult.left),
			right = UDim.new(0, UseChatPagePaddingModuleResult.right),
			top = UDim.new(0, Medium),
			bottom = UDim.new(0, Medium)
		},
		LayoutOrder = UnionResult.layoutOrder
	}, {
		BodyText = ReactModule.createElement(FoundationModule.Text, {
			tag = "text-title-medium text-align-x-left text-truncate-end content-emphasis auto-y fill",
			LayoutOrder = 1,
			Text = UnionResult.bodyText
		}),
		ActionContainer = ReactModule.createElement(FoundationModule.View, {
			LayoutOrder = 2,
			tag = "row gap-small align-y-center auto-xy"
		}, {
			ActionButton = ReactModule.createElement(FoundationModule.Button, {
				LayoutOrder = 1,
				text = UnionResult.actionText,
				onActivated = UnionResult.onActivated,
				size = FoundationModule.Enums.InputSize.Small
			}),
			CloseButton = ReactModule.createElement(FoundationModule.View, {
				LayoutOrder = 2,
				tag = "auto-xy x-default-transparent radius-small padding-xsmall",
				onActivated = UnionResult.onDismissed
			}, {
				Icon = ReactModule.createElement(FoundationModule.Icon, {
					size = FoundationModule.Enums.IconSize.Large,
					name = FoundationModule.Enums.IconName.X
				})
			})
		})
	})
end)