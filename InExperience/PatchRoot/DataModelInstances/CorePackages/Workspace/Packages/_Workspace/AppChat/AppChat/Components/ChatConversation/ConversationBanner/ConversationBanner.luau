local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local cryoModule = require(parent.Cryo)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local _ = require(appChat.types)
local useTokens = foundationModule.Hooks.useTokens
local useChatPagePaddingModule = require(appChat.Contexts.ChatPagePadding.useChatPagePadding)
local t = {
	actionText = "PLACEHOLDER Action",
	bodyText = "PLACEHOLDER Body",
	onActivated = function() --[[ line: 24 ]] end,
	onDismissed = function() --[[ line: 25 ]] end
}

return reactModule.memo(function(p0) --[[ line: 28 | named "ConversationBanner" ]]
	-- upvalues: cryoModule (ref), t (ref), useTokens (ref), useChatPagePaddingModule (ref), reactModule (ref), foundationModule (ref)
	local var6 = cryoModule.Dictionary.union(t, p0)
	local medium = useTokens().Padding.Medium
	local var7 = useChatPagePaddingModule()
	
	return reactModule.createElement(foundationModule.View, {
		tag = "row gap-medium align-y-center size-full-0 auto-y bg-shift-200",
		padding = {
			left = UDim.new(0, var7.left),
			right = UDim.new(0, var7.right),
			top = UDim.new(0, medium),
			bottom = UDim.new(0, medium)
		},
		LayoutOrder = var6.layoutOrder
	}, {
		BodyText = reactModule.createElement(foundationModule.Text, {
			tag = "text-title-medium text-align-x-left text-truncate-end content-emphasis auto-y fill",
			LayoutOrder = 1,
			Text = var6.bodyText
		}),
		ActionContainer = reactModule.createElement(foundationModule.View, {
			LayoutOrder = 2,
			tag = "row gap-small align-y-center auto-xy"
		}, {
			ActionButton = reactModule.createElement(foundationModule.Button, {
				LayoutOrder = 1,
				text = var6.actionText,
				onActivated = var6.onActivated,
				size = foundationModule.Enums.InputSize.Small
			}),
			CloseButton = reactModule.createElement(foundationModule.View, {
				LayoutOrder = 2,
				tag = "auto-xy x-default-transparent radius-small padding-xsmall",
				onActivated = var6.onDismissed
			}, {
				Icon = reactModule.createElement(foundationModule.Icon, {
					size = foundationModule.Enums.IconSize.Large,
					name = foundationModule.Enums.IconName.X
				})
			})
		})
	})
end)