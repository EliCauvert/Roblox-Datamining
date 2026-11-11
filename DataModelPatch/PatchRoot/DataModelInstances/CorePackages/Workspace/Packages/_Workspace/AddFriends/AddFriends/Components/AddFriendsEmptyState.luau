local Parent = script:FindFirstAncestor("AddFriends").Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FoundationModule = require(Parent.Foundation)
local FoundationCloudAssetsModule = require(Parent.FoundationCloudAssets)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local AddFriendsFixText = game:DefineFastFlag("AddFriendsFixText", false)
local FFlagConnectionsToFriendsRename = require(Parent.SharedFlags).FFlagConnectionsToFriendsRename
local Assets = FoundationCloudAssetsModule.Assets
FoundationCloudAssetsModule.preloadAsset("pictograms/collaborators")
local PictogramsCollaborators = Assets["pictograms/collaborators"] or {}

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), FFlagConnectionsToFriendsRename (copy), AddFriendsFixText (copy), UseTokensFunction (copy), ReactModule (copy), FoundationModule (copy), PictogramsCollaborators (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		titleText = if FFlagConnectionsToFriendsRename then "Feature.AddFriends.Title.AddFriendsToolTip" else "Feature.AddFriends.Title.AddConnectionsToolTip",
		emptyStatePromptText = if AddFriendsFixText then nil elseif FFlagConnectionsToFriendsRename then "Feature.AddFriends.Label.EmptyState.FriendsRename" else "Feature.AddFriends.Label.EmptyState",
		emptyStateBodyText = if AddFriendsFixText then {
			if FFlagConnectionsToFriendsRename then "Feature.AddFriends.Text.EmptyState.FriendsRename" else "Feature.AddFriends.Text.EmptyState",
			lineBreak = "\n"
		} else nil
	})
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "size-full-0 auto-y col align-x-center",
		LayoutOrder = p1.layoutOrder
	}, {
		Icon = ReactModule.createElement(FoundationModule.Image, {
			LayoutOrder = 1,
			tag = "position-top-center anchor-top-center",
			Image = PictogramsCollaborators.assetId,
			imageStyle = UseTokensResult.Color.Content.Emphasis,
			ScaleType = Enum.ScaleType.Fit,
			Size = UDim2.new(0, 320 * UseTokensResult.Config.UI.Scale, 0, 180 * UseTokensResult.Config.UI.Scale)
		}),
		TextTitle = ReactModule.createElement(FoundationModule.Text, {
			LayoutOrder = 2,
			tag = "auto-y size-full-0 padding-bottom-small text-heading-small content-emphasis",
			Text = UseLocalizationResult.titleText
		}),
		TextBody = ReactModule.createElement(FoundationModule.Text, {
			LayoutOrder = 3,
			tag = "auto-y size-full-0 text-body-medium",
			Text = if AddFriendsFixText then UseLocalizationResult.emptyStateBodyText else UseLocalizationResult.emptyStatePromptText
		})
	})
end