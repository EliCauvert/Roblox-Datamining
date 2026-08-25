local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local fFlagAppChatUseProfileFrameThumbnailModule = require(appChat.Flags.FFlagAppChatUseProfileFrameThumbnail)
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local foundationModule = require(parent.Foundation)
local builderIconsModule = require(parent.BuilderIcons)
local replyComposeBarTextModule = require(script.Parent.ReplyComposeBarText)
local useFoundationPresenceModule = require(appChat.Hooks.useFoundationPresence)
local fFlagAppChatReplyComposeBarContainerModule = require(appChat.Flags.FFlagAppChatReplyComposeBarContainer)
local t = {
	LayoutOrder = 3,
	totalHeight = 0,
	replyingToUserText = nil,
	replyingToUserContent = nil,
	replyingToUserId = nil,
	onCloseActivated = function() end
}

function ReplyComposeBar(p0)
	-- upvalues: cryoModule (ref), t (ref), foundationModule (ref), useFoundationPresenceModule (ref), fFlagAppChatReplyComposeBarContainerModule (ref), reactModule (ref), fFlagAppChatUseProfileFrameThumbnailModule (ref), replyComposeBarTextModule (ref), builderIconsModule (ref)
	local var10 = cryoModule.Dictionary.union(t, p0)
	local var11 = foundationModule.Hooks.useTokens()
	local var12 = useFoundationPresenceModule(var10.replyingToUserId)
	
	return if fFlagAppChatReplyComposeBarContainerModule then reactModule.createElement(foundationModule.View, {
		tag = "row size-full-0 auto-y align-y-center gap-medium",
		LayoutOrder = var10.LayoutOrder
	}, {
		Avatar = var10.replyingToUserId and reactModule.createElement(foundationModule.Avatar, {
			LayoutOrder = 1,
			userId = var10.replyingToUserId,
			userPresence = var12.presence,
			backgroundStyle = var11.Color.Surface.Surface_200,
			size = foundationModule.Enums.InputSize.Medium,
			includeProfileFrame = fFlagAppChatUseProfileFrameThumbnailModule
		}) or nil,
		Text = reactModule.createElement(replyComposeBarTextModule, {
			layoutOrder = 2,
			userText = var10.replyingToUserText,
			contentText = var10.replyingToUserContent
		}),
		CloseButton = reactModule.createElement(foundationModule.IconButton, {
			isCircular = true,
			LayoutOrder = 3,
			onActivated = var10.onCloseActivated,
			icon = builderIconsModule.Icon.X,
			variant = foundationModule.Enums.ButtonVariant.Utility,
			size = foundationModule.Enums.InputSize.Medium
		})
	}) else reactModule.createElement(foundationModule.View, {
		tag = "col",
		Size = UDim2.new(1, 0, 0, var10.totalHeight),
		LayoutOrder = var10.LayoutOrder
	}, {
		TopBorder = reactModule.createElement(foundationModule.View, { tag = "size-full-50 bg-surface-100", LayoutOrder = 1 }),
		ContentFrame = reactModule.createElement(foundationModule.View, {
			tag = "row size-full-0 fill align-y-center padding-medium gap-medium",
			LayoutOrder = 2
		}, {
			Avatar = var10.replyingToUserId and reactModule.createElement(foundationModule.Avatar, {
				LayoutOrder = 1,
				userId = var10.replyingToUserId,
				userPresence = var12.presence,
				backgroundStyle = var11.Color.Surface.Surface_100,
				size = foundationModule.Enums.InputSize.Medium,
				includeProfileFrame = fFlagAppChatUseProfileFrameThumbnailModule
			}) or nil,
			Text = reactModule.createElement(replyComposeBarTextModule, {
				layoutOrder = 2,
				userText = var10.replyingToUserText,
				contentText = var10.replyingToUserContent
			}),
			CloseButton = reactModule.createElement(foundationModule.IconButton, {
				isCircular = true,
				LayoutOrder = 3,
				onActivated = var10.onCloseActivated,
				icon = builderIconsModule.Icon.X,
				variant = foundationModule.Enums.ButtonVariant.Utility,
				size = foundationModule.Enums.InputSize.Medium
			})
		})
	})
end

return reactModule.memo(ReplyComposeBar)