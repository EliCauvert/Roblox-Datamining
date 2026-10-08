local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local _ = require(parent.MomentsTypes)
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local assetCardViewModule = require(appChat.Components.ChatConversation.AssetCardView.AssetCardView)
local _ = require(appChat.Components.ChatConversation.Grouping.MessageGroupShape)
local toMomentAssetCardPropsModule = require(script.Parent.toMomentAssetCardProps)
local useMomentShareCardViewModelModule = require(script.Parent.useMomentShareCardViewModel)
local fFlagAppChatMomentShareCardHideMomentsGlyphModule = require(appChat.Flags.FFlagAppChatMomentShareCardHideMomentsGlyph)

return reactModule.memo(function(value)
	-- upvalues: useMomentShareCardViewModelModule (ref), useLocalization (ref), reactModule (ref), assetCardViewModule (ref), toMomentAssetCardPropsModule (ref), fFlagAppChatMomentShareCardHideMomentsGlyphModule (ref)
	local var1 = useLocalization({
		errorText = "Feature.Chat.Label.ContentLoadingFailed",
		unavailableText = "Feature.Moments.Label.MomentUnavailableDefault"
	})
	
	return reactModule.createElement(assetCardViewModule, toMomentAssetCardPropsModule(useMomentShareCardViewModelModule({
		momentId = value.momentId,
		targetIdType = value.targetIdType,
		openMomentsDeepLink = value.openMomentsDeepLink
	}), {
		groupShape = value.groupShape,
		mediaRef = value.mediaRef,
		errorText = var1.errorText,
		unavailableText = var1.unavailableText,
		showMomentsGlyph = not fFlagAppChatMomentShareCardHideMomentsGlyphModule
	}))
end)