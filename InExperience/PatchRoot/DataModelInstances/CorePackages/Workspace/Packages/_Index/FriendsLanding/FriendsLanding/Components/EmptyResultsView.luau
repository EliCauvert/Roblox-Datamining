local friendsLanding = script:FindFirstAncestor("FriendsLanding")
local parent = friendsLanding.Parent
local dependenciesModule = require(friendsLanding.dependencies)
local roact = dependenciesModule.Roact
local withLocalization = dependenciesModule.withLocalization
local UIBlox = dependenciesModule.UIBlox
local withStyle = UIBlox.Style.withStyle
local images = UIBlox.App.ImageSet.Images
local imageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local textKeysModule = require(friendsLanding.Common.TextKeys)
local constantsModule = require(friendsLanding.Common.Constants)
local appFonts = require(parent.Style).AppFonts
local cryoModule = require(parent.Cryo)
local foundationModule = require(parent.Foundation)
local image = foundationModule.Image
local useTokens = foundationModule.Hooks.useTokens
local foundationCloudAssetsModule = require(parent.FoundationCloudAssets)
local assets = foundationCloudAssetsModule.Assets
local preloadAsset = foundationCloudAssetsModule.preloadAsset
local migrateEmptyResultsViewToFoundation = game:DefineFastFlag("MigrateEmptyResultsViewToFoundation", false)
local fFlagConnectionsToFriendsRename = require(parent.SharedFlags).FFlagConnectionsToFriendsRename
local emptyResultsView = roact.PureComponent:extend("EmptyResultsView")
emptyResultsView.defaultProps = { layoutOrder = 0, pageLoadingTimeReport = nil }

local function _(value) --[[ line: 45 | named "loadFoundationCloudAsset" ]]
	-- upvalues: preloadAsset (ref), assets (ref)
	preloadAsset(value)
	local var9 = assets[value]
	
	return var9.assetId, var9.size
end

function emptyResultsView.render(p0) --[[ line: 51 ]]
	-- upvalues: withStyle (ref), withLocalization (ref), fFlagConnectionsToFriendsRename (ref), textKeysModule (ref), roact (ref), constantsModule (ref), migrateEmptyResultsViewToFoundation (ref), image (ref), imageSetLabel (ref), images (ref), appFonts (ref)
	return withStyle(function(p1) --[[ line: 52 ]]
		-- upvalues: withLocalization (copy), fFlagConnectionsToFriendsRename (copy), textKeysModule (copy), roact (copy), constantsModule (copy), p0 (ref), migrateEmptyResultsViewToFoundation (copy), image (copy), imageSetLabel (copy), images (copy), appFonts (copy)
		return withLocalization({
			noResultsText = "CommonUI.Messages.Response.NoResults",
			addFriendsBtn = if fFlagConnectionsToFriendsRename then textKeysModule.ADD_FRIENDS_BTN else textKeysModule.ADD_CONNECTIONS_BTN
		})(function(p2) --[[ line: 58 ]]
			-- upvalues: roact (copy), constantsModule (copy), p0 (copy), migrateEmptyResultsViewToFoundation (copy), image (copy), imageSetLabel (copy), images (copy), p1 (ref), appFonts (copy)
			return roact.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, -(constantsModule.TOP_BAR_HEIGHT + 45)),
				LayoutOrder = p0.props.layoutOrder
			}, {
				IndicatorInner = roact.createElement("Frame", {
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.XY,
					Size = UDim2.new(0, 0, 0, 0),
					Position = UDim2.new(0.5, 0, 0.4, 0),
					AnchorPoint = Vector2.new(0.5, 0.4)
				}, {
					UIList = roact.createElement("UIListLayout", {
						VerticalAlignment = Enum.VerticalAlignment.Center,
						SortOrder = Enum.SortOrder.LayoutOrder,
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						Padding = UDim.new(0, 0)
					}),
					Imagelabel = if migrateEmptyResultsViewToFoundation then roact.createElement(image, {
						LayoutOrder = 1,
						Image = p0.props.assetId,
						Size = UDim2.fromOffset(p0.props.assetSize.X, p0.props.assetSize.Y)
					}) else roact.createElement(imageSetLabel, {
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						Image = images["icons/status/oof_xlarge"],
						ImageColor3 = p1.Theme.TextMuted.Color,
						ImageTransparency = p1.Theme.TextMuted.Transparency,
						Size = UDim2.new(0, 96, 0, 96)
					}),
					Textlabel = roact.createElement("TextLabel", {
						BackgroundTransparency = 1,
						LayoutOrder = 2,
						AutomaticSize = Enum.AutomaticSize.XY,
						Font = appFonts.default:getDefault(),
						Size = UDim2.new(0, 0, 0, 0),
						Text = p2.noResultsText,
						TextColor3 = p1.Theme.TextMuted.Color,
						TextSize = p1.Font.Header2.RelativeSize * p1.Font.BaseSize,
						TextTransparency = p1.Theme.TextMuted.Transparency
					})
				})
			})
		end)
	end)
end

return if migrateEmptyResultsViewToFoundation then function(p3) --[[ line: 109 | named "EmptyResultsViewContainer" ]]
	-- upvalues: preloadAsset (ref), assets (ref), useTokens (ref), roact (ref), emptyResultsView (ref), cryoModule (ref)
	preloadAsset("pictograms/collaborators")
	local collaborators = assets["pictograms/collaborators"]
	
	return roact.createElement(emptyResultsView, cryoModule.Dictionary.join(p3, {
		assetSize = collaborators.size / 3,
		assetId = collaborators.assetId,
		tokens = useTokens()
	}))
end else emptyResultsView