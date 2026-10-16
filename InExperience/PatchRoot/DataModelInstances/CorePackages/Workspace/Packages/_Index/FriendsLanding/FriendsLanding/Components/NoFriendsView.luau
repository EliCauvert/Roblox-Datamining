local FriendsLanding = script:FindFirstAncestor("FriendsLanding")
local Parent = FriendsLanding.Parent
local FoundationFontFaceMigration = require(Parent.SharedFlags).FFlagFontFaceSocialFriends and require(Parent.Foundation).Utility.Flags.FoundationFontFaceMigration
local DependenciesModule = require(FriendsLanding.dependencies)
local React = DependenciesModule.React
local Dash = DependenciesModule.Dash
local UIBlox = DependenciesModule.UIBlox
local Images = UIBlox.App.ImageSet.Images
local ImageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local Button = UIBlox.App.Button.Button
local ButtonType = UIBlox.App.Button.Enum.ButtonType
local StandardButtonSize = UIBlox.App.Button.Enum.StandardButtonSize
local Colors = UIBlox.App.Style.Colors
local UseStyleFunction = UIBlox.Core.Style.useStyle
local StyledTextLabel = UIBlox.App.Text.StyledTextLabel
local UseLocalizationFunction = DependenciesModule.Hooks.useLocalization
local TextKeysModule = require(FriendsLanding.Common.TextKeys)
local AppFonts = require(Parent.Style).AppFonts
local FoundationModule = require(Parent.Foundation)
local Image = FoundationModule.Image
local UseTokensFunction = FoundationModule.Hooks.useTokens
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationCloudAssetsModule = require(Parent.FoundationCloudAssets)
local Assets = FoundationCloudAssetsModule.Assets
local PreloadAssetFunction = FoundationCloudAssetsModule.preloadAsset
local MigrateNoFriendsViewToFoundation = game:DefineFastFlag("MigrateNoFriendsViewToFoundation", false)
local FFlagFriendsEmptyStateIllustrationThemingModule = require(FriendsLanding.Flags.FFlagFriendsEmptyStateIllustrationTheming)
local config = {
	layoutOrder = 0,
	pageLoadingTimeReport = nil,
	pageRenderReport = nil,
	addFriendsBtnEnabled = true,
	openAddFriendsPage = Dash.noop,
	addFriendsBtnLabelKey = TextKeysModule.ADD_FRIENDS_BTN,
	noFriendsTextLabelKey = TextKeysModule.NO_FRIENDS_TEXT
}

local function _(p1) --[[ Line: 65 | Named "loadFoundationCloudAsset" ]]
	-- upvalues: PreloadAssetFunction (copy), Assets (copy)
	PreloadAssetFunction(p1)
	local Asset = Assets[p1]
	
	return Asset.assetId, Asset.size
end

return function(p1) --[[ Line: 71 | Named "NoFriendsView" ]]
	-- upvalues: Dash (copy), config (copy), MigrateNoFriendsViewToFoundation (copy), PreloadAssetFunction (copy), Assets (copy), React (copy), UseLocalizationFunction (copy), UseStyleFunction (copy), FFlagFriendsEmptyStateIllustrationThemingModule (copy), UseTokensFunction (copy), Image (copy), ImageSetLabel (copy), Images (copy), Colors (copy), StyledTextLabel (copy), FoundationFontFaceMigration (copy), AppFonts (copy), NormalizeFontFaceFunction (copy), Button (copy), ButtonType (copy), StandardButtonSize (copy)
	local JoinResult = Dash.join(config, p1 or {})
	local Collaborators = if MigrateNoFriendsViewToFoundation then "pictograms/collaborators" else nil
	local AssetId = nil
	local Size = nil
	
	if MigrateNoFriendsViewToFoundation then
		PreloadAssetFunction(Collaborators)
		local Asset = Assets[Collaborators]
		AssetId = Asset.assetId
		Size = Asset.size
	end
	local SizeRatio = if MigrateNoFriendsViewToFoundation then Size / 3 else nil
	React.useEffect(function() --[[ Line: 84 ]]
		-- upvalues: JoinResult (copy)
		if JoinResult.pageLoadingTimeReport then
			JoinResult.pageLoadingTimeReport()
		end
		if JoinResult.pageRenderReport then
			JoinResult.pageRenderReport()
		end
	end, {})
	local UseLocalizationResult = UseLocalizationFunction({
		addFriendsBtn = JoinResult.addFriendsBtnLabelKey,
		noFriendsText = JoinResult.noFriendsTextLabelKey,
		noFriendsHeader = JoinResult.noFriendsHeaderKey
	})
	local UseStyleResult = UseStyleFunction()
	local UseTokensResult = if FFlagFriendsEmptyStateIllustrationThemingModule then UseTokensFunction() else nil
	
	return React.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		LayoutOrder = JoinResult.layoutOrder
	}, {
		IndicatorInner = React.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
			SidePadding = React.createElement("UIPadding", {
				PaddingRight = UDim.new(0, 30),
				PaddingLeft = UDim.new(0, 30)
			}),
			UIList = React.createElement("UIListLayout", {
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				Padding = UDim.new(0, 15)
			}),
			Imagelabel = if MigrateNoFriendsViewToFoundation then React.createElement(Image, {
				LayoutOrder = 1,
				Image = AssetId,
				imageStyle = if FFlagFriendsEmptyStateIllustrationThemingModule then UseTokensResult.Color.Content.Emphasis else nil,
				Size = UDim2.fromOffset(SizeRatio.X, SizeRatio.Y)
			}) else React.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Image = Images["icons/graphic/findfriends_xlarge"],
				ImageColor3 = Colors.White,
				Size = UDim2.fromOffset(96, 96)
			}),
			Headerlabel = if JoinResult.noFriendsHeaderKey and UseLocalizationResult.noFriendsHeader then React.createElement(StyledTextLabel, {
				layoutOrder = 2,
				text = UseLocalizationResult.noFriendsHeader,
				fontStyle = UseStyleResult.Font.Header1,
				colorStyle = UseStyleResult.Theme.TextEmphasis,
				automaticSize = Enum.AutomaticSize.Y,
				size = UDim2.new(1, 0, 0, 0),
				textXAlignment = Enum.TextXAlignment.Center,
				textYAlignment = Enum.TextYAlignment.Center
			}) else nil,
			Textlabel = React.createElement("TextLabel", {
				TextWrapped = true,
				BackgroundTransparency = 1,
				LayoutOrder = 3,
				AutomaticSize = Enum.AutomaticSize.Y,
				Font = if FoundationFontFaceMigration then nil else AppFonts.default:getDefault(),
				FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseStyleResult.Tokens.Typography.BodySmall.Font) else nil,
				Size = UDim2.new(1, 0, 0, 0),
				Text = UseLocalizationResult.noFriendsText,
				TextColor3 = UseStyleResult.Theme.TextMuted.Color,
				TextSize = UseStyleResult.Font.Header2.RelativeSize * UseStyleResult.Font.BaseSize,
				TextTransparency = UseStyleResult.Theme.TextMuted.Transparency
			}),
			Padding = React.createElement("Frame", {
				LayoutOrder = 4,
				BackgroundTransparency = 1,
				Size = UDim2.new(0, 0, 0, 10)
			}),
			AddFriendsButton = JoinResult.addFriendsBtnEnabled and React.createElement(Button, {
				layoutOrder = 5,
				buttonType = ButtonType.PrimarySystem,
				text = UseLocalizationResult.addFriendsBtn,
				standardSize = StandardButtonSize.Regular,
				onActivated = JoinResult.openAddFriendsPage
			})
		})
	})
end