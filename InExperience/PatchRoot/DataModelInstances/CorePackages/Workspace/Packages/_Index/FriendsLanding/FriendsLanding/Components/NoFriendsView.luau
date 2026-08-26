local friendsLanding = script:FindFirstAncestor("FriendsLanding")
local parent = friendsLanding.Parent
local fFlagConnectionsToFriendsRename = require(parent.SharedFlags).FFlagConnectionsToFriendsRename
local dependenciesModule = require(friendsLanding.dependencies)
local react = dependenciesModule.React
local dash = dependenciesModule.Dash
local UIBlox = dependenciesModule.UIBlox
local images = UIBlox.App.ImageSet.Images
local imageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local button = UIBlox.App.Button.Button
local buttonType = UIBlox.App.Button.Enum.ButtonType
local standardButtonSize = UIBlox.App.Button.Enum.StandardButtonSize
local colors = UIBlox.App.Style.Colors
local useStyle = UIBlox.Core.Style.useStyle
local styledTextLabel = UIBlox.App.Text.StyledTextLabel
local useLocalization = dependenciesModule.Hooks.useLocalization
local textKeysModule = require(friendsLanding.Common.TextKeys)
local appFonts = require(parent.Style).AppFonts
local foundationModule = require(parent.Foundation)
local image = foundationModule.Image
local useTokens = foundationModule.Hooks.useTokens
local foundationCloudAssetsModule = require(parent.FoundationCloudAssets)
local assets = foundationCloudAssetsModule.Assets
local preloadAsset = foundationCloudAssetsModule.preloadAsset
local migrateNoFriendsViewToFoundation = game:DefineFastFlag("MigrateNoFriendsViewToFoundation", false)
local fFlagFriendsEmptyStateIllustrationThemingModule = require(friendsLanding.Flags.FFlagFriendsEmptyStateIllustrationTheming)
local t = {
	layoutOrder = 0,
	pageLoadingTimeReport = nil,
	pageRenderReport = nil,
	addFriendsBtnEnabled = true,
	openAddFriendsPage = dash.noop,
	addFriendsBtnLabelKey = if fFlagConnectionsToFriendsRename then textKeysModule.ADD_FRIENDS_BTN else textKeysModule.ADD_CONNECTIONS_BTN,
	noFriendsTextLabelKey = if fFlagConnectionsToFriendsRename then textKeysModule.NO_FRIENDS_TEXT else textKeysModule.NO_CONNECTIONS_TEXT
}

local function _(value)
	-- upvalues: preloadAsset (ref), assets (ref)
	preloadAsset(value)
	local var1 = assets[value]
	
	return var1.assetId, var1.size
end

return function(p1)
	-- upvalues: dash (ref), t (ref), migrateNoFriendsViewToFoundation (ref), preloadAsset (ref), assets (ref), react (ref), useLocalization (ref), useStyle (ref), fFlagFriendsEmptyStateIllustrationThemingModule (ref), useTokens (ref), image (ref), imageSetLabel (ref), images (ref), colors (ref), styledTextLabel (ref), appFonts (ref), button (ref), buttonType (ref), standardButtonSize (ref)
	local var1 = dash.join(t, p1 or {})
	local var2 = if migrateNoFriendsViewToFoundation then "pictograms/collaborators" else nil
	local assetId = nil
	local size = nil
	
	if migrateNoFriendsViewToFoundation then
		preloadAsset(var2)
		local var3 = assets[var2]
		assetId = var3.assetId
		size = var3.size
	end
	local var4 = if migrateNoFriendsViewToFoundation then size / 3 else nil
	react.useEffect(function()
		-- upvalues: var1 (ref)
		if var1.pageLoadingTimeReport then
			var1.pageLoadingTimeReport()
		end
		if var1.pageRenderReport then
			var1.pageRenderReport()
		end
	end, {})
	local var5 = useLocalization({
		addFriendsBtn = var1.addFriendsBtnLabelKey,
		noFriendsText = var1.noFriendsTextLabelKey,
		noFriendsHeader = var1.noFriendsHeaderKey
	})
	local var6 = useStyle()
	
	return react.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		LayoutOrder = var1.layoutOrder
	}, {
		IndicatorInner = react.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
			SidePadding = react.createElement("UIPadding", {
				PaddingRight = UDim.new(0, 30),
				PaddingLeft = UDim.new(0, 30)
			}),
			UIList = react.createElement("UIListLayout", {
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				Padding = UDim.new(0, 15)
			}),
			Imagelabel = if migrateNoFriendsViewToFoundation then react.createElement(image, {
				LayoutOrder = 1,
				Image = assetId,
				imageStyle = if fFlagFriendsEmptyStateIllustrationThemingModule then (if fFlagFriendsEmptyStateIllustrationThemingModule then useTokens() else nil).Color.Content.Emphasis else nil,
				Size = UDim2.fromOffset(var4.X, var4.Y)
			}) else react.createElement(imageSetLabel, {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Image = images["icons/graphic/findfriends_xlarge"],
				ImageColor3 = colors.White,
				Size = UDim2.fromOffset(96, 96)
			}),
			Headerlabel = if var1.noFriendsHeaderKey and var5.noFriendsHeader then react.createElement(styledTextLabel, {
				layoutOrder = 2,
				text = var5.noFriendsHeader,
				fontStyle = var6.Font.Header1,
				colorStyle = var6.Theme.TextEmphasis,
				automaticSize = Enum.AutomaticSize.Y,
				size = UDim2.new(1, 0, 0, 0),
				textXAlignment = Enum.TextXAlignment.Center,
				textYAlignment = Enum.TextYAlignment.Center
			}) else nil,
			Textlabel = react.createElement("TextLabel", {
				TextWrapped = true,
				BackgroundTransparency = 1,
				LayoutOrder = 3,
				AutomaticSize = Enum.AutomaticSize.Y,
				Font = appFonts.default:getDefault(),
				Size = UDim2.new(1, 0, 0, 0),
				Text = var5.noFriendsText,
				TextColor3 = var6.Theme.TextMuted.Color,
				TextSize = var6.Font.Header2.RelativeSize * var6.Font.BaseSize,
				TextTransparency = var6.Theme.TextMuted.Transparency
			}),
			Padding = react.createElement("Frame", {
				LayoutOrder = 4,
				BackgroundTransparency = 1,
				Size = UDim2.new(0, 0, 0, 10)
			}),
			AddFriendsButton = var1.addFriendsBtnEnabled and react.createElement(button, {
				layoutOrder = 5,
				buttonType = buttonType.PrimarySystem,
				text = var5.addFriendsBtn,
				standardSize = standardButtonSize.Regular,
				onActivated = var1.openAddFriendsPage
			})
		})
	})
end