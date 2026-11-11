local CorePackages = game:GetService("CorePackages")
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local ReactModule = require(CorePackages.Packages.React)
local EmptyState = UIBloxModule.App.Indicator.EmptyState
local Images = UIBloxModule.App.ImageSet.Images
local Colors = UIBloxModule.App.Style.Colors
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local FoundationModule = require(CorePackages.Packages.Foundation)
local FoundationCloudAssetsModule = require(CorePackages.Packages.FoundationCloudAssets)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseDisplayNameTextModule = require(CorePackages.Workspace.Packages.EditProfile.useDisplayNameText)
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local FFlagUserSearchEmptyPageNewIcons = require(CorePackages.Workspace.Packages.SharedFlags).FFlagUserSearchEmptyPageNewIcons
local IconsStatusOofXlarge = Images["icons/status/oof_xlarge"]
local IconsGraphicFindfriendsXlarge = Images["icons/graphic/findfriends_xlarge"]
local PictogramsFindPeople = nil
local PictogramsCollaborators = nil

if FFlagUserSearchEmptyPageNewIcons then
	local Assets = FoundationCloudAssetsModule.Assets
	local PreloadAssetFunction: (any) -> () = FoundationCloudAssetsModule.preloadAsset
	PreloadAssetFunction("pictograms/find_people")
	PreloadAssetFunction("pictograms/collaborators")
	PictogramsFindPeople = Assets["pictograms/find_people"] or {}
	PictogramsCollaborators = Assets["pictograms/collaborators"] or {}
end
return function(p1)
	-- upvalues: UseLocalizationFunction (copy), UseDisplayNameTextModule (copy), UseStyleFunction (copy), FFlagUserSearchEmptyPageNewIcons (copy), PictogramsFindPeople (ref), IconsGraphicFindfriendsXlarge (copy), Colors (copy), IconsStatusOofXlarge (copy), PictogramsCollaborators (ref), UseTokensFunction (copy), ReactModule (copy), FoundationModule (copy), EmptyState (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		keywordTooShortText = "Feature.PlayerSearchResults.Label.KeywordTooShort",
		noResultsText = "Feature.PlayerSearchResults.Label.NoResultsFound",
		findFriendsButton = "Feature.Friends.Action.FindFriends",
		tryAnotherWayText = "Feature.PlayerSearchResults.Label.NoResultsTryAnotherWay"
	})
	local SearchForFriendsPrompt = UseDisplayNameTextModule().searchForFriendsPrompt
	local UseStyleResult = UseStyleFunction()
	local White = nil
	local PictogramsFindPeople1 = nil
	local Text = nil
	
	if p1.shouldShowUserSearchLandingPage then
		Text = SearchForFriendsPrompt
		PictogramsFindPeople1 = if FFlagUserSearchEmptyPageNewIcons then PictogramsFindPeople else IconsGraphicFindfriendsXlarge
		White = Colors.White
	elseif p1.searchWordLengthNotSupported then
		Text = UseLocalizationResult.keywordTooShortText
		PictogramsFindPeople1 = if FFlagUserSearchEmptyPageNewIcons then PictogramsCollaborators else IconsStatusOofXlarge
	else
		Text = UseLocalizationResult.noResultsText
		PictogramsFindPeople1 = if FFlagUserSearchEmptyPageNewIcons then PictogramsCollaborators else IconsStatusOofXlarge
	end
	if FFlagUserSearchEmptyPageNewIcons then
		local UseTokensResult = UseTokensFunction()
		
		return ReactModule.createElement(FoundationModule.View, {
			tag = "size-full auto-y col align-x-center align-y-center"
		}, {
			Icon = ReactModule.createElement(FoundationModule.Image, {
				LayoutOrder = 1,
				tag = "position-top-center anchor-top-center",
				Image = PictogramsFindPeople1.assetId,
				imageStyle = UseTokensResult.Color.Content.Emphasis,
				ScaleType = Enum.ScaleType.Fit,
				Size = UDim2.new(0, 320 * UseTokensResult.Config.UI.Scale, 0, 180 * UseTokensResult.Config.UI.Scale)
			}),
			TextBody = ReactModule.createElement(FoundationModule.Text, {
				LayoutOrder = 3,
				tag = "auto-y size-full-0 text-body-medium text-wrap padding-x-xlarge",
				Text = Text
			})
		})
	else
		return (ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = if p1.backgroundTransparency then p1.backgroundTransparency else UseStyleResult.Theme.BackgroundDefault.Transparency,
			BackgroundColor3 = UseStyleResult.Theme.BackgroundDefault.Color
		}, {
			LandingText = ReactModule.createElement(EmptyState, {
				text = Text,
				icon = PictogramsFindPeople1,
				iconColor = White,
				maxSizeTextLabel = Vector2.new(p1.screenSize.X - 64, p1.screenSize.Y)
			})
		}))
	end
end