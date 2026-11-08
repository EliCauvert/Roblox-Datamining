local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local EventNamesModule = require(AppChat.Analytics.EventNames)
local UseAnalyticsModule = require(AppChat.Analytics.useAnalytics)
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local IconName = FoundationModule.Enums.IconName
local InputSize = FoundationModule.Enums.InputSize
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local PopoverSide = FoundationModule.Enums.PopoverSide

return function(p1)
	-- upvalues: UseAnalyticsModule (copy), UseLocalizationFunction (copy), ReactModule (copy), EventNamesModule (copy), FoundationModule (copy), PopoverSide (copy), PopoverAlign (copy), IconName (copy), InputSize (copy), ButtonVariant (copy)
	local UseAnalyticsModuleResult = UseAnalyticsModule()
	local ConversationId = p1.conversationId
	local MessageListVersion = p1.messageListVersion
	local OnActivatedFunction = p1.onActivated
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "position-bottom-right anchor-bottom-right auto-xy padding-medium",
		ZIndex = 2,
		testId = "chat-conversation-scrollToLatest"
	}, {
		Tooltip = ReactModule.createElement(FoundationModule.Tooltip, {
			title = UseLocalizationFunction({
				jumpToLatestMessages = "Feature.Chat.Action.JumpToLatestMessages"
			}).jumpToLatestMessages,
			side = PopoverSide.Left,
			align = PopoverAlign.Center
		}, {
			Button = ReactModule.createElement(FoundationModule.IconButton, {
				isCircular = true,
				testId = "chat-conversation-scrollToLatest-button",
				icon = IconName.ChevronLargeDown,
				size = InputSize.Medium,
				variant = ButtonVariant.Standard,
				onActivated = ReactModule.useCallback(function()
					-- upvalues: UseAnalyticsModuleResult (copy), EventNamesModule (upval), ConversationId (copy), MessageListVersion (copy), OnActivatedFunction (copy)
					UseAnalyticsModuleResult.fireAnalyticsEvent(EventNamesModule.ConversationScrollToLatestBtnClicked, {
						conversationId = ConversationId,
						messageListVersion = MessageListVersion
					})
					OnActivatedFunction()
				end, {
					UseAnalyticsModuleResult,
					ConversationId,
					MessageListVersion,
					OnActivatedFunction
				})
			})
		})
	})
end