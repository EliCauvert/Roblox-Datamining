local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local localizationModule = require(parent.Localization)
local assetCardTypesModule = require(appChat.Components.ChatConversation.AssetCardView.AssetCardTypes)
local assetCardViewModule = require(appChat.Components.ChatConversation.AssetCardView.AssetCardView)
local _ = require(appChat.Components.ChatConversation.Grouping.MessageGroupShape)
local iconName = foundationModule.Enums.IconName
local status = assetCardTypesModule.Status
local useAbbreviatedNumberLocalization = localizationModule.Hooks.useAbbreviatedNumberLocalization
local useLocalization = localizationModule.Hooks.useLocalization

return reactModule.memo(function(value)
	-- upvalues: useAbbreviatedNumberLocalization (ref), useLocalization (ref), status (ref), reactModule (ref), assetCardViewModule (ref), iconName (ref)
	return reactModule.createElement(assetCardViewModule, {
		status = if value.isError then status.Error elseif value.isLoading then status.Loading else status.Ready,
		errorText = useLocalization({ errorText = "Feature.Chat.Label.ContentLoadingFailed" }).errorText,
		groupShape = value.groupShape,
		mediaRef = value.mediaRef,
		LayoutOrder = value.LayoutOrder,
		media = {
			aspectRatio = 1.777777777778,
			image = if value.gameThumbnail ~= nil and value.gameThumbnail ~= "" then Content.fromUri(value.gameThumbnail) else nil,
			onActivated = value.onThumbnailActivated,
			isSelectable = value.onThumbnailActivated ~= nil
		},
		footer = {
			titleText = value.gameName,
			isTitleLoading = value.isLoading,
			gameStats = {
				rating = value.gameRating,
				playerCount = useAbbreviatedNumberLocalization(value.gamePlayerCount)
			},
			isGameStatsLoading = value.isLoading,
			onActivated = value.onMetadataActivated,
			action = if value.onPlayButtonActivated then {
				isSelectable = true,
				icon = iconName.PlayLarge,
				onActivated = value.onPlayButtonActivated
			} else nil
		}
	})
end)