local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local _ = require(Parent.MomentsTypes)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local AssetCardViewModule = require(AppChat.Components.ChatConversation.AssetCardView.AssetCardView)
local _ = require(AppChat.Components.ChatConversation.Grouping.MessageGroupShape)
local ToMomentAssetCardPropsModule = require(script.Parent.toMomentAssetCardProps)
local UseMomentShareCardViewModelModule = require(script.Parent.useMomentShareCardViewModel)
local FFlagAppChatMomentShareCardHideMomentsGlyphModule = require(AppChat.Flags.FFlagAppChatMomentShareCardHideMomentsGlyph)

return ReactModule.memo(function(p1) --[[ Line: 24 | Named "MomentAssetCard" ]]
	-- upvalues: UseMomentShareCardViewModelModule (copy), UseLocalizationFunction (copy), ReactModule (copy), AssetCardViewModule (copy), ToMomentAssetCardPropsModule (copy), FFlagAppChatMomentShareCardHideMomentsGlyphModule (copy)
	local UseMomentShareCardViewModelModuleResult = UseMomentShareCardViewModelModule({
		momentId = p1.momentId,
		targetIdType = p1.targetIdType,
		openMomentsDeepLink = p1.openMomentsDeepLink
	})
	local UseLocalizationResult = UseLocalizationFunction({
		errorText = "Feature.Chat.Label.ContentLoadingFailed",
		unavailableText = "Feature.Moments.Label.MomentUnavailableDefault"
	})
	
	return ReactModule.createElement(AssetCardViewModule, ToMomentAssetCardPropsModule(UseMomentShareCardViewModelModuleResult, {
		groupShape = p1.groupShape,
		mediaRef = p1.mediaRef,
		errorText = UseLocalizationResult.errorText,
		unavailableText = UseLocalizationResult.unavailableText,
		showMomentsGlyph = not FFlagAppChatMomentShareCardHideMomentsGlyphModule
	}))
end)