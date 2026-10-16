local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local FFlagAppChatUseProfileFrameThumbnailModule = require(AppChat.Flags.FFlagAppChatUseProfileFrameThumbnail)
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local FoundationModule = require(Parent.Foundation)
local BuilderIconsModule = require(Parent.BuilderIcons)
local ReplyComposeBarTextModule = require(script.Parent.ReplyComposeBarText)
local UseFoundationPresenceModule = require(AppChat.Hooks.useFoundationPresence)
local config = {
	LayoutOrder = 3,
	replyingToUserText = nil,
	replyingToUserContent = nil,
	replyingToUserId = nil,
	onCloseActivated = function() --[[ Line: 32 ]] end
}

function ReplyComposeBar(p1) --[[ Line: 35 ]]
	-- upvalues: CryoModule (copy), config (copy), FoundationModule (copy), UseFoundationPresenceModule (copy), ReactModule (copy), FFlagAppChatUseProfileFrameThumbnailModule (copy), ReplyComposeBarTextModule (copy), BuilderIconsModule (copy)
	local UnionResult = CryoModule.Dictionary.union(config, p1)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseFoundationPresenceModuleResult = UseFoundationPresenceModule(UnionResult.replyingToUserId)
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "row size-full-0 auto-y align-y-center gap-medium",
		LayoutOrder = UnionResult.LayoutOrder
	}, {
		Avatar = UnionResult.replyingToUserId and ReactModule.createElement(FoundationModule.Avatar, {
			LayoutOrder = 1,
			userId = UnionResult.replyingToUserId,
			userPresence = UseFoundationPresenceModuleResult.presence,
			backgroundStyle = UseTokensResult.Color.Surface.Surface_200,
			size = FoundationModule.Enums.InputSize.Medium,
			includeProfileFrame = FFlagAppChatUseProfileFrameThumbnailModule
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
end

return ReactModule.memo(ReplyComposeBar)