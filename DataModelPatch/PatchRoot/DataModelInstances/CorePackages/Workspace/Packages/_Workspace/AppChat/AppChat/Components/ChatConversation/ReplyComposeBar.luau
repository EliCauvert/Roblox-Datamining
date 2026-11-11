local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local FoundationModule = require(Parent.Foundation)
local BuilderIconsModule = require(Parent.BuilderIcons)
local ReplyComposeBarTextModule = require(script.Parent.ReplyComposeBarText)
local UseFoundationPresenceModule = require(AppChat.Hooks.useFoundationPresence)
local FFlagAppChatReplyComposeBarContainerModule = require(AppChat.Flags.FFlagAppChatReplyComposeBarContainer)
local config = {
	LayoutOrder = 3,
	totalHeight = 0,
	replyingToUserText = nil,
	replyingToUserContent = nil,
	replyingToUserId = nil,
	onCloseActivated = function() end
}

function ReplyComposeBar(p1)
	-- upvalues: CryoModule (copy), config (copy), FoundationModule (copy), UseFoundationPresenceModule (copy), FFlagAppChatReplyComposeBarContainerModule (copy), ReactModule (copy), ReplyComposeBarTextModule (copy), BuilderIconsModule (copy)
	local UnionResult = CryoModule.Dictionary.union(config, p1)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseFoundationPresenceModuleResult = UseFoundationPresenceModule(UnionResult.replyingToUserId)
	
	return if FFlagAppChatReplyComposeBarContainerModule then ReactModule.createElement(FoundationModule.View, {
		tag = "row size-full-0 auto-y align-y-center gap-medium",
		LayoutOrder = UnionResult.LayoutOrder
	}, {
		Avatar = UnionResult.replyingToUserId and ReactModule.createElement(FoundationModule.Avatar, {
			LayoutOrder = 1,
			userId = UnionResult.replyingToUserId,
			userPresence = UseFoundationPresenceModuleResult.presence,
			backgroundStyle = UseTokensResult.Color.Surface.Surface_200,
			size = FoundationModule.Enums.InputSize.Medium
		}) or nil,
		Text = ReactModule.createElement(ReplyComposeBarTextModule, {
			layoutOrder = 2,
			userText = UnionResult.replyingToUserText,
			contentText = UnionResult.replyingToUserContent
		}),
		CloseButton = ReactModule.createElement(FoundationModule.IconButton, {
			isCircular = true,
			LayoutOrder = 3,
			onActivated = UnionResult.onCloseActivated,
			icon = BuilderIconsModule.Icon.X,
			variant = FoundationModule.Enums.ButtonVariant.Utility,
			size = FoundationModule.Enums.InputSize.Medium
		})
	}) else ReactModule.createElement(FoundationModule.View, {
		tag = "col",
		Size = UDim2.new(1, 0, 0, UnionResult.totalHeight),
		LayoutOrder = UnionResult.LayoutOrder
	}, {
		TopBorder = ReactModule.createElement(FoundationModule.View, { tag = "size-full-50 bg-surface-100", LayoutOrder = 1 }),
		ContentFrame = ReactModule.createElement(FoundationModule.View, {
			tag = "row size-full-0 fill align-y-center padding-medium gap-medium",
			LayoutOrder = 2
		}, {
			Avatar = UnionResult.replyingToUserId and ReactModule.createElement(FoundationModule.Avatar, {
				LayoutOrder = 1,
				userId = UnionResult.replyingToUserId,
				userPresence = UseFoundationPresenceModuleResult.presence,
				backgroundStyle = UseTokensResult.Color.Surface.Surface_100,
				size = FoundationModule.Enums.InputSize.Medium
			}) or nil,
			Text = ReactModule.createElement(ReplyComposeBarTextModule, {
				layoutOrder = 2,
				userText = UnionResult.replyingToUserText,
				contentText = UnionResult.replyingToUserContent
			}),
			CloseButton = ReactModule.createElement(FoundationModule.IconButton, {
				isCircular = true,
				LayoutOrder = 3,
				onActivated = UnionResult.onCloseActivated,
				icon = BuilderIconsModule.Icon.X,
				variant = FoundationModule.Enums.ButtonVariant.Utility,
				size = FoundationModule.Enums.InputSize.Medium
			})
		})
	})
end

return ReactModule.memo(ReplyComposeBar)