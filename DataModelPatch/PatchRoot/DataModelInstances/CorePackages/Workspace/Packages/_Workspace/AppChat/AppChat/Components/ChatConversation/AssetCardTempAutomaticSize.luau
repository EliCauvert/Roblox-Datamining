local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local RoactModule = require(Parent.Roact)
local CryoModule = require(Parent.Cryo)
local ChatBubbleContainerAutomaticSizeModule = require(script.Parent.Bubble.ChatBubbleContainerAutomaticSize)
local ConstantsModule = require(AppChat.Constants)
local UseScaledValueFunction = require(Parent.Foundation).Hooks.useScaledValue
local PlaceIdContainerModule = require(AppChat.Components.ChatConversation.GameCardComponents.PlaceIdContainer)
local GameCardContainerModule = require(AppChat.Components.ChatConversation.GameCardComponents.GameCardContainer)
local ShareLinkContainerModule = require(AppChat.Components.ChatConversation.GameCardComponents.ShareLinkContainer)
local config = {
	hasTail = false,
	innerPadding = 0,
	isIncoming = false,
	isPending = true,
	isUnfiltered = false,
	isLastMessageInMessageGroup = false,
	maxWidth = 0,
	parentWidth = 0,
	wideMode = false,
	additionalProps = {
		shareLink = nil,
		placeId = nil,
		universeId = nil,
		senderUserId = nil,
		onDetailsOpened = function() end,
		openGameDetailsPage = function() end
	}
}

return function(p1)
	-- upvalues: CryoModule (copy), config (copy), ShareLinkContainerModule (copy), PlaceIdContainerModule (copy), GameCardContainerModule (copy), UseScaledValueFunction (copy), ConstantsModule (copy), RoactModule (copy), ChatBubbleContainerAutomaticSizeModule (copy)
	local UnionResult = CryoModule.Dictionary.union(config, p1)
	local UnionResult1 = CryoModule.Dictionary.union(config.additionalProps, UnionResult.additionalProps)
	local ShareLinkContainerModule1 = if UnionResult1.shareLink then ShareLinkContainerModule else UnionResult1.placeId and PlaceIdContainerModule or GameCardContainerModule
	local IsPending = UnionResult.isPending
	local UseScaledValueResult = UseScaledValueFunction(ConstantsModule.GameCard.THUMBNAIL_WIDTH)
	local UseScaledValueResult1 = UseScaledValueFunction(ConstantsModule.GameCard.THUMBNAIL_HEIGHT + ConstantsModule.GameCard.FOOTER_HEIGHT)
	UnionResult1.isStartOfGroup = UnionResult.hasTail
	UnionResult1.isIncoming = UnionResult.isIncoming
	UnionResult1.isUnfiltered = UnionResult.isUnfiltered
	UnionResult1.isPending = UnionResult.isPending
	UnionResult1.isRepliedTo = UnionResult.isRepliedTo
	
	return RoactModule.createElement(ChatBubbleContainerAutomaticSizeModule, {
		hasTail = UnionResult.hasTail,
		isIncoming = UnionResult.isIncoming,
		isPending = IsPending,
		isUnfiltered = nil,
		isAssetCard = true,
		LayoutOrder = UnionResult.LayoutOrder,
		padding = 0,
		isLastMessageInMessageGroup = UnionResult.isLastMessageInMessageGroup or config.isLastMessageInMessageGroup,
		[RoactModule.Change.AbsoluteSize] = UnionResult[RoactModule.Change.AbsoluteSize]
	}, {
		AssetCard = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(UseScaledValueResult or 256, UseScaledValueResult1 or 208),
			AutomaticSize = Enum.AutomaticSize.XY
		}, {
			Card = RoactModule.createElement(ShareLinkContainerModule1, UnionResult1)
		})
	})
end