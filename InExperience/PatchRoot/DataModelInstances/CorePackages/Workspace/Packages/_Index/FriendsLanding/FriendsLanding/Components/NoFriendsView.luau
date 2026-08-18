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
local image = require(parent.Foundation).Image
local foundationCloudAssetsModule = require(parent.FoundationCloudAssets)
local assets = foundationCloudAssetsModule.Assets
local preloadAsset = foundationCloudAssetsModule.preloadAsset
local migrateNoFriendsViewToFoundation = game:DefineFastFlag("MigrateNoFriendsViewToFoundation", false)
local t = {
	layoutOrder = 0,
	pageLoadingTimeReport = nil,
	pageRenderReport = nil,
	addFriendsBtnEnabled = true,
	openAddFriendsPage = dash.noop,
	addFriendsBtnLabelKey = if fFlagConnectionsToFriendsRename then textKeysModule.ADD_FRIENDS_BTN else textKeysModule.ADD_CONNECTIONS_BTN,
	noFriendsTextLabelKey = if fFlagConnectionsToFriendsRename then textKeysModule.NO_FRIENDS_TEXT else textKeysModule.NO_CONNECTIONS_TEXT
}

local function _(value) --[[ line: 64 | named "loadFoundationCloudAsset" ]]
	-- upvalues: preloadAsset (ref), assets (ref)
	preloadAsset(value)
	local var6 = assets[value]
	
	return var6.assetId, var6.size
end

return function(p0) --[[ line: 70 | named "NoFriendsView" ]]
	-- upvalues: dash (ref), t (ref), migrateNoFriendsViewToFoundation (ref), preloadAsset (ref), assets (ref), react (ref), useLocalization (ref), useStyle (ref), image (ref), imageSetLabel (ref), images (ref), colors (ref), styledTextLabel (ref), appFonts (ref), button (ref), buttonType (ref), standardButtonSize (ref)
	local var7 = dash.join(t, p0 or {})
	local var8 = if migrateNoFriendsViewToFoundation then "pictograms/collaborators" else nil
	local assetId = nil
	local size = nil
	
	if migrateNoFriendsViewToFoundation then
		preloadAsset(var8)
		local var9 = assets[var8]
		assetId = var9.assetId
		size = var9.size
	end
	local var10 = if migrateNoFriendsViewToFoundation then size / 3 else nil
	react.useEffect(function() --[[ line: 83 ]]
		-- upvalues: var7 (ref)
		if var7.pageLoadingTimeReport then
			var7.pageLoadingTimeReport()
		end
		if var7.pageRenderReport then
			var7.pageRenderReport()
		end
	end, {})
	local var11 = useLocalization({
		addFriendsBtn = var7.addFriendsBtnLabelKey,
		noFriendsText = var7.noFriendsTextLabelKey,
		noFriendsHeader = var7.noFriendsHeaderKey
	})
	local var12 = useStyle()
	
	return react.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		LayoutOrder = var7.layoutOrder
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
				Size = UDim2.fromOffset(var10.X, var10.Y)
			}) else react.createElement(imageSetLabel, {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Image = images["icons/graphic/findfriends_xlarge"],
				ImageColor3 = colors.White,
				Size = UDim2.fromOffset(96, 96)
			}),
			Headerlabel = if var7.noFriendsHeaderKey and var11.noFriendsHeader then react.createElement(styledTextLabel, {
				layoutOrder = 2,
				text = var11.noFriendsHeader,
				fontStyle = var12.Font.Header1,
				colorStyle = var12.Theme.TextEmphasis,
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
				Text = var11.noFriendsText,
				TextColor3 = var12.Theme.TextMuted.Color,
				TextSize = var12.Font.Header2.RelativeSize * var12.Font.BaseSize,
				TextTransparency = var12.Theme.TextMuted.Transparency
			}),
			Padding = react.createElement("Frame", {
				LayoutOrder = 4,
				BackgroundTransparency = 1,
				Size = UDim2.new(0, 0, 0, 10)
			}),
			AddFriendsButton = var7.addFriendsBtnEnabled and react.createElement(button, {
				layoutOrder = 5,
				buttonType = buttonType.PrimarySystem,
				text = var11.addFriendsBtn,
				standardSize = standardButtonSize.Regular,
				onActivated = var7.openAddFriendsPage
			})
		})
	})
end