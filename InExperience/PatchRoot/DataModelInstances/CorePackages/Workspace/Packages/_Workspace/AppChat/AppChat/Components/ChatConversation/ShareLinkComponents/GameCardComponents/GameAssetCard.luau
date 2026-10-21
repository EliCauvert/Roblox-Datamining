local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local LocalizationModule = require(Parent.Localization)
local AssetCardViewModule = require(AppChat.Components.ChatConversation.AssetCardView.AssetCardView)
local _ = require(AppChat.Components.ChatConversation.Grouping.MessageGroupShape)
local IconName = FoundationModule.Enums.IconName
local Status = require(AppChat.Components.ChatConversation.AssetCardView.AssetCardTypes).Status
local UseAbbreviatedNumberLocalizationFunction = LocalizationModule.Hooks.useAbbreviatedNumberLocalization
local UseLocalizationFunction = LocalizationModule.Hooks.useLocalization

return ReactModule.memo(function(Frame)
	-- upvalues: UseAbbreviatedNumberLocalizationFunction (copy), UseLocalizationFunction (copy), Status (copy), ReactModule (copy), AssetCardViewModule (copy), IconName (copy), FoundationModule (copy)
	local IsNotGameThumbnailMatch: boolean = Frame.gameThumbnail ~= nil and Frame.gameThumbnail ~= ""
	
	return ReactModule.createElement(AssetCardViewModule, {
		status = if Frame.isError then Status.Error elseif Frame.isLoading then Status.Loading else Status.Ready,
		errorText = UseLocalizationFunction({ errorText = "Feature.Chat.Label.ContentLoadingFailed" }).errorText,
		groupShape = Frame.groupShape,
		mediaRef = Frame.mediaRef,
		LayoutOrder = Frame.LayoutOrder,
		media = {
			aspectRatio = 1.7777777777777777,
			image = if IsNotGameThumbnailMatch then Content.fromUri(Frame.gameThumbnail) else nil,
			onActivated = Frame.onThumbnailActivated,
			isSelectable = Frame.onThumbnailActivated ~= nil
		},
		footer = {
			titleText = Frame.gameName,
			isTitleLoading = Frame.isLoading,
			gameStats = {
				rating = Frame.gameRating,
				playerCount = UseAbbreviatedNumberLocalizationFunction(Frame.gamePlayerCount)
			},
			isGameStatsLoading = Frame.isLoading,
			onActivated = Frame.onMetadataActivated,
			action = if Frame.onPlayButtonActivated then {
				isSelectable = true,
				icon = if Frame.playButtonLabel then nil else IconName.PlayLarge,
				label = Frame.playButtonLabel,
				variant = if Frame.playButtonLabel then FoundationModule.Enums.ButtonVariant.SubEmphasis else nil,
				onActivated = Frame.onPlayButtonActivated
			} else nil
		}
	})
end)